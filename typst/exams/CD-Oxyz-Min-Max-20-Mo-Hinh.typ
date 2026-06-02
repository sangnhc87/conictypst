#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

#set page(
  paper: "a4",
  margin: (x: 1.2cm, y: 1.6cm),
)
#set text(font: "New Computer Modern", size: 10.2pt, lang: "vi")
#set par(justify: true, leading: 0.78em)
#set list(indent: 1em, body-indent: 0.55em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.1em,
  text(fill: rgb("1A5276"), size: 14.5pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.25em,
  below: 0.7em,
  text(fill: rgb("900C3F"), size: 11.4pt, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 1em,
  below: 0.45em,
  text(fill: rgb("117A65"), size: 10.6pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 16pt, y: 15pt),
    width: 96%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      CHUYÊN ĐỀ CHUYÊN SÂU: 20 MÔ HÌNH MIN - MAX Oxyz CÂU KHÓ
    ]
    #v(0.3em)
    #text(size: 10.4pt, style: "italic", fill: rgb("555555"))[
      Mặt cầu · Khoảng cách · Đường tròn ẩn · Tiếp xúc · Thiết diện · Tham số tồn tại
    ]
  ]
]

#block(
  stroke: 0.6pt + rgb("D6EAF8"),
  fill: rgb("F8FBFF"),
  inset: 10pt,
  radius: 5pt,
  width: 100%,
)[
  *Mục tiêu của chuyên đề.* Chuyên đề này gom 20 mô hình min - max Oxyz rất hay gặp trong đề phân loại lớp 12. Điểm then chốt không phải là nhớ lẻ từng công thức, mà là nhận ra thật nhanh bài toán đang ngụy trang theo lõi nào:

  - *Lõi 1:* Biểu thức tuyến tính trên mặt cầu chính là bài toán mặt phẳng song song tiếp xúc mặt cầu.
  - *Lõi 2:* Khoảng cách thường bị trá hình thành diện tích tam giác, thể tích tứ diện, hoặc khoảng cách giữa hai đường thẳng.
  - *Lõi 3:* Ràng buộc kép của mặt cầu thường sinh ra *đường tròn ẩn*.
  - *Lõi 4:* Tổng, hiệu, tích, tỉ số khoảng cách đến hai điểm thường phải quy về trung điểm, trọng tâm, hoặc mặt cầu Apollonius.
  - *Lõi 5:* Bài toán tham số "để tồn tại nghiệm" thực chất là bài toán tìm *tập giá trị* của một biểu thức hình học.
]

= I. Bản Đồ Tư Duy Chung

== 1. Năm xương sống phải thuộc

1. *Tuyến tính trên mặt cầu.* Nếu $M in (S)$ và cần tối ưu $P = u x + v y + w z + d$ thì ta dịch về tâm $I$ của mặt cầu rồi cộng thêm hoặc trừ đi $R sqrt(u^2 + v^2 + w^2)$.
2. *Khoảng cách trá hình.* Nếu đề hỏi diện tích tam giác hoặc thể tích tứ diện có một đỉnh di động thì phải nghĩ ngay đến khoảng cách từ điểm đến đường thẳng hoặc mặt phẳng cố định.
3. *Quy về một tâm phụ.* Với các tổng bình phương hoặc tích vô hướng, điểm cần nhìn ra thường là trung điểm, trọng tâm, hoặc hình chiếu vuông góc.
4. *Đường tròn ẩn.* Giao của hai mặt cầu, giao của mặt cầu với mặt phẳng, hoặc tập tiếp điểm từ một điểm ngoài tới mặt cầu đều tạo ra một đường tròn.
5. *Tham số tồn tại.* Nếu đề hỏi "có nghiệm", "cắt", "tiếp xúc", "tồn tại điểm" thì đừng lao vào giải hệ ngay; hãy tìm miền giá trị của biểu thức quyết định.

== 1a. Quy Trình Sư Phạm Từ Cấu Trúc Thực Tế Đến Bài Toán

*Cách đi đúng để học sinh không bị ngợp công thức:*

1. *Nhìn bối cảnh thực tế trước.* Ví dụ: ra-đa quét vùng cầu, camera đặt ngoài quả cầu, dây cáp nối hai vệ tinh, máy cắt cắt một bồn cầu theo thiết diện.
2. *Chỉ ra cấu trúc hình học lõi.* Ví dụ: điểm chạy trên mặt cầu, mặt phẳng cắt mặt cầu, khoảng cách tới một đường cố định, hay giao của hai mặt cầu.
3. *Đổi sang ngôn ngữ toán đúng mức cần thiết.* Chỉ sau khi thấy lõi mới viết phương trình mặt cầu, mặt phẳng, đường thẳng hoặc biểu thức tối ưu.
4. *Chốt lõi bằng một hình vẽ chuẩn.* Khi hình đủ rõ, công thức chỉ còn là bước đọc hình và tính toán.

*Nguyên tắc xuyên suốt chuyên đề này:* mọi mô hình đều nên được hiểu theo chiều
"tình huống - cấu trúc hình học - công thức - bấm số",
không đi ngược từ công thức khô tới tình huống.

== 2. Hình vẽ gốc phải nhìn ra

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    [
      #block(stroke: 0.5pt + rgb("D5D8DC"), radius: 5pt, inset: 10pt, width: 100%)[
        #text(weight: "bold", fill: rgb("1A5276"))[a) Tuyến tính trên mặt cầu = tiếp xúc mặt phẳng]
        #v(0.35em)
        #align(center)[
          #cetz.canvas(length: 0.75cm, {
            import cetz.draw: *

            let I = (0, 0)
            let M = (2.2, 2.2)
            circle(I, radius: 3.2, stroke: 1.1pt + rgb("1A5276"), fill: rgb("EBF5FB"))
            line(I, M, stroke: 1pt + rgb("117A65"))
            line((-0.4, 4.8), (4.8, -0.4), stroke: 1.2pt + rgb("C0392B"))
            circle(I, radius: 1.3pt, fill: black)
            circle(M, radius: 1.3pt, fill: black)
            content(I, [$I$], anchor: "south-east")
            content(M, [$M$], anchor: "north-west")
            content((3.8, 0.8), [$(P_k)$], anchor: "west")
            content((1.2, 1.9), [$R$], anchor: "west")
          })
        ]
      ]
    ],
    [
      #block(stroke: 0.5pt + rgb("D5D8DC"), radius: 5pt, inset: 10pt, width: 100%)[
        #text(weight: "bold", fill: rgb("1A5276"))[b) Diện tích, thể tích = khoảng cách trá hình]
        #v(0.35em)
        #align(center)[
          #cetz.canvas(length: 0.7cm, {
            import cetz.draw: *

            let A = (-3, 0)
            let B = (3, 0)
            let M = (0.6, 4)
            let H = (0.6, 0)
            line(A, B, stroke: 1.2pt + rgb("1A5276"))
            line(A, M, stroke: 1pt + rgb("117A65"))
            line(B, M, stroke: 1pt + rgb("117A65"))
            line(M, H, stroke: (dash: "dashed", paint: black))
            circle(A, radius: 1.1pt, fill: black)
            circle(B, radius: 1.1pt, fill: black)
            circle(M, radius: 1.1pt, fill: black)
            content(A, [$A$], anchor: "south")
            content(B, [$B$], anchor: "south")
            content(M, [$M$], anchor: "north")
            content((0.95, 2), [$d(M, A B)$], anchor: "west")
          })
        ]
      ]
    ],
  )
]

== 2a. Sơ Đồ CeTZ 3D Phải Nhìn Ra

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    [
      #block(stroke: 0.5pt + rgb("D5D8DC"), radius: 5pt, inset: 10pt, width: 100%)[
        #text(weight: "bold", fill: rgb("1A5276"))[a) Mặt cầu - mặt phẳng - thiết diện tròn]
        #v(0.35em)
        #align(center)[
          #cetz.canvas(length: 0.54cm, {
            import cetz.draw: *

            let prj(x, y, z) = {
              let xp = y - 0.34 * x
              let yp = z - 0.16 * x
              (xp, yp)
            }

            let O = prj(0, 0, 0)
            let X = prj(5, 0, 0)
            let Y = prj(0, 5.6, 0)
            let Z = prj(0, 0, 5.6)

            line(O, X, stroke: 0.7pt + gray)
            line(O, Y, stroke: 0.7pt + gray)
            line(O, Z, stroke: 0.7pt + gray)
            content(X, [$x$], anchor: "west")
            content(Y, [$y$], anchor: "south")
            content(Z, [$z$], anchor: "south")

            let I = prj(2.2, 2.7, 2.5)
            circle(I, radius: 3.15, stroke: 1.1pt + rgb("1A5276"), fill: rgb("EBF5FB"))
            circle(I, radius: 1.2pt, fill: black)
            content(I, [$I$], anchor: "south-east")

            let A = prj(0.7, 0.8, 3.1)
            let B = prj(4.5, 0.8, 3.1)
            let C = prj(4.5, 4.9, 3.1)
            let D = prj(0.7, 4.9, 3.1)
            line(A, B, C, D, close: true, stroke: 1pt + rgb("C0392B"), fill: rgb("FDEDEC").transparentize(70%))
            content(prj(4.8, 3.4, 3.1), [$(P)$], anchor: "west")

            let H = prj(2.2, 2.7, 3.1)
            line(I, H, stroke: (dash: "dashed", paint: black))
            content(prj(2.4, 2.7, 2.8), [$h$], anchor: "west")

            arc(H, radius: (2.2, 0.72), start: 0deg, stop: 180deg, stroke: 1pt + rgb("117A65"))
            arc(H, radius: (2.2, 0.72), start: 180deg, stop: 360deg, stroke: (dash: "dashed", paint: rgb("117A65")))
            content(prj(2.6, 4.8, 3.1), [thiết diện $(C)$], anchor: "south")
          })
        ]
      ]
    ],
    [
      #block(stroke: 0.5pt + rgb("D5D8DC"), radius: 5pt, inset: 10pt, width: 100%)[
        #text(weight: "bold", fill: rgb("1A5276"))[b) Đáy cố định - đỉnh di động - chiều cao không gian]
        #v(0.35em)
        #align(center)[
          #cetz.canvas(length: 0.54cm, {
            import cetz.draw: *

            let prj(x, y, z) = {
              let xp = y - 0.34 * x
              let yp = z - 0.16 * x
              (xp, yp)
            }

            let O = prj(0, 0, 0)
            let X = prj(5.2, 0, 0)
            let Y = prj(0, 5.8, 0)
            let Z = prj(0, 0, 5.8)

            line(O, X, stroke: 0.7pt + gray)
            line(O, Y, stroke: 0.7pt + gray)
            line(O, Z, stroke: 0.7pt + gray)
            content(X, [$x$], anchor: "west")
            content(Y, [$y$], anchor: "south")
            content(Z, [$z$], anchor: "south")

            let I = prj(2.4, 2.6, 2.4)
            circle(I, radius: 3.0, stroke: 1.1pt + rgb("1A5276"), fill: rgb("EBF5FB"))

            let A = prj(0.8, 1.1, 0)
            let B = prj(4.5, 1.2, 0)
            let C = prj(1.7, 4.5, 0)
            let M = prj(2.8, 3.2, 4.8)
            let H = prj(2.8, 3.2, 0)

            line(A, B, C, close: true, stroke: 1pt + rgb("900C3F"), fill: rgb("FDEDEC").transparentize(72%))
            line(A, M, stroke: 1pt + rgb("117A65"))
            line(B, M, stroke: 1pt + rgb("117A65"))
            line(C, M, stroke: 1pt + rgb("117A65"))
            line(M, H, stroke: (dash: "dashed", paint: black))

            circle(A, radius: 1.1pt, fill: black)
            circle(B, radius: 1.1pt, fill: black)
            circle(C, radius: 1.1pt, fill: black)
            circle(M, radius: 1.1pt, fill: black)
            content(A, [$A$], anchor: "north")
            content(B, [$B$], anchor: "north")
            content(C, [$C$], anchor: "south")
            content(M, [$M$], anchor: "south")
            content(prj(3.1, 3.2, 2.3), [$d(M, (A B C))$], anchor: "west")
          })
        ]
      ]
    ],
  )
]

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    [
      #block(stroke: 0.5pt + rgb("D5D8DC"), radius: 5pt, inset: 10pt, width: 100%)[
        #text(weight: "bold", fill: rgb("1A5276"))[c) Hai mặt cầu = min - max trên trục nối tâm]
        #v(0.35em)
        #align(center)[
          #cetz.canvas(length: 0.65cm, {
            import cetz.draw: *

            let I = (-2.4, 0)
            let J = (3.8, 0)
            circle(I, radius: 1.7, stroke: 1.1pt + rgb("1A5276"), fill: rgb("EBF5FB"))
            circle(J, radius: 2.1, stroke: 1.1pt + rgb("C0392B"), fill: rgb("FDEDEC"))
            line(I, J, stroke: 0.9pt + black)
            circle(I, radius: 1.1pt, fill: black)
            circle(J, radius: 1.1pt, fill: black)
            content(I, [$I$], anchor: "south")
            content(J, [$J$], anchor: "south")
            content((0.7, 0.35), [$I J$], anchor: "south")
          })
        ]
      ]
    ],
    [
      #block(stroke: 0.5pt + rgb("D5D8DC"), radius: 5pt, inset: 10pt, width: 100%)[
        #text(weight: "bold", fill: rgb("1A5276"))[d) Điểm ngoài - tiếp tuyến - đường tròn tiếp điểm]
        #v(0.35em)
        #align(center)[
          #cetz.canvas(length: 0.7cm, {
            import cetz.draw: *

            let I = (0, 0)
            let A = (5.2, 0)
            let M = (1.8, 2.4)
            let N = (1.8, -2.4)
            circle(I, radius: 3, stroke: 1.1pt + rgb("1A5276"), fill: rgb("EBF5FB"))
            line(A, M, stroke: 1pt + rgb("C0392B"))
            line(A, N, stroke: 1pt + rgb("C0392B"))
            line(I, M, stroke: (dash: "dashed", paint: black))
            line(I, N, stroke: (dash: "dashed", paint: black))
            circle(I, radius: 1.1pt, fill: black)
            circle(A, radius: 1.1pt, fill: black)
            content(I, [$I$], anchor: "south")
            content(A, [$A$], anchor: "east")
            content(M, [$M$], anchor: "north")
            content(N, [$N$], anchor: "south")
          })
        ]
      ]
    ],
  )
]

== 3. Bảng quy đổi nhanh

- Nếu đề có $u x + v y + w z + d$ trên mặt cầu $=>$ *Mô hình 1*.
- Nếu đề có $d(M, (P))$, $d(M, Delta)$, $S_(triangle M A B)$, $V_(M A B C)$ $=>$ *Mô hình 2, 3, 4, 5*.
- Nếu đề có $M A^2 + M B^2$, tích vô hướng, trọng tâm, trung điểm $=>$ *Mô hình 6, 7*.
- Nếu đề có hai điểm cùng di động trên hai mặt cầu $=>$ *Mô hình 8*.
- Nếu đề có tỉ số $(M A)/(M B)$, hoặc điều kiện kiểu $M A = m M B$ $=>$ *Mô hình 9*.
- Nếu đề có tổng, hiệu, tích khoảng cách $=>$ *Mô hình 10, 11, 12*.
- Nếu đề có đường thẳng qua $M$ với hướng cố định $=>$ *Mô hình 13*.
- Nếu đề có tiếp tuyến từ điểm ngoài đến mặt cầu $=>$ *Mô hình 14*.
- Nếu đề có hai mặt cầu cùng chứa $M$ $=>$ *Mô hình 15*.
- Nếu đề có điều kiện thêm như $z >= 0$ hay $a x + b y + c z + d >= 0$ $=>$ *Mô hình 16*.
- Nếu đề có tích khoảng cách tới hai mặt phẳng $=>$ *Mô hình 17*.
- Nếu đề có biểu thức bậc hai theo $x, y, z$ trên mặt cầu $=>$ *Mô hình 18*.
- Nếu đề có họ mặt phẳng $(P_m)$ cắt mặt cầu $=>$ *Mô hình 19*.
- Nếu đề hỏi tìm $m$ để phương trình, mặt phẳng, hoặc điểm tồn tại $=>$ *Mô hình 20*.

= II. 20 Mô Hình Cốt Lõi

== Nhóm A. Tuyến Tính Và Khoảng Cách Trá Hình

=== Mô hình 1. Tối ưu biểu thức tuyến tính trên mặt cầu

*Tình huống mô hình hóa thường gặp.* Chỉ số tín hiệu, độ cao hiệu dụng, hoặc cường độ phủ sóng tại điểm $M$ trên một vỏ cầu thường quy về một biểu thức bậc nhất theo $x, y, z$.

*Cấu trúc đề.* Cho mặt cầu $(S): (x - a)^2 + (y - b)^2 + (z - c)^2 = R^2$. Tìm giá trị lớn nhất, nhỏ nhất của $P = u x + v y + w z + d$ khi $M(x, y, z) in (S)$.

*Dấu hiệu nhận diện.* Biểu thức cần tối ưu là bậc nhất theo $x, y, z$.

*Công thức nhanh.* Nếu $I(a, b, c)$ là tâm mặt cầu thì:
$
  P(I) = u a + v b + w c + d
$
$
  P_"max" = P(I) + R sqrt(u^2 + v^2 + w^2)
$
$
  P_"min" = P(I) - R sqrt(u^2 + v^2 + w^2)
$

*Giải thích hình học.* Họ mặt phẳng $u x + v y + w z + d = k$ có cùng vectơ pháp tuyến. Khi tăng hoặc giảm $k$, mặt phẳng trượt song song. Giá trị cực đại và cực tiểu đạt khi mặt phẳng vừa chạm mặt cầu.

*Ví dụ mẫu.* Cho $(S): (x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 16$. Tìm giá trị lớn nhất của $P = 2 x - y + 2 z + 5$.

Ta có $I(1, -2, 3)$, $R = 4$.
$
  P(I) = 2 dot 1 - (-2) + 2 dot 3 + 5 = 15
$
$
  sqrt(2^2 + (-1)^2 + 2^2) = 3
$
Suy ra:
$
  P_"max" = 15 + 4 dot 3 = 27
$

*Ví dụ thực chiến kiểu đề thi.* Một cảm biến chuyển động trên mặt cầu $(S): (x - 2)^2 + (y + 1)^2 + (z - 1)^2 = 9$. Chỉ số thu nhận tại vị trí $M(x, y, z)$ là $Q = 2 x + 2 y - z$. Tìm giá trị lớn nhất của $Q$.

Ta có $I(2, -1, 1)$, $R = 3$.
$
  Q(I) = 2 dot 2 + 2 dot (-1) - 1 = 1
$
$
  sqrt(2^2 + 2^2 + (-1)^2) = 3
$
Do đó:
$
  Q_"max" = 1 + 3 dot 3 = 10
$

*Biến thể trắc nghiệm.* Nếu đề hỏi mặt phẳng $2 x - y + 2 z + 5 = m$ cắt mặt cầu hay không thì đó chính là *Mô hình 20* viết ngược lại.

=== Mô hình 2. Tối ưu khoảng cách từ điểm trên mặt cầu đến mặt phẳng

*Tình huống mô hình hóa thường gặp.* Đây là mô hình của điểm bay quanh một vùng cầu rồi đo độ xa gần tới một mái phẳng, vách chắn, hoặc mặt cắt phẳng cố định.

*Cấu trúc đề.* Cho $M in (S)$, tìm giá trị lớn nhất, nhỏ nhất của $d(M, (P))$.

*Dấu hiệu nhận diện.* Trong lời giải thường xuất hiện trị tuyệt đối $|a x + b y + c z + d|$.

*Chiến thuật nhanh.* Gọi $I$ là tâm mặt cầu, bán kính $R$, đặt $h = d(I, (P))$. Khi đó:
$ d_"max" = h + R $

$ d_"min" = max(0, h - R) $

*Ý tưởng gỡ rối.* Đường vuông góc từ tâm $I$ đến mặt phẳng $(P)$ là trục quyết định khoảng cách. Điểm xa nhất và gần nhất đều nằm trên đường thẳng qua $I$ vuông góc với $(P)$.

*Ví dụ mẫu.* Cho $(S): (x - 1)^2 + y^2 + (z + 2)^2 = 9$ và $(P): 2 x - y + 2 z - 6 = 0$. Tìm giá trị lớn nhất của $d(M, (P))$.

Tâm $I(1, 0, -2)$, bán kính $R = 3$.
$
  h = (|2 dot 1 - 0 + 2 dot (-2) - 6|) / sqrt(2^2 + (-1)^2 + 2^2)
  = 8 / 3
$
Suy ra:
$
  d_"max" = 8 / 3 + 3 = 17 / 3
$

*Ví dụ thực chiến kiểu đề thi.* Trên mặt cầu $(S): (x - 1)^2 + (y + 2)^2 + (z - 2)^2 = 4$, điểm $M$ biểu diễn đầu dò. Tìm khoảng cách nhỏ nhất từ $M$ đến vách phẳng $(P): x + 2 y + 2 z - 10 = 0$.

Tâm $I(1, -2, 2)$, bán kính $R = 2$.
$
  h = (|1 + 2 dot (-2) + 2 dot 2 - 10|) / sqrt(1 + 4 + 4) = 9 / 3 = 3
$
Vì $h > R$, nên:
$
  d_"min" = h - R = 1
$

*Biến thể hay ra đề.* Nếu $h < R$ thì mặt phẳng cắt mặt cầu, khi đó khoảng cách nhỏ nhất bằng $0$.

=== Mô hình 3. Tối ưu khoảng cách từ điểm trên mặt cầu đến đường thẳng

*Tình huống mô hình hóa thường gặp.* Vật thể di động trên vỏ cầu cần giữ khoảng hở an toàn tới một trục cáp, trục ống, hay một ray thẳng cố định.

*Cấu trúc đề.* Cho $M in (S)$, đường thẳng $Delta$. Tìm giá trị lớn nhất, nhỏ nhất của $d(M, Delta)$.

*Nhận diện.* Mẫu này rất hay bị giấu dưới diện tích tam giác hoặc khoảng cách giữa hai vật thể.

*Công thức lõi.* Gọi $h = d(I, Delta)$. Khi đó:
$ d_"max" = h + R $

$ d_"min" = max(0, h - R) $

*Vì sao đúng.* Tập hợp điểm cách $Delta$ một khoảng cố định là mặt trụ tròn xoay quanh $Delta$. Cực trị xuất hiện khi mặt trụ này vừa tiếp xúc mặt cầu.

*Ví dụ mẫu.* Cho $(S): (x - 1)^2 + (y - 2)^2 + z^2 = 25$ và $Delta: x / 1 = y / 2 = z / 2$. Tìm giá trị nhỏ nhất của $d(M, Delta)$.

Tâm $I(1, 2, 0)$, bán kính $R = 5$. Lấy $O(0, 0, 0) in Delta$ và vectơ chỉ phương $u = (1, 2, 2)$.
Khoảng cách từ $I$ đến $Delta$ là:
$
  h = (sqrt(20)) / 3 = (2 sqrt(5)) / 3
$
Vì $h < R$, đường thẳng cắt mặt cầu, nên:
$ d_"min" = 0 $

*Ví dụ thực chiến kiểu đề thi.* Cho $(S): (x - 3)^2 + y^2 + z^2 = 4$. Một trục kỹ thuật trùng với đường thẳng $Delta: x = 0, y = 0$. Tìm khoảng cách nhỏ nhất từ điểm $M in (S)$ đến $Delta$.

Tâm $I(3, 0, 0)$, bán kính $R = 2$.
Khoảng cách từ $I$ đến trục $O z$ là:
$
  h = 3
$
Suy ra:
$
  d_"min" = h - R = 1
$

*Biến thể trắc nghiệm.* Nếu đề thay khoảng cách bằng độ dài đoạn vuông góc kẻ từ $M$ đến $Delta$ thì hoàn toàn cùng bản chất.

=== Mô hình 4. Diện tích tam giác có một đỉnh di động trên mặt cầu

*Tình huống mô hình hóa thường gặp.* Một màng tam giác có cạnh đáy cố định $A B$, còn đỉnh $M$ trượt trên mặt cầu nên diện tích chỉ còn phụ thuộc vào chiều cao từ $M$ xuống đáy.

*Cấu trúc đề.* Cho $A, B$ cố định và $M in (S)$. Tìm giá trị lớn nhất, nhỏ nhất của $S_(triangle M A B)$.

*Quy đổi nhanh.*
$
  S_(triangle M A B) = (1 / 2) A B dot d(M, A B)
$
Nghĩa là bài toán quay về *Mô hình 3*.

*Công thức nhanh.* Nếu $h = d(I, A B)$ thì:
$
  S_"max" = (1 / 2) A B dot (h + R)
$
$
  S_"min" = (1 / 2) A B dot max(0, h - R)
$

*Ví dụ mẫu.* Cho mặt cầu tâm $I(0, 0, 0)$, bán kính $5$. Cho $A(3, 0, 0)$, $B(0, 4, 0)$. Tìm giá trị lớn nhất của diện tích tam giác $M A B$.

Ta có $A B = 5$. Khoảng cách từ $O$ đến đường thẳng $A B$ bằng:
$
  h = (3 dot 4) / 5 = 12 / 5
$
Suy ra:
$
  S_"max" = (1 / 2) dot 5 dot (12 / 5 + 5) = 37 / 2
$

*Ví dụ thực chiến kiểu đề thi.* Cho mặt cầu $(S): x^2 + y^2 + z^2 = 25$. Hai điểm cố định là $A(-3, 4, 0)$, $B(3, 4, 0)$. Tìm giá trị lớn nhất của diện tích tam giác $M A B$ với $M in (S)$.

Ta có:
$
  A B = 6
$
Đường thẳng $A B$ là đường thẳng song song trục $O x$ trong mặt phẳng $y = 4, z = 0$, nên:
$
  h = d(O, A B) = 4
$
Do đó:
$
  S_"max" = (1 / 2) dot 6 dot (4 + 5) = 27
$

*Ý tưởng sư phạm.* Phần lớn học sinh bị hút vào việc tính tọa độ $M$. Thực ra đáy $A B$ cố định nên chỉ cần tối ưu chiều cao.

=== Mô hình 5. Thể tích tứ diện có một đỉnh di động trên mặt cầu

*Tình huống mô hình hóa thường gặp.* Một khối chóp có đáy $A B C$ đặt cố định, còn đỉnh $M$ là đầu cảm biến hoặc đèn quét nằm trên mặt cầu.

*Cấu trúc đề.* Cho $A, B, C$ cố định và $M in (S)$. Tìm min - max của $V_(M A B C)$.

*Quy đổi nhanh.*
$
  V_(M A B C) = (1 / 3) S_(triangle A B C) dot d(M, (A B C))
$
Vậy đây là *Mô hình 2* dưới dạng thể tích.

*Công thức nhanh.* Nếu $h = d(I, (A B C))$ thì:
$
  V_"max" = (1 / 3) S_(triangle A B C) dot (h + R)
$
$
  V_"min" = (1 / 3) S_(triangle A B C) dot max(0, h - R)
$

*Ví dụ mẫu.* Cho $(S): x^2 + y^2 + z^2 = 16$. Cho $A(3, 0, 0)$, $B(0, 4, 0)$, $C(0, 0, 0)$. Tìm giá trị lớn nhất của $V_(M A B C)$.

Mặt phẳng $(A B C)$ có phương trình $z = 0$. Tâm $O(0, 0, 0)$ nên $h = 0$, $R = 4$.
Diện tích đáy:
$
  S_(triangle A B C) = (1 / 2) dot 3 dot 4 = 6
$
Do đó:
$
  V_"max" = (1 / 3) dot 6 dot 4 = 8
$

*Ví dụ thực chiến kiểu đề thi.* Cho mặt cầu $(S): x^2 + y^2 + z^2 = 9$. Xét tam giác đáy với $A(0, 0, 1)$, $B(2, 0, 1)$, $C(0, 2, 1)$. Tìm thể tích lớn nhất của tứ diện $M A B C$ khi $M in (S)$.

Mặt phẳng đáy là $z = 1$, nên:
$
  h = d(O, (A B C)) = 1
$
Diện tích đáy:
$
  S_(triangle A B C) = (1 / 2) dot 2 dot 2 = 2
$
Vậy:
$
  V_"max" = (1 / 3) dot 2 dot (1 + 3) = 8 / 3
$

*Biến thể kiểm tra nhanh.* Nhiều đề hỏi trực tiếp giá trị của định thức thể tích. Khi đó chỉ cần nhớ $|det| = 6 V$.

=== Mô hình 13. Khoảng cách giữa hai đường thẳng chéo nhau, một đường thay đổi

*Tình huống mô hình hóa thường gặp.* Một ray hoặc trục kỹ thuật đi qua $M$ với hướng cố định, còn một ray khác đứng yên; cần đo khoảng hở giữa hai đường thẳng chéo nhau đó.

*Cấu trúc đề.* Cho $M in (S)$. Đường thẳng $Delta_M$ đi qua $M$ và song song với một vectơ cố định. Cho một đường thẳng $d$ cố định. Tìm min - max của $d(Delta_M, d)$.

*Dấu hiệu nhận diện.* Có hai hướng cố định; chỉ vị trí của $M$ là thay đổi.

*Ý tưởng lõi.* Khi hai hướng đã cố định, công thức khoảng cách giữa hai đường thẳng chéo nhau trở thành trị tuyệt đối của *một biểu thức tuyến tính theo tọa độ của $M$*. Vì thế mô hình này rơi về *Mô hình 1* hoặc *Mô hình 2*.

*Ví dụ mẫu.* Cho $(S): x^2 + y^2 + z^2 = 9$. Đường thẳng $d$ đi qua $A(1, 0, 0)$ và song song với trục $O y$. Với $M(x, y, z) in (S)$, dựng $Delta_M$ qua $M$ và song song với trục $O z$. Tìm giá trị lớn nhất của $d(Delta_M, d)$.

Trong cấu hình này, khoảng cách giữa $Delta_M$ và $d$ chính là $|1 - x|$.
Vì $x in [-3, 3]$, nên giá trị lớn nhất đạt tại $x = -3$:
$
  d_"max" = |1 - (-3)| = 4
$

*Ví dụ thực chiến kiểu đề thi.* Cho mặt cầu $(S): (x - 1)^2 + y^2 + z^2 = 4$. Gọi $d$ là trục $O z$. Với mỗi $M in (S)$, dựng đường thẳng $Delta_M$ đi qua $M$ và song song trục $O y$. Tìm giá trị lớn nhất của $d(Delta_M, d)$.

Trong cấu hình này, khoảng cách giữa $Delta_M$ và $d$ chính là $|x|$.
Vì $M in (S)$ nên:
$
  x in [-1, 3]
$
Suy ra:
$
  d_"max" = 3
$

*Mấu chốt.* Đừng bị dọa bởi khoảng cách giữa hai đường chéo nhau. Phần khó thực chất nằm ở việc nhận ra nó đã trở thành một biểu thức bậc nhất theo $x, y, z$.

=== Mô hình 19. Bán kính hoặc diện tích thiết diện của mặt cầu với mặt phẳng tham số

*Tình huống mô hình hóa thường gặp.* Một mặt phẳng cắt bể cầu, nắp cầu, hay vùng quét cầu để tạo ra một thiết diện tròn cần tối ưu bán kính hoặc diện tích.

*Cấu trúc đề.* Cho mặt cầu $(S)$ và họ mặt phẳng $(P_m)$. Giao tuyến là đường tròn $(C_m)$. Tìm $m$ để bán kính hoặc diện tích thiết diện lớn nhất, nhỏ nhất, hoặc bằng một giá trị cho trước.

*Công thức lõi.* Nếu $I$ là tâm mặt cầu, bán kính $R$, đặt $h(m) = d(I, (P_m))$, thì:
$
  r(m) = sqrt(R^2 - h(m)^2)
$
$
  S(m) = pi dot (R^2 - h(m)^2)
$
Muốn thiết diện lớn nhất thì phải làm $h(m)$ nhỏ nhất. Muốn thiết diện bằng một giá trị cho trước thì giải từ $r(m)$ hoặc $S(m)$.

*Ví dụ mẫu.* Cho $(S): x^2 + y^2 + z^2 = 25$ và $(P_m): x + 2 y + 2 z - m = 0$. Tìm $m$ để thiết diện có diện tích lớn nhất.

Khoảng cách từ tâm $O$ đến $(P_m)$ là:
$
  h(m) = |m| / sqrt(1 + 4 + 4) = |m| / 3
$
Diện tích lớn nhất khi $h(m)$ nhỏ nhất, tức là $m = 0$.
Khi đó thiết diện là đường tròn lớn, diện tích bằng:
$
  25 pi
$

*Ví dụ thực chiến kiểu đề thi.* Với cùng mặt cầu $(S): x^2 + y^2 + z^2 = 25$ và họ mặt phẳng $(P_m): x + 2 y + 2 z - m = 0$, tìm $m$ để thiết diện có bán kính bằng $4$.

Ta có:
$
  h(m) = |m| / 3
$
Điều kiện $r = 4$ cho:
$
  4 = sqrt(25 - h(m)^2)
$
nên:
$
  16 = 25 - m^2 / 9
$
$
  m^2 = 81
$
Vậy:
$
  m = ± 9
$

*Biến thể thi rất hay.* Tìm $m$ để mặt phẳng cắt mặt cầu theo đường tròn có bán kính $3$; bài toán này chỉ khác một bước thế số.

=== Mô hình 20. Tồn tại tham số, thực chất là bài toán min - max

*Tình huống mô hình hóa thường gặp.* Đề thi thường không hỏi thẳng cực trị mà chuyển thành câu hỏi tham số: khi nào mặt phẳng cắt, tiếp xúc, hoặc khi nào phương trình còn nghiệm trên mặt cầu.

*Cấu trúc đề.* Cho $M in (S)$, tìm $m$ để tồn tại $M$ sao cho $P(M) = m$, hoặc mặt phẳng phụ thuộc $m$ cắt mặt cầu.

*Chiến thuật nhanh.* Tính khoảng giá trị của $P(M)$ trên mặt cầu. Khi đó điều kiện tồn tại chính là:
$
  P_"min" <= m <= P_"max"
$

*Ví dụ mẫu.* Cho $(S): (x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 4$. Tìm $m$ để mặt phẳng $x - 2 y + 2 z = m$ cắt mặt cầu.

Đặt $P = x - 2 y + 2 z$. Tại tâm $I(1, -2, 3)$ ta có:
$
  P(I) = 1 - 2 dot (-2) + 2 dot 3 = 11
$
$
  sqrt(1^2 + (-2)^2 + 2^2) = 3
$
Suy ra:
$
  P_"min" = 11 - 2 dot 3 = 5
$
$
  P_"max" = 11 + 2 dot 3 = 17
$
Vậy điều kiện là:
$
  5 <= m <= 17
$

*Ví dụ thực chiến kiểu đề thi.* Cho mặt cầu $(S): x^2 + y^2 + z^2 = 9$. Tìm $m$ để mặt phẳng $x + y + z = m$ tiếp xúc với $(S)$.

Đặt $P = x + y + z$. Trên $(S)$ ta có:
$
  -3 sqrt(3) <= P <= 3 sqrt(3)
$
Mặt phẳng tiếp xúc ứng với hai giá trị biên, nên:
$
  m = ± 3 sqrt(3)
$

*Ghi nhớ.* Đây là mô hình cực kỳ quan trọng vì đề thi thường không hỏi trực diện "tìm max - min" mà chuyển thành hỏi *tham số để có nghiệm*.

== Nhóm B. Quy Về Trung Điểm, Trọng Tâm, Tâm Phụ

=== Mô hình 6. Tổng bình phương khoảng cách đến hai điểm cố định

*Tình huống mô hình hóa thường gặp.* Tổng năng lượng, tổng độ suy hao, hoặc tổng bình phương sai lệch đến hai trạm cố định thường rơi đúng vào mô hình này.

*Cấu trúc đề.* Tìm min - max của $M A^2 + M B^2$ khi $M in (S)$.

*Thủ pháp chuẩn.* Gọi $G$ là trung điểm $A B$. Ta có:
$
  M A^2 + M B^2 = 2 M G^2 + A B^2 / 2
$
Nghĩa là bài toán quy về tối ưu khoảng cách từ $M$ đến một điểm cố định $G$.

*Ví dụ mẫu.* Cho $(S): x^2 + y^2 + z^2 = 9$, $A(2, 0, 0)$, $B(0, 2, 0)$. Tìm giá trị lớn nhất của $M A^2 + M B^2$.

Trung điểm $G(1, 1, 0)$, nên $O G = sqrt(2)$, $R = 3$.
Suy ra:
$
  M G_"max" = 3 + sqrt(2)
$
Và $A B^2 = 8$. Do đó:
$
  (M A^2 + M B^2)_"max" = 2 (3 + sqrt(2))^2 + 8 / 2 = 26 + 12 sqrt(2)
$

*Ví dụ thực chiến kiểu đề thi.* Cho mặt cầu $(S): (x - 1)^2 + y^2 + z^2 = 4$, $A(0, 0, 0)$, $B(2, 0, 0)$. Tìm giá trị lớn nhất của $M A^2 + M B^2$.

Gọi $G$ là trung điểm $A B$ thì $G(1, 0, 0)$, chính là tâm của mặt cầu.
Vì thế:
$
  M G = 2
$
và $A B^2 = 4$. Suy ra:
$
  M A^2 + M B^2 = 2 M G^2 + A B^2 / 2 = 2 dot 2^2 + 4 / 2 = 10
$
Nghĩa là đại lượng này *không đổi*, nên giá trị lớn nhất cũng bằng $10$.

*Mấu chốt.* Với tổng bình phương, đừng khai triển trực tiếp theo $x, y, z$ nếu chưa thử kéo về trung điểm.

=== Mô hình 7. Tối ưu tích vô hướng của hai vectơ cùng gốc tại điểm di động

*Tình huống mô hình hóa thường gặp.* Góc mở giữa hai hướng nhìn từ $M$ đến $A, B$ hoặc công suất ghép giữa hai tín hiệu thường được mã hóa qua tích vô hướng $vec(M A) dot vec(M B)$.

*Cấu trúc đề.* Tìm min - max của tích vô hướng giữa hai vectơ có đầu mút lần lượt tại $A, B$ và cùng gốc tại $M$.

*Công thức nhanh.* Nếu $G$ là trung điểm $A B$ thì đại lượng cần tối ưu bằng:
$
  T = M G^2 - A B^2 / 4
$
Nên đây lại là bài toán tối ưu theo $M G$.

*Ví dụ mẫu.* Cho $(S): x^2 + y^2 + z^2 = 4$, $A(2, 0, 0)$, $B(0, 2, 0)$. Tìm giá trị nhỏ nhất của $T$.

Với $G(1, 1, 0)$ ta có $O G = sqrt(2) < R = 2$, nên tồn tại điểm $M$ trùng với $G$ theo nghĩa khoảng cách nhỏ nhất đến $G$ bằng $0$ trên mặt cầu? Không. Vì $G$ nằm *bên trong* mặt cầu, khoảng cách từ điểm trên mặt cầu đến $G$ nhỏ nhất là $R - O G = 2 - sqrt(2)$.

Khi đó:
$
  T_"min" = (2 - sqrt(2))^2 - 8 / 4 = (6 - 4 sqrt(2)) - 2 = 4 - 4 sqrt(2)
$

*Ví dụ thực chiến kiểu đề thi.* Cho mặt cầu $(S): (x - 1)^2 + y^2 + z^2 = 9$, $A(0, 0, 0)$, $B(2, 0, 0)$. Tính $T = vec(M A) dot vec(M B)$ với $M in (S)$.

Với $G$ là trung điểm $A B$, ta có $G(1, 0, 0)$ chính là tâm mặt cầu.
Do đó:
$
  M G = 3, A B^2 = 4
$
Suy ra:
$
  T = M G^2 - A B^2 / 4 = 3^2 - 4 / 4 = 8
$
Đây là một ví dụ đẹp cho thấy biểu thức có thể trở thành *hằng số*.

*Lưu ý sư phạm.* Với mô hình này, nhiều tài liệu rút ngay về $M G_"min" = 0$ là sai. Khoảng cách từ *điểm trên mặt cầu* đến điểm $G$ bên trong mặt cầu không thể bằng $0$ trừ khi $G$ nằm trên mặt cầu.

=== Mô hình 8. Tối ưu khoảng cách giữa hai mặt cầu

*Tình huống mô hình hóa thường gặp.* Đây là mô hình của hai vùng phủ sóng, hai quả cầu an toàn, hoặc hai vật thể cầu cần đo khoảng hở gần nhất và xa nhất.

*Cấu trúc đề.* Cho $M in (S_1)$, $N in (S_2)$. Tìm min - max của $M N$.

*Công thức lõi.* Gọi hai tâm là $I, J$, hai bán kính là $R_1, R_2$, đặt $I J = d$.

Khi đó:
$
  M N_"max" = d + R_1 + R_2
$

Khoảng cách nhỏ nhất phụ thuộc vào vị trí tương đối của hai mặt cầu:

- Nếu $d > R_1 + R_2$ thì $M N_"min" = d - R_1 - R_2$.
- Nếu $|R_1 - R_2| <= d <= R_1 + R_2$ thì $M N_"min" = 0$.
- Nếu $d < |R_1 - R_2|$ thì $M N_"min" = R_"lon" - R_"nho" - d$.

*Ví dụ mẫu.* Cho $(S_1): x^2 + y^2 + z^2 = 4$ và $(S_2): (x - 10)^2 + y^2 + z^2 = 9$.

Ta có $I(0, 0, 0)$, $J(10, 0, 0)$, $R_1 = 2$, $R_2 = 3$, $I J = 10$.
Suy ra:
$
  M N_"min" = 10 - 2 - 3 = 5
$
$
  M N_"max" = 10 + 2 + 3 = 15
$

*Ví dụ thực chiến kiểu đề thi.* Cho $(S_1): x^2 + y^2 + z^2 = 9$ và $(S_2): (x - 4)^2 + y^2 + z^2 = 4$. Tìm giá trị nhỏ nhất và lớn nhất của $M N$ với $M in (S_1)$, $N in (S_2)$.

Ta có $R_1 = 3$, $R_2 = 2$, khoảng cách hai tâm bằng $4$.
Vì:
$
  |R_1 - R_2| = 1 <= 4 <= 5 = R_1 + R_2
$
nên hai mặt cầu giao nhau, do đó:
$
  M N_"min" = 0
$
Mặt khác:
$
  M N_"max" = 4 + 3 + 2 = 9
$

*Biến thể quen thuộc.* Nếu đề hỏi min - max của $M N^2$ thì chỉ cần bình phương hai kết quả khoảng cách.

=== Mô hình 9. Tối ưu tỉ số $(M A)/(M B)$

*Tình huống mô hình hóa thường gặp.* Khi đề so sánh mức gần xa của $M$ tới hai trạm $A, B$, tỉ số $(M A)/(M B)$ thường xuất hiện thay vì tổng hay hiệu.

*Cấu trúc đề.* Cho $M in (S)$, tìm min - max của $(M A)/(M B)$.

*Chiến thuật.* Đặt:
$
  (M A)/(M B) = k
$
Khi đó:
$
  M A^2 = k^2 M B^2
$
và tập hợp điểm thỏa điều kiện là một mặt cầu Apollonius. Bài toán trở thành: tìm các $k$ sao cho mặt cầu Apollonius còn cắt được mặt cầu gốc.

*Ví dụ đối xứng đẹp.* Cho $(S): x^2 + y^2 + z^2 = 1$, $A(2, 0, 0)$, $B(-2, 0, 0)$. Tìm giá trị lớn nhất của $(M A)/(M B)$.

Do đối xứng, điểm cực trị nằm trên trục $O x$. Lấy $M(x, 0, 0)$ với $x in [-1, 1]$.
Khi đó:
$
  (M A)/(M B) = (2 - x) / (x + 2)
$
Hàm này giảm trên $[-1, 1]$, nên giá trị lớn nhất đạt tại $x = -1$:
$
  ((M A)/(M B))_"max" = 3
$

*Ví dụ thực chiến kiểu đề thi.* Cho $(S): x^2 + y^2 + z^2 = 4$, $A(3, 0, 0)$, $B(-3, 0, 0)$. Tìm giá trị nhỏ nhất của $(M A)/(M B)$.

Do cấu hình đối xứng qua trục $O x$, xét $M(x, 0, 0)$ với $x in [-2, 2]$.
Khi đó:
$
  (M A)/(M B) = (3 - x) / (x + 3)
$
Hàm giảm trên $[-2, 2]$, nên giá trị nhỏ nhất đạt tại $x = 2$:
$
  ((M A)/(M B))_"min" = (3 - 2) / (2 + 3) = 1 / 5
$

*Mấu chốt.* Nếu cấu hình có trục đối xứng rõ ràng, nên khai thác đối xứng trước khi gọi mặt cầu Apollonius.

=== Mô hình 10. Tối ưu tổng $M A + M B$

*Tình huống mô hình hóa thường gặp.* Đây là mô hình đường đi hai chặng từ $M$ đến hai mốc $A, B$, rất hay xuất hiện khi đề bọc trong ngôn ngữ quãng đường hoặc thời gian truyền.

*Cấu trúc đề.* Cho $M in (S)$, tìm min - max của $M A + M B$.

*Đặc điểm.* Đây là dạng không có công thức đóng đẹp như tổng bình phương. Cần hạ bài toán về mặt phẳng chứa $A, B, I$ để tận dụng đối xứng.

*Ví dụ mẫu.* Cho $(S): x^2 + y^2 + z^2 = 1$, $A(2, 0, 0)$, $B(-2, 0, 0)$. Tìm min - max của $M A + M B$.

Do đối xứng theo trục $O x$:

- Nhỏ nhất đạt tại $M(1, 0, 0)$ hoặc $M(-1, 0, 0)$, khi đó $M A + M B = 1 + 3 = 4$.
- Lớn nhất đạt tại $M(0, 1, 0)$ hoặc mọi điểm có $x = 0$ trên mặt cầu, khi đó:
$
  M A = M B = sqrt(5)
$
nên:
$
  (M A + M B)_"max" = 2 sqrt(5)
$

*Ví dụ thực chiến kiểu đề thi.* Cho $(S): x^2 + y^2 + z^2 = 4$, $A(4, 0, 0)$, $B(-4, 0, 0)$. Tìm giá trị lớn nhất của $M A + M B$.

Do đối xứng, cực trị lớn nhất đạt khi $x = 0$.
Khi đó với mọi $M$ thỏa $x = 0$ trên mặt cầu, ta có:
$
  M A = M B = sqrt(4^2 + 2^2) = sqrt(20)
$
Suy ra:
$
  (M A + M B)_"max" = 2 sqrt(20) = 4 sqrt(5)
$

*Ghi nhớ.* Nếu không có đối xứng, phải kéo bài toán về mặt phẳng $A B I$ rồi khảo sát đường tròn giao tuyến.

=== Mô hình 11. Tối ưu $|M A - M B|$

*Tình huống mô hình hóa thường gặp.* Hiệu quãng đường đến hai nguồn phát, hai cảm biến, hay hai mốc chuẩn là mô hình chênh lệch thời gian rất quen trong đề thi.

*Cấu trúc đề.* Cho $M in (S)$, tìm giá trị lớn nhất của $|M A - M B|$.

*Tư duy nền.* Luôn có bất đẳng thức tam giác:
$
  |M A - M B| <= A B
$
Nhưng trên mặt cầu chưa chắc đạt được cận trên đó. Điểm cực trị vẫn thường nằm trong mặt phẳng chứa $A, B, I$.

*Ví dụ mẫu.* Với $(S): x^2 + y^2 + z^2 = 1$, $A(2, 0, 0)$, $B(-2, 0, 0)$, ta xét các điểm đối xứng trên trục $O x$.

Tại $M(1, 0, 0)$:
$
  M A = 1, M B = 3
$
Suy ra:
$
  |M A - M B| = 2
$
Đây là giá trị lớn nhất.

*Ví dụ thực chiến kiểu đề thi.* Cho $(S): x^2 + y^2 + z^2 = 4$, $A(2, 0, 0)$, $B(-2, 0, 0)$. Tìm giá trị lớn nhất của $|M A - M B|$.

Theo bất đẳng thức tam giác:
$
  |M A - M B| <= A B = 4
$
Lấy $M(2, 0, 0) in (S)$ thì:
$
  M A = 0, M B = 4
$
nên:
$
  |M A - M B| = 4
$
Vậy giá trị lớn nhất bằng $4$.

*Biến thể thi hay.* Người ra đề hay chia thêm cho $M A + M B$ để tạo ra tỉ số chuẩn hóa.

=== Mô hình 12. Tối ưu tích $M A dot M B$

*Tình huống mô hình hóa thường gặp.* Tích hai khoảng cách xuất hiện khi đề nhân hai độ suy hao, hai quãng đường, hoặc hai hệ số ảnh hưởng từ $M$ tới hai điểm $A, B$.

*Cấu trúc đề.* Cho $M in (S)$, tìm min - max của $M A dot M B$.

*Kỹ thuật chủ đạo.* Nên bình phương đại lượng trước. Nếu cấu hình đối xứng, bài toán thường rơi về một biến.

*Ví dụ mẫu.* Cho $(S): x^2 + y^2 + z^2 = 1$, $A(2, 0, 0)$, $B(-2, 0, 0)$. Tìm min - max của $M A dot M B$.

Đặt $M(x, y, z)$ với $x^2 + y^2 + z^2 = 1$.
Ta có:
$
  M A^2 = (x - 2)^2 + y^2 + z^2 = 5 - 4 x
$
$
  M B^2 = (x + 2)^2 + y^2 + z^2 = 5 + 4 x
$
Suy ra:
$
  (M A dot M B)^2 = (5 - 4 x)(5 + 4 x) = 25 - 16 x^2
$
Vì $x in [-1, 1]$, nên:
$
  9 <= 25 - 16 x^2 <= 25
$
Do đó:
$
  3 <= M A dot M B <= 5
$

*Ví dụ thực chiến kiểu đề thi.* Cho $(S): x^2 + y^2 + z^2 = 4$, $A(3, 0, 0)$, $B(-3, 0, 0)$. Tìm giá trị nhỏ nhất và lớn nhất của $M A dot M B$.

Với $M(x, y, z) in (S)$, ta có:
$
  M A^2 = (x - 3)^2 + y^2 + z^2 = 13 - 6 x
$
$
  M B^2 = (x + 3)^2 + y^2 + z^2 = 13 + 6 x
$
Suy ra:
$
  (M A dot M B)^2 = 169 - 36 x^2
$
Do $x^2 <= 4$, nên:
$
  25 <= (M A dot M B)^2 <= 169
$
Vậy:
$
  5 <= M A dot M B <= 13
$

*Mấu chốt.* Nếu chưa thấy lối ra, hãy thử bình phương tích để loại căn.

== Nhóm C. Giao Hình, Tiếp Xúc, Đường Tròn Ẩn

=== Mô hình 14. Tiếp điểm của tiếp tuyến kẻ từ điểm ngoài đến mặt cầu

*Tình huống mô hình hóa thường gặp.* Đèn chiếu, camera, hoặc dây căng từ một điểm ngoài chạm vào mặt cầu tại các tiếp điểm; tập các tiếp điểm luôn ẩn một đường tròn.

*Cấu trúc đề.* Cho điểm $A$ nằm ngoài mặt cầu $(S)$. Qua $A$ kẻ các tiếp tuyến đến $(S)$, tiếp xúc tại $M$. Tối ưu một đại lượng liên quan đến $M$.

*Định lý lõi.* Nếu $I$ là tâm mặt cầu, bán kính $R$, thì điều kiện tiếp xúc cho tiếp điểm $M$ là:
$
  I M ⊥ A M
$
và tương đương với:
$
  x x_A + y y_A + z z_A = R^2
$
Nghĩa là tập tiếp điểm nằm trên một mặt phẳng, và giao của mặt phẳng này với mặt cầu là một *đường tròn tiếp điểm*.

*Ví dụ mẫu.* Cho mặt cầu tâm $I(0, 0, 0)$, bán kính $3$, điểm $A(0, 0, 5)$. Gọi $M(x, y, z)$ là tiếp điểm của tiếp tuyến từ $A$ đến mặt cầu. Tìm tọa độ $z$.

Từ điều kiện tiếp xúc ta được:
$
  5 z = 9
$
Suy ra:
$
  z = 9 / 5
$
Vậy mọi tiếp điểm nằm trên đường tròn:
$
  x^2 + y^2 + z^2 = 9, z = 9 / 5
$

*Ví dụ thực chiến kiểu đề thi.* Cho mặt cầu tâm $O(0, 0, 0)$, bán kính $4$, và điểm $A(0, 0, 8)$. Với $M(x, y, z)$ là tiếp điểm của tiếp tuyến kẻ từ $A$ đến mặt cầu, tìm giá trị lớn nhất của $x + y$.

Điều kiện tiếp xúc cho:
$
  8 z = 16
$
nên:
$
  z = 2
$
Khi đó $M$ nằm trên đường tròn:
$
  x^2 + y^2 = 16 - 2^2 = 12
$
Do đó:
$
  (x + y)^2 <= 2 (x^2 + y^2) = 24
$
Suy ra:
$
  (x + y)_"max" = 2 sqrt(6)
$

*Biến thể mạnh.* Sau khi tìm được mặt phẳng chứa đường tròn tiếp điểm, mọi bài toán còn lại chỉ là tối ưu trên một đường tròn.

=== Mô hình 15. Min - max trên giao của hai mặt cầu

*Tình huống mô hình hóa thường gặp.* Một vật thể cùng lúc thuộc hai vùng phủ sóng cầu, nên quỹ tích thực của nó không còn là mặt cầu mà bị khóa trên đường tròn giao.

*Cấu trúc đề.* Điểm $M$ đồng thời thuộc hai mặt cầu $(S_1)$ và $(S_2)$. Tối ưu một biểu thức theo $x, y, z$.

*Chiến thuật nhanh.* Trừ hai phương trình mặt cầu để nhận được một mặt phẳng $(P)$. Vì thế giao tuyến $(S_1) ∩ (S_2)$ chính là một đường tròn nằm trong $(P)$.

*Ví dụ mẫu.* Cho $M(x, y, z)$ thỏa:
$
  x^2 + y^2 + z^2 = 25
$
và
$
  (x - 6)^2 + y^2 + z^2 = 25
$
Tìm giá trị lớn nhất của $y$.

Lấy phương trình thứ nhất trừ phương trình thứ hai:
$
  x^2 - (x - 6)^2 = 0
$
$
  12 x - 36 = 0
$
nên $x = 3$.
Thế lại vào phương trình đầu:
$
  9 + y^2 + z^2 = 25
$
Suy ra:
$
  y^2 + z^2 = 16
$
Vậy:
$
  y_"max" = 4
$

*Ví dụ thực chiến kiểu đề thi.* Cho $M(x, y, z)$ thỏa:
$
  x^2 + y^2 + z^2 = 25
$
và
$
  (x - 6)^2 + y^2 + z^2 = 25
$
Tìm giá trị lớn nhất của $x + z$.

Lấy hiệu hai phương trình, ta vẫn được:
$
  x = 3
$
Suy ra:
$
  y^2 + z^2 = 16
$
Khi đó:
$
  x + z = 3 + z <= 3 + 4 = 7
$
Dấu bằng khi $z = 4$.
Vậy:
$
  (x + z)_"max" = 7
$

*Ghi nhớ.* Đây là mô hình cực quen: giao của hai mặt cầu luôn phải nghĩ ngay đến đường tròn ẩn.

=== Mô hình 16. Min - max trên mặt cầu có thêm điều kiện nửa không gian

*Tình huống mô hình hóa thường gặp.* Điểm $M$ không được chạy trên toàn bộ mặt cầu mà chỉ được ở một nửa không gian, chẳng hạn vùng bay phía trên mặt đất hoặc phía trước một tấm chắn.

*Cấu trúc đề.* Cho $M in (S)$ và $a x + b y + c z + d >= 0$. Tìm min - max của một biểu thức.

*Bản chất.* Miền xét không còn là cả mặt cầu mà chỉ là *chỏm cầu* hoặc *nửa mặt cầu*. Cực trị có thể xảy ra ở:

- điểm cực trị tự do trên toàn mặt cầu, nếu nó vẫn thỏa điều kiện phụ,
- hoặc trên *đường tròn biên* là giao của mặt cầu với mặt phẳng biên.

*Ví dụ mẫu.* Cho $x^2 + y^2 + z^2 = 1$, $z >= 0$. Tìm min - max của $P = x + y + z$.

Không xét điều kiện phụ, ta có:
$
  P_"max" = sqrt(3)
$
đạt tại $(1 / sqrt(3), 1 / sqrt(3), 1 / sqrt(3))$, điểm này thỏa $z >= 0$.

Giá trị nhỏ nhất tự do là $-sqrt(3)$, nhưng điểm đạt được có $z < 0$, bị loại. Do đó phải xét biên $z = 0$.
Trên biên ta có $x^2 + y^2 = 1$, nên:
$
  P = x + y
$
Giá trị nhỏ nhất là:
$
  -sqrt(2)
$

*Ví dụ thực chiến kiểu đề thi.* Cho $M(x, y, z)$ thỏa $x^2 + y^2 + z^2 = 4$ và $z >= 1$. Tìm giá trị nhỏ nhất, lớn nhất của $P = x + y + z$.

Nếu bỏ điều kiện phụ, ta có:
$
  P_"max" = 2 sqrt(3)
$
đạt tại điểm cùng hướng với $(1, 1, 1)$, và điểm đó thỏa $z >= 1$.

Giá trị nhỏ nhất tự do bị loại, nên xét biên $z = 1$. Khi đó:
$
  x^2 + y^2 = 3
$
và:
$
  P = x + y + 1
$
Do $x + y >= -sqrt(2 (x^2 + y^2)) = -sqrt(6)$, suy ra:
$
  P_"min" = 1 - sqrt(6)
$

*Mấu chốt.* Mọi điều kiện nửa không gian đều phải kiểm tra thêm đường tròn biên.

=== Mô hình 17. Tối ưu tích hai khoảng cách đến hai mặt phẳng

*Tình huống mô hình hóa thường gặp.* Đây là bài toán đo đồng thời hai độ lệch vuông góc của $M$ tới hai mặt chuẩn độc lập.

*Cấu trúc đề.* Cho $M in (S)$, tìm min - max của $d(M, (P)) dot d(M, (Q))$.

*Kỹ thuật thường dùng.* Nếu $(P), (Q)$ là các mặt phẳng tọa độ hoặc có dạng đơn giản, khoảng cách trở thành trị tuyệt đối của các tọa độ, từ đó dùng bất đẳng thức hoặc đổi biến.

*Ví dụ mẫu.* Cho $(S): x^2 + y^2 + z^2 = 1$. Tìm giá trị lớn nhất của:
$
  d(M, (O y z)) dot d(M, (O x z))
$
Ta có:
$
  d(M, (O y z)) = |x|, d(M, (O x z)) = |y|
$
Nên cần tối ưu $|x y|$ với $x^2 + y^2 + z^2 = 1$.
Vì $x^2 + y^2 <= 1$ nên:
$
  2 |x y| <= x^2 + y^2 <= 1
$
Suy ra:
$
  |x y| <= 1 / 2
$
Dấu bằng khi $x^2 = y^2 = 1 / 2$ và $z = 0$.

*Ví dụ thực chiến kiểu đề thi.* Cho $(S): x^2 + y^2 + z^2 = 4$. Tìm giá trị lớn nhất của:
$
  d(M, (O x y)) dot d(M, (O x z))
$

Ta có:
$
  d(M, (O x y)) = |z|, d(M, (O x z)) = |y|
$
Nên cần tối ưu $|y z|$ với $x^2 + y^2 + z^2 = 4$.
Theo bất đẳng thức:
$
  2 |y z| <= y^2 + z^2 <= 4
$
suy ra:
$
  |y z| <= 2
$
Dấu bằng khi $x = 0$ và $y^2 = z^2 = 2$.

*Biến thể mạnh.* Người ra đề thường thay tích $|x y|$ bằng $|x y + y z + z x|$ hoặc $|x y z|$.

=== Mô hình 18. Biểu thức bậc hai trên mặt cầu

*Tình huống mô hình hóa thường gặp.* Năng lượng, mô-men, hay độ lệch bậc hai của một điểm trên mặt cầu thường dẫn tới biểu thức bậc hai theo $x, y, z$.

*Cấu trúc đề.* Cho $x^2 + y^2 + z^2 = R^2$, tối ưu một biểu thức bậc hai như $a x^2 + b y^2 + c z^2 + d x y + e y z + f z x$.

*Chiến thuật.* Với đề phổ thông, thường không cần ma trận hay trị riêng; chỉ cần ghép bình phương, dùng Cauchy, hoặc dùng hằng đẳng thức quen thuộc.

*Ví dụ mẫu.* Cho $x^2 + y^2 + z^2 = 4$. Tìm giá trị lớn nhất của:
$
  P = x y + y z + z x
$
Ta có:
$
  (x + y + z)^2 = x^2 + y^2 + z^2 + 2 (x y + y z + z x)
$
Nên:
$
  P = ((x + y + z)^2 - 4) / 2
$
Theo bất đẳng thức Cauchy:
$
  (x + y + z)^2 <= 3 (x^2 + y^2 + z^2) = 12
$
Suy ra:
$
  P <= (12 - 4) / 2 = 4
$
Dấu bằng khi $x = y = z = 2 / sqrt(3)$.

*Ví dụ thực chiến kiểu đề thi.* Cho $x^2 + y^2 + z^2 = 4$. Tìm giá trị nhỏ nhất và lớn nhất của:
$
  Q = x^2 + y^2 - z^2
$

Vì $x^2 + y^2 = 4 - z^2$, nên:
$
  Q = 4 - 2 z^2
$
Do $0 <= z^2 <= 4$, suy ra:
$
  -4 <= Q <= 4
$
Vậy:
$
  Q_"min" = -4, Q_"max" = 4
$

*Lưu ý quan trọng.* Giá trị nhỏ nhất của $P$ ở mô hình này là $-2$, đạt khi $x + y + z = 0$.

== Nhóm D. Tham Số, Thiết Diện, Bài Toán Tồn Tại

=== Mô hình 2 bổ sung. Khoảng cách đến mặt phẳng và thiết diện của mặt cầu

*Kết nối nhanh.* Nếu đề cho một mặt phẳng cắt mặt cầu, thì bán kính thiết diện tròn được tính bởi:
$
  r = sqrt(R^2 - h^2)
$
trong đó $h = d(I, (P))$.

Đây là cầu nối giữa *Mô hình 2* và *Mô hình 19*. Người ra đề rất thích đi đường vòng: không hỏi khoảng cách từ tâm đến mặt phẳng, mà hỏi bán kính thiết diện, diện tích thiết diện, hoặc điều kiện để thiết diện là đường tròn lớn.

=== Mô hình 3 bổ sung. Khoảng cách đến đường thẳng và diện tích tam giác

*Quy đổi bắt buộc phải nhớ.*
$
  S_(triangle M A B) = (1 / 2) A B dot d(M, A B)
$
Nếu có nhiều điểm cố định hơn, hãy kiểm tra xem có thể rút đáy cố định ra ngoài không. Một bài diện tích nhìn dài đôi khi chỉ còn là mô hình khoảng cách cơ bản.

=== Mô hình 5 bổ sung. Thể tích và khoảng cách đến mặt phẳng đáy

*Quy đổi bắt buộc phải nhớ.*
$
  V_(M A B C) = (1 / 3) S_(triangle A B C) dot d(M, (A B C))
$
Điểm mạnh của mô hình này là biến một biểu thức không gian rối rắm thành bài toán một chiều theo trục pháp tuyến của đáy.

=== Mô hình 6 mở rộng. Tổng bình phương đến ba điểm cố định

*Khi nào dùng trọng tâm.* Nếu xuất hiện $M A^2 + M B^2 + M C^2$ thì gọi $G$ là trọng tâm tam giác $A B C$ và dùng công thức:
$
  M A^2 + M B^2 + M C^2 = 3 M G^2 + G A^2 + G B^2 + G C^2
$
Như vậy bài toán lại trở về tối ưu khoảng cách từ $M$ đến điểm cố định $G$.

=== Mô hình 10 mở rộng. Tập giá trị của $M A + M B$

*Điều rất hay ra.* Đề không hỏi max - min trực tiếp mà hỏi: "Tìm $m$ để tồn tại điểm $M in (S)$ sao cho $M A + M B = m$." Khi đó chỉ cần tìm đoạn giá trị của tổng rồi trả lời bằng một khoảng.

=== Mô hình 12 mở rộng. Tập giá trị của $M A dot M B$

*Điều hay bị quên.* Sau khi tìm được đoạn giá trị của $(M A dot M B)^2$, phải trả lại miền giá trị của chính $M A dot M B$ bằng cách khai thác điều kiện không âm của khoảng cách.

= III. Bộ Ví Dụ Áp Dụng Đa Dạng

== Ví dụ 1. Cực trị tuyến tính trá hình qua khoảng cách

Cho mặt cầu $(S): (x - 2)^2 + (y + 1)^2 + (z - 1)^2 = 9$. Tìm giá trị nhỏ nhất của:
$
  Q = |x - 2 y + 2 z - 4|
$

*Lời giải tắt.* Đây là khoảng cách đến họ mặt phẳng $x - 2 y + 2 z - 4 = k$ sau khi bỏ mẫu chuẩn hóa. Tại tâm $I(2, -1, 1)$:
$
  x - 2 y + 2 z - 4 = 2 - 2 dot (-1) + 2 dot 1 - 4 = 2
$
Độ dài pháp tuyến là $3$. Bán kính là $3$. Vì khoảng cách từ tâm đến mặt phẳng gốc bằng $2 / 3 < 3$, nên mặt phẳng cắt mặt cầu và:
$
  Q_"min" = 0
$

== Ví dụ 2. Diện tích lớn nhất khi đáy không nằm trên mặt phẳng tọa độ

Cho mặt cầu tâm $I(1, 1, 1)$, bán kính $4$. Cho $A(1, 0, 0)$, $B(1, 4, 0)$. Tìm giá trị lớn nhất của $S_(triangle M A B)$ khi $M in (S)$.

Ta có $A B = 4$. Đường thẳng $A B$ song song trục $O y$, nên khoảng cách từ $I$ đến $A B$ là:
$
  h = sqrt((1 - 1)^2 + (1 - 0)^2 + (1 - 0)^2) = sqrt(2)
$
Suy ra:
$
  S_"max" = (1 / 2) dot 4 dot (4 + sqrt(2)) = 8 + 2 sqrt(2)
$

== Ví dụ 3. Thể tích tứ diện qua mặt phẳng không đặc biệt

Cho mặt cầu $(S): (x - 1)^2 + (y - 2)^2 + (z - 2)^2 = 25$. Cho $A(0, 0, 0)$, $B(2, 0, 0)$, $C(0, 2, 0)$. Tìm giá trị lớn nhất của $V_(M A B C)$.

Mặt phẳng đáy là $z = 0$. Tâm $I(1, 2, 2)$ nên $h = 2$, $R = 5$.
Diện tích đáy:
$
  S_(triangle A B C) = 2
$
Do đó:
$
  V_"max" = (1 / 3) dot 2 dot (2 + 5) = 14 / 3
$

== Ví dụ 4. Giao hai mặt cầu tạo đường tròn ẩn rồi tối ưu tuyến tính

Cho $M$ thỏa:
$
  x^2 + y^2 + z^2 = 29
$
và
$
  (x - 4)^2 + y^2 + z^2 = 13
$
Tìm giá trị lớn nhất của $P = y + z$.

Trừ hai phương trình:
$
  x^2 - (x - 4)^2 = 16
$
$
  8 x - 16 = 16
$
Suy ra $x = 4$.
Thế vào phương trình đầu:
$
  16 + y^2 + z^2 = 29
$
nên:
$
  y^2 + z^2 = 13
$
Do đó:
$
  P_"max" = sqrt(2) dot sqrt(13) = sqrt(26)
$

== Ví dụ 5. Nửa mặt cầu buộc phải xét biên

Cho $x^2 + y^2 + z^2 = 4$, $z >= 1$. Tìm giá trị nhỏ nhất của $x + y + z$.

Điểm cực trị tự do của $x + y + z$ không thỏa điều kiện $z >= 1$, nên xét biên $z = 1$.
Khi đó $x^2 + y^2 = 3$ và:
$
  x + y + z = x + y + 1
$
Giá trị nhỏ nhất của $x + y$ bằng $-sqrt(6)$, nên:
$
  P_"min" = 1 - sqrt(6)
$

== Ví dụ 6. Khoảng cách hai đường thẳng chéo nhau biến thành tuyến tính

Cho $(S): x^2 + y^2 + z^2 = 16$. Đường thẳng $d$ đi qua $(0, 1, 0)$ và song song trục $O y$. Với $M in (S)$, dựng $Delta_M$ qua $M$ và song song trục $O z$. Tìm giá trị nhỏ nhất của $d(Delta_M, d)$.

Khoảng cách giữa hai đường thẳng này bằng $|x|$. Vì $M in (S)$, ta có thể chọn $x = 0$, nên:
$
  d_"min" = 0
$

== Ví dụ 7. Thiết diện có bán kính cho trước

Cho $(S): x^2 + y^2 + z^2 = 25$ và $(P_m): x + 2 y + 2 z - m = 0$. Tìm $m$ để thiết diện có bán kính bằng $3$.

Ta có:
$
  r^2 = 25 - h^2 = 9
$
nên $h = 4$.
Mà $h = |m| / 3$, do đó:
$
  |m| = 12
$
Vậy:
$
  m = ±12
$

== Ví dụ 8. Tổng bình phương đến ba điểm qua trọng tâm

Cho mặt cầu tâm $O(0, 0, 0)$, bán kính $5$. Tam giác $A B C$ có trọng tâm $G(1, 2, 1)$ và thỏa:
$
  G A^2 + G B^2 + G C^2 = 18
$
Tìm giá trị nhỏ nhất của $M A^2 + M B^2 + M C^2$ khi $M in (S)$.

Ta có:
$
  M A^2 + M B^2 + M C^2 = 3 M G^2 + 18
$
Vì $O G = sqrt(6)$ nên:
$
  M G_"min" = 5 - sqrt(6)
$
Do đó:
$
  (M A^2 + M B^2 + M C^2)_"min" = 3 (5 - sqrt(6))^2 + 18
$

= IV. Bẫy Tư Duy Và Mẹo Chống Sai

== 1. Sai lầm rất hay gặp

1. *Nhìn thấy diện tích mà quên khoảng cách.* Nếu không cố định đáy trước, học sinh rất dễ lao vào dựng tọa độ toàn phần rồi tính định thức dài.
2. *Quên đường tròn biên.* Trong các bài có điều kiện $z >= 0$, $a x + b y + c z + d >= 0$, học sinh thường chỉ xét cực trị tự do rồi kết luận luôn.
3. *Nhầm khoảng cách nhỏ nhất về $0$.* Điều này chỉ đúng khi đối tượng cố định cắt mặt cầu hoặc khi đường tròn ẩn thật sự đi qua điểm xét.
4. *Không nhận ra bài toán tham số là bài toán tập giá trị.* Đây là nguyên nhân chính làm lời giải dài và rối.
5. *Khai triển bậc hai quá sớm.* Với $x y + y z + z x$, tổng bình phương, tích vô hướng, nếu khai triển ngay thường đi vào ngõ cụt.

== 2. Checklist đọc đề trong 20 giây đầu

- Có mặt cầu không?
- Biểu thức cần tối ưu là tuyến tính hay bậc hai?
- Có khoảng cách nào bị trá hình qua diện tích, thể tích, hoặc độ dài đường cao không?
- Có hai phương trình mặt cầu cùng chứa $M$ không?
- Có điều kiện nửa không gian hoặc điều kiện tiếp xúc không?
- Có tham số $m$ và yêu cầu "tồn tại", "cắt", "tiếp xúc" không?

Nếu trả lời được 3 câu hỏi đầu thì thường đã chốt được 80% lời giải.

= V. Xếp Hạng Mức Độ Đáng Luyện Khi Dự Đoán Đề

== 1. Nhóm phải thuộc thật nhanh

1. Mô hình 1: tuyến tính trên mặt cầu.
2. Mô hình 2 và 3: khoảng cách đến mặt phẳng, đường thẳng.
3. Mô hình 4 và 5: diện tích, thể tích trá hình.
4. Mô hình 15 và 20: giao hai mặt cầu, bài toán tồn tại tham số.

== 2. Nhóm rất hợp để phân loại câu khó

1. Mô hình 9: tỉ số $(M A)/(M B)$.
2. Mô hình 10, 11, 12: tổng, hiệu, tích khoảng cách.
3. Mô hình 13: khoảng cách giữa hai đường thẳng chéo nhau với một đường thay đổi.
4. Mô hình 14: tiếp điểm từ điểm ngoài đến mặt cầu.
5. Mô hình 18 và 19: biểu thức bậc hai, thiết diện tham số.

== 3. Năm lõi nên dùng để tự chế đề

1. Tuyến tính trên mặt cầu.
2. Khoảng cách trá hình thành diện tích hoặc thể tích.
3. Giao mặt cầu với mặt phẳng hoặc mặt cầu sinh đường tròn ẩn.
4. Tổng, hiệu, tích, tỉ số khoảng cách đến hai điểm.
5. Tham số tồn tại nghiệm, bản chất là min - max.

#block(
  stroke: 0.6pt + rgb("D6EAF8"),
  fill: rgb("F8FBFF"),
  inset: 10pt,
  radius: 5pt,
  width: 100%,
)[
  *Chốt chiến lược ôn.* Nếu muốn làm bộ vận dụng cao nhưng vẫn rất "đề thi phổ thông", hãy lấy mặt cầu làm sân khấu chính rồi xoay quanh ba trục mạnh nhất:

  - *Trục 1:* tối ưu tuyến tính và khoảng cách.
  - *Trục 2:* đường tròn ẩn do giao hoặc do tiếp xúc.
  - *Trục 3:* tham số tồn tại nghiệm.

  Hai mô hình có mùi đề mới nhưng lời giải vẫn đẹp nhất là:
  - tiếp điểm từ điểm ngoài đến mặt cầu,
  - khoảng cách giữa hai đường thẳng chéo nhau với một đường đi qua điểm di động trên mặt cầu.
]
