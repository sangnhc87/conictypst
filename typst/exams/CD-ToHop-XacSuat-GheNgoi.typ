#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// CẤU HÌNH TRANG
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.9em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0F1B5F"), rgb("1A237E"), rgb("3949AB"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("283593")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("283593"), size: 12pt, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 1.1em,
  below: 0.45em,
  text(fill: rgb("1565C0"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// MÀU CHỦ ĐỀ
#let col-purple = rgb("4A148C")
#let col-violet = rgb("6A1B9A")
#let col-blue = rgb("1565C0")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-red = rgb("C62828")
#let col-teal = rgb("006064")
#let col-navy = rgb("1A237E")

// HỘP TRÌNH BÀY
#let rev-box(title: none, body) = block(
  fill: rgb("EDE7F6"),
  stroke: (left: 4pt + col-purple, rest: 0.8pt + rgb("CE93D8")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-purple, size: 11pt, weight: "bold")[#title]
    #v(0.35em)
  ]
  #body
]

#let eg-box(title: "Ví dụ", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-green, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let note-box(title: "Nhận xét", body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let compare-box(title: "So sánh", body) = block(
  fill: rgb("E0F7FA"),
  stroke: (left: 4pt + col-teal, rest: 0.5pt + rgb("80DEEA")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-teal, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[Lời giải chi tiết]
  #v(0.3em)
  #body
]

#let theory-layout(main, side) = grid(
  columns: (1fr, 0.4fr),
  gutter: 1.5em,
  main,
  side
)

#let side-note(title: "Nhắc lại lý thuyết", body) = block(
  fill: rgb("FCE4EC"),
  stroke: (left: 4pt + rgb("C2185B"), rest: 0.6pt + rgb("F8BBD0")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("C2185B"), weight: "bold", size: 10pt)[#title]
  #v(0.3em)
  #text(size: 10pt)[#body]
]

// TRANG BÌA
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D0030"), rgb("1A237E"), rgb("3949AB"), rgb("006064"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("C5CAE9"), size: 11pt, weight: "bold", tracking: 2pt)[
      CHUYÊN ĐỀ TỔ HỢP - XÁC SUẤT
    ]
    #v(0.55em)
    #text(fill: white, size: 22pt, weight: "black")[Bài Toán Xếp Ghế: Phân Bổ Nhóm và Ràng Buộc Vị Trí]
    #v(0.45em)
    #text(fill: rgb("E8EAF6"), size: 14pt)[Tư duy Rút gọn Trạng thái · Mô hình hóa Toán học · Chinh phục bài toán Phân phối Bàn học]
    #v(0.55em)
    #text(fill: rgb("C5CAE9"), size: 11pt, style: "italic")[(Phương pháp phân bổ vị trí — Đếm cấu trúc số lượng trước, phân bổ chỗ ngồi sau)]
    #v(1.1em)
    #line(length: 72%, stroke: 1.5pt + rgb("C5CAE9"))
  ]
]

#v(1.35em)

// MỤC LỤC
#align(center)[
  #block(
    width: 95%,
    fill: rgb("E8EAF6").lighten(60%),
    stroke: 1pt + rgb("C5CAE9"),
    radius: 8pt,
    inset: (x: 16pt, y: 12pt),
  )[
    #text(fill: col-navy, size: 11pt, weight: "bold")[Nội dung chuyên đề]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 0.65em,
      align: left,
      [I. Phương pháp đếm cấu trúc phân bổ], [II. Quy trình 3 bước giải quyết bài toán],
      [III. Bài tập minh họa bàn đồng kích thước], [IV. Bài tập minh họa bàn khác kích thước],
    )
  ]
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("283593"))
    grid(
      columns: (1fr, auto),
      [Chuyên đề đề thi: Tổ hợp - Xác suất xếp ghế], [GV Nguyễn Văn Sang],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("C5CAE9"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("283593"))
    grid(
      columns: (1fr, auto),
      [], [Trang #counter(page).display()],
    )
  },
)

= I. Phương pháp đếm cấu trúc phân bổ

Nhiều học sinh lúng túng khi gặp các bài toán xếp ghế có ràng buộc nhóm (ví dụ: không có bàn nào chỉ toàn bạn Nam, mỗi hàng không quá 1 bạn đặc biệt, v.v.). Sự nhầm lẫn phổ biến là lao vào xếp từng người một cách thứ tự ngay từ đầu, dẫn đến việc trùng lặp hoặc thiếu sót cực kỳ khó kiểm soát.

== 1. Nguyên lý tách biệt "Vị trí" và "Cá nhân" (Khung xương & Hoán vị)

Để giải quyết triệt để các bài toán này, ta sử dụng nguyên lý tách biệt gồm 2 giai đoạn độc lập:

#rev-box(title: [Giai đoạn 1: Đếm cấu trúc phân bổ (Vị trí)])[
  Chúng ta không quan tâm bạn Nam tên A hay B, bạn Nữ tên X hay Y ngồi ở đâu. Ta chỉ coi tất cả các bạn Nam là các vật thể giống nhau (nhãn "Nam") và các bạn Nữ là các vật thể giống nhau (nhãn "Nữ").
  
  Bài toán lúc này quy về: *Chọn ra số lượng ghế cho nhóm Nam ở từng bàn* thỏa mãn điều kiện ràng buộc.
]

#rev-box(title: [Giai đoạn 2: Nhân hoán vị cá nhân (Hoán vị)])[
  Sau khi đã xác định được cấu trúc vị trí ghế cho Nam và Nữ, ta tiến hành xếp cụ thể từng người vào các ghế đã định sẵn:
  - Xếp $N$ bạn Nam vào $N$ ghế dành cho Nam: có $N!$ cách.
  - Xếp $M$ bạn Nữ vào $M$ ghế dành cho Nữ: có $M!$ cách.
  
  Do phép hoán vị cá nhân này luôn là $N! times M!$ cho cả tử số (số biến cố thuận lợi) và mẫu số (không gian mẫu), nên chúng sẽ tự động triệt tiêu khi tính xác suất. Do đó, *ta chỉ cần làm việc hoàn toàn trên Giai đoạn 1*.
]

= II. Quy trình 3 bước giải quyết bài toán

Để giải quyết bài toán phân bổ ghế ngồi có giới hạn số lượng ở từng bàn, ta thực hiện theo 3 bước chuẩn mực sau:

== 1. Quy trình 3 bước chuẩn hóa

#theory-layout(
  [
    #cach1-box[
      *Bước 1 — Xác định biến số trạng thái bàn:*
      Gọi $x_i$ là số bạn Nam ngồi ở bàn thứ $i$ (với $i = 1, 2, ..., k$).
      Xác định khoảng giới hạn của $x_i$ dựa trên số ghế của bàn và điều kiện ràng buộc của đề bài.
      
      *Bước 2 — Tìm số kết quả của Không gian mẫu $n(Omega)$:*
      Tìm số nghiệm nguyên của phương trình tổng số Nam:
      $ x_1 + x_2 + ... + x_k = S_("Nam") $
      Thỏa mãn các khoảng điều kiện ràng buộc của $x_i$. Với mỗi bộ nghiệm $(x_1, x_2, ..., x_k)$, số cách chọn ghế trong các bàn tương ứng là:
      $ C_("bàn " i) = C_(L_i)^(x_i) $
      (Trong đó $L_i$ là số ghế của bàn $i$).
      
      *Bước 3 — Tìm số kết quả thuận lợi $n(A)$ và tính xác suất:*
      Cố định giá trị của bàn cần tính xác suất (ví dụ bàn 1 có đúng $a$ bạn Nam: $x_1 = a$).
      Tìm các cách phân bổ số Nam còn lại cho các bàn khác thỏa mãn điều kiện.
      Tính tỉ số $p = frac(n(A), n(Omega))$ để đưa ra đáp số cuối cùng.
    ]
  ],
  side-note(title: "Mẹo nhỏ khi đếm", [
    Để tránh bỏ sót các bộ nghiệm $(x_1, x_2, ..., x_k)$, hãy luôn viết chúng dưới dạng tập hợp không thứ tự (ví dụ $\{3, 2, 0\}$), sau đó nhân với số cách hoán vị các bàn để ra số nghiệm có thứ tự.
  ])
)

#pagebreak()
= III. Bài tập minh họa bàn đồng kích thước (Uniform Tables)

Dưới đây là các ví dụ minh họa chi tiết với các bàn có cùng số lượng ghế ngồi.

== Ví dụ 1 (Bài toán gốc)
#tln(
  id: "THXS-01",
  [Trong phòng đọc sách có $12$ chiếc ghế được xếp thành $3$ bàn, đánh số từ $1$ đến $3$, mỗi bàn gồm $4$ chiếc ghế. Một nhóm học tập gồm $5$ bạn Nam và $7$ bạn Nữ bước vào phòng và ngồi ngẫu nhiên mỗi người một ghế. Biết rằng, sau khi ngồi xong thì không có bất kỳ bàn nào chỉ toàn là các bạn Nam. 

  Gọi $p$ là xác suất để bàn số 1 có đúng $2$ bạn Nam ngồi. Hãy tính giá trị của $160p$?],
  [70],
  loigiai: [
    #reset-step()
    #ppgiai[Áp dụng phương pháp phân bổ trạng thái vị trí ghế cho Nam. Độc lập hóa việc chọn ghế ở các bàn học.]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        
        // Vẽ 3 bàn học
        for c in range(1, 4) {
          let bx = c * 2.5
          circle((bx, 3.8), radius: 0.25, fill: rgb("1565C0"), stroke: none)
          content((bx, 3.8), text(fill: white, weight: "bold")[#c])
          
          for r in range(1, 5) {
            let ry = r * 0.8 - 0.3
            // Ghế
            rect((bx - 0.6, ry), (bx + 0.6, ry + 0.5), fill: rgb("FFF3E0"), stroke: (paint: rgb("E65100"), thickness: 1.2pt), radius: 2pt)
            // Đệm tựa
            rect((bx - 0.4, ry + 0.1), (bx - 0.1, ry + 0.3), fill: rgb("FFE0B2"), stroke: rgb("F57C00"))
          }
        }
        
        // Khung chú thích
        rect((8.5, 1.2), (12.2, 3.2), stroke: (paint: rgb("B0BEC5"), dash: "dashed"), radius: 4pt, fill: rgb("ECEFF1"))
        // Nam
        rect((8.8, 2.4), (9.3, 2.7), fill: rgb("BBDEFB"), stroke: rgb("1976D2"), radius: 1pt)
        content((9.4, 2.55), text(size: 9.5pt, fill: rgb("0D47A1"))[Nam: 5 bạn], anchor: "west")
        // Nữ
        rect((8.8, 1.6), (9.3, 1.9), fill: rgb("FFCDD2"), stroke: rgb("D32F2F"), radius: 1pt)
        content((9.4, 1.75), text(size: 9.5pt, fill: rgb("B71C1C"))[Nữ: 7 bạn], anchor: "west")
      })
    ]

    #step[Phân tích mô hình toán học]
    Gọi $x_1, x_2, x_3$ lần lượt là số lượng bạn Nam ngồi ở bàn $1, 2, 3$. 
    Vì không có bàn nào gồm cả $4$ Nam (bàn toàn Nam), nên ta có điều kiện: $0 \le x_i \le 3$.

    #step[Tính không gian mẫu $n(Omega)$]
    Ta tìm số cách phân bổ $5$ bạn Nam vào $3$ bàn, tức là tìm nghiệm nguyên của phương trình: 
    $ x_1 + x_2 + x_3 = 5 quad "với " 0 \le x_i \le 3 $
    Ta có bảng phân tích cấu trúc phân bố như sau:
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${3, 2, 0}$], [$3! = 6$], [$C_4^3 dot C_4^2 dot C_4^0$], [$6 dot (4 dot 6 dot 1) = 144$],
        [${3, 1, 1}$], [$frac(3!, 2!) = 3$], [$C_4^3 dot C_4^1 dot C_4^1$], [$3 dot (4 dot 4 dot 4) = 192$],
        [${2, 2, 1}$], [$frac(3!, 2!) = 3$], [$C_4^2 dot C_4^2 dot C_4^1$], [$3 dot (6 dot 6 dot 4) = 432$],
        table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*768*]
      )
    ]

    #step[Tính số kết quả thuận lợi cho biến cố $n(A)$]
    Cố định bàn số 1 có đúng $2$ bạn Nam ($x_1 = 2$). Số ghế cần chọn cho Nam ở bàn 1 là $C_4^2 = 6$ cách.
    Tổng số Nam ở $2$ bàn còn lại là $x_2 + x_3 = 5 - 2 = 3$ (với $0 \le x_i \le 3$). 
    Ta phân bổ $3$ Nam vào 2 bàn còn lại:
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${3, 0}$], [$2! = 2$], [$C_4^3 dot C_4^0$], [$2 dot (4 dot 1) = 8$],
        [${2, 1}$], [$2! = 2$], [$C_4^2 dot C_4^1$], [$2 dot (6 dot 4) = 48$],
        table.cell(colspan: 3)[*Tổng số cách xếp cho 2 bàn còn lại*], [*56*]
      )
    ]
    Số kết quả thuận lợi cho biến cố $A$ là:
    $ n(A) = C_4^2 times 56 = 6 dot 56 = 336 $

    #step[Tính xác suất và kết luận]
    Xác suất $p$ của biến cố là:
    $ p = frac(n(A), n(Omega)) = frac(336, 768) = frac(7, 16) $
    Giá trị biểu thức cần tính là:
    $ 160p = 160 dot frac(7, 16) = 70 $
    #eg-box(title: [Kết quả])[Vậy kết quả của bài toán là *70*.]
  ]
)

== Ví dụ 2
#tln(
  id: "THXS-02",
  [Trong phòng đọc sách có $9$ chiếc ghế được xếp thành $3$ bàn, mỗi bàn gồm $3$ chiếc ghế. Một nhóm gồm $4$ bạn Nam và $5$ bạn Nữ bước vào phòng và ngồi ngẫu nhiên mỗi người một ghế. Biết rằng sau khi ngồi xong thì không có bàn nào chỉ toàn các bạn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $2$ bạn Nam ngồi. Tính giá trị $120p$?],
  [50],
  loigiai: [
    #reset-step()
    #ppgiai[Giải bằng cách phân bổ 4 Nam vào 3 bàn 3 ghế. Ràng buộc là không bàn nào có 3 Nam ($0 \le x_i \le 2$).]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta phân bổ $4$ bạn Nam vào $3$ bàn: $x_1 + x_2 + x_3 = 4$ với $0 \le x_i \le 2$.
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${2, 2, 0}$], [$frac(3!, 2!) = 3$], [$C_3^2 dot C_3^2 dot C_3^0$], [$3 dot (3 dot 3 dot 1) = 27$],
        [${2, 1, 1}$], [$frac(3!, 2!) = 3$], [$C_3^2 dot C_3^1 dot C_3^1$], [$3 dot (3 dot 3 dot 3) = 81$],
        table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*108*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Cố định bàn 1 có đúng 2 Nam ($x_1 = 2$) $arrow.r C_3^2 = 3$ cách.
    Hai bàn còn lại có tổng $x_2 + x_3 = 2$ Nam (với $0 \le x_i \le 2$).
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${2, 0}$], [$2! = 2$], [$C_3^2 dot C_3^0$], [$2 dot (3 dot 1) = 6$],
        [${1, 1}$], [$1$], [$C_3^1 dot C_3^1$], [$1 dot (3 dot 3) = 9$],
        table.cell(colspan: 3)[*Tổng số cách xếp cho 2 bàn còn lại*], [*15*]
      )
    ]
    Vậy $n(A) = 3 times 15 = 45$.

    #step[Tính xác suất]
    Xác suất $p = frac(45, 108) = frac(5, 12)$.
    Giá trị $120p = 120 dot frac(5, 12) = 50$.
  ]
)

== Ví dụ 3
#tln(
  id: "THXS-03",
  [Trong phòng đọc sách có $8$ chiếc ghế được xếp thành $2$ bàn, mỗi bàn gồm $4$ chiếc ghế. Một nhóm gồm $4$ bạn Nam và $4$ bạn Nữ ngồi ngẫu nhiên mỗi người một ghế. Biết rằng sau khi ngồi xong thì không có bàn nào chỉ toàn các bạn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $2$ bạn Nam ngồi. Tính giá trị của $136p$?],
  [72],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 4 Nam vào 2 bàn 4 ghế. Ràng buộc không bàn nào toàn Nam ($0 \le x_i \le 3$).]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta phân bổ $4$ bạn Nam vào $2$ bàn: $x_1 + x_2 = 4$ với $0 \le x_i \le 3$.
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${3, 1}$], [$2! = 2$], [$C_4^3 dot C_4^1$], [$2 dot (4 dot 4) = 32$],
        [${2, 2}$], [$1$], [$C_4^2 dot C_4^2$], [$1 dot (6 dot 6) = 36$],
        table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*68*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 1 có đúng 2 Nam ($x_1 = 2$) $arrow.r C_4^2 = 6$ cách.
    Bàn 2 bắt buộc phải có đúng $2$ Nam ($x_2 = 2$) $arrow.r C_4^2 = 6$ cách.
    Vậy $n(A) = 6 times 6 = 36$.

    #step[Tính xác suất]
    Xác suất $p = frac(36, 68) = frac(9, 17)$.
    Giá trị $136p = 136 dot frac(9, 17) = 72$.
  ]
)

== Ví dụ 4
#tln(
  id: "THXS-04",
  [Trong phòng đọc sách có $12$ chiếc ghế xếp thành $3$ bàn, mỗi bàn gồm $4$ chiếc ghế. Có $6$ bạn Nam và $6$ bạn Nữ. Họ ngồi ngẫu nhiên mỗi người một ghế sao cho không có bất kỳ bàn nào chỉ toàn bạn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $2$ bạn Nam ngồi. Tính giá trị $70p$?],
  [34],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 6 Nam vào 3 bàn 4 ghế. Ràng buộc $0 \le x_i \le 3$.]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta tìm nghiệm nguyên không âm của $x_1+x_2+x_3=6$ thỏa $0 \le x_i \le 3$:
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${3, 3, 0}$], [$3!/2! = 3$], [$C_4^3 dot C_4^3 dot C_4^0$], [$3 dot (4 dot 4 dot 1) = 48$],
        [${3, 2, 1}$], [$3! = 6$], [$C_4^3 dot C_4^2 dot C_4^1$], [$6 dot (4 dot 6 dot 4) = 576$],
        [${2, 2, 2}$], [$1$], [$C_4^2 dot C_4^2 dot C_4^2$], [$1 dot (6 dot 6 dot 6) = 216$],
        table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*840*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 1 có đúng 2 Nam ($x_1 = 2$) $arrow.r C_4^2 = 6$ cách.
    Hai bàn còn lại có tổng $x_2 + x_3 = 4$ Nam (với $0 \le x_i \le 3$).
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${3, 1}$], [$2! = 2$], [$C_4^3 dot C_4^1$], [$2 dot (4 dot 4) = 32$],
        [${2, 2}$], [$1$], [$C_4^2 dot C_4^2$], [$1 dot (6 dot 6) = 36$],
        table.cell(colspan: 3)[*Tổng số cách xếp cho 2 bàn còn lại*], [*68*]
      )
    ]
    Do đó, $n(A) = 6 times 68 = 408$.

    #step[Tính xác suất]
    Xác suất $p = frac(408, 840) = frac(17, 35)$.
    Giá trị $70p = 70 dot frac(17, 35) = 34$.
  ]
)

== Ví dụ 5
#tln(
  id: "THXS-05",
  [Một phòng hội thảo có $12$ chiếc ghế được chia làm $4$ bàn, mỗi bàn gồm $3$ chiếc ghế. Nhóm thảo luận gồm $5$ Nam và $7$ Nữ ngồi ngẫu nhiên vào các ghế. Biết rằng không có bàn nào chỉ toàn các bạn Nam ngồi. Gọi $p$ là xác suất để bàn số 1 có đúng $1$ bạn Nam ngồi. Tính giá trị $190p$?],
  [95],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 5 Nam vào 4 bàn 3 ghế. Ràng buộc không bàn nào toàn Nam ($0 \le x_i \le 2$).]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta tìm nghiệm nguyên không âm của $x_1+x_2+x_3+x_4=5$ thỏa $0 \le x_i \le 2$:
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${2, 2, 1, 0}$], [$4!/2! = 12$], [$C_3^2 dot C_3^2 dot C_3^1 dot C_3^0$], [$12 dot (3 dot 3 dot 3 dot 1) = 324$],
        [${2, 1, 1, 1}$], [$4!/3! = 4$], [$C_3^2 dot C_3^1 dot C_3^1 dot C_3^1$], [$4 dot (3 dot 3 dot 3 dot 3) = 324$],
        table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*648*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 1 có đúng 1 Nam ($x_1 = 1$) $arrow.r C_3^1 = 3$ cách.
    Ba bàn còn lại có tổng $x_2 + x_3 + x_4 = 4$ Nam (với $0 \le x_i \le 2$).
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc 3 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${2, 2, 0}$], [$3!/2! = 3$], [$C_3^2 dot C_3^2 dot C_3^0$], [$3 dot (3 dot 3 dot 1) = 27$],
        [${2, 1, 1}$], [$3!/2! = 3$], [$C_3^2 dot C_3^1 dot C_3^1$], [$3 dot (3 dot 3 dot 3) = 81$],
        table.cell(colspan: 3)[*Tổng số cách xếp cho 3 bàn còn lại*], [*108*]
      )
    ]
    Do đó, $n(A) = 3 times 108 = 324$.

    #step[Tính xác suất]
    Xác suất $p = frac(324, 648) = frac(1, 2)$.
    Giá trị $190p = 190 dot frac(1, 2) = 95$.
  ]
)

== Ví dụ 6
#tln(
  id: "THXS-06",
  [Một phòng thí nghiệm có $15$ chiếc ghế xếp quanh $3$ bàn tròn lớn, mỗi bàn tròn gồm $5$ chiếc ghế. Nhóm nghiên cứu gồm $6$ bạn Nam và $9$ bạn Nữ. Họ ngồi ngẫu nhiên mỗi người một ghế sao cho không có bàn nào chỉ toàn bạn Nam ngồi. Gọi $p$ là xác suất để bàn số 1 có đúng $2$ bạn Nam ngồi. Tính giá trị $199p$?],
  [84],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 6 Nam vào 3 bàn 5 ghế. Ràng buộc không bàn nào toàn Nam ($0 \le x_i \le 4$).]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta tìm các bộ phân bố $x_1+x_2+x_3=6$ thỏa $0 \le x_i \le 4$:
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${4, 2, 0}$], [$3! = 6$], [$C_5^4 dot C_5^2 dot C_5^0$], [$6 dot (5 dot 10 dot 1) = 300$],
        [${4, 1, 1}$], [$3!/2! = 3$], [$C_5^4 dot C_5^1 dot C_5^1$], [$3 dot (5 dot 5 dot 5) = 375$],
        [${3, 3, 0}$], [$3!/2! = 3$], [$C_5^3 dot C_5^3 dot C_5^0$], [$3 dot (10 dot 10 dot 1) = 300$],
        [${3, 2, 1}$], [$3! = 6$], [$C_5^3 dot C_5^2 dot C_5^1$], [$6 dot (10 dot 10 dot 5) = 3000$],
        [${2, 2, 2}$], [$1$], [$C_5^2 dot C_5^2 dot C_5^2$], [$1 dot (10 dot 10 dot 10) = 1000$],
        table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*4975*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 1 có đúng 2 Nam ($x_1 = 2$) $arrow.r C_5^2 = 10$ cách.
    Hai bàn còn lại có tổng $x_2 + x_3 = 4$ Nam (với $0 \le x_i \le 4$).
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${4, 0}$], [$2! = 2$], [$C_5^4 dot C_5^0$], [$2 dot (5 dot 1) = 10$],
        [${3, 1}$], [$2! = 2$], [$C_5^3 dot C_5^1$], [$2 dot (10 dot 5) = 100$],
        [${2, 2}$], [$1$], [$C_5^2 dot C_5^2$], [$1 dot (10 dot 10) = 100$],
        table.cell(colspan: 3)[*Tổng số cách xếp cho 2 bàn còn lại*], [*210*]
      )
    ]
    Do đó, $n(A) = 10 times 210 = 2100$.

    #step[Tính xác suất]
    Xác suất $p = frac(2100, 4975) = frac(84, 199)$.
    Giá trị $199p = 199 dot frac(84, 199) = 84$.
  ]
)

== Ví dụ 7
#tln(
  id: "THXS-07",
  [Trong phòng đọc sách có $12$ chiếc ghế xếp thành $3$ bàn, mỗi bàn gồm $4$ chiếc ghế. Có $4$ bạn Nam và $8$ bạn Nữ. Họ ngồi ngẫu nhiên mỗi người một ghế sao cho không có bàn nào chỉ toàn bạn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $2$ bạn Nam ngồi. Tính giá trị $123p$?],
  [42],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 4 Nam vào 3 bàn 4 ghế. Ràng buộc $0 \le x_i \le 3$.]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta tìm nghiệm nguyên không âm của $x_1+x_2+x_3=4$ thỏa $0 \le x_i \le 3$:
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${3, 1, 0}$], [$3! = 6$], [$C_4^3 dot C_4^1 dot C_4^0$], [$6 dot (4 dot 4 dot 1) = 96$],
        [${2, 2, 0}$], [$3!/2! = 3$], [$C_4^2 dot C_4^2 dot C_4^0$], [$3 dot (6 dot 6 dot 1) = 108$],
        [${2, 1, 1}$], [$3!/2! = 3$], [$C_4^2 dot C_4^1 dot C_4^1$], [$3 dot (6 dot 4 dot 4) = 288$],
        table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*492*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 1 có đúng 2 Nam ($x_1 = 2$) $arrow.r C_4^2 = 6$ cách.
    Hai bàn còn lại có tổng $x_2 + x_3 = 2$ Nam.
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${2, 0}$], [$2! = 2$], [$C_4^2 dot C_4^0$], [$2 dot (6 dot 1) = 12$],
        [${1, 1}$], [$1$], [$C_4^1 dot C_4^1$], [$1 dot (4 dot 4) = 16$],
        table.cell(colspan: 3)[*Tổng số cách xếp cho 2 bàn còn lại*], [*28*]
      )
    ]
    Do đó, $n(A) = 6 times 28 = 168$.

    #step[Tính xác suất]
    Xác suất $p = frac(168, 492) = frac(14, 41)$.
    Giá trị $123p = 123 dot frac(14, 41) = 42$.
  ]
)

== Ví dụ 8
#tln(
  id: "THXS-08",
  [Một quán cà phê có $16$ chiếc ghế xếp thành $4$ bàn, mỗi bàn gồm $4$ chiếc ghế. Có $5$ bạn Nam và $11$ bạn Nữ. Họ ngồi ngẫu nhiên mỗi người một ghế sao cho không có bàn nào chỉ toàn bạn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $2$ bạn Nam ngồi. Tính giá trị $1080p$?],
  [330],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 5 Nam vào 4 bàn 4 ghế. Ràng buộc không bàn nào toàn Nam ($0 \le x_i \le 3$).]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta tìm nghiệm nguyên không âm của $x_1+x_2+x_3+x_4=5$ thỏa $0 \le x_i \le 3$:
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${3, 2, 0, 0}$], [$4!/2! = 12$], [$C_4^3 dot C_4^2 dot C_4^0 dot C_4^0$], [$12 dot (4 dot 6 dot 1 dot 1) = 288$],
        [${3, 1, 1, 0}$], [$4!/2! = 12$], [$C_4^3 dot C_4^1 dot C_4^1 dot C_4^0$], [$12 dot (4 dot 4 dot 4 dot 1) = 768$],
        [${2, 2, 1, 0}$], [$4!/2! = 12$], [$C_4^2 dot C_4^2 dot C_4^1 dot C_4^0$], [$12 dot (6 dot 6 dot 4 dot 1) = 1728$],
        [${2, 1, 1, 1}$], [$4!/3! = 4$], [$C_4^2 dot C_4^1 dot C_4^1 dot C_4^1$], [$4 dot (6 dot 4 dot 4 dot 4) = 1536$],
        table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*4320*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 1 có đúng 2 Nam ($x_1 = 2$) $arrow.r C_4^2 = 6$ cách.
    Ba bàn còn lại có tổng $x_2 + x_3 + x_4 = 3$ Nam.
    #align(center)[
      #table(
        columns: (2fr, 1.5fr, 2.5fr, 2fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Cấu trúc 3 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
        [${3, 0, 0}$], [$3!/2! = 3$], [$C_4^3 dot C_4^0 dot C_4^0$], [$3 dot (4 dot 1 dot 1) = 12$],
        [${2, 1, 0}$], [$3! = 6$], [$C_4^2 dot C_4^1 dot C_4^0$], [$6 dot (6 dot 4 dot 1) = 144$],
        [${1, 1, 1}$], [$1$], [$C_4^1 dot C_4^1 dot C_4^1$], [$1 dot (4 dot 4 dot 4) = 64$],
        table.cell(colspan: 3)[*Tổng số cách xếp cho 3 bàn còn lại*], [*220*]
      )
    ]
    Do đó, $n(A) = 6 times 220 = 1320$.

    #step[Tính xác suất]
    Xác suất $p = frac(1320, 4320) = frac(11, 36)$.
    Giá trị $1080p = 1080 dot frac(11, 36) = 330$.
  ]
)

#pagebreak()
= IV. Bài tập minh họa bàn khác kích thước (Non-uniform Tables)

Dưới đây là các ví dụ minh họa khi các bàn học có kích thước không đồng đều.

== Ví dụ 9
#tln(
  id: "THXS-09",
  [Trong một phòng học có $12$ ghế được xếp thành $3$ bàn: Bàn 1 gồm $5$ ghế, Bàn 2 gồm $4$ ghế, Bàn 3 gồm $3$ ghế. Một nhóm gồm $5$ bạn Nam và $7$ bạn Nữ ngồi ngẫu nhiên mỗi người một ghế. Biết rằng không có bàn nào chỉ toàn các bạn Nam ngồi. Gọi $p$ là xác suất để Bàn 2 có đúng $2$ bạn Nam ngồi. Hãy tính giá trị của $249p$?],
  [110],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 5 Nam vào 3 bàn có kích thước lần lượt là $L_1 = 5, L_2 = 4, L_3 = 3$. Ràng buộc: $x_1 \le 4, x_2 \le 3, x_3 \le 2$.]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta liệt kê các bộ phân bổ Nam $(x_1, x_2, x_3)$ có tổng bằng 5:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
        [$(4, 1, 0)$], [$C_5^4 = 5$], [$C_4^1 = 4$], [$C_3^0 = 1$], [$20$],
        [$(4, 0, 1)$], [$C_5^4 = 5$], [$C_4^0 = 1$], [$C_3^1 = 3$], [$15$],
        [$(3, 2, 0)$], [$C_5^3 = 10$], [$C_4^2 = 6$], [$C_3^0 = 1$], [$60$],
        [$(3, 1, 1)$], [$C_5^3 = 10$], [$C_4^1 = 4$], [$C_3^1 = 3$], [$120$],
        [$(3, 0, 2)$], [$C_5^3 = 10$], [$C_4^0 = 1$], [$C_3^2 = 3$], [$30$],
        [$(2, 3, 0)$], [$C_5^2 = 10$], [$C_4^3 = 4$], [$C_3^0 = 1$], [$40$],
        [$(2, 2, 1)$], [$C_5^2 = 10$], [$C_4^2 = 6$], [$C_3^1 = 3$], [$180$],
        [$(2, 1, 2)$], [$C_5^2 = 10$], [$C_4^1 = 4$], [$C_3^2 = 3$], [$120$],
        [$(1, 3, 1)$], [$C_5^1 = 5$], [$C_4^3 = 4$], [$C_3^1 = 3$], [$60$],
        [$(1, 2, 2)$], [$C_5^1 = 5$], [$C_4^2 = 6$], [$C_3^2 = 3$], [$90$],
        [$(0, 3, 2)$], [$C_5^0 = 1$], [$C_4^3 = 4$], [$C_3^2 = 3$], [$12$],
        table.cell(colspan: 4)[*Tổng số kết quả $n(Omega)$*], [*747*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 2 có đúng 2 Nam ($x_2 = 2$). Các bộ $(x_1, 2, x_3)$ hợp lệ:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
        [$(3, 2, 0)$], [$C_5^3 = 10$], [$C_4^2 = 6$], [$C_3^0 = 1$], [$60$],
        [$(2, 2, 1)$], [$C_5^2 = 10$], [$C_4^2 = 6$], [$C_3^1 = 3$], [$180$],
        [$(1, 2, 2)$], [$C_5^1 = 5$], [$C_4^2 = 6$], [$C_3^2 = 3$], [$90$],
        table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*330*]
      )
    ]

    #step[Tính xác suất]
    Xác suất $p = frac(330, 747) = frac(110, 249)$.
    Giá trị $249p = 249 dot frac(110, 249) = 110$.
  ]
)

== Ví dụ 10
#tln(
  id: "THXS-10",
  [Trong phòng học có $12$ ghế được chia thành $3$ bàn: Bàn 1 có $5$ ghế, Bàn 2 có $4$ ghế, Bàn 3 có $3$ ghế. Có $4$ bạn Nam và $8$ bạn Nữ. Họ ngồi ngẫu nhiên mỗi người một ghế sao cho không có bàn nào chỉ toàn bạn Nam. Gọi $p$ là xác suất để Bàn 3 có đúng $1$ bạn Nam ngồi. Hãy tính giá trị của $485p$?],
  [252],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 4 Nam vào 3 bàn có kích thước $L_1 = 5, L_2 = 4, L_3 = 3$. Ràng buộc: $x_1 \le 4, x_2 \le 3, x_3 \le 2$.]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta liệt kê các bộ phân bổ Nam $(x_1, x_2, x_3)$ tổng bằng 4:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
        [$(4, 0, 0)$], [$C_5^4 = 5$], [$C_4^0 = 1$], [$C_3^0 = 1$], [$5$],
        [$(3, 1, 0)$], [$C_5^3 = 10$], [$C_4^1 = 4$], [$C_3^0 = 1$], [$40$],
        [$(3, 0, 1)$], [$C_5^3 = 10$], [$C_4^0 = 1$], [$C_3^1 = 3$], [$30$],
        [$(2, 2, 0)$], [$C_5^2 = 10$], [$C_4^2 = 6$], [$C_3^0 = 1$], [$60$],
        [$(2, 1, 1)$], [$C_5^2 = 10$], [$C_4^1 = 4$], [$C_3^1 = 3$], [$120$],
        [$(2, 0, 2)$], [$C_5^2 = 10$], [$C_4^0 = 1$], [$C_3^2 = 3$], [$30$],
        [$(1, 3, 0)$], [$C_5^1 = 5$], [$C_4^3 = 4$], [$C_3^0 = 1$], [$20$],
        [$(1, 2, 1)$], [$C_5^1 = 5$], [$C_4^2 = 6$], [$C_3^1 = 3$], [$90$],
        [$(1, 1, 2)$], [$C_5^1 = 5$], [$C_4^1 = 4$], [$C_3^2 = 3$], [$60$],
        [$(0, 3, 1)$], [$C_5^0 = 1$], [$C_4^3 = 4$], [$C_3^1 = 3$], [$12$],
        [$(0, 2, 2)$], [$C_5^0 = 1$], [$C_4^2 = 6$], [$C_3^2 = 3$], [$18$],
        table.cell(colspan: 4)[*Tổng số kết quả $n(Omega)$*], [*485*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 3 có đúng 1 Nam ($x_3 = 1$). Các bộ $(x_1, x_2, 1)$ hợp lệ:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
        [$(3, 0, 1)$], [$C_5^3 = 10$], [$C_4^0 = 1$], [$C_3^1 = 3$], [$30$],
        [$(2, 1, 1)$], [$C_5^2 = 10$], [$C_4^1 = 4$], [$C_3^1 = 3$], [$120$],
        [$(1, 2, 1)$], [$C_5^1 = 5$], [$C_4^2 = 6$], [$C_3^1 = 3$], [$90$],
        [$(0, 3, 1)$], [$C_5^0 = 1$], [$C_4^3 = 4$], [$C_3^1 = 3$], [$12$],
        table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*252*]
      )
    ]

    #step[Tính xác suất]
    Xác suất $p = frac(252, 485)$.
    Giá trị $485p = 485 dot frac(252, 485) = 252$.
  ]
)

== Ví dụ 11
#tln(
  id: "THXS-11",
  [Trong phòng đọc sách có $10$ ghế được chia thành $2$ bàn: Bàn 1 có $6$ ghế, Bàn 2 có $4$ ghế. Một nhóm gồm $4$ Nam và $6$ Nữ ngồi ngẫu nhiên mỗi người một ghế sao cho không có bàn nào chỉ toàn bạn Nam. Gọi $p$ là xác suất để Bàn 2 có đúng $2$ bạn Nam ngồi. Hãy tính giá trị của $209p$?],
  [90],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 4 Nam vào 2 bàn $L_1 = 6, L_2 = 4$. Ràng buộc: $x_1 \le 5, x_2 \le 3$.]

    #step[Xác định không gian mẫu $n(Omega)$]
    #align(center)[
      #table(
        columns: (1.5fr, 1.5fr, 1.5fr, 1.8fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2)$*], [*Bàn 1 ($C_6^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Số cách xếp*],
        [$(4, 0)$], [$C_6^4 = 15$], [$C_4^0 = 1$], [$15$],
        [$(3, 1)$], [$C_6^3 = 20$], [$C_4^1 = 4$], [$80$],
        [$(2, 2)$], [$C_6^2 = 15$], [$C_4^2 = 6$], [$90$],
        [$(1, 3)$], [$C_6^1 = 6$], [$C_4^3 = 4$], [$24$],
        table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*209*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 2 có đúng 2 Nam ($x_2 = 2$). Chỉ có bộ $(2, 2)$ thỏa mãn:
    #align(center)[
      #table(
        columns: (1.5fr, 1.5fr, 1.5fr, 1.8fr),
        inset: 8pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2)$*], [*Bàn 1 ($C_6^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Số cách xếp*],
        [$(2, 2)$], [$C_6^2 = 15$], [$C_4^2 = 6$], [*90*]
      )
    ]
    Do đó, $n(A) = 90$.

    #step[Tính xác suất]
    Xác suất $p = frac(90, 209)$.
    Giá trị $209p = 209 dot frac(90, 209) = 90$.
  ]
)

== Ví dụ 12
#tln(
  id: "THXS-12",
  [Trong phòng đọc sách có $12$ ghế được chia thành $3$ bàn: Bàn 1 có $5$ ghế, Bàn 2 có $5$ ghế, Bàn 3 có $2$ ghế. Có $4$ bạn Nam và $8$ bạn Nữ ngồi ngẫu nhiên mỗi người một ghế sao cho không bàn nào toàn Nam. Gọi $p$ là xác suất để Bàn 3 có đúng $1$ bạn Nam ngồi. Tính giá trị $150p$?],
  [80],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 4 Nam vào 3 bàn $L_1 = 5, L_2 = 5, L_3 = 2$. Ràng buộc: $x_1 \le 4, x_2 \le 4, x_3 \le 1$.]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta liệt kê các bộ phân bổ $(x_1, x_2, x_3)$ tổng bằng 4:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_5^(x_2)$)*], [*Bàn 3 ($C_2^(x_3)$)*], [*Số cách xếp*],
        [$(4, 0, 0)$], [$C_5^4 = 5$], [$C_5^0 = 1$], [$C_2^0 = 1$], [$5$],
        [$(3, 1, 0)$], [$C_5^3 = 10$], [$C_5^1 = 5$], [$C_2^0 = 1$], [$50$],
        [$(3, 0, 1)$], [$C_5^3 = 10$], [$C_5^0 = 1$], [$C_2^1 = 2$], [$20$],
        [$(2, 2, 0)$], [$C_5^2 = 10$], [$C_5^2 = 10$], [$C_2^0 = 1$], [$100$],
        [$(2, 1, 1)$], [$C_5^2 = 10$], [$C_5^1 = 5$], [$C_2^1 = 2$], [$100$],
        [$(1, 3, 0)$], [$C_5^1 = 5$], [$C_5^3 = 10$], [$C_2^0 = 1$], [$50$],
        [$(1, 2, 1)$], [$C_5^1 = 5$], [$C_5^2 = 10$], [$C_2^1 = 2$], [$100$],
        [$(0, 4, 0)$], [$C_5^0 = 1$], [$C_5^4 = 5$], [$C_2^0 = 1$], [$5$],
        [$(0, 3, 1)$], [$C_5^0 = 1$], [$C_5^3 = 10$], [$C_2^1 = 2$], [$20$],
        table.cell(colspan: 4)[*Tổng số kết quả $n(Omega)$*], [*450*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 3 có đúng 1 Nam ($x_3 = 1$). Các bộ $(x_1, x_2, 1)$ hợp lệ:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_5^(x_2)$)*], [*Bàn 3 ($C_2^(x_3)$)*], [*Số cách xếp*],
        [$(3, 0, 1)$], [$C_5^3 = 10$], [$C_5^0 = 1$], [$C_2^1 = 2$], [$20$],
        [$(2, 1, 1)$], [$C_5^2 = 10$], [$C_5^1 = 5$], [$C_2^1 = 2$], [$100$],
        [$(1, 2, 1)$], [$C_5^1 = 5$], [$C_5^2 = 10$], [$C_2^1 = 2$], [$100$],
        [$(0, 3, 1)$], [$C_5^0 = 1$], [$C_5^3 = 10$], [$C_2^1 = 2$], [$20$],
        table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*240*]
      )
    ]

    #step[Tính xác suất]
    Xác suất $p = frac(240, 450) = frac(8, 15)$.
    Giá trị $150p = 150 dot frac(8, 15) = 80$.
  ]
)

== Ví dụ 13
#tln(
  id: "THXS-13",
  [Trong phòng thảo luận có $12$ chiếc ghế được chia thành $3$ bàn: Bàn 1 gồm $6$ ghế, Bàn 2 gồm $3$ ghế, Bàn 3 gồm $3$ ghế. Có $5$ bạn Nam và $7$ bạn Nữ ngồi ngẫu nhiên vào các ghế sao cho không có bàn nào chỉ toàn bạn Nam ngồi. Gọi $p$ là xác suất để Bàn 1 có đúng $3$ bạn Nam ngồi. Hãy tính giá trị của $120p$?],
  [50],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 5 Nam vào 3 bàn $L_1 = 6, L_2 = 3, L_3 = 3$. Ràng buộc: $x_1 \le 5, x_2 \le 2, x_3 \le 2$.]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta liệt kê các bộ phân bổ $(x_1, x_2, x_3)$ tổng bằng 5:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_6^(x_1)$)*], [*Bàn 2 ($C_3^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
        [$(5, 0, 0)$], [$C_6^5 = 6$], [$C_3^0 = 1$], [$C_3^0 = 1$], [$6$],
        [$(4, 1, 0)$], [$C_6^4 = 15$], [$C_3^1 = 3$], [$C_3^0 = 1$], [$45$],
        [$(4, 0, 1)$], [$C_6^4 = 15$], [$C_3^0 = 1$], [$C_3^1 = 3$], [$45$],
        [$(3, 2, 0)$], [$C_6^3 = 20$], [$C_3^2 = 3$], [$C_3^0 = 1$], [$60$],
        [$(3, 1, 1)$], [$C_6^3 = 20$], [$C_3^1 = 3$], [$C_3^1 = 3$], [$180$],
        [$(3, 0, 2)$], [$C_6^3 = 20$], [$C_3^0 = 1$], [$C_3^2 = 3$], [$60$],
        [$(2, 2, 1)$], [$C_6^2 = 15$], [$C_3^2 = 3$], [$C_3^1 = 3$], [$135$],
        [$(2, 1, 2)$], [$C_6^2 = 15$], [$C_3^1 = 3$], [$C_3^2 = 3$], [$135$],
        [$(1, 2, 2)$], [$C_6^1 = 6$], [$C_3^2 = 3$], [$C_3^2 = 3$], [$54$],
        table.cell(colspan: 4)[*Tổng số kết quả $n(Omega)$*], [*720*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 1 có đúng 3 Nam ($x_1 = 3$). Các bộ $(3, x_2, x_3)$ hợp lệ:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_6^(x_1)$)*], [*Bàn 2 ($C_3^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
        [$(3, 2, 0)$], [$C_6^3 = 20$], [$C_3^2 = 3$], [$C_3^0 = 1$], [$60$],
        [$(3, 1, 1)$], [$C_6^3 = 20$], [$C_3^1 = 3$], [$C_3^1 = 3$], [$180$],
        [$(3, 0, 2)$], [$C_6^3 = 20$], [$C_3^0 = 1$], [$C_3^2 = 3$], [$60$],
        table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*300*]
      )
    ]

    #step[Tính xác suất]
    Xác suất $p = frac(300, 720) = frac(5, 12)$.
    Giá trị $120p = 120 dot frac(5, 12) = 50$.
  ]
)

== Ví dụ 14
#tln(
  id: "THXS-14",
  [Trong phòng học có $10$ ghế được chia thành $3$ bàn: Bàn 1 có $4$ ghế, Bàn 2 có $4$ ghế, Bàn 3 có $2$ ghế. Có $4$ bạn Nam và $6$ bạn Nữ ngồi ngẫu nhiên vào các ghế sao cho không có bàn nào chỉ toàn bạn Nam. Gọi $p$ là xác suất để Bàn 3 có đúng $1$ bạn Nam ngồi. Hãy tính giá trị của $90p$?],
  [56],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 4 Nam vào 3 bàn $L_1 = 4, L_2 = 4, L_3 = 2$. Ràng buộc: $x_1 \le 3, x_2 \le 3, x_3 \le 1$.]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta liệt kê các bộ phân bổ $(x_1, x_2, x_3)$ tổng bằng 4:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_4^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Bàn 3 ($C_2^(x_3)$)*], [*Số cách xếp*],
        [$(3, 1, 0)$], [$C_4^3 = 4$], [$C_4^1 = 4$], [$C_2^0 = 1$], [$16$],
        [$(3, 0, 1)$], [$C_4^3 = 4$], [$C_4^0 = 1$], [$C_2^1 = 2$], [$8$],
        [$(2, 2, 0)$], [$C_4^2 = 6$], [$C_4^2 = 6$], [$C_2^0 = 1$], [$36$],
        [$(2, 1, 1)$], [$C_4^2 = 6$], [$C_4^1 = 4$], [$C_2^1 = 2$], [$48$],
        [$(1, 3, 0)$], [$C_4^1 = 4$], [$C_4^3 = 4$], [$C_2^0 = 1$], [$16$],
        [$(1, 2, 1)$], [$C_4^1 = 4$], [$C_4^2 = 6$], [$C_2^1 = 2$], [$48$],
        [$(0, 3, 1)$], [$C_4^0 = 1$], [$C_4^3 = 4$], [$C_2^1 = 2$], [$8$],
        table.cell(colspan: 4)[*Tổng số kết quả $n(Omega)$*], [*180*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 3 có đúng 1 Nam ($x_3 = 1$). Các bộ $(x_1, x_2, 1)$ hợp lệ:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_4^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Bàn 3 ($C_2^(x_3)$)*], [*Số cách xếp*],
        [$(3, 0, 1)$], [$C_4^3 = 4$], [$C_4^0 = 1$], [$C_2^1 = 2$], [$8$],
        [$(2, 1, 1)$], [$C_4^2 = 6$], [$C_4^1 = 4$], [$C_2^1 = 2$], [$48$],
        [$(1, 2, 1)$], [$C_4^1 = 4$], [$C_4^2 = 6$], [$C_2^1 = 2$], [$48$],
        [$(0, 3, 1)$], [$C_4^0 = 1$], [$C_4^3 = 4$], [$C_2^1 = 2$], [$8$],
        table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*112*]
      )
    ]

    #step[Tính xác suất]
    Xác suất $p = frac(112, 180) = frac(28, 45)$.
    Giá trị $90p = 90 dot frac(28, 45) = 56$.
  ]
)

== Ví dụ 15
#tln(
  id: "THXS-15",
  [Trong phòng đọc sách có $10$ ghế được chia thành $3$ bàn: Bàn 1 có $5$ ghế, Bàn 2 có $3$ ghế, Bàn 3 có $2$ ghế. Có $4$ bạn Nam và $6$ bạn Nữ ngồi ngẫu nhiên vào các ghế sao cho không có bàn nào chỉ toàn bạn Nam. Gọi $p$ là xác suất để Bàn 2 có đúng $1$ bạn Nam ngồi. Hãy tính giá trị của $140p$?],
  [72],
  loigiai: [
    #reset-step()
    #ppgiai[Phân bổ 4 Nam vào 3 bàn $L_1 = 5, L_2 = 3, L_3 = 2$. Ràng buộc: $x_1 \le 4, x_2 \le 2, x_3 \le 1$.]

    #step[Xác định không gian mẫu $n(Omega)$]
    Ta liệt kê các bộ phân bổ $(x_1, x_2, x_3)$ tổng bằng 4:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_3^(x_2)$)*], [*Bàn 3 ($C_2^(x_3)$)*], [*Số cách xếp*],
        [$(4, 0, 0)$], [$C_5^4 = 5$], [$C_3^0 = 1$], [$C_2^0 = 1$], [$5$],
        [$(3, 1, 0)$], [$C_5^3 = 10$], [$C_3^1 = 3$], [$C_2^0 = 1$], [$30$],
        [$(3, 0, 1)$], [$C_5^3 = 10$], [$C_3^0 = 1$], [$C_2^1 = 2$], [$20$],
        [$(2, 2, 0)$], [$C_5^2 = 10$], [$C_3^2 = 3$], [$C_2^0 = 1$], [$30$],
        [$(2, 1, 1)$], [$C_5^2 = 10$], [$C_3^1 = 3$], [$C_2^1 = 2$], [$60$],
        [$(1, 2, 1)$], [$C_5^1 = 5$], [$C_3^2 = 3$], [$C_2^1 = 2$], [$30$],
        table.cell(colspan: 4)[*Tổng số kết quả $n(Omega)$*], [*175*]
      )
    ]

    #step[Tính số kết quả thuận lợi $n(A)$]
    Bàn 2 có đúng 1 Nam ($x_2 = 1$). Các bộ $(x_1, 1, x_3)$ hợp lệ:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
        [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_3^(x_2)$)*], [*Bàn 3 ($C_2^(x_3)$)*], [*Số cách xếp*],
        [$(3, 1, 0)$], [$C_5^3 = 10$], [$C_3^1 = 3$], [$C_2^0 = 1$], [$30$],
        [$(2, 1, 1)$], [$C_5^2 = 10$], [$C_3^1 = 3$], [$C_2^1 = 2$], [$60$],
        table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*90*]
      )
    ]

    #step[Tính xác suất]
    Xác suất $p = frac(90, 175) = frac(18, 35)$.
    Giá trị $140p = 140 dot frac(18, 35) = 72$.
  ]
)

#pagebreak()
= V. Bài tập tự luyện mở rộng

Học sinh giải các bài tập sau theo quy trình đã hướng dẫn ở trên.

#note-box(title: "Bài tập 16")[
#tln(
  id: "THXS-16",
  [Trong phòng đọc sách có $12$ chiếc ghế xếp thành $3$ bàn, mỗi bàn gồm $4$ chiếc ghế. Có $7$ bạn Nam và $5$ bạn Nữ. Họ ngồi ngẫu nhiên mỗi người một ghế sao cho không có bàn nào chỉ toàn bạn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $2$ bạn Nam ngồi. Tính giá trị $130p$?],
  [60],
  loigiai: [
    - Ràng buộc: $x_i \le 3$. Nghiệm nguyên của $x_1+x_2+x_3=7$:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${3, 3, 1}$], [$3!/2! = 3$], [$C_4^3 dot C_4^3 dot C_4^1$], [$3 dot (4 dot 4 dot 4) = 192$],
          [${3, 2, 2}$], [$3!/2! = 3$], [$C_4^3 dot C_4^2 dot C_4^2$], [$3 dot (4 dot 6 dot 6) = 432$],
          table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*624*]
        )
      ]
    - Biến cố $A$: Bàn 1 có 2 Nam ($x_1=2$) $arrow.r C_4^2 = 6$ cách. Hai bàn còn lại có tổng bằng 5:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${3, 2}$], [$2! = 2$], [$C_4^3 dot C_4^2$], [$2 dot (4 dot 6) = 48$]
        )
      ]
      $arrow.r n(A) = 6 dot 48 = 288$.
    - Xác suất $p = frac(288, 624) = frac(6, 13) arrow.r 130p = 60$.
  ]
)
]

#note-box(title: "Bài tập 17")[
#tln(
  id: "THXS-17",
  [Trong phòng học có $9$ ghế xếp thành $3$ bàn, mỗi bàn gồm $3$ ghế. Có $3$ Nam và $6$ Nữ ngồi ngẫu nhiên vào các ghế sao cho không có bàn nào toàn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $1$ Nam. Tính giá trị $99p$?],
  [55],
  loigiai: [
    - Ràng buộc $x_i \le 2$. Nghiệm nguyên của $x_1+x_2+x_3=3$:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${2, 1, 0}$], [$3! = 6$], [$C_3^2 dot C_3^1 dot C_3^0$], [$6 dot (3 dot 3 dot 1) = 54$],
          [${1, 1, 1}$], [$1$], [$C_3^1 dot C_3^1 dot C_3^1$], [$1 dot (3 dot 3 dot 3) = 27$],
          table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*81*]
        )
      ]
    - Biến cố $A$: Bàn 1 có đúng 1 Nam $arrow.r C_3^1 = 3$ cách. Hai bàn còn lại có tổng bằng 2:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${2, 0}$], [$2! = 2$], [$C_3^2 dot C_3^0$], [$2 dot (3 dot 1) = 6$],
          [${1, 1}$], [$1$], [$C_3^1 dot C_3^1$], [$1 dot (3 dot 3) = 9$],
          table.cell(colspan: 3)[*Tổng số cách xếp cho 2 bàn còn lại*], [*15*]
        )
      ]
      $arrow.r n(A) = 3 dot 15 = 45$.
    - Xác suất $p = frac(45, 81) = frac(5, 9) arrow.r 99p = 55$.
  ]
)
]

#note-box(title: "Bài tập 18")[
#tln(
  id: "THXS-18",
  [Trong phòng học có $10$ ghế được chia thành $2$ bàn, mỗi bàn gồm $5$ ghế. Có $5$ bạn Nam và $5$ bạn Nữ ngồi ngẫu nhiên sao cho không có bàn nào toàn bạn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $3$ bạn Nam. Tính giá trị $125p$?],
  [50],
  loigiai: [
    - Ràng buộc $x_i \le 4$. Nghiệm nguyên của $x_1+x_2=5$:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${4, 1}$], [$2! = 2$], [$C_5^4 dot C_5^1$], [$2 dot (5 dot 5) = 50$],
          [${3, 2}$], [$2! = 2$], [$C_5^3 dot C_5^2$], [$2 dot (10 dot 10) = 200$],
          table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*250*]
        )
      ]
    - Biến cố $A$: Bàn 1 có đúng 3 Nam $arrow.r$ bàn 2 có đúng 2 Nam.
      $arrow.r n(A) = C_5^3 dot C_5^2 = 100$.
    - Xác suất $p = frac(100, 250) = frac(2, 5) arrow.r 125p = 50$.
  ]
)
]

#note-box(title: "Bài tập 19")[
#tln(
  id: "THXS-19",
  [Trong phòng học có $12$ ghế xếp thành $3$ bàn, mỗi bàn gồm $4$ ghế. Có $8$ Nam và $4$ Nữ ngồi ngẫu nhiên sao cho không bàn nào toàn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $3$ bạn Nam. Tính giá trị $120p$?],
  [80],
  loigiai: [
    - Ràng buộc $x_i \le 3$. Phương trình $x_1+x_2+x_3=8$ chỉ có duy nhất cấu trúc ${3, 3, 2}$ thỏa mãn:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${3, 3, 2}$], [$3!/2! = 3$], [$C_4^3 dot C_4^3 dot C_4^2$], [$3 dot (4 dot 4 dot 6) = 288$]
        )
      ]
      $arrow.r n(Omega) = 288$.
    - Biến cố $A$: Bàn 1 có đúng 3 Nam $arrow.r C_4^3 = 4$ cách. Hai bàn còn lại có tổng bằng 5:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${3, 2}$], [$2! = 2$], [$C_4^3 dot C_4^2$], [$2 dot (4 dot 6) = 48$]
        )
      ]
      $arrow.r n(A) = 4 dot 48 = 192$.
    - Xác suất $p = frac(192, 288) = frac(2, 3) arrow.r 120p = 80$.
  ]
)
]

#note-box(title: "Bài tập 20")[
#tln(
  id: "THXS-20",
  [Trong phòng thảo luận có $12$ ghế được chia thành $4$ bàn, mỗi bàn gồm $3$ ghế. Có $6$ Nam và $6$ Nữ ngồi ngẫu nhiên sao cho không có bàn nào toàn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $2$ Nam. Tính giá trị $121p$?],
  [66],
  loigiai: [
    - Ràng buộc $x_i \le 2$. Nghiệm nguyên của $x_1+x_2+x_3+x_4=6$:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${2, 2, 2, 0}$], [$4!/3! = 4$], [$C_3^2 dot C_3^2 dot C_3^2 dot C_3^0$], [$4 dot (3 dot 3 dot 3 dot 1) = 108$],
          [${2, 2, 1, 1}$], [$4!/(2! 2!) = 6$], [$C_3^2 dot C_3^2 dot C_3^1 dot C_3^1$], [$6 dot (3 dot 3 dot 3 dot 3) = 486$],
          table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*594*]
        )
      ]
    - Biến cố $A$: Bàn 1 có đúng 2 Nam $arrow.r C_3^2 = 3$ cách. Ba bàn còn lại có tổng bằng 4:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc 3 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${2, 2, 0}$], [$3!/2! = 3$], [$C_3^2 dot C_3^2 dot C_3^0$], [$3 dot (3 dot 3 dot 1) = 27$],
          [${2, 1, 1}$], [$3!/2! = 3$], [$C_3^2 dot C_3^1 dot C_3^1$], [$3 dot (3 dot 3 dot 3) = 81$],
          table.cell(colspan: 3)[*Tổng số cách xếp cho 3 bàn còn lại*], [*108*]
        )
      ]
      $arrow.r n(A) = 3 dot 108 = 324$.
    - Xác suất $p = frac(324, 594) = frac(6, 11) arrow.r 121p = 66$.
  ]
)
]

#note-box(title: "Bài tập 21")[
#tln(
  id: "THXS-21",
  [Một phòng thí nghiệm có $15$ ghế xếp quanh $3$ bàn tròn lớn, mỗi bàn tròn gồm $5$ ghế. Có $5$ bạn Nam và $10$ bạn Nữ. Họ ngồi ngẫu nhiên mỗi người một ghế sao cho không có bàn nào toàn bạn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $2$ bạn Nam. Tính giá trị $150p$?],
  [60],
  loigiai: [
    - Ràng buộc $x_i \le 4$. Nghiệm nguyên của $x_1+x_2+x_3=5$:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${4, 1, 0}$], [$3! = 6$], [$C_5^4 dot C_5^1 dot C_5^0$], [$6 dot (5 dot 5 dot 1) = 150$],
          [${3, 2, 0}$], [$3! = 6$], [$C_5^3 dot C_5^2 dot C_5^0$], [$6 dot (10 dot 10 dot 1) = 600$],
          [${3, 1, 1}$], [$3!/2! = 3$], [$C_5^3 dot C_5^1 dot C_5^1$], [$3 dot (10 dot 5 dot 5) = 750$],
          [${2, 2, 1}$], [$3!/2! = 3$], [$C_5^2 dot C_5^2 dot C_5^1$], [$3 dot (10 dot 10 dot 5) = 1500$],
          table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*3000*]
        )
      ]
    - Biến cố $A$: Bàn 1 có đúng 2 Nam $arrow.r C_5^2 = 10$ cách. Hai bàn còn lại có tổng bằng 3:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${3, 0}$], [$2! = 2$], [$C_5^3 dot C_5^0$], [$2 dot (10 dot 1) = 20$],
          [${2, 1}$], [$2! = 2$], [$C_5^2 dot C_5^1$], [$2 dot (10 dot 5) = 100$],
          table.cell(colspan: 3)[*Tổng số cách xếp cho 2 bàn còn lại*], [*120*]
        )
      ]
      $arrow.r n(A) = 10 dot 120 = 1200$.
    - Xác suất $p = frac(1200, 3000) = frac(2, 5) arrow.r 150p = 60$.
  ]
)
]

#note-box(title: "Bài tập 22")[
#tln(
  id: "THXS-22",
  [Trong phòng đọc sách có $12$ ghế xếp thành $3$ bàn, mỗi bàn gồm $4$ ghế. Có $3$ bạn Nam và $9$ bạn Nữ ngồi ngẫu nhiên sao cho không bàn nào toàn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $1$ bạn Nam. Tính giá trị $110p$?],
  [56],
  loigiai: [
    - Ràng buộc $x_i \le 3$. Nghiệm nguyên của $x_1+x_2+x_3=3$:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc phân bố*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${3, 0, 0}$], [$3!/2! = 3$], [$C_4^3 dot C_4^0 dot C_4^0$], [$3 dot (4 dot 1 dot 1) = 12$],
          [${2, 1, 0}$], [$3! = 6$], [$C_4^2 dot C_4^1 dot C_4^0$], [$6 dot (6 dot 4 dot 1) = 144$],
          [${1, 1, 1}$], [$1$], [$C_4^1 dot C_4^1 dot C_4^1$], [$1 dot (4 dot 4 dot 4) = 64$],
          table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*220*]
        )
      ]
    - Biến cố $A$: Bàn 1 có đúng 1 Nam $arrow.r C_4^1 = 4$ cách. Hai bàn còn lại chứa 2 Nam:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${2, 0}$], [$2! = 2$], [$C_4^2 dot C_4^0$], [$2 dot (6 dot 1) = 12$],
          [${1, 1}$], [$1$], [$C_4^1 dot C_4^1$], [$1 dot (4 dot 4) = 16$],
          table.cell(colspan: 3)[*Tổng số cách xếp cho 2 bàn còn lại*], [*28*]
        )
      ]
      $arrow.r n(A) = 4 dot 28 = 112$.
    - Xác suất $p = frac(112, 220) = frac(28, 55) arrow.r 110p = 56$.
  ]
)
]

#note-box(title: "Bài tập 23")[
#tln(
  id: "THXS-23",
  [Một phòng học có $12$ ghế được chia thành $3$ bàn: Bàn 1 có $5$ ghế, Bàn 2 có $4$ ghế, Bàn 3 có $3$ ghế. Có $6$ bạn Nam và $6$ bạn Nữ ngồi ngẫu nhiên sao cho không bàn nào toàn Nam. Gọi $p$ là xác suất để Bàn 3 có đúng $2$ bạn Nam. Tính giá trị $322p$?],
  [150],
  loigiai: [
    - Ràng buộc: $x_1 \le 4, x_2 \le 3, x_3 \le 2$. Liệt kê các bộ phân bổ $(x_1, x_2, x_3)$ tổng bằng 6:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
          inset: 7pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
          [$(4, 2, 0)$], [$C_5^4 = 5$], [$C_4^2 = 6$], [$C_3^0 = 1$], [$30$],
          [$(4, 1, 1)$], [$C_5^4 = 5$], [$C_4^1 = 4$], [$C_3^1 = 3$], [$60$],
          [$(4, 0, 2)$], [$C_5^4 = 5$], [$C_4^0 = 1$], [$C_3^2 = 3$], [$15$],
          [$(3, 3, 0)$], [$C_5^3 = 10$], [$C_4^3 = 4$], [$C_3^0 = 1$], [$40$],
          [$(3, 2, 1)$], [$C_5^3 = 10$], [$C_4^2 = 6$], [$C_3^1 = 3$], [$180$],
          [$(3, 1, 2)$], [$C_5^3 = 10$], [$C_4^1 = 4$], [$C_3^2 = 3$], [$120$],
          [$(2, 3, 1)$], [$C_5^2 = 10$], [$C_4^3 = 4$], [$C_3^1 = 3$], [$120$],
          [$(2, 2, 2)$], [$C_5^2 = 10$], [$C_4^2 = 6$], [$C_3^2 = 3$], [$180$],
          [$(1, 3, 2)$], [$C_5^1 = 5$], [$C_4^3 = 4$], [$C_3^2 = 3$], [$60$],
          table.cell(colspan: 4)[*Tổng số kết quả $n(Omega)$*], [*805*]
        )
      ]
    - Biến cố $A$: Bàn 3 có đúng 2 Nam ($x_3 = 2$). Các bộ $(x_1, x_2, 2)$ hợp lệ:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
          inset: 7pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
          [$(4, 0, 2)$], [$C_5^4 = 5$], [$C_4^0 = 1$], [$C_3^2 = 3$], [$15$],
          [$(3, 1, 2)$], [$C_5^3 = 10$], [$C_4^1 = 4$], [$C_3^2 = 3$], [$120$],
          [$(2, 2, 2)$], [$C_5^2 = 10$], [$C_4^2 = 6$], [$C_3^2 = 3$], [$180$],
          [$(1, 3, 2)$], [$C_5^1 = 5$], [$C_4^3 = 4$], [$C_3^2 = 3$], [$60$],
          table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*375*]
        )
      ]
    - Xác suất $p = frac(375, 805) = frac(75, 161) arrow.r 322p = 150$.
  ]
)
]

#note-box(title: "Bài tập 24")[
#tln(
  id: "THXS-24",
  [Một phòng đọc sách có $12$ ghế được chia thành $3$ bàn: Bàn 1 có $5$ ghế, Bàn 2 có $5$ ghế, Bàn 3 có $2$ ghế. Có $5$ bạn Nam và $7$ bạn Nữ ngồi ngẫu nhiên sao cho không có bàn nào toàn Nam. Gọi $p$ là xác suất để Bàn 3 có đúng $1$ bạn Nam. Tính giá trị $201p$?],
  [126],
  loigiai: [
    - Ràng buộc: $x_1 \le 4, x_2 \le 4, x_3 \le 1$. Liệt kê các bộ $(x_1, x_2, x_3)$ tổng bằng 5:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
          inset: 7pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_5^(x_2)$)*], [*Bàn 3 ($C_2^(x_3)$)*], [*Số cách xếp*],
          [$(4, 1, 0)$], [$C_5^4 = 5$], [$C_5^1 = 5$], [$C_2^0 = 1$], [$25$],
          [$(4, 0, 1)$], [$C_5^4 = 5$], [$C_5^0 = 1$], [$C_2^1 = 2$], [$10$],
          [$(3, 2, 0)$], [$C_5^3 = 10$], [$C_5^2 = 10$], [$C_2^0 = 1$], [$100$],
          [$(3, 1, 1)$], [$C_5^3 = 10$], [$C_5^1 = 5$], [$C_2^1 = 2$], [$100$],
          [$(2, 3, 0)$], [$C_5^2 = 10$], [$C_5^3 = 10$], [$C_2^0 = 1$], [$100$],
          [$(2, 2, 1)$], [$C_5^2 = 10$], [$C_5^2 = 10$], [$C_2^1 = 2$], [$200$],
          [$(1, 4, 0)$], [$C_5^1 = 5$], [$C_5^4 = 5$], [$C_2^0 = 1$], [$25$],
          [$(1, 3, 1)$], [$C_5^1 = 5$], [$C_5^3 = 10$], [$C_2^1 = 2$], [$100$],
          [$(0, 4, 1)$], [$C_5^0 = 1$], [$C_5^4 = 5$], [$C_2^1 = 2$], [$10$],
          table.cell(colspan: 4)[*Tổng số kết quả $n(Omega)$*], [*670*]
        )
      ]
    - Biến cố $A$: Bàn 3 có đúng 1 Nam ($x_3 = 1$). Các bộ $(x_1, x_2, 1)$ hợp lệ:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
          inset: 7pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_5^(x_2)$)*], [*Bàn 3 ($C_2^(x_3)$)*], [*Số cách xếp*],
          [$(4, 0, 1)$], [$C_5^4 = 5$], [$C_5^0 = 1$], [$C_2^1 = 2$], [$10$],
          [$(3, 1, 1)$], [$C_5^3 = 10$], [$C_5^1 = 5$], [$C_2^1 = 2$], [$100$],
          [$(2, 2, 1)$], [$C_5^2 = 10$], [$C_5^2 = 10$], [$C_2^1 = 2$], [$200$],
          [$(1, 3, 1)$], [$C_5^1 = 5$], [$C_5^3 = 10$], [$C_2^1 = 2$], [$100$],
          [$(0, 4, 1)$], [$C_5^0 = 1$], [$C_5^4 = 5$], [$C_2^1 = 2$], [$10$],
          table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*420*]
        )
      ]
    - Xác suất $p = frac(420, 670) = frac(42, 67) arrow.r 201p = 126$.
  ]
)
]

#note-box(title: "Bài tập 25")[
#tln(
  id: "THXS-25",
  [Trong phòng đọc sách có $10$ ghế được chia thành $2$ bàn: Bàn 1 có $6$ ghế, Bàn 2 có $4$ ghế. Có $5$ bạn Nam và $5$ bạn Nữ ngồi ngẫu nhiên sao cho không có bàn nào toàn Nam. Gọi $p$ là xác suất để Bàn 2 có đúng $2$ bạn Nam. Tính giá trị của $123p$?],
  [60],
  loigiai: [
    - Ràng buộc: $x_1 \le 5, x_2 \le 3$. Liệt kê các bộ $(x_1, x_2)$ tổng bằng 5:
      #align(center)[
        #table(
          columns: (1.5fr, 1.5fr, 1.5fr, 1.8fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2)$*], [*Bàn 1 ($C_6^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Số cách xếp*],
          [$(5, 0)$], [$C_6^5 = 6$], [$C_4^0 = 1$], [$6$],
          [$(4, 1)$], [$C_6^4 = 15$], [$C_4^1 = 4$], [$60$],
          [$(3, 2)$], [$C_6^3 = 20$], [$C_4^2 = 6$], [$120$],
          [$(2, 3)$], [$C_6^2 = 15$], [$C_4^3 = 4$], [$60$],
          table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*246*]
        )
      ]
    - Biến cố $A$: Bàn 2 có đúng 2 Nam ($x_2 = 2$). Chỉ có bộ $(3, 2)$ thỏa mãn:
      #align(center)[
        #table(
          columns: (1.5fr, 1.5fr, 1.5fr, 1.8fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2)$*], [*Bàn 1 ($C_6^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Số cách xếp*],
          [$(3, 2)$], [$C_6^3 = 20$], [$C_4^2 = 6$], [*120*]
        )
      ]
    - Xác suất $p = frac(120, 246) = frac(20, 41) arrow.r 123p = 60$.
  ]
)
]

#note-box(title: "Bài tập 26")[
#tln(
  id: "THXS-26",
  [Trong phòng đọc sách có $10$ ghế được chia thành $3$ bàn: Bàn 1 có $5$ ghế, Bàn 2 có $3$ ghế, Bàn 3 có $2$ ghế. Có $5$ bạn Nam và $5$ bạn Nữ ngồi ngẫu nhiên sao cho không có bàn nào toàn Nam. Gọi $p$ là xác suất để Bàn 3 có đúng $1$ bạn Nam. Tính giá trị của $176p$?],
  [130],
  loigiai: [
    - Ràng buộc $x_1 \le 4, x_2 \le 2, x_3 \le 1$. Liệt kê các bộ $(x_1, x_2, x_3)$ tổng bằng 5:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
          inset: 7pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_3^(x_2)$)*], [*Bàn 3 ($C_2^(x_3)$)*], [*Số cách xếp*],
          [$(4, 1, 0)$], [$C_5^4 = 5$], [$C_3^1 = 3$], [$C_2^0 = 1$], [$15$],
          [$(4, 0, 1)$], [$C_5^4 = 5$], [$C_3^0 = 1$], [$C_2^1 = 2$], [$10$],
          [$(3, 2, 0)$], [$C_5^3 = 10$], [$C_3^2 = 3$], [$C_2^0 = 1$], [$30$],
          [$(3, 1, 1)$], [$C_5^3 = 10$], [$C_3^1 = 3$], [$C_2^1 = 2$], [$60$],
          [$(2, 2, 1)$], [$C_5^2 = 10$], [$C_3^2 = 3$], [$C_2^1 = 2$], [$60$],
          table.cell(colspan: 4)[*Tổng số kết quả $n(Omega)$*], [*176*]
        )
      ]
    - Biến cố $A$: Bàn 3 có đúng 1 Nam ($x_3 = 1$). Các bộ $(x_1, x_2, 1)$ hợp lệ:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
          inset: 7pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_3^(x_2)$)*], [*Bàn 3 ($C_2^(x_3)$)*], [*Số cách xếp*],
          [$(4, 0, 1)$], [$C_5^4 = 5$], [$C_3^0 = 1$], [$C_2^1 = 2$], [$10$],
          [$(3, 1, 1)$], [$C_5^3 = 10$], [$C_3^1 = 3$], [$C_2^1 = 2$], [$60$],
          [$(2, 2, 1)$], [$C_5^2 = 10$], [$C_3^2 = 3$], [$C_2^1 = 2$], [$60$],
          table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*130*]
        )
      ]
    - Xác suất $p = frac(130, 176) arrow.r 176p = 130$.
  ]
)
]

#note-box(title: "Bài tập 27")[
#tln(
  id: "THXS-27",
  [Trong phòng đọc sách có $10$ ghế được chia thành $2$ bàn, mỗi bàn gồm $5$ ghế. Có $4$ bạn Nam và $6$ bạn Nữ ngồi ngẫu nhiên sao cho không có bàn nào toàn Nam. Gọi $p$ là xác suất để Bàn 2 có đúng $2$ bạn Nam. Tính giá trị của $105p$?],
  [50],
  loigiai: [
    - Do tổng số Nam là 4, nên không bàn 5 ghế nào có thể chứa toàn Nam. Ràng buộc luôn được thỏa mãn.
    - Ta liệt kê các bộ $(x_1, x_2)$ tổng bằng 4:
      #align(center)[
        #table(
          columns: (1.5fr, 1.5fr, 1.5fr, 1.8fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_5^(x_2)$)*], [*Số cách xếp*],
          [$(4, 0)$], [$C_5^4 = 5$], [$C_5^0 = 1$], [$5$],
          [$(3, 1)$], [$C_5^3 = 10$], [$C_5^1 = 5$], [$50$],
          [$(2, 2)$], [$C_5^2 = 10$], [$C_5^2 = 10$], [$100$],
          [$(1, 3)$], [$C_5^1 = 5$], [$C_5^3 = 10$], [$50$],
          [$(0, 4)$], [$C_5^0 = 1$], [$C_5^4 = 5$], [$5$],
          table.cell(colspan: 3)[*Tổng số kết quả $n(Omega)$*], [*210*]
        )
      ]
    - Biến cố $A$: Bàn 2 có đúng 2 Nam ($x_2 = 2$). Chỉ có bộ $(2, 2)$ thỏa mãn:
      #align(center)[
        #table(
          columns: (1.5fr, 1.5fr, 1.5fr, 1.8fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_5^(x_2)$)*], [*Số cách xếp*],
          [$(2, 2)$], [$C_5^2 = 10$], [$C_5^2 = 10$], [*100*]
        )
      ]
    - Xác suất $p = frac(100, 210) = frac(10, 21) arrow.r 105p = 50$.
  ]
)
]

#note-box(title: "Bài tập 28")[
#tln(
  id: "THXS-28",
  [Trong phòng thảo luận có $12$ chiếc ghế chia thành $3$ bàn: Bàn 1 có $6$ ghế, Bàn 2 có $3$ ghế, Bàn 3 có $3$ ghế. Có $4$ bạn Nam và $8$ bạn Nữ ngồi ngẫu nhiên sao cho không bàn nào toàn Nam. Gọi $p$ là xác suất để Bàn 2 có đúng $1$ bạn Nam. Tính giá trị của $159p$?],
  [83],
  loigiai: [
    - Ràng buộc: $x_1 \le 5, x_2 \le 2, x_3 \le 2$. Liệt kê các bộ $(x_1, x_2, x_3)$ tổng bằng 4:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
          inset: 7pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_6^(x_1)$)*], [*Bàn 2 ($C_3^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
          [$(4, 0, 0)$], [$C_6^4 = 15$], [$C_3^0 = 1$], [$C_3^0 = 1$], [$15$],
          [$(3, 1, 0)$], [$C_6^3 = 20$], [$C_3^1 = 3$], [$C_3^0 = 1$], [$60$],
          [$(3, 0, 1)$], [$C_6^3 = 20$], [$C_3^0 = 1$], [$C_3^1 = 3$], [$60$],
          [$(2, 2, 0)$], [$C_6^2 = 15$], [$C_3^2 = 3$], [$C_3^0 = 1$], [$45$],
          [$(2, 1, 1)$], [$C_6^2 = 15$], [$C_3^1 = 3$], [$C_3^1 = 3$], [$135$],
          [$(2, 0, 2)$], [$C_6^2 = 15$], [$C_3^0 = 1$], [$C_3^2 = 3$], [$45$],
          [$(1, 2, 1)$], [$C_6^1 = 6$], [$C_3^2 = 3$], [$C_3^1 = 3$], [$54$],
          [$(1, 1, 2)$], [$C_6^1 = 6$], [$C_3^1 = 3$], [$C_3^2 = 3$], [$54$],
          [$(0, 2, 2)$], [$C_6^0 = 1$], [$C_3^2 = 3$], [$C_3^2 = 3$], [$9$],
          table.cell(colspan: 4)[*Tổng số kết quả $n(Omega)$*], [*477*]
        )
      ]
    - Biến cố $A$: Bàn 2 có đúng 1 Nam ($x_2 = 1$). Các bộ $(x_1, 1, x_3)$ hợp lệ:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
          inset: 7pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_6^(x_1)$)*], [*Bàn 2 ($C_3^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
          [$(3, 1, 0)$], [$C_6^3 = 20$], [$C_3^1 = 3$], [$C_3^0 = 1$], [$60$],
          [$(2, 1, 1)$], [$C_6^2 = 15$], [$C_3^1 = 3$], [$C_3^1 = 3$], [$135$],
          [$(1, 1, 2)$], [$C_6^1 = 6$], [$C_3^1 = 3$], [$C_3^2 = 3$], [$54$],
          table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*249*]
        )
      ]
    - Xác suất $p = frac(249, 477) = frac(83, 159) arrow.r 159p = 83$.
  ]
)
]

#note-box(title: "Bài tập 29")[
#tln(
  id: "THXS-29",
  [Trong phòng đọc sách có $12$ chiếc ghế xếp thành $3$ bàn, mỗi bàn gồm $4$ ghế. Có $5$ bạn Nam và $7$ bạn Nữ. Họ ngồi ngẫu nhiên mỗi người một ghế sao cho không có bàn nào toàn Nam. Gọi $p$ là xác suất để bàn số 1 có đúng $1$ bạn Nam. Tính giá trị $240p$?],
  [85],
  loigiai: [
    - Ràng buộc: $x_i \le 3$. Từ Ví dụ 1 ta có $n(Omega) = 768$.
    - Biến cố $A$: Bàn 1 có đúng 1 Nam $arrow.r C_4^1 = 4$ cách. Hai bàn còn lại có tổng bằng 4:
      #align(center)[
        #table(
          columns: (2fr, 1.5fr, 2.5fr, 2fr),
          inset: 8pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Cấu trúc 2 bàn*], [*Số hoán vị bàn*], [*Chọn ghế trong bàn*], [*Số cách xếp*],
          [${3, 1}$], [$2! = 2$], [$C_4^3 dot C_4^1$], [$2 dot (4 dot 4) = 32$],
          [${2, 2}$], [$1$], [$C_4^2 dot C_4^2$], [$1 dot (6 dot 6) = 36$],
          table.cell(colspan: 3)[*Tổng số cách xếp cho 2 bàn còn lại*], [*68*]
        )
      ]
      $arrow.r n(A) = 4 dot 68 = 272$.
    - Xác suất $p = frac(272, 768) = frac(17, 48) arrow.r 240p = 85$.
  ]
)
]

#note-box(title: "Bài tập 30")[
#tln(
  id: "THXS-30",
  [Bàn 1 có $5$ ghế, Bàn 2 có $4$ ghế, Bàn 3 có $3$ ghế. Có $4$ Nam và $8$ Nữ ngồi ngẫu nhiên sao cho không có bàn nào toàn Nam. Gọi $p$ là xác suất để Bàn 2 có đúng $2$ bạn Nam. Tính giá trị $485p$?],
  [168],
  loigiai: [
    - Ràng buộc: $x_1 \le 4, x_2 \le 3, x_3 \le 2$. Từ Ví dụ 10 ta có $n(Omega) = 485$.
    - Biến cố $A$: Bàn 2 có đúng 2 Nam ($x_2 = 2$). Các bộ $(x_1, 2, x_3)$ tổng bằng 2 hợp lệ:
      #align(center)[
        #table(
          columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
          inset: 7pt,
          align: center + horizon,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
          [*Bộ $(x_1, x_2, x_3)$*], [*Bàn 1 ($C_5^(x_1)$)*], [*Bàn 2 ($C_4^(x_2)$)*], [*Bàn 3 ($C_3^(x_3)$)*], [*Số cách xếp*],
          [$(2, 2, 0)$], [$C_5^2 = 10$], [$C_4^2 = 6$], [$C_3^0 = 1$], [$60$],
          [$(1, 2, 1)$], [$C_5^1 = 5$], [$C_4^2 = 6$], [$C_3^1 = 3$], [$90$],
          [$(0, 2, 2)$], [$C_5^0 = 1$], [$C_4^2 = 6$], [$C_3^2 = 3$], [$18$],
          table.cell(colspan: 4)[*Tổng số cách xếp thuận lợi $n(A)$*], [*168*]
        )
      ]
    - Xác suất $p = frac(168, 485) arrow.r 485p = 168$.
  ]
)
]
