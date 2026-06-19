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
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[Lời giải trực tiếp]
  #v(0.3em)
  #body
]

#let cach2-box(body) = block(
  fill: rgb("F3E5F5"),
  stroke: (left: 4pt + col-violet, rest: 0.5pt + rgb("CE93D8")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-violet, weight: "bold", size: 10.5pt)[Lời giải bằng hàm sinh]
  #v(0.3em)
  #body
]

// TRANG BÌA
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("09152E"), rgb("102A63"), rgb("1A237E"), rgb("3949AB"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("C5CAE9"), size: 11pt, weight: "bold", tracking: 2pt)[
      CHUYÊN ĐỀ ĐỀ THI TUYỂN SINH 12
    ]
    #v(0.55em)
    #text(fill: white, size: 22pt, weight: "black")[4 Case Phân Phối Vật Vào Hộp]
    #v(0.45em)
    #text(fill: rgb("E8EAF6"), size: 14pt)[Lý thuyết dễ hiểu · ví dụ nhiều · bài phân tầng có lời giải chi tiết]
    #v(0.55em)
    #text(fill: rgb("C5CAE9"), size: 11pt, style: "italic")[(Đọc đề đúng case trước, viết hàm sinh sau, giải rất thẳng)]
    #v(1.1em)
    #line(length: 72%, stroke: 1.5pt + rgb("C5CAE9"))
    #v(0.8em)
    #grid(
      columns: (1fr, 1fr),
      align: center,
      gutter: 0.5em,
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("E8EAF6"), size: 9pt)[*Hạt nhân* OGF, EGF, Stirling, Euler]
        ]
      ],
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("E8EAF6"), size: 9pt)[*Thiết kế* Nhận biết - Thông hiểu - Vận dụng - Vận dụng cao]
        ]
      ],
    )
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
      [I. Mở khoá 4 case bằng ngôn ngữ đề bài], [II. Lý thuyết hàm sinh thật dễ nuốt],
      [III. Case 1: Vật phân biệt - hộp phân biệt], [IV. Case 2: Vật giống nhau - hộp phân biệt],
      [V. Case 3: Vật phân biệt - hộp giống nhau], [VI. Case 4: Vật giống nhau - hộp giống nhau],
      [VII. Ma trận mức độ, bẫy sai và bảng chốt], [],
    )
  ]
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("283593"))
    grid(
      columns: (1fr, auto),
      [Chuyên đề đề thi: 4 case phân phối vật vào hộp], [GV Nguyễn Văn Sang],
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

= I. Mở Khoá 4 Case Bằng Ngôn Ngữ Đề Bài

Nếu đọc sai case, bài sẽ sai từ dòng đầu tiên. Vì vậy, trước khi chạm vào công thức, ta phải nhìn được *đề đang đếm cái gì*.

== 1. Một dữ kiện, bốn cách đọc hoàn toàn khác nhau

#compare-box(title: [Cùng chữ “chia vào 3 hộp”, nhưng có thể là 4 bài khác hẳn])[
  - *Case 1:* Xếp $4$ học sinh $A, B, C, D$ vào $3$ phòng có tên. Ở đây ta đếm: *mỗi học sinh đi vào phòng nào*.

  - *Case 2:* Xếp $4$ viên bi trắng giống nhau vào $3$ hộp có tên. Ở đây ta đếm: *mỗi hộp nhận bao nhiêu viên*.

  - *Case 3:* Chia $4$ học sinh $A, B, C, D$ thành nhiều nhất $3$ nhóm vô danh. Ở đây ta đếm: *ai đi cùng ai*.

  - *Case 4:* Chia $4$ viên kẹo giống nhau vào nhiều nhất $3$ túi vô danh. Ở đây ta đếm: *hình dạng phân chia*, ví dụ $2 + 1 + 1$.
]

== 2. Hai câu hỏi phải hỏi trước khi giải

#rev-box(title: [Quy tắc 10 giây])[
  1. *Vật có phân biệt không?*

  2. *Hộp có phân biệt không?*

  Trả lời xong hai câu này thì case sẽ tự hiện ra. Chưa trả lời được hai câu này thì chưa nên viết công thức.
]

== 3. Bảng phân loại lõi của 4 case

#table(
  columns: (0.7fr, 1.2fr, 1.2fr, 2.8fr),
  inset: (x: 8pt, y: 7pt),
  stroke: 0.45pt + col-navy,
  fill: (col, row) => if row == 0 { rgb("E8EAF6") } else if calc.rem(row, 2) == 1 { rgb("F8FBFF") } else { white },
  table.header([*Case*], [*Vật*], [*Hộp*], [*Đối tượng thật sự đang đếm*]),
  [1], [Phân biệt], [Phân biệt], [Ánh xạ từ tập vật sang tập hộp. Mỗi vật có một lựa chọn hộp.],
  [2], [Giống nhau], [Phân biệt], [Các bộ nghiệm $(x_1, ..., x_k)$ với $x_i$ là số vật trong hộp thứ $i$.],
  [3], [Phân biệt], [Giống nhau], [Các cách chia tập vật thành các nhóm không tên. Đây là phân hoạch tập.],
  [4], [Giống nhau], [Giống nhau], [Các dạng kích thước nhóm. Đây là phân hoạch số nguyên.],
)

== 4. Vì sao nhiều bạn nhầm nhất ở Case 2, 3, 4?

#note-box(title: [Ba thứ rất dễ bị gộp nhầm])[
  - Case 2 đếm *nghiệm nguyên không âm*.

  - Case 3 đếm *phân hoạch tập*.

  - Case 4 đếm *phân hoạch số nguyên*.

  Cùng là “chia”, nhưng ba bài này không cùng bản chất. Vì thế công cụ cũng không thể giống nhau.
]

== 5. Quy trình giải nhanh trong phòng thi

#rev-box(title: [Quy trình 4 bước])[
  1. Chốt đúng case.

  2. Viết hàm sinh của *một hộp* hoặc *một nhóm mẫu*.

  3. Ghép các nhân tử lại đúng quy tắc: nhân trực tiếp, chia cho $k!$, hoặc dùng tích Euler.

  4. Trích hệ số và kết luận.
]

#pagebreak()

= II. Lý Thuyết Hàm Sinh Thật Dễ Nuốt

Phần này không đi từ công thức khô. Ta đi từ câu hỏi tự nhiên hơn: *biến $x$ đang ghi lại điều gì?*

== 1. OGF: khi vật giống nhau

Nếu các vật giống nhau, số mũ của $x$ chỉ ghi lại *số lượng vật*.

#eg-box(title: [Một hộp chứa vật giống nhau])[
  - Hộp nhận tự do $0, 1, 2, 3, ...$ vật thì ta ghi:
    $1 + x + x^2 + x^3 + ... = frac(1, 1 - x).$

  - Hộp phải có ít nhất $2$ vật thì ta ghi:
    $x^2 + x^3 + x^4 + ... = frac(x^2, 1 - x).$

  - Hộp chỉ nhận số chẵn vật thì ta ghi:
    $1 + x^2 + x^4 + ... = frac(1, 1 - x^2).$
]

#note-box(title: [Ý nghĩa của từng số hạng])[
  Trong OGF, số hạng $x^r$ có nghĩa là: “hộp này nhận $r$ vật”. Không có câu chuyện chọn vật nào, vì các vật là giống nhau.
]

== 2. EGF: khi vật phân biệt

Nếu vật phân biệt, chỉ biết “có $r$ vật” là chưa đủ. Ta còn phải tính xem *đó là những vật nào*. Chính vì vậy ta dùng EGF và hệ số chuẩn là $x^r / r!$.

#eg-box(title: [Một hộp chứa vật phân biệt])[
  - Hộp nhận tự do $0, 1, 2, 3, ...$ vật phân biệt thì EGF là:
    $1 + x + frac(x^2, 2!) + frac(x^3, 3!) + ... = e^x.$

  - Hộp phải có ít nhất $1$ vật thì EGF là:
    $e^x - 1.$

  - Hộp chỉ nhận số chẵn vật thì EGF là:
    $1 + frac(x^2, 2!) + frac(x^4, 4!) + ... = cosh(x).$
]

#note-box(title: [Điểm khác nhau cốt lõi giữa OGF và EGF])[
  - OGF đi với *vật giống nhau*.

  - EGF đi với *vật phân biệt*.

  - Khi trích hệ số từ EGF, phải nhớ nhân thêm $n!$:
    $N = n! [x^n] E(x).$
]

== 3. Từ một hộp đến cả hệ hộp có tên

Nếu các hộp có tên, ta ghép các hộp bằng phép nhân trực tiếp.

#rev-box(title: [Quy tắc nhân])[
  - Với OGF: nếu hộp thứ $i$ có OGF là $G_i(x)$ thì
    $G(x) = G_1(x) G_2(x) ... G_k(x)$
    và số cách là $[x^n] G(x)$.

  - Với EGF: nếu hộp thứ $i$ có EGF là $E_i(x)$ thì
    $E(x) = E_1(x) E_2(x) ... E_k(x)$
    và số cách là $n! [x^n] E(x)$.
]

== 4. Vì sao Case 3 phải chia cho $k!$?

Case 3 có vật phân biệt nhưng hộp *không có tên*. Đây là chỗ nhiều bạn hụt chân nhất.

Nếu viết $(e^x - 1)^3$ thì nghĩa là bạn đang gọi tên ba nhóm là “Nhóm 1, Nhóm 2, Nhóm 3”. Như vậy bạn đã biến hộp vô danh thành hộp có tên.

Do đó, với đúng $k$ nhóm không rỗng, EGF chuẩn phải là
$Phi_k(x) = frac((e^x - 1)^k, k!).$

Số cách là
$S_n^k = n! [x^n] frac((e^x - 1)^k, k!).$

#note-box(title: [Ý nghĩa của việc chia cho $k!$])[
  Chia cho $k!$ là thao tác *xoá tên các nhóm*. Đây chính là bản chất của số Stirling loại hai.
]

== 5. Sự tương đồng và dị biệt giữa Case 1 và Case 3: Chia hay không chia $k!$?

Cả Case 1 và Case 3 đều là bài toán phân phối *vật phân biệt*, do đó cả hai đều sử dụng *Hàm sinh lũy thừa (EGF)* làm công cụ. Điểm khác biệt duy nhất nằm ở tính chất của hộp:

- *Case 1 (Hộp có tên - Distinguishable boxes):* Thứ tự của các hộp quan trọng. Nếu ta chia vật vào các hộp, hộp $A$ nhận nhóm này, hộp $B$ nhận nhóm kia là khác nhau. Vì vậy, ta nhân các EGF của từng hộp trực tiếp và *không chia cho bất kỳ giai thừa nào*.
  Với $k$ hộp phân biệt không trống, EGF tổng là:
  $E_"Case1"(x) = (e^x - 1)^k$
  Số cách phân phối là:
  $N_1 = n! [x^n] (e^x - 1)^k$

- *Case 3 (Hộp giống nhau - Indistinguishable boxes):* Các hộp không có tên (vô danh). Việc hoán vị các nhóm vật giữa các hộp không tạo ra cách chia mới. Do đó, ta phải *chia cho $k!$* để khử đi $k!$ cách hoán vị nhãn hộp.
  Với $k$ hộp giống nhau không trống, EGF tổng là:
  $E_"Case3"(x) = frac((e^x - 1)^k, k!)$
  Số cách phân phối là:
  $N_3 = n! [x^n] frac((e^x - 1)^k, k!) = S_n^k$

#compare-box(title: [Công thức vàng liên kết Case 1 và Case 3 (khi không có hộp trống)])[
  $ N_"Case1" = k! dot N_"Case3" $
  *Nói cách khác:* Để giải Case 1 (hộp có tên) bằng cách dùng Case 3 (hộp vô danh), ta chỉ việc chia các vật thành $k$ nhóm không tên (Case 3), sau đó phát mỗi nhóm cho một trong $k$ người (hoán vị $k!$ cách).
]

== 6. Vì sao Case 4 đi tới tích Euler?

Case 4 là “vật giống nhau, hộp giống nhau”, nên không còn khái niệm hộp thứ nhất hay hộp thứ hai. Ta chỉ nhìn thấy *các cỡ nhóm*.

Nếu cho phép nhiều nhất $k$ hộp vô danh, OGF chuẩn là
$P_k(x) = product_(j=1)^k frac(1, 1 - x^j).$

Nhân tử $frac(1, 1 - x^j)$ biểu diễn việc ta có thể dùng:

- $0$ nhóm cỡ $j$,
- hoặc $1$ nhóm cỡ $j$,
- hoặc $2$ nhóm cỡ $j$,
- v.v.

Từ đó, hệ số $[x^n] P_k(x)$ đếm số phân hoạch của $n$ thành không quá $k$ phần.

== 7. Bảng từ điển một hộp phải nhớ

#table(
  columns: (1.7fr, 1.7fr, 1.8fr),
  inset: (x: 8pt, y: 7pt),
  stroke: 0.4pt + col-navy,
  fill: (col, row) => if row == 0 { rgb("E8EAF6") } else if calc.rem(row, 2) == 1 { rgb("FAFCFF") } else { white },
  table.header([*Điều kiện*], [*OGF*], [*EGF*]),
  [Tự do], [$frac(1, 1 - x)$], [$e^x$],
  [Ít nhất $1$], [$frac(x, 1 - x)$], [$e^x - 1$],
  [Ít nhất $r$], [$frac(x^r, 1 - x)$], [$e^x - sum_(j=0)^(r-1) frac(x^j, j!)$],
  [Nhiều nhất $r$], [$1 + x + ... + x^r$], [$sum_(j=0)^r frac(x^j, j!)$],
  [Đúng $r$], [$x^r$], [$frac(x^r, r!)$],
  [Chẵn], [$frac(1, 1 - x^2)$], [$cosh(x)$],
  [Lẻ], [$frac(x, 1 - x^2)$], [$sinh(x)$],
)

== 8. Bảng chốt công cụ

#table(
  columns: (0.7fr, 1.7fr, 2.5fr),
  inset: (x: 8pt, y: 7pt),
  stroke: 0.4pt + col-navy,
  fill: (col, row) => if row == 0 { rgb("E8EAF6") } else if calc.rem(row, 2) == 1 { rgb("FBFDFF") } else { white },
  table.header([*Case*], [*Bản chất*], [*Công cụ đúng*]),
  [1], [Vật có tên, hộp có tên], [Quy tắc nhân; nếu có điều kiện riêng từng hộp thì dùng EGF],
  [2], [Vật giống nhau, hộp có tên], [OGF theo từng hộp rồi lấy $[x^n]$],
  [3], [Vật có tên, hộp vô danh], [EGF của nhóm không rỗng rồi chia $k!$],
  [4], [Vật giống nhau, hộp vô danh], [OGF Euler $product_(j=1)^k frac(1, 1 - x^j)$],
)

#pagebreak()

= III. Case 1: Vật Phân Biệt, Hộp Phân Biệt

Case 1 là case dễ nhất về mặt bản chất. Ta thường không cần hàm sinh nếu đề chỉ hỏi đếm trực tiếp.

== 1. Dấu hiệu nhận diện

#note-box(title: [Khi nào là Case 1?])[
  - Vật có tên riêng: $A, B, C, ...$ hoặc “học sinh phân biệt”, “quyển sách phân biệt”.

  - Hộp có tên riêng: Hộp $1$, Hộp $2$, Hộp $3$ hoặc “phòng A, B, C”.

  Khi đó ta đang đếm: mỗi vật đi về hộp nào.
]

== 2. Bài 1 - Mức nhận biết

#eg-box(title: [Đề bài])[
  Xếp $4$ học sinh phân biệt $A, B, C, D$ vào $3$ phòng $1, 2, 3$. Hỏi có bao nhiêu cách xếp?
]

#cach1-box[
  Mỗi học sinh có đúng $3$ lựa chọn phòng.

  Vì bốn học sinh chọn độc lập, số cách là
  $N = 3 dot 3 dot 3 dot 3 = 3^4 = 81.$

  Vậy có *81 cách*.
]

== 3. Bài 2 - Mức thông hiểu

#eg-box(title: [Đề bài])[
  Xếp $5$ học sinh phân biệt vào $3$ phòng phân biệt sao cho *mỗi phòng có ít nhất $1$ học sinh*.
]

#cach1-box[
  Ta đếm bằng nguyên lý bù.

  *Bước 1: Tổng số cách xếp tự do.*

  Mỗi học sinh có $3$ phòng để chọn nên
  $N_"tong" = 3^5 = 243.$

  *Bước 2: Trừ các cách có ít nhất một phòng trống.*

  - Chọn $1$ phòng bị trống: có $C_3^1$ cách.
  - Khi đó $5$ học sinh chỉ còn chọn trong $2$ phòng còn lại: có $2^5$ cách.

  Số cách cần trừ là
  $C_3^1 dot 2^5 = 3 dot 32 = 96.$

  *Bước 3: Cộng lại các cách bị trừ hai lần.*

  Nếu có $2$ phòng trống thì tất cả học sinh dồn vào đúng $1$ phòng. Có
  $C_3^2 dot 1^5 = 3$
  cách như vậy.

  *Bước 4: Kết luận.*

  $N = 243 - 96 + 3 = 150.$

  Vậy có *150 cách*.
]

== 4. Giải bài toán chứa ràng buộc bằng Hàm sinh EGF

Khi Case 1 có thêm các ràng buộc phức tạp tại từng hộp (ví dụ: mỗi hộp có ít nhất 1 vật, hoặc một hộp nhận số vật chẵn/lẻ), phương pháp tổ hợp cổ điển hoặc bù trừ sẽ trở nên rất cồng kềnh. Lúc này, *Hàm sinh lũy thừa (EGF)* là công cụ tối ưu.

Quy trình giải:
1. Viết EGF đại diện cho điều kiện của từng hộp: $E_i(x)$.
2. Nhân trực tiếp các EGF này lại (không chia cho $k!$ vì hộp phân biệt): $E(x) = E_1(x) E_2(x) ... E_k(x)$.
3. Số cách xếp $n$ vật phân biệt vào các hộp là hệ số của $x^n$ nhân với $n!$:
   $ N = n! [x^n] E(x) $

== 5. Bài 3 - Mức vận dụng

#eg-box(title: [Đề bài])[
  Có $6$ cuốn sách giáo khoa khác nhau cần tặng cho $3$ học sinh $A, B, C$ sao cho học sinh nào cũng nhận được ít nhất $1$ cuốn sách. Hỏi có bao nhiêu cách tặng sách?
]

#cach1-box[
  *Cách 1: Sử dụng phân hoạch nhóm rồi hoán vị (Liên hệ Case 3)*

  - Trước hết, ta chia $6$ cuốn sách phân biệt thành $3$ nhóm không rỗng vô danh (đây chính là bài toán Case 3).
  - Có hai dạng phân hoạch số lượng cho $3$ nhóm từ $6$ cuốn sách:
    1. Dạng $4 + 1 + 1$: Chọn $4$ sách cho nhóm 1, $1$ cho nhóm 2, $1$ cho nhóm 3. Do hai nhóm có $1$ cuốn giống nhau về số lượng nên số cách chia nhóm là:
       $frac(C_6^4 dot C_2^1 dot C_1^1, 2!) = 15.$
    2. Dạng $3 + 2 + 1$: Số cách chia nhóm là:
       $C_6^3 dot C_3^2 dot C_1^1 = 20 dot 3 = 60.$
    3. Dạng $2 + 2 + 2$: Ba nhóm có số lượng bằng nhau nên số cách chia nhóm là:
       $frac(C_6^2 dot C_4^2 dot C_2^2, 3!) = frac(15 dot 6, 6) = 15.$
  - Tổng số cách chia sách thành $3$ nhóm không tên là:
    $N_"nhom" = 15 + 60 + 15 = 90$ cách (đây chính là số Stirling loại hai $S_6^3 = 90$).
  - Sau đó, vì 3 học sinh $A, B, C$ là phân biệt, ta đem $3$ nhóm sách này phát cho $3$ học sinh. Có $3!$ cách hoán vị.
  - Tổng số cách tặng sách là:
    $N = N_"nhom" dot 3! = 90 dot 6 = 540$ cách.
]

#cach2-box[
  *Cách 2: Giải trực tiếp bằng EGF (không chia $k!$)*

  - Mỗi học sinh nhận ít nhất $1$ cuốn sách, nên EGF cho mỗi học sinh là:
    $E_"hs"(x) = e^x - 1.$
  - Vì $3$ học sinh phân biệt, EGF tổng của hệ thống là:
    $E(x) = (e^x - 1)^3 = e^(3x) - 3e^(2x) + 3e^x - 1.$
  - Số cách tặng sách là hệ số của $frac(x^6, 6!)$ trong $E(x)$, tương đương:
    $N = 6! [x^6] E(x) = 6! [x^6] (e^(3x) - 3e^(2x) + 3e^x - 1).$
  - Ta biết $[x^n] e^(a x) = frac(a^n, n!)$, do đó:
    $N = 6! lr(frac(3^6, 6!) - 3 dot frac(2^6, 6!) + 3 dot frac(1^6, 6!))$
    $N = 3^6 - 3 dot 2^6 + 3 = 729 - 192 + 3 = 540.$

  *Nhận xét:* Cách giải bằng EGF cực kỳ nhanh, trực quan và loại bỏ hoàn toàn việc phải chia các trường hợp phân hoạch số lượng phức tạp.
]

== 6. Bài 4 - Mức vận dụng cao

#eg-box(title: [Đề bài])[
  Có $6$ món quà khác nhau phân phối cho $3$ em bé phân biệt $A, B, C$ sao cho:
  - Bé $A$ nhận được một số chẵn món quà (có thể nhận $0$ quà).
  - Bé $B$ và bé $C$ mỗi bé nhận được ít nhất $1$ món quà.
  
  Hỏi có bao nhiêu cách phân phối quà thỏa mãn?
]

#cach2-box[
  Ta viết EGF đại diện cho điều kiện nhận quà của từng bé:
  - Bé $A$ nhận số chẵn quà: $E_A(x) = 1 + frac(x^2, 2!) + frac(x^4, 4!) + ... = cosh(x) = frac(e^x + e^(-x), 2).$
  - Bé $B$ nhận ít nhất $1$ quà: $E_B(x) = e^x - 1.$
  - Bé $C$ nhận ít nhất $1$ quà: $E_C(x) = e^x - 1.$
  
  Vì các bé là phân biệt, EGF tổng của cả 3 bé là:
  $E(x) = E_A(x) dot E_B(x) dot E_C(x) = frac(e^x + e^(-x), 2) (e^x - 1)^2$
  $E(x) = frac(e^x + e^(-x), 2) (e^(2x) - 2e^x + 1)$
  $E(x) = frac(1, 2) (e^(3x) - 2e^(2x) + e^x + e^x - 2 + e^(-x))$
  $E(x) = frac(1, 2) (e^(3x) - 2e^(2x) + 2e^x - 2 + e^(-x)).$
  
  Số cách phân phối thỏa mãn cho $6$ món quà là $N = 6! [x^6] E(x)$. Ta trích hệ số của $x^6$ từ các hàm mũ:
  $N = 6! dot frac(1, 2) lr(frac(3^6, 6!) - 2 dot frac(2^6, 6!) + 2 dot frac(1^6, 6!) + frac((-1)^6, 6!))$
  $N = frac(1, 2) (3^6 - 2 dot 2^6 + 2 dot 1^6 + (-1)^6)$
  $N = frac(1, 2) (729 - 128 + 2 + 1) = frac(604, 2) = 302.$
  
  Vậy có *302 cách* phân phối quà thỏa mãn.
]

#pagebreak()

= IV. Case 2: Vật Giống Nhau, Hộp Phân Biệt

Đây là case của *nghiệm nguyên không âm* và *OGF*. Hễ hộp có tên mà vật giống nhau, hãy nghĩ ngay đến OGF.

== 1. Khung tư duy của Case 2

#rev-box(title: [Câu hỏi gốc của Case 2])[
  Ta không hỏi “viên nào vào hộp nào”, mà hỏi “hộp $1$ có bao nhiêu, hộp $2$ có bao nhiêu, ...”.

  Vì vậy Case 2 gắn tự nhiên với các bộ nghiệm
  $(x_1, x_2, ..., x_k)$
  và OGF là công cụ rất hợp.
]

== 2. Bài 1 - Mức nhận biết

#eg-box(title: [Đề bài])[
  Chia $6$ quả bóng trắng giống nhau vào $3$ hộp phân biệt $A, B, C$. Hỏi có bao nhiêu cách chia?
]

#cach2-box[
  Mỗi hộp nhận tự do $0, 1, 2, ...$ quả bóng, nên OGF của một hộp là
  $frac(1, 1 - x).$

  Ba hộp phân biệt nên OGF tổng là
  $G(x) = frac(1, (1 - x)^3).$

  Số cách cần tìm là hệ số của $x^6$:
  $N = [x^6] frac(1, (1 - x)^3).$

  Dùng khai triển nhị thức âm:
  $frac(1, (1 - x)^3) = sum_(n=0)^(+oo) C_(n+2)^2 x^n.$

  Vì vậy
  $N = C_8^2 = 28.$

  Vậy có *28 cách*.
]

== 3. Bài 2 - Mức thông hiểu

#eg-box(title: [Đề bài])[
  Chia $7$ viên kẹo giống nhau vào $3$ hộp phân biệt sao cho:

  - mỗi hộp đều có ít nhất $1$ viên;
  - riêng hộp $1$ có nhiều nhất $3$ viên.
]

#cach2-box[
  Ta viết OGF cho từng hộp.

  - Hộp $1$ có thể nhận $1, 2, 3$ viên nên OGF là
    $x + x^2 + x^3.$

  - Hộp $2$ và hộp $3$ đều phải có ít nhất $1$ viên nên OGF của mỗi hộp là
    $frac(x, 1 - x).$

  Do đó OGF tổng là
  $G(x) = (x + x^2 + x^3) lr(frac(x, 1 - x))^2 = frac(x^3 (1 + x + x^2), (1 - x)^2).$

  Ta cần hệ số của $x^7$, tức là hệ số của $x^4$ trong
  $frac(1 + x + x^2, (1 - x)^2).$

  Mà
  $[x^m] frac(1, (1 - x)^2) = m + 1.$

  Vì thế:
  $N = [x^4] frac(1, (1 - x)^2) + [x^3] frac(1, (1 - x)^2) + [x^2] frac(1, (1 - x)^2)$
  $= 5 + 4 + 3 = 12.$

  Vậy có *12 cách*.
]

== 4. Bài 3 - Mức vận dụng

#eg-box(title: [Đề bài])[
  Chia $8$ quả bóng giống nhau vào $3$ hộp phân biệt sao cho:

  - hộp $1$ chứa một số *chẵn* quả bóng;
  - hộp $2$ chứa một số *lẻ* quả bóng;
  - hộp $3$ chứa ít nhất $1$ quả bóng.
]

#cach2-box[
  OGF của từng hộp là:

  - Hộp $1$: $G_1(x) = frac(1, 1 - x^2)$.
  - Hộp $2$: $G_2(x) = frac(x, 1 - x^2)$.
  - Hộp $3$: $G_3(x) = frac(x, 1 - x)$.

  Do đó
  $G(x) = frac(x^2, (1 - x^2)^2 (1 - x)).$

  Số cách cần tìm là hệ số của $x^8$, tức là hệ số của $x^6$ trong
  $frac(1, (1 - x^2)^2 (1 - x)).$

  Khai triển:
  $(1 - x^2)^(-2) = 1 + 2 x^2 + 3 x^4 + 4 x^6 + ...$
  và
  $(1 - x)^(-1) = 1 + x + x^2 + x^3 + ...$

  Để lấy hệ số của $x^6$, ta có các khả năng:

  - lấy $1$ từ dãy thứ nhất và $x^6$ từ dãy thứ hai: cho $1$;
  - lấy $2 x^2$ từ dãy thứ nhất và $x^4$ từ dãy thứ hai: cho $2$;
  - lấy $3 x^4$ từ dãy thứ nhất và $x^2$ từ dãy thứ hai: cho $3$;
  - lấy $4 x^6$ từ dãy thứ nhất và $1$ từ dãy thứ hai: cho $4$.

  Tổng là
  $N = 1 + 2 + 3 + 4 = 10.$

  Vậy có *10 cách*.
]

== 5. Bài 4 - Mức vận dụng cao

#eg-box(title: [Đề bài])[
  Chia $9$ phần thưởng giống nhau vào $4$ hộp phân biệt sao cho:

  - hộp $1$ chứa số phần thưởng *chẵn*;
  - ba hộp còn lại đều chứa *ít nhất $1$* phần thưởng.

  Hỏi có bao nhiêu cách chia?
]

#cach2-box[
  OGF của hộp $1$ là
  $frac(1, 1 - x^2).$

  Mỗi hộp trong ba hộp còn lại có OGF
  $frac(x, 1 - x).$

  Do đó OGF tổng là
  $G(x) = frac(1, 1 - x^2) lr(frac(x, 1 - x))^3 = frac(x^3, (1 - x)^3 (1 - x^2)).$

  Ta cần hệ số của $x^9$, tức là hệ số của $x^6$ trong
  $frac(1, (1 - x)^3 (1 - x^2)).$

  Viết
  $frac(1, 1 - x^2) = 1 + x^2 + x^4 + x^6 + ...$
  và
  $frac(1, (1 - x)^3) = sum_(m=0)^(+oo) C_(m+2)^2 x^m.$

  Vì thế hệ số của $x^6$ là:
  $C_8^2 + C_6^2 + C_4^2 + C_2^2 = 28 + 15 + 6 + 1 = 50.$

  Vậy có *50 cách*.
]

#note-box(title: [Khẩu quyết riêng của Case 2])[
  Hễ đề cho từng hộp một điều kiện riêng như chẵn, lẻ, không quá, ít nhất, đúng bằng, chia hết cho $m$ thì hãy viết ngay OGF của *từng hộp*. Đó là đường ngắn nhất.
]

#pagebreak()

= V. Case 3: Vật Phân Biệt, Hộp Giống Nhau

Case 3 là case của *chia nhóm không tên*. Đây là quê hương của Stirling loại hai và EGF chia cho $k!$.

== 1. Sự liên kết chặt chẽ với Case 1 (Khử nhãn hộp)

#compare-box(title: [Tại sao chia cho $k!$ là đủ?])[
  Khi chia $n$ vật phân biệt vào $k$ hộp giống nhau (không trống), ta chỉ quan tâm đến cấu trúc phân hoạch: *ai đi với ai*.
  Nếu ta tạm thời coi các hộp này là phân biệt (gắn nhãn $1, 2, ..., k$), ta sẽ có đúng $k!$ cách xếp tương ứng với mỗi phân hoạch duy nhất ở Case 3.
  
  Do đó:
  $ N_"Case3" = frac(N_"Case1", k!) $
  
  Về mặt Hàm sinh, điều này giải thích trực tiếp tại sao EGF của Case 3 phải chia cho $k!$:
  $ E_"Case3"(x) = frac((e^x - 1)^k, k!) $
]

== 2. Khung tư duy của Case 3

#rev-box(title: [Câu hỏi gốc của Case 3])[
  Ta không hỏi “hộp $1$ có bao nhiêu người”, mà hỏi “những ai đứng cùng một nhóm”.

  Vì thế đây là bài toán phân hoạch tập, không phải bài toán nghiệm nguyên.
]

== 3. Bài 1 - Mức nhận biết

#eg-box(title: [Đề bài])[
  Chia $5$ học sinh phân biệt thành đúng $2$ nhóm vô danh, mỗi nhóm đều không rỗng. Hỏi có bao nhiêu cách chia?
]

#cach2-box[
  Với đúng $2$ nhóm vô danh không rỗng, EGF chuẩn là
  $Phi_2(x) = frac((e^x - 1)^2, 2!).$

  Số cách cần tìm là
  $N = 5! [x^5] frac((e^x - 1)^2, 2!).$

  Khai triển:
  $frac((e^x - 1)^2, 2!) = frac(e^(2x) - 2 e^x + 1, 2).$

  Lấy hệ số $x^5$ rồi nhân với $5!$:
  $N = frac(2^5 - 2, 2) = frac(32 - 2, 2) = 15.$

  Vậy có *15 cách*.
]

== 4. Bài 2 - Mức thông hiểu

#eg-box(title: [Đề bài])[
  Chia $6$ học sinh phân biệt thành đúng $3$ nhóm vô danh, mỗi nhóm đều không rỗng. Hỏi có bao nhiêu cách chia?
]

#cach2-box[
  Với đúng $3$ nhóm vô danh không rỗng, EGF là
  $Phi_3(x) = frac((e^x - 1)^3, 3!).$

  Số cách là
  $N = 6! [x^6] frac((e^x - 1)^3, 3!).$

  Ta khai triển:
  $frac((e^x - 1)^3, 3!) = frac(e^(3x) - 3 e^(2x) + 3 e^x - 1, 6).$

  Vì vậy
  $N = frac(3^6 - 3 dot 2^6 + 3, 6)$
  $= frac(729 - 192 + 3, 6)$
  $= 90.$

  Vậy có *90 cách*.
]

== 5. Bài 3 - Mức vận dụng

#eg-box(title: [Đề bài])[
  Chia $7$ học sinh phân biệt thành *nhiều nhất $3$* nhóm vô danh, không nhóm nào rỗng. Hỏi có bao nhiêu cách chia?
]

#cach2-box[
  “Nhiều nhất $3$ nhóm” nghĩa là ta cộng ba trường hợp: đúng $1$ nhóm, đúng $2$ nhóm, đúng $3$ nhóm.

  Do đó
  $N = sum_(j=1)^3 7! [x^7] frac((e^x - 1)^j, j!)$
  $= S_7^1 + S_7^2 + S_7^3.$

  Ta tính từng hạng:

  - $S_7^1 = 1$.

  - $S_7^2 = 7! [x^7] frac((e^x - 1)^2, 2!) = frac(2^7 - 2, 2) = 63.$

  - $S_7^3 = 7! [x^7] frac((e^x - 1)^3, 3!) = frac(3^7 - 3 dot 2^7 + 3, 6)$
    $= frac(2187 - 384 + 3, 6) = 301.$

  Cộng lại:
  $N = 1 + 63 + 301 = 365.$

  Vậy có *365 cách*.
]

== 6. Bài 4 - Mức vận dụng cao

#eg-box(title: [Đề bài])[
  Chia $7$ học sinh phân biệt thành đúng $3$ nhóm vô danh, không nhóm nào rỗng, sao cho *có đúng một nhóm chỉ gồm $1$ học sinh*. Hỏi có bao nhiêu cách chia?
]

#cach2-box[
  Ta xây EGF theo đúng cấu trúc nhóm.

  - Một nhóm đơn đúng $1$ người có EGF là $x$.

  - Mỗi nhóm còn lại phải có ít nhất $2$ người nên EGF của một nhóm như vậy là
    $e^x - 1 - x.$

  - Có hai nhóm kiểu này và chúng vô danh, nên phải chia cho $2!$.

  Do đó EGF của toàn bộ cấu trúc là
  $F(x) = x frac((e^x - 1 - x)^2, 2!).$

  Số cách cần tìm là
  $N = 7! [x^7] F(x) = frac(7!, 2) [x^6] (e^x - 1 - x)^2.$

  Khai triển:
  $(e^x - 1 - x)^2 = e^(2x) - 2 e^x (1 + x) + (1 + x)^2.$

  Ta chỉ cần hệ số của $x^6$.

  - Từ $e^(2x)$, hệ số là $2^6 / 6! = 64 / 720$.

  - Từ $-2 e^x (1 + x)$, hệ số là
    $-2 (1 / 6! + 1 / 5!) = -2 (1 / 720 + 1 / 120) = -14 / 720.$

  - Từ $(1 + x)^2$, hệ số của $x^6$ bằng $0$.

  Vậy
  $[x^6] (e^x - 1 - x)^2 = frac(64 - 14, 720) = frac(50, 720).$

  Suy ra
  $N = frac(7!, 2) dot frac(50, 720) = 175.$

  Vậy có *175 cách*.
]

== 7. Bài 5 - Mức vận dụng cao

#eg-box(title: [Đề bài])[
  Một công ty công nghệ muốn chia $6$ lập trình viên phân biệt thành $3$ nhóm dự án để nghiên cứu $3$ công nghệ mới độc lập (mỗi nhóm nghiên cứu một công nghệ). Biết rằng mỗi nhóm phải có ít nhất $1$ lập trình viên.
  1. Hỏi có bao nhiêu cách chia nhóm nếu các công nghệ nghiên cứu là khác nhau (ví dụ: AI, Blockchain, Cloud)?
  2. Hỏi có bao nhiêu cách chia nhóm nếu công ty chỉ đơn thuần chia họ thành $3$ nhóm độc lập để thảo luận tự do (không phân biệt công nghệ hay tên nhóm)?
]

#cach2-box[
  *Lời giải chi tiết:*
  
  Đây là một ví dụ kinh điển giúp phân biệt rõ ràng giữa Case 1 và Case 3:
  
  *Câu 1: Các công nghệ khác nhau (Hộp phân biệt - Case 1)*
  - Vì 3 công nghệ AI, Blockchain, Cloud là phân biệt, việc lập trình viên được xếp vào nhóm nghiên cứu AI hay Cloud là hoàn toàn khác nhau. Đây chính là bài toán Case 1 (6 vật biệt vào 3 hộp biệt, không trống).
  - Sử dụng kết quả đếm từ EGF ở Bài 3 (mục III):
    $N_1 = 540$ cách.
  
  *Câu 2: Thảo luận tự do, không phân biệt nhóm (Hộp giống nhau - Case 3)*
  - Vì các nhóm thảo luận tự do không được gán công nghệ hay tên gọi cụ thể, đây là bài toán phân hoạch tập hợp (Case 3 - chia 6 vật biệt thành 3 nhóm vô danh không trống).
  - Ta có hai cách tính:
    - *Cách A (Dùng trực tiếp Stirling loại hai):*
      $N_2 = S_6^3 = 90$ cách.
    - *Cách B (Khử nhãn từ câu 1):*
      Vì mỗi cách chia ở câu 2 sau khi gán 3 nhãn công nghệ sẽ tạo ra đúng $3! = 6$ cách chia ở câu 1, nên:
      $N_2 = frac(N_1, 3!) = frac(540, 6) = 90$ cách.
      
  *Kết luận:* Việc hiểu rõ bản chất "nhân/chia $k!$" giúp ta giải quyết linh hoạt cả hai chiều bài toán một cách dễ dàng.
]

#note-box(title: [Khẩu quyết riêng của Case 3])[
  Khi đề nói “đúng $k$ nhóm vô danh” hoặc “nhiều nhất $k$ nhóm vô danh”, hãy nghĩ ngay tới EGF của *một nhóm không rỗng* là $e^x - 1$, rồi điều chỉnh thêm cho điều kiện đặc biệt của nhóm.
]

#pagebreak()

= VI. Case 4: Vật Giống Nhau, Hộp Giống Nhau

Case 4 là case của *phân hoạch số*. Đây là case trừu tượng nhất, nhưng khi đã quen tích Euler thì rất mạnh.

== 1. Khung tư duy của Case 4

#rev-box(title: [Câu hỏi gốc của Case 4])[
  Ta không còn nhìn thấy tên của vật, cũng không còn nhìn thấy tên của hộp. Vì thế thứ còn lại duy nhất là *dạng kích thước*.

  Ví dụ, $3 + 1 + 1$ chỉ là một dạng, không còn là ba hộp thứ tự nào cả.
]

== 2. Bài 1 - Mức nhận biết

#eg-box(title: [Đề bài])[
  Chia $6$ vật giống nhau vào nhiều nhất $3$ hộp vô danh. Hỏi có bao nhiêu kiểu chia?
]

#cach2-box[
  OGF Euler của bài toán là
  $P_3(x) = frac(1, (1 - x)(1 - x^2)(1 - x^3)).$

  Ta cần hệ số của $x^6$.

  Việc lấy hệ số này tương đương đếm số nghiệm nguyên không âm của
  $a + 2 b + 3 c = 6.$

  Xét theo $c$:

  - Nếu $c = 0$ thì $a + 2 b = 6$. Có $4$ nghiệm.

  - Nếu $c = 1$ thì $a + 2 b = 3$. Có $2$ nghiệm.

  - Nếu $c = 2$ thì $a + 2 b = 0$. Có $1$ nghiệm.

  Tổng cộng:
  $N = 4 + 2 + 1 = 7.$

  Vậy có *7 kiểu chia*.
]

== 3. Bài 2 - Mức thông hiểu

#eg-box(title: [Đề bài])[
  Chia $9$ vật giống nhau vào *đúng $4$* hộp vô danh, mỗi hộp đều không rỗng. Hỏi có bao nhiêu kiểu chia?
]

#cach2-box[
  “Đúng $4$ hộp không rỗng” nghĩa là ta đang phân hoạch $9$ thành đúng $4$ phần dương.

  OGF tương ứng là
  $Q(x) = frac(x^4, (1 - x)(1 - x^2)(1 - x^3)(1 - x^4)).$

  Vì vậy số cách là hệ số của $x^9$, tức là hệ số của $x^5$ trong
  $frac(1, (1 - x)(1 - x^2)(1 - x^3)(1 - x^4)).$

  Điều này tương đương đếm số nghiệm nguyên không âm của
  $a + 2 b + 3 c + 4 d = 5.$

  - Nếu $d = 0$ thì $a + 2 b + 3 c = 5$.
    Có $5$ nghiệm.

  - Nếu $d = 1$ thì $a + 2 b + 3 c = 1$.
    Có $1$ nghiệm.

  Tổng cộng:
  $N = 5 + 1 = 6.$

  Vậy có *6 kiểu chia*.
]

== 4. Bài 3 - Mức vận dụng

#eg-box(title: [Đề bài])[
  Hỏi có bao nhiêu phân hoạch của $8$ thành các số hạng *lẻ*?
]

#cach2-box[
  Hàm sinh của phân hoạch thành các phần lẻ là
  $P_"le"(x) = product_(r=1)^(+oo) frac(1, 1 - x^(2r - 1)).$

  Theo định lý Euler,
  $product_(r=1)^(+oo) frac(1, 1 - x^(2r - 1)) = product_(j=1)^(+oo) (1 + x^j).$

  Vế phải là OGF của các phân hoạch thành các phần *phân biệt*. Vì vậy số phân hoạch của $8$ thành các phần lẻ bằng số phân hoạch của $8$ thành các phần phân biệt.

  Ta liệt kê các phân hoạch của $8$ thành các phần phân biệt:

  $8,$
  $7 + 1,$
  $6 + 2,$
  $5 + 3,$
  $5 + 2 + 1,$
  $4 + 3 + 1.$

  Có tất cả $6$ phân hoạch.

  Vậy số phân hoạch của $8$ thành các phần lẻ là *6*.
]

== 5. Bài 4 - Mức vận dụng cao

#eg-box(title: [Đề bài])[
  Chia $12$ vật giống nhau vào đúng $4$ hộp vô danh, mỗi hộp đều có ít nhất $2$ vật. Hỏi có bao nhiêu kiểu chia?
]

#cach2-box[
  Vì mỗi hộp có ít nhất $2$ vật và có đúng $4$ hộp, nên trước hết ta đặt sẵn $2$ vật vào mỗi hộp. Như vậy đã dùng hết $8$ vật, còn lại $4$ vật để phân phối thêm.

  Sau bước dịch này, bài toán trở thành:

  “Phân hoạch $4$ thành nhiều nhất $4$ phần”.

  OGF tương ứng là
  $frac(1, (1 - x)(1 - x^2)(1 - x^3)(1 - x^4)).$

  Ta cần hệ số của $x^4$, tức là đếm số nghiệm nguyên không âm của
  $a + 2 b + 3 c + 4 d = 4.$

  Xét theo $d$:

  - Nếu $d = 0$ thì $a + 2 b + 3 c = 4$.
    Có $4$ nghiệm.

  - Nếu $d = 1$ thì $a + 2 b + 3 c = 0$.
    Có $1$ nghiệm.

  Tổng cộng:
  $N = 4 + 1 = 5.$

  Vậy có *5 kiểu chia*.

  Năm dạng đó là:
  $6 + 2 + 2 + 2,$
  $5 + 3 + 2 + 2,$
  $4 + 4 + 2 + 2,$
  $4 + 3 + 3 + 2,$
  $3 + 3 + 3 + 3.$
]

#note-box(title: [Khẩu quyết riêng của Case 4])[
  Hễ đề nói “vật giống nhau, hộp vô danh”, hãy quên các hộp thứ tự đi. Lúc này thứ duy nhất còn lại là kích thước phần. Đó là lúc tích Euler xuất hiện.
]

#pagebreak()

= VII. Ma Trận Mức Độ, Bẫy Sai Và Bảng Chốt

== 1. Ma trận mức độ của toàn chuyên đề

#table(
  columns: (1.2fr, 1.7fr, 2.6fr),
  inset: (x: 8pt, y: 7pt),
  stroke: 0.45pt + col-navy,
  fill: (col, row) => if row == 0 { rgb("E8EAF6") } else if calc.rem(row, 2) == 1 { rgb("FBFDFF") } else { white },
  table.header([*Mức độ*], [*Case điển hình*], [*Dấu hiệu thường gặp trong đề*]),
  [Nhận biết], [Case 1, Case 2 đơn giản], [Tự do, không ràng buộc hoặc ràng buộc rất ngắn như “ít nhất 1”, “đúng 2”.],
  [Thông hiểu], [Case 2, Case 3 cơ bản], [Phải biết viết đúng hàm sinh cho từng hộp hoặc từng nhóm.],
  [Vận dụng],
  [Case 2 nhiều điều kiện, Case 3 nhiều nhất $k$ nhóm, Case 4 phân hoạch chuẩn],
  [Đề bắt đầu trộn chẵn, lẻ, chặn dưới, đúng số nhóm.],

  [Vận dụng cao],
  [Case 3 theo kiểu nhóm đặc biệt, Case 4 có dịch biến và cấu trúc phần],
  [Đề yêu cầu bóc đúng cấu trúc nhóm hoặc dịch bài toán về hệ số khác.],
)

== 2. Bẫy sai xuất hiện dày nhất

#note-box(title: [Bẫy 1: Dùng OGF cho vật phân biệt])[
  Nếu vật phân biệt mà vẫn viết $frac(1, 1 - x)$ thì gần như chắc chắn bạn đã đếm sai. Với vật phân biệt phải ưu tiên EGF.
]

#note-box(title: [Bẫy 2: Quên chia $k!$ ở Case 3])[
  $(e^x - 1)^k$ là của *$k$ nhóm có tên*. Nếu nhóm vô danh thì phải dùng
  $frac((e^x - 1)^k, k!).$
]

#note-box(title: [Bẫy 3: Dùng $(1 - x)^(-k)$ cho Case 4])[
  $frac(1, (1 - x)^k)$ là biểu thức của *$k$ hộp có tên*. Nếu hộp vô danh thì phải chuyển sang tích Euler
  $product_(j=1)^k frac(1, 1 - x^j).$
]

#note-box(title: [Bẫy 4: Nhìn “đúng $k$ nhóm” thành “nhiều nhất $k$ nhóm”])[
  - Case 3: đúng $k$ nhóm là một hạng, nhiều nhất $k$ nhóm là một tổng.

  - Case 4: đúng $k$ hộp không rỗng thường phải dịch biến, không được đọc lướt như nhiều nhất $k$ hộp.
]

== 3. Checklist 30 giây trước khi bấm máy tính

#rev-box(title: [Checklist])[
  1. Vật có tên hay giống nhau?

  2. Hộp có tên hay vô danh?

  3. Đề đang đếm nghiệm nguyên, phân hoạch tập hay phân hoạch số?

  4. Hàm sinh của *một hộp* hoặc *một nhóm mẫu* là gì?

  5. Có cần chia cho $k!$ không?

  6. Có phải dùng tích Euler không?
]

== 4. Bảng chốt cuối cùng

#align(center)[
  #table(
    columns: (1.15fr, 1.45fr, 2.3fr, 1.55fr),
    align: center + horizon,
    inset: (x: 12pt, y: 10pt),
    fill: (col, row) => if row == 0 { rgb("E8EAF6") } else if calc.rem(row, 2) == 1 { rgb("F7FBFF") } else { white },
    stroke: 0.5pt + col-navy,
    table.header([*Case*], [*Nhận diện*], [*Công cụ đúng*], [*Mẫu công thức*]),
    [1], [Vật có tên, hộp có tên], [Quy tắc nhân; có điều kiện thì EGF], [$k^n$ hoặc $n! [x^n] E(x)$],
    [2], [Vật giống nhau, hộp có tên], [OGF theo từng hộp], [$[x^n] product_(i=1)^k G_i(x)$],
    [3], [Vật có tên, hộp vô danh], [EGF + Stirling], [$n! [x^n] frac((e^x - 1)^k, k!)$],
    [4], [Vật giống nhau, hộp vô danh], [OGF Euler + phân hoạch], [$[x^n] product_(j=1)^k frac(1, 1 - x^j)$],
  )
]

#v(0.8em)

#rev-box(title: [Khẩu quyết chốt bài])[
  - *Case 2:* hỏi “mỗi hộp nhận bao nhiêu?”.

  - *Case 3:* hỏi “ai đi cùng ai?”.

  - *Case 4:* hỏi “dạng phân chia là gì?”.

  Nếu ba câu này đã rõ, việc chọn đúng hàm sinh sẽ trở nên rất tự nhiên.
]
