#import "../sang-exam.typ": *
#import "../template.typ": *

#set page(paper: "a4", margin: (x: 1.35cm, y: 1.55cm))
#set text(font: "New Computer Modern", size: 10.8pt, lang: "vi")
#set par(justify: true, leading: 0.8em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("061A40"), rgb("0D47A1"), rgb("1976D2"), angle: 135deg),
  inset: (x: 14pt, y: 10pt),
  radius: 7pt,
  above: 1.3em,
  below: 0.9em,
  text(fill: white, size: 13.2pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1em,
  below: 0.45em,
  stroke: (left: 4pt + rgb("1565C0")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("0D47A1"), size: 11.3pt, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 0.8em,
  below: 0.35em,
  text(fill: rgb("283593"), size: 10.8pt, weight: "bold", "• " + it.body),
)

#let navy = rgb("0D47A1")
#let blue = rgb("1E88E5")
#let green = rgb("2E7D32")
#let amber = rgb("EF6C00")
#let violet = rgb("6A1B9A")

#let note-box(title, body, fill: rgb("F5F9FF"), stroke-color: navy) = block(
  fill: fill,
  stroke: (left: 4pt + stroke-color, rest: 0.45pt + rgb("CFD8DC")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: stroke-color, weight: "bold")[#title]
  #v(0.24em)
  #body
]

#let case-chip(label, fill-color, text-color: white) = box(
  fill: fill-color,
  inset: (x: 8pt, y: 3pt),
  radius: 999pt,
  text(fill: text-color, weight: "bold", size: 9pt, label),
)

#let sample-box(title, color, body) = block(
  fill: color.lighten(85%),
  stroke: (left: 4pt + color, rest: 0.45pt + color.lighten(55%)),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: color, weight: "bold")[#title]
  #v(0.24em)
  #body
]

#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("031127"), rgb("0A2F73"), rgb("1565C0"), rgb("42A5F5"), angle: 135deg),
    radius: 12pt,
    inset: (x: 18pt, y: 20pt),
  )[
    #text(fill: rgb("BBDEFB"), size: 10.5pt, weight: "bold", tracking: 2pt)[BẢN ÔN NHANH 4 CASE]
    #v(0.35em)
    #text(fill: white, size: 20pt, weight: "bold")[Phân Phối Vật Vào Hộp Trong 30 Giây Nhận Diện]
    #v(0.3em)
    #text(fill: rgb("E3F2FD"), size: 11.5pt)[Dùng trước giờ kiểm tra hoặc trước khi làm bộ đề luyện]
  ]
]

#v(0.7em)

#note-box([Mục tiêu của tờ ôn này], [
  Tờ này không thay chuyên đề dài. Nó chỉ giữ lại đúng những thứ cần nhớ khi gặp đề tuyển sinh lớp $12$:

  - nhìn đề và chốt case trong vài giây,
  - gắn đúng công cụ OGF, EGF hoặc Euler,
  - tránh các lỗi nhầm tên hộp và nhầm tính vô danh của nhóm.
])

= I. Ma Trận Nhận Diện 4 Case

#table(
  columns: (0.9fr, 1.5fr, 1.55fr, 1.25fr, 1.8fr),
  inset: (x: 7pt, y: 6pt),
  stroke: 0.45pt + navy,
  fill: (col, row) => if row == 0 { rgb("E3F2FD") } else if calc.rem(row, 2) == 1 { rgb("FAFCFF") } else { white },
  table.header([*Case*], [*Vật*], [*Hộp / nhóm*], [*Công cụ chốt*], [*Dấu hiệu đọc đề*]),
  [#case-chip([Case 1], blue)],
  [Phân biệt],
  [Phân biệt],
  [Đếm trực tiếp, nguyên lý bù, đôi khi EGF],
  [Mỗi vật “chọn một hộp có tên”.],

  [#case-chip([Case 2], green)],
  [Giống nhau],
  [Phân biệt],
  [OGF theo từng hộp],
  [Điều kiện gắn vào từng hộp: không âm, ít nhất, chẵn, lẻ, tối đa, bội số.],

  [#case-chip([Case 3], violet)],
  [Phân biệt],
  [Giống nhau],
  [EGF, Stirling],
  [Chia người có tên thành các nhóm vô danh.],

  [#case-chip([Case 4], amber)],
  [Giống nhau],
  [Giống nhau],
  [Tích Euler, phân hoạch số],
  [Chỉ còn đếm các dạng kích thước hộp, không quan tâm tên.],
)

#note-box([Mẹo chốt case thật nhanh], [
  - Nếu đề hỏi “học sinh A, B, C vào lớp nào / phòng nào / tổ nào” thì gần như chắc là *Case 1*.

  - Nếu đề hỏi “$n$ viên bi giống nhau vào các hộp $1, 2, 3$” thì là *Case 2* vì hộp còn tên.

  - Nếu đề hỏi “chia $n$ học sinh thành $k$ nhóm” mà không đặt tên nhóm thì là *Case 3*.

  - Nếu đề hỏi “có bao nhiêu kiểu viết $n$ thành tổng...” thì gần như đi vào *Case 4*.
])

= II. Từ Điển Hàm Sinh Cần Nhớ

== 1. OGF cho Case 2

#table(
  columns: (2.25fr, 1.45fr, 2.2fr),
  inset: (x: 7pt, y: 6pt),
  stroke: 0.45pt + green,
  fill: (col, row) => if row == 0 { rgb("E8F5E9") } else if calc.rem(row, 2) == 1 { rgb("FBFFFC") } else { white },
  table.header([*Điều kiện của một hộp*], [*OGF*], [*Ý nghĩa*]),
  [Không hạn chế], [$frac(1, 1 - x)$], [Nhận $0, 1, 2, ...$ vật.],
  [Ít nhất $r$ vật], [$frac(x^r, 1 - x)$], [Đặt sẵn $r$ vật trước.],
  [Nhiều nhất $r$ vật], [$1 + x + x^2 + ... + x^r$], [Chặn trên hữu hạn.],
  [Số vật chẵn], [$frac(1, 1 - x^2)$], [Chỉ giữ các mũ chẵn.],
  [Số vật lẻ], [$frac(x, 1 - x^2)$], [Bắt buộc có dạng $2k + 1$.],
  [Bội của $k$], [$frac(1, 1 - x^k)$], [Chỉ nhận $0, k, 2k, ...$ vật.],
)

== 2. EGF cho Case 3

#table(
  columns: (2.3fr, 1.55fr, 2.05fr),
  inset: (x: 7pt, y: 6pt),
  stroke: 0.45pt + violet,
  fill: (col, row) => if row == 0 { rgb("F3E5F5") } else if calc.rem(row, 2) == 1 { rgb("FEFBFF") } else { white },
  table.header([*Loại nhóm*], [*EGF*], [*Ghi nhớ*]),
  [Một nhóm không rỗng], [$e^x - 1$], [Nhóm có thể nhận $1, 2, 3, ...$ người.],
  [Một nhóm có thể rỗng], [$e^x$], [Có hoặc không có người đều được.],
  [Một nhóm có ít nhất $2$ người], [$e^x - 1 - x$], [Loại riêng trường hợp rỗng và singleton.],
  [Đúng $k$ nhóm vô danh không rỗng (Case 3)], [$frac((e^x - 1)^k, k!)$], [Chia cho $k!$ vì nhóm vô danh (hộp giống nhau).],
  [Đúng $k$ nhóm có tên không rỗng (Case 1)], [$(e^x - 1)^k$], [Không chia cho $k!$ vì nhóm có tên (hộp phân biệt).],
  [Nhiều nhất $k$ nhóm], [$sum_(j=1)^k frac((e^x - 1)^j, j!)$], [Cộng đủ các trường hợp từ $1$ đến $k$ nhóm.],
)

== 3. Euler cho Case 4

#note-box(
  [Bốn công thức chốt],
  [
    - Không quá $m$ phần:
      $product_(j=1)^m frac(1, 1 - x^j).$

    - Đúng $m$ phần dương:
      $x^m product_(j=1)^m frac(1, 1 - x^j).$

    - Chỉ dùng các phần lẻ:
      $product_(j >= 1) frac(1, 1 - x^(2j - 1)).$

    - Chỉ dùng các phần phân biệt:
      $product_(j >= 1) (1 + x^j).$
  ],
  fill: rgb("FFF8E1"),
  stroke-color: amber,
)

#note-box(
  [Định lý Euler phải thuộc],
  [
    Số phân hoạch của $n$ thành các phần lẻ *bằng* số phân hoạch của $n$ thành các phần phân biệt.

    Đây là cây cầu rất mạnh để đổi một bài đếm khó sang một bài liệt kê dễ hơn.
  ],
  fill: rgb("FFF3E0"),
  stroke-color: amber,
)

= III. Bốn Bài Mẫu Chuẩn

== 1. Mẫu cho Case 1

#sample-box([Case 1 mẫu: 5 học sinh vào 3 phòng, mỗi phòng không rỗng], blue, [
  *Cách 1 (Bù trừ):* $3^5 - C_3^1 2^5 + C_3^2 dot 1^5 = 243 - 96 + 3 = 150$ cách.
  
  *Cách 2 (Hành trình EGF - không chia $3!$):*
  EGF của mỗi phòng là $e^x - 1$. Vì 3 phòng phân biệt nên EGF tổng là:
  $E(x) = (e^x - 1)^3 = e^(3x) - 3e^(2x) + 3e^x - 1.$
  Số cách: $5! [x^5] E(x) = 3^5 - 3 dot 2^5 + 3 = 243 - 96 + 3 = 150$ cách.
  
  *Ý tưởng cần nhớ:* Hộp có tên $\to$ dùng EGF nhân trực tiếp hoặc bù trừ độc lập.
])

== 2. Mẫu cho Case 2

#sample-box([Case 2 mẫu: 7 kẹo giống nhau vào 3 hộp, mỗi hộp ít nhất 1, hộp 1 nhiều nhất 3], green, [
  OGF của ba hộp là
  $(x + x^2 + x^3) lr(frac(x, 1 - x))^2.$

  Số cách là hệ số của $x^7$:
  $[x^7] frac(x^3 (1 + x + x^2), (1 - x)^2).$

  Do $[x^m] (1 - x)^(-2) = m + 1$, ta được
  $5 + 4 + 3 = 12.$

  Ý tưởng cần nhớ: *điều kiện nằm trên từng hộp* thì viết nhân tử của từng hộp rồi nhân lại.
])

== 3. Mẫu cho Case 3

#sample-box([Case 3 mẫu: 6 học sinh thành đúng 3 nhóm vô danh], violet, [
  EGF chuẩn (phải chia $3!$ để khử nhãn hộp):
  $Phi_3(x) = frac((e^x - 1)^3, 3!).$

  Số cách bằng:
  $N = 6! [x^6] frac((e^x - 1)^3, 3!) = frac(3^6 - 3 dot 2^6 + 3, 6) = 90$ cách.

  *Mối liên hệ:* Kết quả $90$ này bằng đúng kết quả của bài toán chia 6 học sinh vào 3 phòng phân biệt không trống (Case 1) chia cho $3!$ (tức là $540 / 6 = 90$).
  
  *Ý tưởng cần nhớ:* Vật có tên nhưng nhóm vô danh $\to$ EGF chia $k!$ hoặc Stirling.
])

== 4. Mẫu cho Case 4

#sample-box([Case 4 mẫu: 9 thành đúng 4 phần dương], amber, [
  Đúng $4$ phần dương có OGF
  $x^4 product_(j=1)^4 frac(1, 1 - x^j).$

  Ta cần hệ số của $x^9$, tức là hệ số của $x^5$ trong
  $product_(j=1)^4 frac(1, 1 - x^j).$

  Bài toán quy về đếm nghiệm của
  $a + 2 b + 3 c + 4 d = 5.$

  Kết quả là $6$ kiểu chia.

  Ý tưởng cần nhớ: *không có tên hộp* nên ta chỉ đếm các dạng kích thước.
])

= IV. Bẫy Sai Rất Thường Gặp

#note-box(
  [Năm lỗi học sinh hay mắc],
  [
    1. Thấy “nhóm” nhưng vẫn dùng $k^n$ như thể nhóm có tên. Sai ở bản chất vô danh.

    2. Thấy “mỗi hộp không rỗng” rồi làm tổng quát trước, trừ sau nhưng quên cộng lại giao của hai biến cố trống.

    3. Với Case $2$, viết OGF thiếu nhân tử dịch $x^r$ khi đề nói “ít nhất $r$”.

    4. Với Case $4$, nhầm “đúng $m$ phần” với “không quá $m$ phần”. Hai công thức khác nhau ở nhân tử $x^m$.

    5. Dùng định lý Euler không đúng chỗ. Euler chỉ nối “phần lẻ” với “phần phân biệt”, không nối mọi ràng buộc khác.
  ],
  fill: rgb("FFF8E1"),
  stroke-color: amber,
)

= V. Checklist 30 Giây Trước Khi Bấm Bút

#table(
  columns: (0.65fr, 3.45fr),
  inset: (x: 7pt, y: 6pt),
  stroke: 0.45pt + navy,
  fill: (col, row) => if row == 0 { rgb("E8EAF6") } else if calc.rem(row, 2) == 1 { rgb("FAFCFF") } else { white },
  table.header([*Bước*], [*Câu hỏi phải tự trả lời*]),
  [1], [Vật có tên hay giống nhau?],
  [2], [Hộp hoặc nhóm có tên hay vô danh?],
  [3], [Điều kiện nằm trên từng hộp, trên số nhóm, hay trên dạng phân hoạch?],
  [4], [Nếu là Case 2 thì viết OGF từng hộp được chưa?],
  [5], [Nếu là Case 3 thì đã chia cho $k!$ khi nhóm vô danh chưa?],
  [6], [Nếu là Case 4 thì đang đếm “đúng $m$ phần” hay “không quá $m$ phần”?],
)

#note-box(
  [Chốt cuối cùng],
  [
    Nếu đọc đề xong mà bạn còn phân vân giữa hai case, đừng tính ngay. Hãy viết ra hai dòng ngắn:

    - “có tên / không có tên” cho *vật*,
    - “có tên / không có tên” cho *hộp hoặc nhóm*.

    Chỉ cần hai dòng đó, phần lớn nhầm lẫn sẽ tự biến mất.
  ],
  fill: rgb("EEF7FF"),
  stroke-color: blue,
)
