#import "../sang-exam.typ": *
#import "../template.typ": *

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
      CHUYÊN ĐỀ TỔ HỢP - XÁC SUẤT NÂNG CAO
    ]
    #v(0.55em)
    #text(fill: white, size: 22pt, weight: "black")[Xác Suất Điều Kiện & Bài Toán Phân Bổ Phòng Học]
    #v(0.45em)
    #text(fill: rgb("E8EAF6"), size: 14pt)[Tư duy Phân hoạch Số nguyên · Nguyên lý Bù trừ Bảng · Kỹ thuật Độc lập hóa Phân bố]
    #v(0.55em)
    #text(fill: rgb("C5CAE9"), size: 11pt, style: "italic")[(Cẩm nang sư phạm chi tiết dành cho giáo viên và học sinh ôn thi học sinh giỏi, THPT Quốc gia)]
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
      [I. Phương pháp Phân hoạch Số nguyên], [II. Kỹ thuật Độc lập hóa & Nguyên lý Bù trừ (PIE)],
      [III. Quy trình 3 bước chuẩn sư phạm], [IV. Hệ thống 6 ví dụ mẫu giải chi tiết],
      [V. Hệ thống 10 bài tập tự luyện nâng cao], []
    )
  ]
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("283593"))
    grid(
      columns: (1fr, auto),
      [Chuyên đề ôn thi: Xác suất phân bổ phòng học], [Hệ thống bài tập nâng cao],
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

= I. Phương pháp Phân hoạch Số nguyên trong Đếm cấu trúc phòng

Khi xếp $N$ học sinh phân biệt vào $K$ phòng học phân biệt sao cho không có phòng nào trống, khó khăn lớn nhất là các phòng có thể có số lượng học sinh khác nhau. Nếu đếm một cách mò mẫm, ta sẽ rất dễ đếm trùng hoặc bỏ sót.

Để giải quyết triệt để, ta sử dụng *Phép phân hoạch số nguyên* để chia số lượng học sinh thành tổng của các số nguyên dương.

== 1. Khái niệm phân hoạch và lập cấu trúc phòng
Gọi $N$ là tổng số học sinh và $K$ là số phòng học ($N >= K$). Ta cần tìm tất cả các cách viết $N$ dưới dạng tổng của $K$ số nguyên dương:
$ N = s_1 + s_2 + ... + s_K " với " s_1 >= s_2 >= ... >= s_K >= 1 $
Mỗi bộ $(s_1, s_2, ..., s_K)$ được gọi là một *cấu trúc phân bổ*.

== 2. Cách chọn phòng và phân bổ học sinh
Với mỗi cấu trúc phân bổ $(s_1, s_2, ..., s_K)$, ta thực hiện chọn phòng và xếp học sinh theo các nguyên tắc sau:

#rev-box(title: [Quy tắc chọn phòng cho nhóm kích thước])[
  - *Nhóm cùng kích thước:* Nếu trong cấu trúc phân bổ có $m$ phòng có cùng số học sinh là $s$, ta chọn $m$ phòng trong số các phòng còn lại để nhận kích thước này. Số cách chọn là tổ hợp: $C_R^m$ (với $R$ là số phòng còn lại chưa được gán kích thước).
  - *Nhóm khác kích thước:* Nếu các phòng có kích thước khác nhau (ví dụ: một phòng $3$ người, một phòng $2$ người), việc chọn phòng cho chúng có tính chất thứ tự. Do đó, ta chọn phòng bằng chỉnh hợp $A_R^p$ hoặc chọn lần lượt cho từng phòng.
]

#rev-box(title: [Quy tắc xếp học sinh vào các phòng đã định])[
  Sau khi đã chọn được phòng nào có kích thước bao nhiêu, ta tiến hành chọn học sinh xếp vào phòng:
  - Chọn học sinh cho phòng thứ nhất: $C_N^(s_1)$ cách.
  - Chọn học sinh cho phòng thứ hai từ số còn lại: $C_(N - s_1)^(s_2)$ cách.
  - ... Tiếp tục cho đến phòng cuối cùng.
  - Cuối cùng, nhân với hoán vị học sinh trong các phòng có kích thước $1$ (nếu có): $r!$ cách (với $r$ là số phòng có kích thước $1$).
]

#note-box(title: [Lưu ý cực kỳ quan trọng về hoán vị phòng học])[
  Vì các phòng học trong thực tế đều là các phòng phân biệt (ví dụ phòng 101, phòng 102...), việc xếp học sinh vào các phòng cụ thể đã làm cho các nhóm tự động phân biệt. Do đó, *ta tuyệt đối KHÔNG chia cho hoán vị các nhóm cùng kích thước* (ví dụ chia cho $3!$ khi có 3 phòng cùng có 2 người). Đây là lỗi sai phổ biến nhất của học sinh khi học phần này.
]

= II. Kỹ thuật Độc lập hóa và Nguyên lý Bù trừ (PIE)

Đối với ràng buộc *"Không có hai học sinh cùng lớp nào ở chung một phòng"*, bài toán trở nên phức tạp hơn vì ta phải đảm bảo không có phòng nào chứa quá 1 học sinh của mỗi lớp.

== 1. Tính độc lập giữa các lớp học
Do ràng buộc chỉ yêu cầu các học sinh *cùng một lớp* không được ở chung phòng, còn học sinh *khác lớp* hoàn toàn có thể ở chung phòng, việc phân phối học sinh của từng lớp vào các phòng là *hoàn toàn độc lập* với nhau.

#lythuyet(title: [Số cách xếp thỏa mãn ràng buộc lớp])[
  Giả sử có $M$ phòng học đang khả dụng.
  - Xếp $n_A$ học sinh lớp A vào $M$ phòng sao cho mỗi phòng tối đa 1 bạn: Có $A_M^(n_A)$ cách (chọn $n_A$ phòng khác nhau từ $M$ phòng và xếp học sinh vào).
  - Xếp $n_B$ học sinh lớp B vào $M$ phòng tương tự: Có $A_M^(n_B)$ cách.
  - Xếp $n_C$ học sinh lớp C vào $M$ phòng tương tự: Có $A_M^(n_C)$ cách.
  
  Tổng số cách xếp thỏa mãn ràng buộc lớp vào $M$ phòng (cho phép có phòng trống) là:
  $ T_M = A_M^(n_A) dot A_M^(n_B) dot A_M^(n_C) $
]

== 2. Thiết lập Nguyên lý Bù trừ (PIE) để loại bỏ phòng trống
Tuy nhiên, đề bài yêu cầu *không phòng nào trống* (tất cả các phòng đều được sử dụng). Ta sử dụng Nguyên lý Bù trừ trên số phòng trống:

#lythuyet(title: [Công thức Nguyên lý Bù trừ cho phòng trống])[
  Gọi $V_k$ là số cách xếp sao cho có *ít nhất* $k$ phòng trống cụ thể (nghĩa là học sinh chỉ được xếp vào $K - k$ phòng còn lại).
  $ V_k = C_K^k dot T_(K - k) = C_K^k dot A_(K - k)^(n_A) dot A_(K - k)^(n_B) dot A_(K - k)^(n_C) $
  
  Khi đó, số cách xếp thỏa mãn cả hai điều kiện (không cùng lớp chung phòng VÀ không phòng nào trống) là:
  $ n(X inter Y) = V_0 - V_1 + V_2 - V_3 + ... + (-1)^k V_k $
]

#side-note(title: "Nguyên lý Dirichlet và giới hạn bù trừ", [
  Nếu số học sinh của một lớp lớn hơn số phòng khả dụng ($n_i > K - k$), ta không thể xếp mỗi phòng tối đa 1 học sinh lớp đó được. Khi đó $A_(K - k)^(n_i) = 0$, dẫn đến $T_(K - k) = 0$ and $V_k = 0$.
  
  Điều này giúp ta thu hẹp bảng bù trừ lại rất nhiều (chỉ cần tính đến một giá trị $k$ nhỏ nào đó, các giá trị sau đều bằng 0).
])

#pagebreak()

= III. Quy trình 3 bước chuẩn sư phạm

Để giải quyết bài toán xác suất điều kiện phân bổ phòng học, học sinh hãy thực hiện theo đúng 3 bước chuẩn hóa dưới đây:

#align(center)[
  #table(
    columns: (1fr, 3fr),
    stroke: 0.5pt + rgb("ccc"),
    fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { none },
    table.header([*Bước thực hiện*], [*Nội dung công việc*]),
    [*Bước 1* \ (Tính $n(Y)$)], [
      - Xác định tổng số học sinh $N$ và số phòng $K$.
      - Liệt kê tất cả các cấu trúc phân hoạch số nguyên của $N$ thành tổng của $K$ số nguyên dương.
      - Với mỗi cấu trúc, tính số cách chọn phòng và số cách chọn học sinh tương ứng.
      - Cộng các kết quả lại để có $n(Y)$ (Không gian mẫu thu hẹp).
    ],
    [*Bước 2* \ (Tính $n(X inter Y)$)], [
      - Độc lập hóa việc xếp học sinh của từng lớp.
      - Thiết lập công thức $T_M$ cho số cách xếp học sinh cùng lớp khác phòng vào $M$ phòng.
      - Tính các giá trị $V_k = C_K^k dot T_(K - k)$ cho đến khi gặp giá trị biên bằng 0.
      - Áp dụng công thức Nguyên lý Bù trừ: $n(X inter Y) = V_0 - V_1 + V_2 - V_3 + ...$
    ],
    [*Bước 3* \ (Tính xác suất)], [
      - Xác suất điều kiện cần tính là: $p = frac(n(X inter Y), n(Y))$.
      - Thực hiện phép tính và làm tròn kết quả theo yêu cầu của đề bài (ví dụ tính $10^4 p$).
    ]
  )
]

= IV. Hệ thống 6 ví dụ mẫu giải chi tiết

== Ví dụ 1 (Bài toán gốc)
#tln(
  id: "VD-01",
  [Xếp ngẫu nhiên ba học sinh lớp A, ba học sinh lớp B, hai học sinh lớp C vào 5 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (không làm tròn ở các phép tính trung gian và làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [3143],
  loigiai: [
    #reset-step()
    #ppgiai[Áp dụng quy trình 3 bước chuẩn hóa với $N = 8$ học sinh phân biệt (3A, 3B, 2C) và $K = 5$ phòng học phân biệt.]
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Ta chia $8$ học sinh vào $5$ phòng theo các cấu trúc số lượng khác nhau và lập bảng đếm chi tiết:
    
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(4, 1, 1, 1, 1)* \ (1 phòng 4 người)], 
        [$C_5^1 = 5$], 
        [$C_8^4 dot 4!$ \ Chọn 4 bạn và hoán vị 4 bạn lẻ], 
        [$5 dot 70 dot 24 = \ bold(8.400)$],
        
        [*(3, 2, 1, 1, 1)* \ (Phòng 3 và 2)], 
        [$A_5^2 = 20$], 
        [$C_8^3 dot C_5^2 dot 3!$ \ Chọn 3 bạn, chọn 2 bạn, hoán vị 3 bạn lẻ], 
        [$20 dot 56 dot 10 dot 6 = \ bold(67.200)$],
        
        [*(2, 2, 2, 1, 1)* \ (3 phòng 2 người)], 
        [$C_5^3 = 10$], 
        [$C_8^2 dot C_6^2 dot C_4^2 dot 2!$ \ Chọn lần lượt cho các phòng 2 người và hoán vị 2 bạn lẻ], 
        [$10 dot 28 dot 15 dot 6 dot 2 = \ bold(50.400)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(126.000)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học sao cho cùng lớp khác phòng là:
    $ T_M = A_M^3 dot A_M^3 dot A_M^2 $
    Ta lập bảng Nguyên lý Bù trừ đối với số phòng trống:
    
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(5-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_5^0 = 1$], [$A_5^3 dot A_5^3 dot A_5^2 = 60 dot 60 dot 20$], [$1 dot 72.000 = bold(72.000)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_5^1 = 5$], [$A_4^3 dot A_4^3 dot A_4^2 = 24 dot 24 dot 12$], [$5 dot 6.912 = bold(34.560)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_5^2 = 10$], [$A_3^3 dot A_3^3 dot A_3^2 = 6 dot 6 dot 6$], [$10 dot 216 = bold(2.160)$],
        [$3$ phòng ($k=3$)], [$-$], [$C_5^3 = 10$], [$A_2^3 dot A_2^3 dot A_2^2$ (Không thể xếp 3 học sinh A vào 2 phòng)], [$10 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 + V_2 = $*], 
        [bold(39.600)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(39.600, 126.000) = frac(11, 35) $
    Giá trị yêu cầu tính là:
    $ 10^4 p = 10.000 dot frac(11, 35) = frac(22.000, 7) approx 3142,857 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *3143*.
  ]
)

#pagebreak()

== Ví dụ 2 (Thay đổi số lượng học sinh và phòng)
#tln(
  id: "VD-02",
  [Xếp ngẫu nhiên hai học sinh lớp A, hai học sinh lớp B, hai học sinh lớp C vào 4 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [5846],
  loigiai: [
    #reset-step()
    #ppgiai[Áp dụng quy trình với $N = 6$ học sinh phân biệt (2A, 2B, 2C) and $K = 4$ phòng học phân biệt.]
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $6$ học sinh vào $4$ phòng gồm các cấu trúc sau:
    
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(3, 1, 1, 1)* \ (1 phòng 3 người)], 
        [$C_4^1 = 4$], 
        [$C_6^3 dot 3!$], 
        [$4 dot 20 dot 6 = bold(480)$],
        
        [*(2, 2, 1, 1)* \ (2 phòng 2 người)], 
        [$C_4^2 = 6$], 
        [$C_6^2 dot C_4^2 dot 2!$], 
        [$6 dot 15 dot 6 dot 2 = bold(1.080)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(1.560)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^2 dot A_M^2 dot A_M^2 = (A_M^2)^3 $
    Bảng bù trừ phòng trống:
    
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(4-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_4^0 = 1$], [$(A_4^2)^3 = 12^3 = 1728$], [$1 dot 1728 = bold(1.728)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_4^1 = 4$], [$(A_3^2)^3 = 6^3 = 216$], [$4 dot 216 = bold(864)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_4^2 = 6$], [$(A_2^2)^3 = 2^3 = 8$], [$6 dot 8 = bold(48)$],
        [$3$ phòng ($k=3$)], [$-$], [$C_4^3 = 4$], [$(A_1^2)^3$ (Không thể xếp 2 học sinh lớp A vào 1 phòng)], [$4 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 + V_2 = $*], 
        [bold(912)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(912, 1.560) = frac(38, 65) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(38, 65) approx 5846,15 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *5846*.
  ]
)

#pagebreak()

== Ví dụ 3 (Cấu trúc học sinh không đối xứng)
#tln(
  id: "VD-03",
  [Xếp ngẫu nhiên ba học sinh lớp A, hai học sinh lớp B, hai học sinh lớp C vào 4 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [3086],
  loigiai: [
    #reset-step()
    #ppgiai[Áp dụng quy trình với $N = 7$ học sinh phân biệt (3A, 2B, 2C) và $K = 4$ phòng học phân biệt.]
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $7$ học sinh vào $4$ phòng gồm các cấu trúc sau:
    
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(4, 1, 1, 1)* \ (1 phòng 4 người)], 
        [$C_4^1 = 4$], 
        [$C_7^4 dot 3!$], 
        [$4 dot 35 dot 6 = bold(840)$],
        
        [*(3, 2, 1, 1)* \ (Phòng 3 và 2)], 
        [$A_4^2 = 12$], 
        [$C_7^3 dot C_4^2 dot 2!$], 
        [$12 dot 35 dot 6 dot 2 = bold(5.040)$],
        
        [*(2, 2, 2, 1)* \ (3 phòng 2 người)], 
        [$C_4^3 = 4$], 
        [$C_7^2 dot C_5^2 dot C_3^2 dot 1!$], 
        [$4 dot 21 dot 10 dot 3 = bold(2.520)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(8.400)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^3 dot A_M^2 dot A_M^2 $
    Bảng bù trừ phòng trống:
    
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(4-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_4^0 = 1$], [$A_4^3 dot A_4^2 dot A_4^2 = 24 dot 12 dot 12 = 3456$], [$1 dot 3456 = bold(3.456)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_4^1 = 4$], [$A_3^3 dot A_3^2 dot A_3^2 = 6 dot 6 dot 6 = 216$], [$4 dot 216 = bold(864)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_4^2 = 6$], [$A_2^3 dot A_2^2 dot A_2^2$ (Không thể xếp 3 học sinh lớp A vào 2 phòng)], [$6 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 = $*], 
        [bold(2.592)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(2.592, 8.400) = frac(54, 175) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(54, 175) approx 3085,71 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *3086*.
  ]
)

#pagebreak()

== Ví dụ 4 (Số lượng phòng lớn hơn)
#tln(
  id: "VD-04",
  [Xếp ngẫu nhiên ba học sinh lớp A, ba học sinh lớp B, ba học sinh lớp C vào 6 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [3333],
  loigiai: [
    #reset-step()
    #ppgiai[Áp dụng quy trình với $N = 9$ học sinh phân biệt (3A, 3B, 3C) và $K = 6$ phòng học phân biệt.]
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $9$ học sinh vào $6$ phòng gồm các cấu trúc sau:
    
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(4, 1, 1, 1, 1, 1)* \ (1 phòng 4 người)], 
        [$C_6^1 = 6$], 
        [$C_9^4 dot 5!$], 
        [$6 dot 126 dot 120 = bold(90.720)$],
        
        [*(3, 2, 1, 1, 1, 1)* \ (Phòng 3 và 2)], 
        [$A_6^2 = 30$], 
        [$C_9^3 dot C_6^2 dot 4!$], 
        [$30 dot 84 dot 15 dot 24 = bold(907.200)$],
        
        [*(2, 2, 2, 1, 1, 1)* \ (3 phòng 2 người)], 
        [$C_6^3 = 20$], 
        [$C_9^2 dot C_7^2 dot C_5^2 dot 3!$], 
        [$20 dot 36 dot 21 dot 10 dot 6 = bold(907.200)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(1.905.120)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^3 dot A_M^3 dot A_M^3 = (A_M^3)^3 $
    Bảng bù trừ phòng trống:
    
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(6-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_6^0 = 1$], [$(A_6^3)^3 = 120^3 = 1728000$], [$1 dot 1728000 = bold(1.728.000)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_6^1 = 6$], [$(A_5^3)^3 = 60^3 = 216000$], [$6 dot 216000 = bold(1.296.000)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_6^2 = 15$], [$(A_4^3)^3 = 24^3 = 13824$], [$15 dot 13824 = bold(207.360)$],
        [$3$ phòng ($k=3$)], [$-$], [$C_6^3 = 20$], [$(A_3^3)^3 = 6^3 = 216$], [$20 dot 216 = bold(4.320)$],
        [$4$ phòng ($k=4$)], [$+$], [$C_6^4 = 15$], [$(A_2^3)^3 = 0$ (Không thể xếp 3 học sinh vào 2 phòng)], [$15 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 + V_2 - V_3 = $*], 
        [bold(635.040)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(635.040, 1.905.120) = frac(1, 3) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(1, 3) approx 3333,33 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *3333*.
  ]
)

#pagebreak()

== Ví dụ 5 (Mở rộng với 4 lớp học khác nhau)
#tln(
  id: "VD-05",
  [Xếp ngẫu nhiên hai học sinh lớp A, hai học sinh lớp B, hai học sinh lớp C, hai học sinh lớp D vào 5 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [5486],
  loigiai: [
    #reset-step()
    #ppgiai[Áp dụng quy trình với $N = 8$ học sinh phân biệt (2A, 2B, 2C, 2D) và $K = 5$ phòng học phân biệt.]
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Do tổng số học sinh là $8$ và số phòng là $5$, cấu trúc phân hoạch hoàn toàn trùng khớp với Ví dụ 1.
    $ n(Y) = bold(126.000) $
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học sao cho cùng lớp khác phòng là:
    $ T_M = A_M^2 dot A_M^2 dot A_M^2 dot A_M^2 = (A_M^2)^4 $
    Bảng bù trừ phòng trống:
    
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(5-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_5^0 = 1$], [$(A_5^2)^4 = 20^4 = 160000$], [$1 dot 160000 = bold(160.000)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_5^1 = 5$], [$(A_4^2)^4 = 12^4 = 20736$], [$5 dot 20736 = bold(103.680)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_5^2 = 10$], [$(A_3^2)^4 = 6^4 = 1296$], [$10 dot 1296 = bold(12.960)$],
        [$3$ phòng ($k=3$)], [$-$], [$C_5^3 = 10$], [$(A_2^2)^4 = 2^4 = 16$], [$10 dot 16 = bold(160)$],
        [$4$ phòng ($k=4$)], [$+$], [$C_5^4 = 5$], [$(A_1^2)^4 = 0$ (Không thể xếp 2 học sinh lớp A vào 1 phòng)], [$5 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 + V_2 - V_3 = $*], 
        [bold(69.120)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(69.120, 126.000) = frac(96, 175) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(96, 175) approx 5485,71 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *5486*.
  ]
)

#pagebreak()

== Ví dụ 6 (Mô hình hóa bài toán thực tế)
#tln(
  id: "VD-06",
  [Một công ty công nghệ triển khai 3 nhóm dự án: Nhóm dự án phần mềm (gồm 3 kỹ sư), Nhóm dự án phần cứng (gồm 2 kỹ sư), và Nhóm dự án dữ liệu (gồm 2 kỹ sư). Công ty bố trí họ vào làm việc tại 4 phòng lab phân biệt. Xếp ngẫu nhiên 7 kỹ sư này vào 4 phòng lab sao cho phòng lab nào cũng có ít nhất 1 kỹ sư làm việc. Tính xác suất $p$ để không có phòng lab nào chứa từ 2 kỹ sư trở lên thuộc cùng một nhóm dự án làm chung. Hãy tính $10^4 p$ (làm tròn đến hàng đơn vị).],
  [3086],
  loigiai: [
    #reset-step()
    #ppgiai[Thực hiện mô hình hóa bài toán thực tế về mặt Toán học trước khi giải quyết.]
    
    *Mô hình hóa Toán học:*
    - Lập trình viên từ 3 nhóm dự án tương ứng với học sinh của 3 lớp khác nhau: Lớp A gồm 3 học sinh, lớp B gồm 2 học sinh, và lớp C gồm 2 học sinh. Tổng cộng $N = 7$ học sinh phân biệt.
    - Bố trí vào 4 phòng lab tương ứng với xếp vào $K = 4$ phòng học phân biệt.
    - Điều kiện "phòng lab nào cũng có ít nhất 1 kỹ sư" tương ứng với điều kiện "không phòng học nào trống" (biến cố điều kiện $Y$).
    - Điều kiện "không có phòng lab nào chứa từ 2 kỹ sư trở lên thuộc cùng một nhóm dự án làm chung" tương ứng với điều kiện "không có hai học sinh cùng lớp nào ở chung một phòng" (biến cố thuận lợi $X$).
    
    Như vậy, cấu trúc toán học của bài toán này hoàn toàn tương đương với *Ví dụ 3* đã giải ở trên.
    - Số phần tử không gian mẫu thu hẹp: $n(Y) = bold(8.400)$ cách.
    - Số kết quả thuận lợi: $n(X inter Y) = bold(2.592)$ cách.
    - Xác suất cần tìm:
      $ p = frac(2.592, 8.400) = frac(54, 175) $
    - Giá trị của biểu thức cần tính là:
      $ 10^4 p = 10.000 dot frac(54, 175) approx 3085,71 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *3086*.
  ]
)

#pagebreak()

= V. Hệ thống 10 bài tập tự luyện nâng cao

Dưới đây là 10 bài tập tự luyện được chọn lọc, thiết kế hệ thống số liệu chuẩn xác nhằm giúp học sinh làm quen với nhiều biến thể khác nhau về số lượng lớp học, học sinh và số phòng.

#tln(
  id: "BT-01",
  [Xếp ngẫu nhiên ba học sinh lớp A, hai học sinh lớp B, hai học sinh lớp C vào 5 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [5286],
  loigiai: [
    #reset-step()
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $7$ học sinh vào $5$ phòng gồm các cấu trúc sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(3, 1, 1, 1, 1)* \ (1 phòng 3 người)], 
        [$C_5^1 = 5$], 
        [$C_7^3 dot 4!$], 
        [$5 dot 35 dot 24 = bold(4.200)$],
        
        [*(2, 2, 1, 1, 1)* \ (2 phòng 2 người)], 
        [$C_5^2 = 10$], 
        [$C_7^2 dot C_5^2 dot 3!$], 
        [$10 dot 21 dot 10 dot 6 = bold(12.600)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(16.800)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^3 dot A_M^2 dot A_M^2 $
    Bảng bù trừ phòng trống:
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(5-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_5^0 = 1$], [$A_5^3 dot A_5^2 dot A_5^2 = 60 dot 20 dot 20$], [$1 dot 24000 = bold(24.000)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_5^1 = 5$], [$A_4^3 dot A_4^2 dot A_4^2 = 24 dot 12 dot 12$], [$5 dot 3456 = bold(17.280)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_5^2 = 10$], [$A_3^3 dot A_3^2 dot A_3^2 = 6 dot 6 dot 6$], [$10 dot 216 = bold(2.160)$],
        [$3$ phòng ($k=3$)], [$-$], [$C_5^3 = 10$], [$A_2^3 dot A_2^2 dot A_2^2$ (Không thể xếp 3 học sinh lớp A vào 2 phòng)], [$10 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 + V_2 = $*], 
        [bold(8.880)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(8.880, 16.800) = frac(37, 70) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(37, 70) approx 5285,71 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *5286*.
  ]
)

#tln(
  id: "BT-02",
  [Xếp ngẫu nhiên ba học sinh lớp A, ba học sinh lớp B vào 4 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [2769],
  loigiai: [
    #reset-step()
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $6$ học sinh vào $4$ phòng gồm các cấu trúc sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(3, 1, 1, 1)* \ (1 phòng 3 người)], 
        [$C_4^1 = 4$], 
        [$C_6^3 dot 3!$], 
        [$4 dot 20 dot 6 = bold(480)$],
        
        [*(2, 2, 1, 1)* \ (2 phòng 2 người)], 
        [$C_4^2 = 6$], 
        [$C_6^2 dot C_4^2 dot 2!$], 
        [$6 dot 15 dot 6 dot 2 = bold(1.080)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(1.560)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^3 dot A_M^3 = (A_M^3)^2 $
    Bảng bù trừ phòng trống:
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(4-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_4^0 = 1$], [$(A_4^3)^2 = 24^2$], [$1 dot 576 = bold(576)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_4^1 = 4$], [$(A_3^3)^2 = 6^2$], [$4 dot 36 = bold(144)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_4^2 = 6$], [$(A_2^3)^2 = 0$ (Không thể xếp 3 học sinh vào 2 phòng)], [$6 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 = $*], 
        [bold(432)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(432, 1.560) = frac(18, 65) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(18, 65) approx 2769,23 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *2769*.
  ]
)

#tln(
  id: "BT-03",
  [Xếp ngẫu nhiên ba học sinh lớp A, ba học sinh lớp B, một học sinh lớp C vào 4 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [2229],
  loigiai: [
    #reset-step()
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $7$ học sinh vào $4$ phòng gồm các cấu trúc sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(4, 1, 1, 1)* \ (1 phòng 4 người)], 
        [$C_4^1 = 4$], 
        [$C_7^4 dot 3!$], 
        [$4 dot 35 dot 6 = bold(840)$],
        
        [*(3, 2, 1, 1)* \ (Phòng 3 và 2)], 
        [$A_4^2 = 12$], 
        [$C_7^3 dot C_4^2 dot 2!$], 
        [$12 dot 35 dot 6 dot 2 = bold(5.040)$],
        
        [*(2, 2, 2, 1)* \ (3 phòng 2 người)], 
        [$C_4^3 = 4$], 
        [$C_7^2 dot C_5^2 dot C_3^2 dot 1!$], 
        [$4 dot 21 dot 10 dot 3 = bold(2.520)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(8.400)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^3 dot A_M^3 dot A_M^1 $
    Bảng bù trừ phòng trống:
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(4-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_4^0 = 1$], [$A_4^3 dot A_4^3 dot A_4^1 = 24 dot 24 dot 4$], [$1 dot 2304 = bold(2.304)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_4^1 = 4$], [$A_3^3 dot A_3^3 dot A_3^1 = 6 dot 6 dot 3$], [$4 dot 108 = bold(432)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_4^2 = 6$], [$A_2^3 dot A_2^3 dot A_2^1 = 0$ (Không thể xếp 3 học sinh vào 2 phòng)], [$6 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 = $*], 
        [bold(1.872)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(1.872, 8.400) = frac(39, 175) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(39, 175) approx 2228,57 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *2229*.
  ]
)

#tln(
  id: "BT-04",
  [Xếp ngẫu nhiên bốn học sinh lớp A, hai học sinh lớp B vào 5 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [5333],
  loigiai: [
    #reset-step()
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $6$ học sinh vào $5$ phòng gồm cấu trúc sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(2, 1, 1, 1, 1)* \ (1 phòng 2 người)], 
        [$C_5^1 = 5$], 
        [$C_6^2 dot 4!$], 
        [$5 dot 15 dot 24 = bold(1.800)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(1.800)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^4 dot A_M^2 $
    Bảng bù trừ phòng trống:
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(5-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_5^0 = 1$], [$A_5^4 dot A_5^2 = 120 dot 20$], [$1 dot 2400 = bold(2.400)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_5^1 = 5$], [$A_4^4 dot A_4^2 = 24 dot 12$], [$5 dot 288 = bold(1.440)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_5^2 = 10$], [$A_3^4 dot A_3^2 = 0$ (Không thể xếp 4 học sinh vào 3 phòng)], [$10 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 = $*], 
        [bold(960)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(960, 1.800) = frac(8, 15) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(8, 15) approx 5333,33 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *5333*.
  ]
)

#tln(
  id: "BT-05",
  [Xếp ngẫu nhiên ba học sinh lớp A, hai học sinh lớp B, một học sinh lớp C vào 4 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [4615],
  loigiai: [
    #reset-step()
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $6$ học sinh vào $4$ phòng gồm các cấu trúc sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(3, 1, 1, 1)* \ (1 phòng 3 người)], 
        [$C_4^1 = 4$], 
        [$C_6^3 dot 3!$], 
        [$4 dot 20 dot 6 = bold(480)$],
        
        [*(2, 2, 1, 1)* \ (2 phòng 2 người)], 
        [$C_4^2 = 6$], 
        [$C_6^2 dot C_4^2 dot 2!$], 
        [$6 dot 15 dot 6 dot 2 = bold(1.080)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(1.560)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^3 dot A_M^2 dot A_M^1 $
    Bảng bù trừ phòng trống:
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(4-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_4^0 = 1$], [$A_4^3 dot A_4^2 dot A_4^1 = 24 dot 12 dot 4$], [$1 dot 1152 = bold(1.152)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_4^1 = 4$], [$A_3^3 dot A_3^2 dot A_3^1 = 6 dot 6 dot 3$], [$4 dot 108 = bold(432)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_4^2 = 6$], [$A_2^3 dot A_2^2 dot A_2^1 = 0$ (Không thể xếp 3 học sinh vào 2 phòng)], [$6 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 = $*], 
        [bold(720)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(720, 1.560) = frac(6, 13) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(6, 13) approx 4615,38 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *4615*.
  ]
)

#tln(
  id: "BT-06",
  [Xếp ngẫu nhiên bốn học sinh lớp A, bốn học sinh lớp B vào 6 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [2707],
  loigiai: [
    #reset-step()
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $8$ học sinh vào $6$ phòng gồm các cấu trúc sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(3, 1, 1, 1, 1, 1)* \ (1 phòng 3 người)], 
        [$C_6^1 = 6$], 
        [$C_8^3 dot 5!$], 
        [$6 dot 56 dot 120 = bold(40.320)$],
        
        [*(2, 2, 1, 1, 1, 1)* \ (2 phòng 2 người)], 
        [$C_6^2 = 15$], 
        [$C_8^2 dot C_6^2 dot 4!$], 
        [$15 dot 28 dot 15 dot 24 = bold(151.200)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(191.520)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^4 dot A_M^4 = (A_M^4)^2 $
    Bảng bù trừ phòng trống:
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(6-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_6^0 = 1$], [$(A_6^4)^2 = 360^2$], [$1 dot 129600 = bold(129.600)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_6^1 = 6$], [$(A_5^4)^2 = 120^2$], [$6 dot 14400 = bold(86.400)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_6^2 = 15$], [$(A_4^4)^2 = 24^2$], [$15 dot 576 = bold(8.640)$],
        [$3$ phòng ($k=3$)], [$-$], [$C_6^3 = 20$], [$(A_3^4)^2 = 0$ (Không thể xếp 4 học sinh vào 3 phòng)], [$20 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 + V_2 = $*], 
        [bold(51.840)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(51.840, 191.520) = frac(36, 133) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(36, 133) approx 2706,77 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *2707*.
  ]
)

#tln(
  id: "BT-07",
  [Xếp ngẫu nhiên hai học sinh lớp A, hai học sinh lớp B, một học sinh lớp C vào 3 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [5600],
  loigiai: [
    #reset-step()
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $5$ học sinh vào $3$ phòng gồm các cấu trúc sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(3, 1, 1)* \ (1 phòng 3 người)], 
        [$C_3^1 = 3$], 
        [$C_5^3 dot 2!$], 
        [$3 dot 10 dot 2 = bold(60)$],
        
        [*(2, 2, 1)* \ (2 phòng 2 người)], 
        [$C_3^1 = 3$], 
        [$C_5^2 dot C_3^2 dot 1!$], 
        [$3 dot 10 dot 3 dot 1 = bold(90)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(150)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^2 dot A_M^2 dot A_M^1 $
    Bảng bù trừ phòng trống:
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(3-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_3^0 = 1$], [$A_3^2 dot A_3^2 dot A_3^1 = 6 dot 6 dot 3$], [$1 dot 108 = bold(108)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_3^1 = 3$], [$A_2^2 dot A_2^2 dot A_2^1 = 2 dot 2 dot 2$], [$3 dot 8 = bold(24)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_3^2 = 3$], [$A_1^2 dot A_1^2 dot A_1^1 = 0$ (Không thể xếp 2 học sinh vào 1 phòng)], [$3 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 = $*], 
        [bold(84)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(84, 150) = frac(14, 25) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot 0,56 = bold(5600) $
  ]
)

#tln(
  id: "BT-08",
  [Xếp ngẫu nhiên ba học sinh lớp A, một học sinh lớp B, một học sinh lớp C vào 3 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [3600],
  loigiai: [
    #reset-step()
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $5$ học sinh vào $3$ phòng gồm các cấu trúc tương tự Bài tập 7:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(3, 1, 1)* \ (1 phòng 3 người)], 
        [$C_3^1 = 3$], 
        [$C_5^3 dot 2!$], 
        [$3 dot 10 dot 2 = bold(60)$],
        
        [*(2, 2, 1)* \ (2 phòng 2 người)], 
        [$C_3^1 = 3$], 
        [$C_5^2 dot C_3^2 dot 1!$], 
        [$3 dot 10 dot 3 dot 1 = bold(90)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(150)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^3 dot A_M^1 dot A_M^1 $
    Bảng bù trừ phòng trống:
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(3-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_3^0 = 1$], [$A_3^3 dot A_3^1 dot A_3^1 = 6 dot 3 dot 3$], [$1 dot 54 = bold(54)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_3^1 = 3$], [$A_2^3 dot A_2^1 dot A_2^1 = 0$ (Không thể xếp 3 học sinh vào 2 phòng)], [$3 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 = $*], 
        [bold(54)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(54, 150) = frac(9, 25) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot 0,36 = bold(3600) $
  ]
)

#tln(
  id: "BT-09",
  [Xếp ngẫu nhiên hai học sinh lớp A, hai học sinh lớp B, hai học sinh lớp C, một học sinh lớp D vào 4 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [5257],
  loigiai: [
    #reset-step()
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $7$ học sinh vào $4$ phòng gồm các cấu trúc tương tự Ví dụ 3:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(4, 1, 1, 1)* \ (1 phòng 4 người)], 
        [$C_4^1 = 4$], 
        [$C_7^4 dot 3!$], 
        [$4 dot 35 dot 6 = bold(840)$],
        
        [*(3, 2, 1, 1)* \ (Phòng 3 và 2)], 
        [$A_4^2 = 12$], 
        [$C_7^3 dot C_4^2 dot 2!$], 
        [$12 dot 35 dot 6 dot 2 = bold(5.040)$],
        
        [*(2, 2, 2, 1)* \ (3 phòng 2 người)], 
        [$C_4^3 = 4$], 
        [$C_7^2 dot C_5^2 dot C_3^2 dot 1!$], 
        [$4 dot 21 dot 10 dot 3 = bold(2.520)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(8.400)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = (A_M^2)^3 dot A_M^1 $
    Bảng bù trừ phòng trống:
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(4-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_4^0 = 1$], [$(A_4^2)^3 dot A_4^1 = 12^3 dot 4$], [$1 dot 6912 = bold(6.912)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_4^1 = 4$], [$(A_3^2)^3 dot A_3^1 = 6^3 dot 3$], [$4 dot 648 = bold(2.592)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_4^2 = 6$], [$(A_2^2)^3 dot A_2^1 = 2^3 dot 2$], [$6 dot 16 = bold(96)$],
        [$3$ phòng ($k=3$)], [$-$], [$C_4^3 = 4$], [$(A_1^2)^3 dot A_1^1 = 0$ (Không thể xếp 2 học sinh vào 1 phòng)], [$4 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 + V_2 = $*], 
        [bold(4.416)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(4.416, 8.400) = frac(92, 175) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(92, 175) approx 5257,14 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *5257*.
  ]
)

#tln(
  id: "BT-10",
  [Xếp ngẫu nhiên bốn học sinh lớp A, ba học sinh lớp B, hai học sinh lớp C vào 6 phòng học. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp cùng phòng, nếu đã biết mỗi phòng có ít nhất một học sinh. Hãy tính $10^4 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị).],
  [2812],
  loigiai: [
    #reset-step()
    
    #step[Tính số kết quả của không gian mẫu thu hẹp $n(Y)$]
    Phân hoạch $9$ học sinh vào $6$ phòng gồm các cấu trúc tương tự Ví dụ 4:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.8fr, 1fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        table.header([*Cấu trúc*], [*Chọn phòng*], [*Xếp học sinh*], [*Số cách*]),
        [*(4, 1, 1, 1, 1, 1)* \ (1 phòng 4 người)], 
        [$C_6^1 = 6$], 
        [$C_9^4 dot 5!$], 
        [$6 dot 126 dot 120 = bold(90.720)$],
        
        [*(3, 2, 1, 1, 1, 1)* \ (Phòng 3 và 2)], 
        [$A_6^2 = 30$], 
        [$C_9^3 dot C_6^2 dot 4!$], 
        [$30 dot 84 dot 15 dot 24 = bold(907.200)$],
        
        [*(2, 2, 2, 1, 1, 1)* \ (3 phòng 2 người)], 
        [$C_6^3 = 20$], 
        [$C_9^2 dot C_7^2 dot C_5^2 dot 3!$], 
        [$20 dot 36 dot 21 dot 10 dot 6 = bold(907.200)$],
        
        table.cell(colspan: 3, align: right)[*Tổng số cách xếp không để phòng trống $n(Y) = $*], 
        [bold(1.905.120)]
      )
    ]
    
    #step[Tính số cách xếp thuận lợi $n(X inter Y)$ bằng bảng Nguyên lý Bù trừ]
    Số cách xếp học sinh từng lớp vào $M$ phòng học là:
    $ T_M = A_M^4 dot A_M^3 dot A_M^2 $
    Bảng bù trừ phòng trống:
    #align(center)[
      #table(
        columns: (1.2fr, 0.6fr, 0.8fr, 2fr, 1.2fr),
        stroke: 0.5pt + rgb("ccc"),
        inset: 7pt,
        align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        table.header([*Số phòng trống*], [*Dấu*], [*Chọn phòng*], [*Xếp học sinh ($T_(6-k)$)*], [*Giá trị ($V_k$)*]),
        [$0$ phòng ($k=0$)], [$+$], [$C_6^0 = 1$], [$A_6^4 dot A_6^3 dot A_6^2 = 360 dot 120 dot 30$], [$1 dot 1296000 = bold(1.296.000)$],
        [$1$ phòng ($k=1$)], [$-$], [$C_6^1 = 6$], [$A_5^4 dot A_5^3 dot A_5^2 = 120 dot 60 dot 20$], [$6 dot 144000 = bold(864.000)$],
        [$2$ phòng ($k=2$)], [$+$], [$C_6^2 = 15$], [$A_4^4 dot A_4^3 dot A_4^2 = 24 dot 24 dot 12$], [$15 dot 6912 = bold(103.680)$],
        [$3$ phòng ($k=3$)], [$-$], [$C_6^3 = 20$], [$A_3^4 dot A_3^3 dot A_3^2 = 0$ (Không thể xếp 4 học sinh vào 3 phòng)], [$20 dot 0 = bold(0)$],
        table.cell(colspan: 4, align: right)[*Tổng số cách xếp thỏa mãn điều kiện $n(X inter Y) = V_0 - V_1 + V_2 = $*], 
        [bold(535.680)]
      )
    ]
    
    #step[Tính xác suất điều kiện]
    Xác suất cần tìm là:
    $ p = frac(n(X inter Y), n(Y)) = frac(535.680, 1.905.120) = frac(31, 110) $
    Giá trị biểu thức cần tính là:
    $ 10^4 p = 10.000 dot frac(31, 110) approx 2811,79 $
    Làm tròn kết quả đến hàng đơn vị ta thu được đáp án là *2812*.
  ]
)
