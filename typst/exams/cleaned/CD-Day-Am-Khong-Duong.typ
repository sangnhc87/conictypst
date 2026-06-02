#import "../../math-sym.typ": *
#import "../../sang-exam.typ": *
#import "../../template.typ": *

// ═══════════════════════════════════════════════════════════
// CD-Day-Am-Khong-Duong.typ
// Chuyên đề: Dãy Âm-Không-Dương | a_i in {-1, 0, 1} | Tổng Theo Nhóm
// Phong cách: Typst-native · Sư phạm từng bước · Dự đoán đề thi
// ═══════════════════════════════════════════════════════════

#set page(paper: "a4", margin: (x: 1.55cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.92em)
#set list(indent: 1em, body-indent: 0.55em)
#set enum(indent: 0.8em, body-indent: 0.55em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("102A43"), rgb("1E3A8A"), rgb("2563EB"), angle: 135deg),
  stroke: none,
  inset: (x: 16pt, y: 11pt),
  radius: 8pt,
  above: 1.9em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.45em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("1E3A8A")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("1E3A8A"), size: 12pt, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 1.15em,
  below: 0.45em,
  text(fill: rgb("0F766E"), size: 11pt, weight: "bold", "▸ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show math.equation: set text(fill: black)
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let c-navy = rgb("1E3A8A")
#let c-teal = rgb("0F766E")
#let c-amber = rgb("C2410C")
#let c-violet = rgb("6D28D9")
#let c-green = rgb("15803D")
#let c-red = rgb("B91C1C")
#let c-slate = rgb("475569")

#let eg-box(title: "🎯 Ví dụ", body) = block(
  fill: rgb("ECFDF5"),
  stroke: (left: 4pt + c-green, rest: 0.7pt + rgb("A7F3D0")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let key-box(body) = block(
  fill: rgb("F5F3FF"),
  stroke: (left: 4pt + c-violet, rest: 0.7pt + rgb("DDD6FE")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-violet, weight: "bold")[🔑 Ý tưởng then chốt]
  #v(0.3em)
  #body
]

#let insight-box(title: "💡 Trực giác sư phạm", body) = block(
  fill: rgb("ECFEFF"),
  stroke: (left: 4pt + c-teal, rest: 0.7pt + rgb("A5F3FC")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-teal, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let cach1-box(body) = block(
  fill: rgb("EFF6FF"),
  stroke: (left: 4pt + rgb("2563EB"), rest: 0.7pt + rgb("BFDBFE")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("2563EB"), weight: "bold")[🧭 Cách nhìn trực tiếp từ số lượng +1 và -1]
  #v(0.3em)
  #body
]

#let theory-box(body) = block(
  fill: rgb("EFF6FF"),
  stroke: (left: 4pt + c-navy, rest: 0.8pt + rgb("BFDBFE")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

#let compare-box(title: "📊 Bảng kiểm tra", body) = block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-teal, rest: 0.6pt + rgb("CBD5E1")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-teal, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let step-box(n, title, body) = block(
  fill: white,
  stroke: (left: 4pt + c-navy, rest: 0.6pt + rgb("DBEAFE")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.8em,
    circle(radius: 10pt, fill: c-navy)[
      #text(fill: white, weight: "bold", size: 10.5pt)[#n]
    ],
    [
      #text(fill: c-navy, weight: "bold")[#title]
      #v(0.18em)
      #body
    ],
  )
]

#let ans-box(body) = block(
  fill: rgb("F0FDF4"),
  stroke: (left: 4pt + c-green, rest: 0.7pt + rgb("BBF7D0")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[✅ Kết luận]
  #v(0.3em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FEF2F2"),
  stroke: (left: 4pt + c-red, rest: 0.7pt + rgb("FECACA")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-red, weight: "bold")[⚠️ Lỗi sai thường gặp]
  #v(0.3em)
  #body
]

#let note-box(title: "📌 Ghi chú nâng cao", body) = block(
  fill: rgb("FFF7ED"),
  stroke: (left: 4pt + c-amber, rest: 0.7pt + rgb("FED7AA")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let loigiai-box(body) = block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-slate, rest: 0.7pt + rgb("CBD5E1")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-slate, weight: "bold")[📝 Lời giải chi tiết]
  #v(0.3em)
  #body
]

#let qopen(body) = block(
  fill: rgb("FAF5FF"),
  stroke: (left: 3pt + c-violet, rest: 0.6pt + rgb("E9D5FF")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: c-violet, weight: "bold", size: 9.5pt)[❓ Bài tập tự luyện]
  #v(0.22em)
  #body
]

#let activity-box(title: "🎓 Gợi ý thảo luận", body) = block(
  fill: rgb("FFFBEB"),
  stroke: (left: 4pt + rgb("D97706"), rest: 0.7pt + rgb("FDE68A")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("B45309"), weight: "bold")[#title]
  #v(0.3em)
  #body
]

#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0B1120"), rgb("102A43"), rgb("1E3A8A"), angle: 140deg),
    inset: (x: 1.8cm, y: 1.35cm),
    radius: 12pt,
  )[
    #text(fill: rgb("BFDBFE"), size: 10.5pt, weight: "bold")[CHUYÊN ĐỀ TỔ HỢP ĐẾM VÀ XÁC SUẤT]
    #v(0.45em)
    #text(fill: white, size: 24pt, weight: "black")[Dãy Âm - Không - Dương Theo Nhóm]
    #v(0.2em)
    #text(fill: rgb("DBEAFE"), size: 12pt)[Đếm bằng số phần tử +1 và -1, không liệt kê dãy thô]
  ]
]

#v(0.9em)

#key-box[
  *Lõi của chuyên đề này:* Khi mỗi phần tử chỉ nhận ba giá trị $-1$, $0$, $1$ và đề bài ràng buộc *tổng*, ta không nên nghĩ theo từng dãy cụ thể. Ta nên nghĩ theo hai con số:

  - Có bao nhiêu vị trí mang $+1$?
  - Có bao nhiêu vị trí mang $-1$?

  Từ đó xuất hiện hai hàm đếm quan trọng:

  #align(center)[
    $S(n) = sum_(k=0)^floor(n/2) C(n, 2k) cdot C(2k, k)$
  ]

  #align(center)[
    $T(n, s) = sum_(q=0)^floor((n-s)/2) C(n, q + s) cdot C(n - q - s, q)$
  ]

  Trong đó:

  - $S(n)$ là số dãy độ dài $n$ có tổng bằng $0$.
  - $T(n, s)$ là số dãy độ dài $n$ có tổng bằng $s$, với $s geq 0$.

  *Ký hiệu thống nhất trong tài liệu:* ta dùng $C(n, k)$ để biểu diễn tổ hợp theo đúng thói quen trình bày phổ thông Việt Nam.

  *Ghi nhớ nhanh:* $T(n, 0) = S(n)$ và $T(n, -s) = T(n, s)$ do đối xứng đổi dấu.
]

= Mở Bài Sư Phạm — Thử Với 4 Vị Trí

#eg-box(title: "🎯 Bài mở đầu rất nhỏ")[
  Xét các dãy $(a_1, a_2, a_3, a_4)$, trong đó mỗi phần tử chỉ nhận một trong ba giá trị $-1$, $0$, $1$.

  Hỏi có bao nhiêu dãy có tổng bằng $0$?
]

#insight-box[
  Đây là điểm mở bài nên dùng trên lớp. Với $n = 4$, học sinh còn đủ sức tự kiểm bằng tay. Sau đó giáo viên mới tổng quát hóa thành công thức.
]

#step-box(1, "Không đếm theo dãy, đếm theo số phần tử khác 0")[
  Nếu tổng bằng $0$ thì số phần tử $+1$ phải bằng số phần tử $-1$.

  Gọi số cặp đó là $k$. Khi $n = 4$, ta chỉ có ba khả năng:

  - $k = 0$: cả 4 vị trí đều bằng $0$.
  - $k = 1$: có đúng 1 số $+1$ và 1 số $-1$.
  - $k = 2$: có đúng 2 số $+1$ và 2 số $-1$.
]

#compare-box(title: "📊 Bảng đếm với n = 4")[
  #table(
    columns: (auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[k],
    text(fill: white, weight: "bold")[Chọn vị trí khác 0],
    text(fill: white, weight: "bold")[Chia thành +1 và -1],
    text(fill: white, weight: "bold")[Số dãy],

    [$0$], [$1$], [$1$], [$1$],
    [$1$], [$C(4, 2) = 6$], [$C(2, 1) = 2$], [$12$],
    [$2$], [$C(4, 4) = 1$], [$C(4, 2) = 6$], [$6$],
  )

  #v(0.35em)
  Vậy có tất cả $1 + 12 + 6 = 19$ dãy, tức là $S(4) = 19$.
]

#ans-box[
  Bài mở đầu này cho thấy đúng cấu trúc của công thức tổng quát:

  #align(center)[$S(n) = sum_(k=0)^floor(n/2) C(n, 2k) cdot C(2k, k)$]

  Nghĩa là: chọn ra $2k$ vị trí không bằng $0$, rồi trong số đó chọn $k$ vị trí cho $+1$.
]

#pagebreak()
= I. Bài Toán Gốc — Dạng Olympic Chuẩn

#eg-box(title: "🎯 Bài toán gốc — n = 18, tách vị trí lẻ/chẵn")[
  Xét tất cả các dãy $(a_1, a_2, ldots, a_18)$, trong đó mỗi phần tử nhận một trong ba giá trị $-1$, $0$, $1$, thỏa mãn đồng thời ba điều kiện:

  #enum(
    [Phần tử đầu tiên thỏa $a_1 neq 0$.],
    [Tổng các phần tử ở vị trí lẻ bằng $0$.],
    [Tổng các phần tử ở vị trí chẵn bằng $0$.],
  )

  Gọi $p$ là xác suất chọn ngẫu nhiên một dãy từ tập tất cả các dãy độ dài $18$ thỏa ba điều kiện trên.

  Tính giá trị của
  #align(center)[$frac(3^18 p, 688)$]
]

#insight-box[
  *Điểm cốt lõi của bài này:* đề nhìn như một bài xác suất, nhưng trái tim của nó là một bài đếm theo *hai nhóm vị trí độc lập*. Muốn giải gọn, phải tách nhóm lẻ và nhóm chẵn ra trước.
]

#insight-box(title: "💬 Ba câu nên hỏi học sinh trước khi giải")[
  - Nhóm vị trí lẻ và nhóm vị trí chẵn có ảnh hưởng lẫn nhau không?
  - Điều kiện $a_1 neq 0$ thuộc về nhóm nào?
  - Nếu mỗi nhóm đếm được riêng, ta phải *cộng* hay *nhân* số cách?
]

== 1.1 Tách Bài Toán Thành Hai Nhóm Độc Lập

#cach1-box[
  Dãy độ dài $18$ tách thành hai nhóm:

  - Nhóm lẻ $L$: các vị trí $1, 3, 5, 7, 9, 11, 13, 15, 17$, tổng cộng $9$ phần tử.
  - Nhóm chẵn $C$: các vị trí $2, 4, 6, 8, 10, 12, 14, 16, 18$, tổng cộng $9$ phần tử.

  Điều kiện của đề trở thành:

  - Nhóm $L$ có tổng bằng $0$ và còn thêm ràng buộc $a_1 neq 0$.
  - Nhóm $C$ có tổng bằng $0$ và không có ràng buộc thêm.

  Vì hai nhóm là độc lập, số dãy cần đếm là
  #align(center)[$N = |L| cdot |C|$]
]

== 1.2 Đếm Nhóm Chẵn C

#step-box(1, "Nhóm chẵn chỉ là bài S(9)")[
  Nhóm chẵn có $9$ vị trí. Ta cần đếm số dãy độ dài $9$ có tổng bằng $0$.

  Do đó
  #align(center)[$|C| = S(9)$]
]

#loigiai-box[
  Để tổng bằng $0$, số phần tử $+1$ và $-1$ phải bằng nhau. Gọi số đó là $p$.

  Vì dãy có $9$ phần tử nên $2p leq 9$, tức $p$ chạy từ $0$ đến $4$.

  #align(center)[$S(9) = sum_(p=0)^4 C(9, 2p) cdot C(2p, p)$]

  #table(
    columns: (auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("334155") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[p],
    text(fill: white, weight: "bold")[$C(9, 2p)$],
    text(fill: white, weight: "bold")[$C(2p, p)$],
    text(fill: white, weight: "bold")[Tích],

    [$0$], [$1$], [$1$], [$1$],
    [$1$], [$36$], [$2$], [$72$],
    [$2$], [$126$], [$6$], [$756$],
    [$3$], [$84$], [$20$], [$1680$],
    [$4$], [$9$], [$70$], [$630$],
  )

  Suy ra
  #align(center)[$S(9) = 1 + 72 + 756 + 1680 + 630 = 3139$]

  Vậy $|C| = 3139$.
]

== 1.3 Đếm Nhóm Lẻ L Với Điều Kiện a_1 neq 0

#step-box(2, "Có hai cách đếm đều nên biết")[
  Nhóm lẻ cũng có $9$ vị trí, nhưng lần này còn thêm điều kiện $a_1 neq 0$.

  Đây là chỗ rất hợp để dạy học sinh hai cách đếm:

  - Cách bù trừ: lấy tất cả rồi trừ trường hợp $a_1 = 0$.
  - Cách cố định giá trị của $a_1$: tách $a_1 = 1$ và $a_1 = -1$.
]

#cach1-box[
  *Cách 1. Bù trừ.*

  Nếu bỏ điều kiện $a_1 neq 0$ thì có $S(9)$ dãy.

  Nếu $a_1 = 0$ thì $8$ phần tử còn lại vẫn phải có tổng bằng $0$, nên có $S(8)$ dãy.

  Vì vậy
  #align(center)[$|L| = S(9) - S(8)$]
]

#cach1-box[
  *Cách 2. Cố định a_1.*

  - Nếu $a_1 = 1$ thì $8$ phần tử còn lại phải có tổng bằng $-1$, số cách là $T(8, -1) = T(8, 1)$.
  - Nếu $a_1 = -1$ thì $8$ phần tử còn lại phải có tổng bằng $1$, số cách là $T(8, 1)$.

  Do đó
  #align(center)[$|L| = 2 cdot T(8, 1)$]
]

#compare-box(title: "📊 Tính T(8, 1) bằng bảng")[
  Với dãy độ dài $8$ có tổng bằng $1$, đặt:

  - $p$ là số phần tử $+1$,
  - $q$ là số phần tử $-1$.

  Khi đó $p - q = 1$, tức là $p = q + 1$.

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[q],
    text(fill: white, weight: "bold")[p = q + 1],
    text(fill: white, weight: "bold")[$C(8, p)$],
    text(fill: white, weight: "bold")[$C(8 - p, q)$],
    text(fill: white, weight: "bold")[Tích],

    [$0$], [$1$], [$8$], [$1$], [$8$],
    [$1$], [$2$], [$28$], [$6$], [$168$],
    [$2$], [$3$], [$56$], [$10$], [$560$],
    [$3$], [$4$], [$70$], [$4$], [$280$],
  )

  Vậy
  #align(center)[$T(8, 1) = 8 + 168 + 560 + 280 = 1016$]
]

#loigiai-box[
  Từ bảng giá trị chuẩn, $S(8) = 1107$.

  Do đó
  #align(center)[$|L| = S(9) - S(8) = 3139 - 1107 = 2032$]

  Mặt khác,
  #align(center)[$2 cdot T(8, 1) = 2 cdot 1016 = 2032$]

  Hai cách cho cùng một kết quả, nên phép đếm là nhất quán.
]

== 1.4 Tổng Hợp Kết Quả Bài Gốc

#step-box(3, "Nhân hai kết quả rồi quay về xác suất")[
  Ta đã có:

  - $|L| = 2032$
  - $|C| = 3139$

  Vì vậy
  #align(center)[$N = 2032 cdot 3139 = 6378448$]

  Không gian mẫu có $3^18$ dãy, nên
  #align(center)[$p = frac(6378448, 3^18)$]
]

#ans-box[
  Suy ra
  #align(center)[$frac(3^18 p, 688) = frac(6378448, 688) = 9271$]

  Nên đáp số cuối cùng là
  #align(center)[$boxed(9271)$]
]

#warn-box[
  *Sai lầm hay gặp nhất:* đếm nhầm $T(8, 1)$.

  Có tài liệu ghi sai thành $688$ do lẫn công thức của hệ số nhị thức với hệ số tam thức. Giá trị đúng là $T(8, 1) = 1016$.

  Một cách tự kiểm tra rất tốt là dùng đẳng thức
  #align(center)[$S(9) - S(8) = 2 cdot T(8, 1)$]

  Nếu ba số này không khớp nhau thì chắc chắn ở đâu đó đã tính sai.
]

#pagebreak()
= II. Hai Công Thức Cốt Lõi — Giải Thích Từ Dễ Đến Khó

== 2.1 Công Thức S(n) Cho Tổng Bằng 0

#theory-box[
  *Mệnh đề:* Số dãy độ dài $n$ có tổng bằng $0$ là

  #align(center)[$S(n) = sum_(k=0)^floor(n/2) C(n, 2k) cdot C(2k, k)$]
]

#cach1-box[
  *Giải thích theo ngôn ngữ học sinh phổ thông:*

  Muốn tổng bằng $0$ thì số lượng $+1$ và $-1$ phải bằng nhau. Gọi mỗi loại có đúng $k$ phần tử.

  Khi đó:

  - Tổng số vị trí khác $0$ là $2k$.
  - Ta chọn $2k$ vị trí trong $n$ vị trí: có $C(n, 2k)$ cách.
  - Trong $2k$ vị trí đã chọn, ta chọn tiếp $k$ vị trí để đặt $+1$: có $C(2k, k)$ cách.

  Lấy tổng theo mọi giá trị $k$ khả dĩ, ta thu được công thức của $S(n)$.
]

#eg-box(title: "Ví dụ rất nhanh với n = 6")[
  #align(
    center,
  )[$S(6) = C(6, 0) C(0, 0) + C(6, 2) C(2, 1) + C(6, 4) C(4, 2) + C(6, 6) C(6, 3)$]

  #align(center)[$S(6) = 1 + 15 cdot 2 + 15 cdot 6 + 1 cdot 20 = 141$]
]

#insight-box[
  *Điểm giáo viên nên chốt:* công thức $S(n)$ thực ra không hề "thần bí". Nó chỉ là một bản ghi gọn của thao tác: *chọn chỗ cho các số khác 0, rồi chia đều chúng thành hai nửa +1 và -1*.
]

== 2.2 Công Thức T(n, s) Cho Tổng Bằng s

#theory-box[
  Với $s geq 0$, số dãy độ dài $n$ có tổng bằng $s$ là

  #align(center)[$T(n, s) = sum_(q=0)^floor((n-s)/2) C(n, q + s) cdot C(n - q - s, q)$]
]

#cach1-box[
  Đặt:

  - $p$ là số phần tử $+1$,
  - $q$ là số phần tử $-1$.

  Điều kiện tổng bằng $s$ cho ta
  #align(center)[$p - q = s$]

  nên
  #align(center)[$p = q + s$]

  Với mỗi $q$:

  - Chọn $p = q + s$ vị trí cho $+1$.
  - Chọn tiếp $q$ vị trí trong phần còn lại cho $-1$.

  Đó chính là lý do xuất hiện tích
  #align(center)[$C(n, q + s) cdot C(n - q - s, q)$]
]

#eg-box(title: "Ví dụ nhanh với T(6, 2)")[
  Ta có $p - q = 2$, tức là $p = q + 2$.

  Khi $n = 6$, giá trị $q$ chạy từ $0$ đến $2$.

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("0F766E") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[q],
    text(fill: white, weight: "bold")[p = q + 2],
    text(fill: white, weight: "bold")[$C(6, p)$],
    text(fill: white, weight: "bold")[$C(6 - p, q)$],
    text(fill: white, weight: "bold")[Tích],

    [$0$], [$2$], [$15$], [$1$], [$15$],
    [$1$], [$3$], [$20$], [$3$], [$60$],
    [$2$], [$4$], [$15$], [$1$], [$15$],
  )

  Vậy
  #align(center)[$T(6, 2) = 15 + 60 + 15 = 90$]
]

#insight-box[
  *Hai điều nên nhớ rất nhanh:*

  - $T(n, 0) = S(n)$.
  - $T(n, -s) = T(n, s)$ vì nếu đổi dấu mọi phần tử thì tổng $s$ biến thành $-s$.
]

== 2.3 Truy Hồi Và Cách Tự Kiểm Nhanh

#theory-box[
  Một đẳng thức rất hữu ích là
  #align(center)[$S(n) = S(n - 1) + 2 cdot T(n - 1, 1)$]
]

#cach1-box[
  Giải thích bằng cách tách theo giá trị cuối $a_n$:

  - Nếu $a_n = 0$ thì $n - 1$ phần tử đầu phải có tổng $0$: có $S(n - 1)$ cách.
  - Nếu $a_n = 1$ thì $n - 1$ phần tử đầu phải có tổng $-1$: có $T(n - 1, 1)$ cách.
  - Nếu $a_n = -1$ thì $n - 1$ phần tử đầu phải có tổng $1$: cũng có $T(n - 1, 1)$ cách.

  Cộng ba trường hợp lại được truy hồi trên.
]

#note-box(title: "📌 Phần chuyên sâu nhưng nên đọc sau")[
  Nếu học sinh đã vững, ta có thể nói thêm về hàm sinh:

  #align(center)[$sum_(a_1, ldots, a_n in {-1, 0, 1}) z^(a_1 + cdots + a_n) = (z^(-1) + 1 + z)^n$]

  Khi đó $S(n)$ là hệ số của $z^0$, còn $T(n, s)$ là hệ số của $z^s$.

  Phần này đẹp về lý thuyết, nhưng không nên dùng làm điểm mở đầu với lớp còn yếu.
]

#pagebreak()
= III. Bảng Giá Trị Tham Khảo

#theory-box[
  *Bảng dùng nhanh khi ôn tập:*

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[n],
    text(fill: white, weight: "bold")[S(n)],
    text(fill: white, weight: "bold")[T(n, 1)],
    text(fill: white, weight: "bold")[3^n],
    text(fill: white, weight: "bold")[S(n) / 3^n],

    [$0$], [$1$], [--], [$1$], [$1.000$],
    [$1$], [$1$], [$1$], [$3$], [$0.333$],
    [$2$], [$3$], [$2$], [$9$], [$0.333$],
    [$3$], [$7$], [$6$], [$27$], [$0.259$],
    [$4$], [$19$], [$16$], [$81$], [$0.235$],
    [$5$], [$51$], [$45$], [$243$], [$0.210$],
    [$6$], [$141$], [$126$], [$729$], [$0.193$],
    [$7$], [$393$], [$357$], [$2187$], [$0.180$],
    [$8$], [$1107$], [$1016$], [$6561$], [$0.169$],
    [$9$], [$3139$], [$2907$], [$19683$], [$0.160$],
    [$10$], [$8953$], [$8350$], [$59049$], [$0.152$],
    [$12$], [$73789$], [--], [$531441$], [$0.139$],
    [$14$], [$616227$], [--], [$4782969$], [$0.129$],
    [$15$], [$1787607$], [$1704510$], [$14348907$], [$0.125$],
    [$16$], [$5196627$], [--], [$43046721$], [$0.121$],
  )
]

#insight-box[
  *Cách dùng bảng này:* Khi ôn đề thi, nhiều bài không cần tính lại từ đầu. Chỉ cần nhận đúng dạng rồi tra $S(n)$, $T(n, 1)$ hoặc chênh lệch $S(n) - S(n - 1)$ là đủ.
]

#pagebreak()
= IV. Bảy Biến Thể Chuẩn Hay Gặp

== B1. Một Nhóm, Tổng Bằng 0, Có Điều Kiện a_1 neq 0

#eg-box(title: "🎯 Bài B1 — n = 10")[
  Xét các dãy $(a_1, ldots, a_10)$, trong đó mỗi phần tử nhận một trong ba giá trị $-1$, $0$, $1$.

  Điều kiện:

  - $a_1 neq 0$
  - $a_1 + a_2 + cdots + a_10 = 0$

  Tính xác suất $p$ khi chọn ngẫu nhiên một dãy.
]

#loigiai-box[
  Đây là đúng dạng
  #align(center)[$S(n) - S(n - 1)$]

  nên
  #align(center)[$N = S(10) - S(9) = 8953 - 3139 = 5814$]

  Do đó
  #align(center)[$p = frac(5814, 3^10) = frac(5814, 59049)$]

  *Kiểm tra chéo:* $5814 = 2 cdot T(9, 1) = 2 cdot 2907$.
]

== B2. Tách Lẻ Và Chẵn, Không Có Điều Kiện Phụ

#eg-box(title: "🎯 Bài B2 — n = 12")[
  Dãy $(a_1, ldots, a_12)$ thỏa mãn:

  - tổng các vị trí lẻ bằng $0$,
  - tổng các vị trí chẵn bằng $0$.
]

#loigiai-box[
  Có $6$ vị trí lẻ và $6$ vị trí chẵn.

  - Nhóm lẻ có $S(6) = 141$ cách.
  - Nhóm chẵn có $S(6) = 141$ cách.

  Vậy
  #align(center)[$N = S(6)^2 = 141^2 = 19881$]
]

== B3. Tách Lẻ Và Chẵn, Nhưng a_1 neq 0

#eg-box(title: "🎯 Bài B3 — n = 14")[
  Dãy $(a_1, ldots, a_14)$ thỏa:

  - tổng vị trí lẻ bằng $0$,
  - tổng vị trí chẵn bằng $0$,
  - $a_1 neq 0$.
]

#loigiai-box[
  - Nhóm lẻ có $7$ phần tử, tổng bằng $0$, thêm điều kiện $a_1 neq 0$, nên có
    #align(center)[$S(7) - S(6) = 393 - 141 = 252$]

  - Nhóm chẵn có $7$ phần tử, tổng bằng $0$, nên có
    #align(center)[$S(7) = 393$]

  Vậy
  #align(center)[$N = 252 cdot 393 = 99036$]
]

== B4. Tổng Ở Hai Nhóm Bằng Hai Giá Trị Khác Nhau

#eg-box(title: "🎯 Bài B4 — n = 15")[
  Dãy $(a_1, ldots, a_15)$ thỏa:

  - tổng vị trí lẻ bằng $1$,
  - tổng vị trí chẵn bằng $-1$.
]

#loigiai-box[
  - Nhóm lẻ có $8$ phần tử, tổng bằng $1$, nên có $T(8, 1) = 1016$ cách.
  - Nhóm chẵn có $7$ phần tử, tổng bằng $-1$, nên có $T(7, -1) = T(7, 1) = 357$ cách.

  Vậy
  #align(center)[$N = 1016 cdot 357 = 362712$]
]

== B5. Tổng Bằng 0 Và Biết Trước Số Phần Tử Khác 0

#eg-box(title: "🎯 Bài B5 — đúng 2k phần tử khác 0")[
  Dãy $(a_1, ldots, a_n)$ thỏa:

  - tổng bằng $0$,
  - có đúng $2k$ phần tử khác $0$.

  Hãy đếm số dãy thỏa mãn.
]

#loigiai-box[
  Nếu có đúng $2k$ phần tử khác $0$ mà tổng vẫn bằng $0$, thì trong $2k$ phần tử đó phải có đúng $k$ số $+1$ và đúng $k$ số $-1$.

  Vậy:

  - Chọn $2k$ vị trí khác $0$: có $C(n, 2k)$ cách.
  - Trong đó chọn $k$ vị trí cho $+1$: có $C(2k, k)$ cách.

  Số dãy là
  #align(center)[$N_(2k) = C(n, 2k) cdot C(2k, k)$]
]

== B6. Điều Kiện Đặc Biệt: Tổng Chung Bằng 0 Và Hai Nhóm Bằng Nhau

#eg-box(title: "🎯 Bài B6 — n = 18")[
  Dãy $(a_1, ldots, a_18)$ thỏa:

  - tổng của cả dãy bằng $0$,
  - tổng vị trí lẻ bằng tổng vị trí chẵn.
]

#loigiai-box[
  Gọi tổng vị trí lẻ là $L$, tổng vị trí chẵn là $C$.

  Đề bài cho:

  - $L + C = 0$
  - $L = C$

  Từ đó suy ra ngay
  #align(center)[$L = C = 0$]

  Nghĩa là bài toán quay về đúng dạng: nhóm lẻ tổng $0$ và nhóm chẵn tổng $0$.

  Vậy
  #align(center)[$N = S(9)^2 = 3139^2 = 9853321$]
]

== B7. Tổng Lẻ Bằng Tổng Chẵn Với a_1 neq 0

#eg-box(title: "🎯 Bài B7 — n = 16")[
  Dãy $(a_1, ldots, a_16)$ thỏa:

  - tổng vị trí lẻ bằng tổng vị trí chẵn,
  - $a_1 neq 0$.

  Tính $3^16 p$.
]

#loigiai-box[
  Gọi giá trị chung của hai tổng là $c$.

  - Nhóm lẻ có $8$ phần tử, tổng bằng $c$, thêm điều kiện $a_1 neq 0$, nên có $T(8, c) - T(7, c)$ cách.
  - Nhóm chẵn có $8$ phần tử, tổng bằng $c$, nên có $T(8, c)$ cách.

  Vì vậy
  #align(center)[$N = sum_(c=-8)^8 (T(8, c) - T(7, c)) cdot T(8, c)$]

  Tách ra:
  #align(center)[$N = sum_(c=-8)^8 T(8, c)^2 - sum_(c=-8)^8 T(7, c) cdot T(8, c)$]

  Dùng tích chập chuẩn:

  - $sum_(c=-8)^8 T(8, c)^2 = S(16)$
  - $sum_(c=-8)^8 T(7, c) cdot T(8, c) = S(15)$

  Suy ra
  #align(center)[$N = S(16) - S(15) = 5196627 - 1787607 = 3409020$]

  Vì $3^16 p = N$, ta được
  #align(center)[$3^16 p = 3409020$]
]

#note-box(title: "📌 Ý nghĩa của tích chập")[
  Kỹ thuật
  #align(center)[$sum_c T(m, c) cdot T(n, c) = S(m + n)$]

  rất mạnh vì nó biến bài "hai nhóm có cùng tổng" thành bài "một dãy dài hơn có tổng bằng 0". Đây là điểm chuyên sâu nhất của chuyên đề, nhưng nếu giải thích chậm thì học sinh khá vẫn theo được.
]

#pagebreak()
= V. Chiến Lược Giải Nhanh Và Dự Đoán Đề Thi

== 5.1 Bảng Chẩn Đoán 4 Bước

#compare-box(title: "📊 Đọc đề rồi quyết định công thức")[
  #table(
    columns: (1.2fr, 1.2fr, 1fr, 1fr),
    inset: 6pt,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    align: (left, left, center, left),
    text(fill: white, weight: "bold")[Dấu hiệu trong đề],
    text(fill: white, weight: "bold")[Câu cần đổi ra],
    text(fill: white, weight: "bold")[Công thức trụ],
    text(fill: white, weight: "bold")[Lưu ý],

    [Một nhóm, tổng bằng 0], [Có bao nhiêu dãy tổng 0?], [$S(n)$], [Đếm theo số cặp +1 và -1],
    [Một nhóm, tổng bằng 0, có điều kiện $a_1 neq 0$],
    [Trừ đi trường hợp đầu bằng 0],
    [$S(n) - S(n - 1)$],
    [Cũng bằng $2 cdot T(n - 1, 1)$],

    [Một nhóm, tổng bằng s], [Bao nhiêu số +1 và -1?], [$T(n, s)$], [Dùng $p - q = s$],
    [Hai nhóm độc lập], [Mỗi nhóm có bao nhiêu cách?], [Nhân kết quả], [Không cộng nhầm],
    [Hai nhóm có cùng tổng], [Đưa về tích chập], [$S(m + n)$], [Dạng phân hóa cao],
  )
]

#step-box(1, "Tách nhóm trước, đếm sau")[
  Nếu đề có cụm *vị trí lẻ*, *vị trí chẵn*, *nhóm A*, *nhóm B*, thì phản xạ đầu tiên phải là tách dãy thành các khối độc lập. Nhiều bài khó trở nên rất ngắn chỉ nhờ bước này.
]

#step-box(2, "Đọc tổng cần đạt")[
  Sau khi tách nhóm, mỗi khối chỉ còn là một bài con: tổng bằng $0$, tổng bằng $1$, tổng bằng $-1$, hay hai tổng bằng nhau. Đây là điểm quyết định ta dùng $S$ hay $T$.
]

#step-box(3, "Nhận diện điều kiện phụ")[
  Điều kiện như $a_1 neq 0$, $a_1 = 1$, hay "đúng 6 phần tử khác 0" không nên xử lý quá muộn. Nó phải được đưa vào ngay khi đếm từng nhóm.
]

#step-box(4, "Kết luận thật ngắn")[
  Sau khi có công thức và giá trị, phần cuối chỉ còn là nhân, rút gọn xác suất, hoặc thay vào biểu thức đề cho. Không cần giải thích dài thêm nếu bảng đếm đã sáng.
]

== 5.2 Nhóm Dự Đoán 1 — Một Nhóm, Một Tổng, Một Điều Kiện

#qopen[
  *Dự đoán 1.1.* Dãy $(a_1, ldots, a_9)$, mỗi phần tử nhận một trong ba giá trị $-1$, $0$, $1$. Điều kiện: tổng cả dãy bằng $0$ và $a_1 neq 0$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Đây là đúng dạng
  #align(center)[$S(9) - S(8)$]

  nên
  #align(center)[$N = 3139 - 1107 = 2032$]

  Nếu muốn kiểm tra chéo, ta cũng có
  #align(center)[$N = 2 cdot T(8, 1) = 2 cdot 1016 = 2032$]
]

#qopen[
  *Dự đoán 1.2.* Dãy $(a_1, ldots, a_8)$ có tổng bằng $1$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Đây là đúng định nghĩa của $T(8, 1)$.

  Từ bảng chuẩn hoặc từ phép đếm chi tiết ở bài gốc, ta có
  #align(center)[$N = T(8, 1) = 1016$]
]

#qopen[
  *Dự đoán 1.3.* Dãy $(a_1, ldots, a_10)$ có tổng bằng $0$ và đúng $6$ phần tử khác $0$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Tổng bằng $0$ và có đúng $6$ phần tử khác $0$ thì trong $6$ phần tử đó phải có $3$ số $+1$ và $3$ số $-1$.

  Vậy
  #align(center)[$N = C(10, 6) cdot C(6, 3) = 210 cdot 20 = 4200$]
]

== 5.3 Nhóm Dự Đoán 2 — Tách Lẻ Và Chẵn

#qopen[
  *Dự đoán 2.1.* Dãy $(a_1, ldots, a_12)$ thỏa tổng vị trí lẻ bằng $0$ và tổng vị trí chẵn bằng $0$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Có $6$ vị trí lẻ và $6$ vị trí chẵn.

  Mỗi nhóm cho $S(6) = 141$ cách, nên
  #align(center)[$N = 141 cdot 141 = 19881$]
]

#qopen[
  *Dự đoán 2.2.* Dãy $(a_1, ldots, a_14)$ thỏa tổng vị trí lẻ bằng $0$, tổng vị trí chẵn bằng $0$, và $a_1 neq 0$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  - Nhóm lẻ: $S(7) - S(6) = 393 - 141 = 252$.
  - Nhóm chẵn: $S(7) = 393$.

  Vậy
  #align(center)[$N = 252 cdot 393 = 99036$]
]

#qopen[
  *Dự đoán 2.3.* Dãy $(a_1, ldots, a_15)$ thỏa tổng vị trí lẻ bằng $1$ và tổng vị trí chẵn bằng $-1$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  - Nhóm lẻ có $8$ phần tử: $T(8, 1) = 1016$.
  - Nhóm chẵn có $7$ phần tử: $T(7, -1) = T(7, 1) = 357$.

  Do đó
  #align(center)[$N = 1016 cdot 357 = 362712$]
]

== 5.4 Nhóm Dự Đoán 3 — Tổng Bằng Nhau, Dạng Chuyên Sâu Hơn

#qopen[
  *Dự đoán 3.1.* Dãy $(a_1, ldots, a_16)$ thỏa tổng vị trí lẻ bằng tổng vị trí chẵn và $a_1 neq 0$. Tính $3^16 p$.
]

#loigiai-box[
  Đây là đúng bài chuẩn của tích chập lệch một điều kiện phụ, nên
  #align(center)[$3^16 p = S(16) - S(15)$]

  Từ bảng chuẩn,
  #align(center)[$3^16 p = 5196627 - 1787607 = 3409020$]
]

#qopen[
  *Dự đoán 3.2.* Dãy $(a_1, ldots, a_18)$ thỏa tổng cả dãy bằng $0$ và tổng vị trí lẻ bằng tổng vị trí chẵn. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Từ hai điều kiện, suy ra hai tổng riêng đều bằng $0$.

  Vì vậy bài toán trở thành:

  - nhóm lẻ: $S(9)$ cách,
  - nhóm chẵn: $S(9)$ cách.

  Do đó
  #align(center)[$N = S(9)^2 = 3139^2 = 9853321$]
]

#qopen[
  *Dự đoán 3.3.* Dãy $(a_1, ldots, a_16)$ thỏa $a_1 = 1$ và tổng vị trí lẻ bằng tổng vị trí chẵn. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Đây là bài lệch một đơn vị rất hay ra trong đề chọn lọc.

  Kết quả chuẩn là
  #align(center)[$N = T(15, 1)$]

  Từ đẳng thức $S(16) - S(15) = 2 cdot T(15, 1)$, suy ra
  #align(center)[$T(15, 1) = frac(5196627 - 1787607, 2) = 1704510$]

  Vậy số dãy thỏa mãn là $1704510$.
]

== 5.5 Nhóm Dự Đoán 4 — Biết Trước Số Phần Tử Khác 0

#theory-box[
  Đây là nhóm bài rất hay gặp vì nhìn lạ nhưng thực ra khá cơ học. Khi đề cho thêm điều kiện *đúng $r$ phần tử khác $0$*, ta nên lập ngay hệ:

  #align(center)[$p + q = r$]
  #align(center)[$p - q = s$]

  trong đó:

  - $p$ là số phần tử $+1$,
  - $q$ là số phần tử $-1$,
  - $s$ là tổng cần đạt.

  Giải hệ xong mới chọn vị trí. Nhờ vậy bài nhìn phức tạp nhưng vẫn chạy theo một khuôn rất rõ.
]

#qopen[
  *Dự đoán 4.1.* Dãy $(a_1, ldots, a_12)$ có tổng bằng $0$ và đúng $4$ phần tử khác $0$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Tổng bằng $0$ và đúng $4$ phần tử khác $0$ nên trong $4$ phần tử đó phải có $2$ số $+1$ và $2$ số $-1$.

  - Chọn $4$ vị trí khác $0$: có $C(12, 4)$ cách.
  - Trong $4$ vị trí đó, chọn $2$ vị trí cho $+1$: có $C(4, 2)$ cách.

  Vậy
  #align(center)[$N = C(12, 4) cdot C(4, 2) = 495 cdot 6 = 2970$]
]

#qopen[
  *Dự đoán 4.2.* Dãy $(a_1, ldots, a_14)$ có tổng bằng $2$ và đúng $6$ phần tử khác $0$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Đặt $p$ là số phần tử $+1$, $q$ là số phần tử $-1$. Khi đó
  #align(center)[$p + q = 6, quad p - q = 2$]

  Suy ra $p = 4$, $q = 2$.

  - Chọn $6$ vị trí khác $0$: có $C(14, 6)$ cách.
  - Trong $6$ vị trí đó, chọn $4$ vị trí cho $+1$: có $C(6, 4)$ cách.

  Vậy
  #align(center)[$N = C(14, 6) cdot C(6, 4) = 3003 cdot 15 = 45045$]
]

#qopen[
  *Dự đoán 4.3.* Dãy $(a_1, ldots, a_16)$ thỏa:

  - tổng vị trí lẻ bằng $0$ và đúng $4$ vị trí lẻ khác $0$,
  - tổng vị trí chẵn bằng $0$ và đúng $2$ vị trí chẵn khác $0$.

  Tính số dãy thỏa mãn.
]

#loigiai-box[
  Tách hai nhóm độc lập.

  *Nhóm lẻ:* có $8$ vị trí, đúng $4$ vị trí khác $0$, tổng bằng $0$.
  Vì tổng bằng $0$ nên trong $4$ vị trí đó phải có $2$ số $+1$ và $2$ số $-1$.

  #align(center)[$N_L = C(8, 4) cdot C(4, 2) = 70 cdot 6 = 420$]

  *Nhóm chẵn:* có $8$ vị trí, đúng $2$ vị trí khác $0$, tổng bằng $0$.
  Vậy một vị trí là $+1$, một vị trí là $-1$.

  #align(center)[$N_C = C(8, 2) cdot C(2, 1) = 28 cdot 2 = 56$]

  Do hai nhóm độc lập,
  #align(center)[$N = N_L cdot N_C = 420 cdot 56 = 23520$]
]

== 5.6 Nhóm Dự Đoán 5 — Cố Định Phần Tử Đầu

#theory-box[
  Với nhóm bài này, nên nhớ ba quy tắc rất ngắn:

  - Nếu $a_1 = 1$ và tổng cả dãy bằng $s$ thì phần còn lại phải có tổng $s - 1$.
  - Nếu $a_1 = -1$ và tổng cả dãy bằng $s$ thì phần còn lại phải có tổng $s + 1$.
  - Nếu chỉ biết $a_1 neq 0$ thì ta cộng hai trường hợp trên.

  Đây là cách biến một điều kiện tưởng như phụ thành một bài $S$ hoặc $T$ quen thuộc.
]

#qopen[
  *Dự đoán 5.1.* Dãy $(a_1, ldots, a_10)$ có tổng bằng $0$ và thỏa $a_1 = 1$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Vì $a_1 = 1$, nên $9$ phần tử còn lại phải có tổng bằng $-1$.

  Theo đối xứng,
  #align(center)[$N = T(9, -1) = T(9, 1) = 2907$]
]

#qopen[
  *Dự đoán 5.2.* Dãy $(a_1, ldots, a_10)$ có tổng bằng $1$ và thỏa $a_1 = 1$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Vì $a_1 = 1$, nên $9$ phần tử còn lại phải có tổng bằng $0$.

  Vậy
  #align(center)[$N = S(9) = 3139$]
]

#qopen[
  *Dự đoán 5.3.* Dãy $(a_1, ldots, a_9)$ có tổng bằng $1$ và thỏa $a_1 neq 0$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Tách hai trường hợp.

  *Trường hợp 1:* $a_1 = 1$.
  Khi đó $8$ phần tử còn lại có tổng bằng $0$, nên có $S(8) = 1107$ cách.

  *Trường hợp 2:* $a_1 = -1$.
  Khi đó $8$ phần tử còn lại có tổng bằng $2$, nên có $T(8, 2)$ cách.

  Ta tính nhanh:
  #align(center)[$T(8, 2) = C(8, 2) C(6, 0) + C(8, 3) C(5, 1) + C(8, 4) C(4, 2) + C(8, 5) C(3, 3)$]

  #align(center)[$T(8, 2) = 28 + 280 + 420 + 56 = 784$]

  Vậy
  #align(center)[$N = 1107 + 784 = 1891$]
]

== 5.7 Nhóm Dự Đoán 6 — Hai Nhóm Có Tổng Lệch Nhau

#note-box(title: "📌 Ý tưởng hơi lạ nhưng rất đáng học")[
  Nếu một nhóm có tổng lớn hơn nhóm kia đúng $r$ đơn vị, thì ta thường gặp tổng dạng

  #align(center)[$sum_c T(m, c + r) cdot T(n, c)$]

  Sau khi đổi dấu nhóm thứ hai, biểu thức này quy về số dãy tổng bằng $r$, tức là
  #align(center)[$T(m + n, r)$]

  Đây là biến thể rất hay vì nhìn khó hơn nhóm "hai tổng bằng nhau", nhưng cốt lõi vẫn là tích chập quen thuộc.
]

#qopen[
  *Dự đoán 6.1.* Dãy $(a_1, ldots, a_8)$ thỏa tổng vị trí lẻ lớn hơn tổng vị trí chẵn đúng $1$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Có $4$ vị trí lẻ và $4$ vị trí chẵn.

  Gọi tổng vị trí chẵn là $c$, thì tổng vị trí lẻ là $c + 1$.

  Do đó
  #align(center)[$N = sum_c T(4, c + 1) cdot T(4, c)$]

  Theo tích chập lệch,
  #align(center)[$N = T(8, 1) = 1016$]
]

#qopen[
  *Dự đoán 6.2.* Dãy $(a_1, ldots, a_10)$ thỏa tổng vị trí lẻ nhỏ hơn tổng vị trí chẵn đúng $2$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Điều kiện "tổng vị trí lẻ nhỏ hơn tổng vị trí chẵn đúng $2$" tương đương với việc sau khi đổi dấu một nhóm, dãy ghép lại có tổng bằng $2$.

  Vì vậy
  #align(center)[$N = T(10, 2)$]

  Ta tính nhanh bằng công thức:
  #align(
    center,
  )[$T(10, 2) = C(10, 2) C(8, 0) + C(10, 3) C(7, 1) + C(10, 4) C(6, 2) + C(10, 5) C(5, 3) + C(10, 6) C(4, 4)$]

  #align(center)[$T(10, 2) = 45 + 840 + 3150 + 2520 + 210 = 6765$]

  Vậy số dãy thỏa mãn là $6765$.
]

#qopen[
  *Dự đoán 6.3.* Dãy $(a_1, ldots, a_10)$ thỏa $a_1 = 1$ và tổng vị trí lẻ bằng tổng vị trí chẵn. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Có $5$ vị trí lẻ và $5$ vị trí chẵn.

  Vì $a_1 = 1$, nên nếu gọi tổng chung của hai nhóm là $c$, thì $4$ vị trí lẻ còn lại phải có tổng bằng $c - 1$, còn $5$ vị trí chẵn có tổng bằng $c$.

  Do đó
  #align(center)[$N = sum_c T(4, c - 1) cdot T(5, c)$]

  Đây chính là tích chập lệch $1$, nên
  #align(center)[$N = T(9, 1) = 2907$]
]

#activity-box[
  - Nếu đổi điều kiện $a_1 = 1$ thành $a_1 = -1$, kết quả có thay đổi không?
  - Nếu thay "vị trí lẻ" và "vị trí chẵn" bằng hai nửa đầu và nửa sau của dãy, tư duy giải có gì khác?
  - Nếu tổng hai nhóm không cần bằng nhau mà chênh nhau đúng $2$, ta sẽ thay tích chập như thế nào?
]

#pagebreak()
= VI. Bài Tập Tự Luyện — Lời Giải Theo Nhịp Dạy Học

== Nhóm A — Cơ Bản

#qopen[
  *A1.* Tính $S(5)$, $S(6)$, $S(7)$, $S(8)$ bằng công thức và so sánh với bảng ở mục III.
]

#loigiai-box[
  Ta thay trực tiếp vào công thức của $S(n)$.

  - $S(5) = 1 + C(5, 2) cdot C(2, 1) + C(5, 4) cdot C(4, 2) = 1 + 20 + 30 = 51$.
  - $S(6) = 141$.
  - $S(7) = 393$.
  - $S(8) = 1107$.

  Các kết quả đều khớp bảng chuẩn.
]

#qopen[
  *A2.* Tính $T(6, 1)$ và $T(6, 2)$, rồi kiểm tra công thức tổng bằng $3^6$.
]

#loigiai-box[
  Từ công thức của $T(n, s)$ hoặc từ bảng nhỏ ở trên:

  - $T(6, 1) = 126$.
  - $T(6, 2) = 90$.

  Dùng đối xứng, ta có
  #align(center)[$3^6 = S(6) + 2(T(6, 1) + T(6, 2) + T(6, 3) + T(6, 4) + T(6, 5) + T(6, 6))$]

  Đây là một cách tự kiểm khá tốt khi tính bằng tay.
]

#qopen[
  *A3.* Xét dãy $(a_1, ldots, a_8)$. Tính số dãy thỏa mãn $a_1 neq 0$ và tổng bằng $0$. So sánh với $2 cdot T(7, 1)$.
]

#loigiai-box[
  Ta có
  #align(center)[$N = S(8) - S(7) = 1107 - 393 = 714$]

  Mặt khác, vì $T(7, 1) = 357$, nên
  #align(center)[$2 cdot T(7, 1) = 2 cdot 357 = 714$]

  Hai cách cho cùng kết quả.
]

== Nhóm B — Mức Chuẩn Đề Thi

#qopen[
  *B1.* Dãy $(a_1, ldots, a_20)$ thỏa tổng vị trí lẻ bằng $0$, tổng vị trí chẵn bằng $0$, và $a_1 neq 0$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  - Nhóm lẻ có $10$ phần tử và $a_1 neq 0$, nên có
    #align(center)[$S(10) - S(9) = 8953 - 3139 = 5814$]

  - Nhóm chẵn có $10$ phần tử, tổng bằng $0$, nên có
    #align(center)[$S(10) = 8953$]

  Vậy
  #align(center)[$N = 5814 cdot 8953 = 52073442$]
]

#qopen[
  *B2.* Dãy $(a_1, ldots, a_12)$ thỏa tổng vị trí lẻ bằng $1$ và tổng vị trí chẵn bằng $0$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  - Nhóm lẻ có $6$ phần tử, tổng bằng $1$, nên có $T(6, 1) = 126$ cách.
  - Nhóm chẵn có $6$ phần tử, tổng bằng $0$, nên có $S(6) = 141$ cách.

  Do đó
  #align(center)[$N = 126 cdot 141 = 17766$]
]

#qopen[
  *B3.* Dãy $(a_1, ldots, a_10)$ có tổng bằng $0$ và đúng $6$ phần tử khác $0$. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Ta đang ở đúng dạng của B5 với $n = 10$ và $2k = 6$, tức là $k = 3$.

  Vậy
  #align(center)[$N = C(10, 6) cdot C(6, 3) = 210 cdot 20 = 4200$]
]

== Nhóm C — Chuyên Sâu Nhưng Vẫn Gần Với HS Khá

#qopen[
  *C1.* Chứng minh lại truy hồi $S(n) = S(n - 1) + 2 cdot T(n - 1, 1)$ bằng cách phân trường hợp theo $a_n$.
]

#loigiai-box[
  Xét ba khả năng của $a_n$:

  - $a_n = 0$: khi đó $n - 1$ phần tử đầu có tổng bằng $0$, có $S(n - 1)$ cách.
  - $a_n = 1$: khi đó $n - 1$ phần tử đầu có tổng bằng $-1$, có $T(n - 1, 1)$ cách.
  - $a_n = -1$: khi đó $n - 1$ phần tử đầu có tổng bằng $1$, cũng có $T(n - 1, 1)$ cách.

  Cộng lại, ta được
  #align(center)[$S(n) = S(n - 1) + 2 cdot T(n - 1, 1)$]
]

#qopen[
  *C2.* Dãy $(a_1, ldots, a_16)$ thỏa $a_1 = 1$ và tổng vị trí lẻ bằng tổng vị trí chẵn. Tính số dãy thỏa mãn.
]

#loigiai-box[
  Đây là bài lệch một đơn vị ở nhóm lẻ. Kết quả quy về
  #align(center)[$N = T(15, 1)$]

  Mà
  #align(center)[$2 cdot T(15, 1) = S(16) - S(15)$]

  nên
  #align(center)[$T(15, 1) = frac(5196627 - 1787607, 2) = 1704510$]
]

#ans-box[
  *Kết quả của bài C2:* số dãy thỏa mãn là
  #align(center)[$boxed(1704510)$]
]
