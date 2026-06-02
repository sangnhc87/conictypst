#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"

// CẤU HÌNH TRANG

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

#let theory-layout(main, side) = grid(
  columns: (1fr, 0.4fr),
  gutter: 1.5em,
  main,
  side
)

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

#theory-layout(
  [
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
  ],
  side-note(title: "Nhắc lại chuỗi vô hạn", [
    Khai triển cấp số nhân lùi vô hạn:
    $ 1 + x + x^2 + ... = frac(1, 1-x) $
    (với $|x| < 1$).
    
    Chuỗi chẵn:
    $ 1 + x^2 + x^4 + ... = frac(1, 1-x^2) $
  ])
)

== 2. EGF: khi vật phân biệt

Nếu vật phân biệt, chỉ biết “có $r$ vật” là chưa đủ. Ta còn phải tính xem *đó là những vật nào*. Chính vì vậy ta dùng EGF và hệ số chuẩn là $x^r / r!$.

#theory-layout(
  [
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
  ],
  side-note(title: "Hàm e^x", [
    Chuỗi Taylor kinh điển:
    $ e^x = 1 + x + frac(x^2, 2!) + ... $
    
    Khi mất đi số hạng $1$ (ứng với $0$ phần tử), ta có:
    $ e^x - 1 = x + frac(x^2, 2!) + ... $
  ])
)

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

#theory-layout(
  [
    Do đó, với đúng $k$ nhóm không rỗng, EGF chuẩn phải là
    $Phi_k(x) = frac((e^x - 1)^k, k!).$

    Số cách là
    $S_n^k = n! [x^n] frac((e^x - 1)^k, k!).$

    #note-box(title: [Ý nghĩa của việc chia cho $k!$])[
      Chia cho $k!$ là thao tác *xoá tên các nhóm*. Đây chính là bản chất của số Stirling loại hai.
    ]
  ],
  side-note(title: "Số Stirling loại 2", [
    Ký hiệu $S_n^k$ đếm số cách chia $n$ vật phân biệt thành đúng $k$ nhóm vô danh (không rỗng).
    
    Chia $k!$ vì $k$ nhóm có thể hoán vị cho nhau mà không tạo ra cách chia mới.
  ])
)

== 5. Giải phẫu Tích Euler (Case 4)

Case 4 là “vật giống nhau, hộp vô danh (giống nhau)”. Lúc này không còn khái niệm hộp thứ nhất hay hộp thứ hai, ta chỉ quan tâm đến *kích thước của các nhóm*. Việc chia đồ vật lúc này chính là bài toán *phân hoạch số nguyên*.

#theory-layout(
  [
    #eg-box(title: [Tích Euler là gì?])[
      Tích Euler là chuỗi nhân vô hạn các phân thức, mỗi phân thức đại diện cho một kích thước nhóm:
      $ P(x) = frac(1, 1-x) dot frac(1, 1-x^2) dot frac(1, 1-x^3) dot ... $
      
      Ý nghĩa của từng phân thức:
      - $frac(1, 1 - x) = 1 + x + x^2 + ...$: Biểu diễn số lượng *nhóm cỡ 1*. Mũ của $x$ đếm tổng vật trong các nhóm này.
      - $frac(1, 1 - x^2) = 1 + x^2 + x^4 + ...$: Biểu diễn số lượng *nhóm cỡ 2*.
      - $frac(1, 1 - x^j)$: Biểu diễn *nhóm cỡ $j$*.
      
      Khi nhân tung toé ra, hệ số của $x^n$ chính là *số kiểu chia (phân hoạch)* $n$ vật thành các nhóm.
    ]

    #cach2-box[
      *Ví dụ:* Chia $4$ viên kẹo giống nhau vào các túi giống nhau. (Tức là phân hoạch số $4$).
      Ta xét khai triển Euler tới mũ 4:
      $ P(x) = (1+x+x^2+x^3+x^4)(1+x^2+x^4)(1+x^3)(1+x^4) $
      Nhân bung ra để tìm hệ số của $x^4$:
      - Lấy $x^4$ từ ngoặc 1: $1+1+1+1$
      - Lấy $x^2$ từ ngoặc 1, $x^2$ từ ngoặc 2: $2+1+1$
      - Lấy $x^4$ từ ngoặc 2: $2+2$
      - Lấy $x$ từ ngoặc 1, $x^3$ từ ngoặc 3: $3+1$
      - Lấy $x^4$ từ ngoặc 4: $4$
      
      Hệ số của $x^4$ là $5$. Vậy có $5$ kiểu chia!
    ]
  ],
  side-note(title: "Dấu hiệu nhận biết", [
    *Dùng khi nào?*
    Khi đề bài có combo:
    1. Vật *giống nhau*
    2. Hộp *vô danh*
    
    Hoặc các bài toán "Đổi tiền", "Phân hoạch số".
    
    *Cách dùng thực chiến:*
    Trong phòng thi, thay vì nhân đa thức dài dòng, ta thường lập phương trình nghiệm nguyên:
    $ a + 2b + 3c + ... = n $
    Với $a, b, c$ lần lượt là *số lượng nhóm* cỡ $1, 2, 3$. Tương ứng với số mũ của các đa thức thành phần trong tích Euler.
  ])
)

== 6. Bảng từ điển một hộp phải nhớ

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

== 7. Bảng chốt công cụ

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

== 1.5. Ví dụ mini (Thấy mới tin)

#theory-layout(
  [
    #eg-box(title: [Xếp 2 học sinh vào 2 phòng])[
      Giả sử có 2 học sinh là *An* và *Bình* cần xếp vào *Phòng 1* và *Phòng 2*.
      Ta thử liệt kê tay toàn bộ các cách:
      - Cách 1: An vào Phòng 1, Bình vào Phòng 1. 
      - Cách 2: An vào Phòng 1, Bình vào Phòng 2. 
      - Cách 3: An vào Phòng 2, Bình vào Phòng 1. 
      - Cách 4: An vào Phòng 2, Bình vào Phòng 2. 
      
      Rõ ràng có đúng *4 cách*.
      Thay vì liệt kê, ta dùng Quy tắc nhân: An có $2$ lựa chọn phòng, Bình có $2$ lựa chọn phòng. Vậy số cách là $2 times 2 = 2^2 = 4$.
    ]
  ],
  side-note(title: "Sự khác biệt nằm ở đâu?", [
    Hãy nhìn vào Cách 2 và Cách 3.
    Vì học sinh *có tên*, nên việc Phòng 1 chứa An hoàn toàn khác với việc Phòng 1 chứa Bình. Chính sự "phân biệt cá thể" này đã đẻ ra nhiều cách xếp.
  ])
)

== 2. Bài 1 - Mức nhận biết

#eg-box(title: [Đề bài])[
  Xếp $4$ học sinh phân biệt $A, B, C, D$ vào $3$ phòng $1, 2, 3$. Hỏi có bao nhiêu cách xếp?
]

#theory-layout(
  [
    #cach1-box[
      Mỗi học sinh có đúng $3$ lựa chọn phòng.

      Vì bốn học sinh chọn độc lập, số cách là
      $N = 3 dot 3 dot 3 dot 3 = 3^4 = 81.$

      Vậy có *81 cách*.
    ]

    #cach2-box[
      Vì học sinh phân biệt (có tên), ta hoàn toàn có thể dùng EGF.
      
      Mỗi phòng không có ràng buộc số lượng nên EGF của một phòng là:
      $e^x$
      
      Vì có $3$ phòng nên Hàm sinh của bài toán là:
      $E(x) = (e^x)^3 = e^{3x}$
      
      Số cách xếp là hệ số của $frac(x^4, 4!)$ trong $e^{3x}$, theo nhẩm nhanh chính là $3^4 = 81.$
    ]
  ],
  side-note(title: "Nhắc bài", [
    Dấu hiệu Case 1 cực kỳ rõ nét: "học sinh phân biệt" (có tên) và "phòng 1, 2, 3" (hộp có tên).
    Bài này chưa có điều kiện ràng buộc nên chỉ cần dùng Quy tắc nhân cơ bản.

    *Vì sao lại dạy EGF ở đây?* Việc tập tư duy thiết lập EGF ở bài dễ nhất sẽ giúp bạn không bị "khớp" khi đối mặt với các bài toán có ràng buộc phức tạp phía sau!
  ])
)

== 3. Bài 2 - Mức thông hiểu

#eg-box(title: [Đề bài])[
  Xếp $5$ học sinh phân biệt vào $3$ phòng phân biệt sao cho *mỗi phòng có ít nhất $1$ học sinh*.
]

#theory-layout(
  [
    #cach1-box[
      Ta đếm bằng nguyên lý bù.
    
      *Bước 1: Tổng số cách xếp tự do.*
      Mỗi học sinh có $3$ phòng để chọn nên
      $N_"tong" = 3^5 = 243.$
    
      *Bước 2: Trừ các cách có ít nhất một phòng trống.*
      - Chọn $1$ phòng bị trống: có $C_3^1$ cách.
      - Khi đó $5$ học sinh chỉ còn chọn trong $2$ phòng còn lại: có $2^5$ cách.
      Số cách cần trừ là $C_3^1 dot 2^5 = 3 dot 32 = 96.$
    
      *Bước 3: Cộng lại các cách bị trừ hai lần.*
      Nếu có $2$ phòng trống thì tất cả học sinh dồn vào đúng $1$ phòng. Có
      $C_3^2 dot 1^5 = 3$ cách như vậy.
    
      *Bước 4: Kết luận.*
      $N = 243 - 96 + 3 = 150.$
      Vậy có *150 cách*.
    ]

    #cach2-box[
      Dùng EGF vì vật và hộp đều phân biệt.
      
      Mỗi phòng chứa "ít nhất 1" người, do đó EGF của một phòng là:
      $e^x - 1$
      
      Vì có $3$ phòng, Hàm sinh của bài toán là:
      $E(x) = (e^x - 1)^3$
      
      Khai triển đa thức:
      $E(x) = e^{3x} - 3e^{2x} + 3e^x - 1$
      
      Hệ số của $frac(x^5, 5!)$ trong khai triển này (dùng mẹo nhặt hệ số $e^x$) chính là:
      $N = 3^5 - 3 dot 2^5 + 3 dot 1^5 - 0 = 243 - 96 + 3 = 150.$
    ]
  ],
  side-note(title: "Nhắc bài", [
    Đề có cụm từ "ít nhất 1" (phân phối toàn ánh), kết hợp với số lượng phòng nhỏ (3 phòng), thường gợi ý dùng *Nguyên lý bù (Bao hàm - Loại trừ)*.
    
    _So sánh phương pháp:_ Bạn có thấy các số hạng trong Khai triển đa thức ở Cách 2 giống y hệt chuỗi tính toán của Cách 1 không? Bản chất của Nguyên lý bù trừ chính là khai triển hằng đẳng thức nhị thức $(a-b)^n$ đấy!
  ])
)

== 4. Bài 3 - Mức vận dụng cao (Buộc dùng EGF)

#eg-box(title: [Đề bài])[
  Xếp $6$ học sinh phân biệt vào $3$ phòng phân biệt $A, B, C$ sao cho:
  - Phòng $A$ chứa số *chẵn* học sinh.
  - Phòng $B$ chứa số *lẻ* học sinh.
  - Phòng $C$ không có ràng buộc gì.
  Hỏi có bao nhiêu cách xếp?
]

#theory-layout(
  [
    #cach2-box[
      Với bài toán có ràng buộc kiểu chẵn/lẻ đối với vật phân biệt, quy tắc đếm thông thường bị vô hiệu hóa hoàn toàn. Ta BẮT BUỘC dùng EGF.

      - Phòng $A$ (chẵn): $E_A (x) = frac(e^x + e^{-x}, 2)$
      - Phòng $B$ (lẻ): $E_B (x) = frac(e^x - e^{-x}, 2)$
      - Phòng $C$ (tùy ý): $E_C (x) = e^x$

      Hàm sinh tổng của bài toán là tích của 3 hàm sinh trên:
      $E(x) = E_A (x) dot E_B (x) dot E_C (x)$
      $E(x) = frac(e^x + e^{-x}, 2) dot frac(e^x - e^{-x}, 2) dot e^x$
      $E(x) = frac(e^{2x} - e^{-2x}, 4) dot e^x = frac(e^{3x} - e^{-x}, 4)$

      Ta cần lấy hệ số của $frac(x^6, 6!)$ trong khai triển $E(x)$.
      
      Dùng mẹo nhặt hệ số, ta có ngay:
      $N = frac(3^6 - (-1)^6, 4) = frac(729 - 1, 4) = 182.$

      Vậy có *182 cách xếp*.
    ]
  ],
  side-note(title: "Uy lực của EGF", [
    Gặp cụm từ "số lượng chẵn / lẻ" đối với vật phân biệt $\to$ Phản xạ ngay lập tức: *Dùng EGF*.
    
    Bạn thấy đấy, một bài toán cực kỳ phức tạp nếu giải tay, nhưng lại "bay màu" chỉ trong đúng 3 dòng biến đổi Hàm sinh!
  ])
)

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

== 1.5. Ví dụ mini (Thấy mới tin)

#theory-layout(
  [
    #eg-box(title: [Chia 3 viên kẹo giống nhau cho 2 bạn An và Bình])[
      Khác với Case 1, viên kẹo bây giờ không có tên. Ta chỉ đếm An được mấy viên, Bình được mấy viên.
      Hãy liệt kê tay toàn bộ các khả năng:
      - Cách 1: An 3 viên, Bình 0 viên. `(3, 0)`
      - Cách 2: An 2 viên, Bình 1 viên. `(2, 1)`
      - Cách 3: An 1 viên, Bình 2 viên. `(1, 2)`
      - Cách 4: An 0 viên, Bình 3 viên. `(0, 3)`
      
      Có đúng *4 cách* chia.
      
      Nếu dùng công thức tổ hợp lặp (Stars and Bars) cho phương trình $x_1 + x_2 = 3$:
      Công thức số nghiệm là $C_(3 + 2 - 1)^(2 - 1) = C_4^1 = 4$. Khớp hoàn toàn với liệt kê!
    ]
  ],
  side-note(title: "Tại sao không dùng quy tắc nhân?", [
    Vì 3 viên kẹo giống nhau y hệt.
    Việc An nhận "viên kẹo thứ nhất" hay "viên kẹo thứ hai" không tạo ra cách chia mới. Thứ duy nhất quan trọng là *số lượng* kẹo mỗi bạn nhận được.
  ])
)

== 2. Bài 1 - Mức nhận biết

#eg-box(title: [Đề bài])[
  Chia $6$ quả bóng trắng giống nhau vào $3$ hộp phân biệt $A, B, C$. Hỏi có bao nhiêu cách chia?
]

#theory-layout(
  [
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
  ],
  side-note(title: "Nhị thức âm", [
    Công thức tổng quát hay dùng:
    $ frac(1, (1-x)^k) = sum_(n=0)^(+oo) C_(n+k-1)^(k-1) x^n $
    
    Trong bài này $k=3$, nên:
    $ [x^n] frac(1, (1-x)^3) = C_(n+2)^2 $
  ])
)

== 3. Bài 2 - Mức thông hiểu

#eg-box(title: [Đề bài])[
  Chia $7$ viên kẹo giống nhau vào $3$ hộp phân biệt sao cho:

  - mỗi hộp đều có ít nhất $1$ viên;
  - riêng hộp $1$ có nhiều nhất $3$ viên.
]

#theory-layout(
  [
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
  ],
  side-note(title: "Nhắc bài", [
    Điều kiện độc lập từng hộp $\to$ Viết OGF riêng rồi nhân lại với nhau.
    
    Hãy cẩn thận: hộp chứa "nhiều nhất 3 viên" thì OGF chỉ là đa thức $x+x^2+x^3$, không phải là phân thức vô hạn!
  ])
)

== 4. Bài 3 - Mức vận dụng

#eg-box(title: [Đề bài])[
  Chia $8$ quả bóng giống nhau vào $3$ hộp phân biệt sao cho:

  - hộp $1$ chứa một số *chẵn* quả bóng;
  - hộp $2$ chứa một số *lẻ* quả bóng;
  - hộp $3$ chứa ít nhất $1$ quả bóng.
]

#theory-layout(
  [
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
  ],
  side-note(title: "Nhắc bài", [
    Đây là bài kinh điển về tính chẵn lẻ của OGF.
    - Hộp *chẵn*: nhảy bước 2 nên OGF là $frac(1, 1-x^2)$
    - Hộp *lẻ*: bắt đầu từ 1, nhảy bước 2 nên OGF là $frac(x, 1-x^2)$.
  ])
)

== 5. Bài 4 - Mức vận dụng cao

#eg-box(title: [Đề bài])[
  Chia $9$ phần thưởng giống nhau vào $4$ hộp phân biệt sao cho:

  - hộp $1$ chứa số phần thưởng *chẵn*;
  - ba hộp còn lại đều chứa *ít nhất $1$* phần thưởng.

  Hỏi có bao nhiêu cách chia?
]

#theory-layout(
  [
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
  ],
  side-note(title: "Nhắc bài", [
    Để nhân hai phân thức vô hạn nhanh nhất, ta chọn 1 chuỗi làm "chuỗi chủ đạo" (ở đây là nhị thức âm), và 1 chuỗi để "rải hệ số". 
    
    Chuỗi chẵn $(1+x^2+x^4...)$ chỉ làm nhiệm vụ đi "nhặt" các hệ số chẵn tương ứng từ khai triển nhị thức âm. Rất tinh tế!
  ])
)

#note-box(title: [Khẩu quyết riêng của Case 2])[
  Hễ đề cho từng hộp một điều kiện riêng như chẵn, lẻ, không quá, ít nhất, đúng bằng, chia hết cho $m$ thì hãy viết ngay OGF của *từng hộp*. Đó là đường ngắn nhất.
]

#pagebreak()

= V. Case 3: Vật Phân Biệt, Hộp Giống Nhau

Case 3 là case của *chia nhóm không tên*. Đây là quê hương của Stirling loại hai và EGF chia cho $k!$.

== 1. Khung tư duy của Case 3

#rev-box(title: [Câu hỏi gốc của Case 3])[
  Ta không hỏi “hộp $1$ có bao nhiêu người”, mà hỏi “những ai đứng cùng một nhóm”.

  Vì thế đây là bài toán phân hoạch tập, không phải bài toán nghiệm nguyên.
]

== 1.5. Ví dụ mini (Thấy mới tin)

#theory-layout(
  [
    #eg-box(title: [Chia 3 người vào 2 nhóm vô danh])[
      Giả sử có 3 bạn *An, Bình, Châu* (phân biệt). Cần chia thành 2 nhóm không tên, không nhóm nào rỗng.
      Ta thử liệt kê tay xem có bao nhiêu kiểu "gom nhóm":
      - Kiểu 1: Một nhóm có {An}, nhóm kia có {Bình, Châu}.
      - Kiểu 2: Một nhóm có {Bình}, nhóm kia có {An, Châu}.
      - Kiểu 3: Một nhóm có {Châu}, nhóm kia có {An, Bình}.
      
      Chỉ có đúng *3 kiểu*!
      
      Nếu dùng công thức Stirling $S_3^2$ với EGF:
      $ S_3^2 = 3! [x^3] frac((e^x - 1)^2, 2!) = 3. $
      Công thức khớp hoàn toàn với thực tế liệt kê.
    ]
  ],
  side-note(title: "Hiểu sâu về việc chia k!", [
    Nếu 2 nhóm này có tên (Nhóm 1, Nhóm 2).
    Lúc đó `({An} ở Nhóm 1, {Bình, Châu} ở Nhóm 2)` là 1 cách. Đảo lại `({Bình, Châu} ở Nhóm 1, {An} ở Nhóm 2)` là cách thứ 2. Tổng cộng sẽ có $3 times 2 = 6$ cách.
    
    Nhưng vì nhóm *vô danh*, hai trạng thái trên bị chập làm 1. Do đó ta phải chia cho $2!$ để "xoá nhãn" nhóm.
  ])
)

== 1.6. Bí kíp nhặt hệ số $e^x$ siêu tốc

#note-box(title: [Làm sao để biết hệ số của x^n?])[
  Nhiều bạn thấy hàm $e^x$ là sợ vì không biết nhặt hệ số kiểu gì. Đừng lo, vì ta cần tính $N = n! [x^n]$, bạn chỉ cần thuộc lòng mẹo sau:
  - Gặp $e^x$ thì thay bằng $1^n = 1$.
  - Gặp $e^(2x)$ thì thay bằng $2^n$.
  - Gặp $e^(3x)$ thì thay bằng $3^n$.
  - Tổng quát: Gặp $e^(k x)$ thì thay bằng $k^n$. Hằng số đứng một mình thì thay bằng $0$.
  
  *Cách làm thực chiến:* Khi khai triển xong $(e^x - 1)^k$, bạn cứ thấy chữ $e^(k x)$ thì lập tức thay bằng số $k^n$. Không cần bận tâm đến chuỗi Taylor nữa!
]

== 1.7. Bí kíp Casio đếm thẳng số Stirling

#theory-layout(
  [
    #cach2-box[
      Với các bài toán trắc nghiệm chia $n$ người vào $k$ nhóm vô danh (không rỗng), ta đang đi tìm số Stirling loại hai $S_n^k$. Thay vì viết hàm sinh rồi khai triển, bạn có thể *bấm máy tính Casio trực tiếp* bằng công thức tổng Sigma:
      
      $ S_n^k = frac(1, k!) sum_(j=0)^k (-1)^(k-j) C_k^j dot j^n $
      
      *Cú pháp nhập máy tính Casio:*
      - Chức năng tính tổng `\sum` (Shift + x). Biến chạy là $X$ (từ $0$ đến $k$).
      - Nhập: `1/k! * \sum_{X=0}^k ( (-1)^(k-X) * kCX * X^n )`
      
      *Ví dụ:* Bài toán chia 5 người vào 2 nhóm ($n=5, k=2$).
      Bấm: `1/2! * \sum_{X=0}^2 ( (-1)^(2-X) * 2CX * X^5 )`
      Kết quả sẽ hiện ra ngay $15$. Siêu tốc độ cho trắc nghiệm!
    ]
  ],
  side-note(title: "Công thức này ở đâu ra?", [
    Thực chất đây chính là khai triển nhị thức Newton của $(e^x - 1)^k$ rồi áp dụng *Bí kíp nhặt hệ số siêu tốc* ở trên. 
    
    Nhưng thay vì bạn phải tự khai triển tay dài dòng, máy tính Casio sẽ gom lại chạy vòng lặp tính giùm bạn một cách chính xác tuyệt đối.
  ])
)

== 2. Bài 1 - Mức nhận biết

#eg-box(title: [Đề bài])[
  Chia $5$ học sinh phân biệt thành đúng $2$ nhóm vô danh, mỗi nhóm đều không rỗng. Hỏi có bao nhiêu cách chia?
]

#theory-layout(
  [
    #cach2-box[
      Với đúng $2$ nhóm vô danh không rỗng, EGF chuẩn là
      $Phi_2(x) = frac((e^x - 1)^2, 2!).$

      Số cách cần tìm là:
      $N = 5! [x^5] frac((e^x - 1)^2, 2!).$

      Khai triển tử số:
      $(e^x - 1)^2 = e^(2x) - 2 e^x + 1.$

      *Áp dụng bí kíp nhặt hệ số siêu tốc ($n=5$):*
      Ta thay $e^(2x)$ bằng $2^5$, thay $e^x$ bằng $1^5$, thay hằng số $1$ bằng $0^5=0$:
      $N = frac(2^5 - 2 dot 1^5 + 0, 2!) = frac(32 - 2, 2) = 15.$

      Vậy có *15 cách*.
      
      *(Hoặc bạn bấm trực tiếp Casio theo Bí kíp 1.7 ở trên, kết quả cũng lập tức ra 15!)*
    ]
  ],
  side-note(title: "Nhắc bài", [
    Đây là bài toán cơ bản đi tìm số Stirling $S_5^2$.
    Nhóm "vô danh" $\to$ chia $2!$.
    Thay vì khai triển Taylor, hãy dùng *Bí kíp nhặt hệ số* (cứ gặp $e^(k x)$ thì thay bằng $k^n$).
  ])
)

== 3. Bài 2 - Mức thông hiểu

#eg-box(title: [Đề bài])[
  Chia $6$ học sinh phân biệt thành đúng $3$ nhóm vô danh, mỗi nhóm đều không rỗng. Hỏi có bao nhiêu cách chia?
]

#theory-layout(
  [
    #cach2-box[
      Với đúng $3$ nhóm vô danh không rỗng, EGF là
      $Phi_3(x) = frac((e^x - 1)^3, 3!).$

      Số cách là:
      $N = 6! [x^6] frac((e^x - 1)^3, 3!).$

      Ta khai triển tử số (hằng đẳng thức lập phương):
      $(e^x - 1)^3 = e^(3x) - 3 e^(2x) + 3 e^x - 1.$

      *Áp dụng bí kíp nhặt hệ số siêu tốc ($n=6$):*
      Thay $e^(3x)$ thành $3^6$, $e^(2x)$ thành $2^6$, $e^x$ thành $1^6$, hằng số $1$ thành $0$:
      $N = frac(3^6 - 3 dot 2^6 + 3 dot 1^6 - 0, 3!) = frac(729 - 192 + 3, 6) = 90.$

      Vậy có *90 cách*.
      
      *(Nhắc lại: Đi thi trắc nghiệm chỉ cần bấm `1/3! * \sum_{X=0}^3 ( (-1)^(3-X) * 3CX * X^6 )` là ra 90 ngay lập tức!)*
    ]
  ],
  side-note(title: "Nhắc bài", [
    Việc khai triển $(e^x - 1)^3$ kết hợp với Bí kíp nhặt hệ số $e^x$ đã biến một bài toán vi tích phân phức tạp thành một biểu thức số học cấp 1.
  ])
)

== 4. Bài 3 - Mức vận dụng

#eg-box(title: [Đề bài])[
  Chia $7$ học sinh phân biệt thành *nhiều nhất $3$* nhóm vô danh, không nhóm nào rỗng. Hỏi có bao nhiêu cách chia?
]

#theory-layout(
  [
    #cach2-box[
      “Nhiều nhất $3$ nhóm” nghĩa là ta cộng ba trường hợp: đúng $1$ nhóm, đúng $2$ nhóm, đúng $3$ nhóm.

      Do đó
      $N = sum_(j=1)^3 7! [x^7] frac((e^x - 1)^j, j!) = S_7^1 + S_7^2 + S_7^3.$
      
      Nếu làm tự luận, ta sẽ nhặt hệ số thủ công cho từng cái $S_7^1, S_7^2, S_7^3$. Nhưng với trắc nghiệm, ta dùng luôn *Bí kíp Casio 1.7* cho siêu nhanh:
      
      - $S_7^1 = 1$ (hiển nhiên chia 1 nhóm thì chỉ có 1 cách).
      - $S_7^2$: Bấm máy `1/2! * \sum_{X=0}^2 ( (-1)^(2-X) * 2CX * X^7 )` $= 63$.
      - $S_7^3$: Bấm máy `1/3! * \sum_{X=0}^3 ( (-1)^(3-X) * 3CX * X^7 )` $= 301$.
      
      Vậy tổng cộng $N = 1 + 63 + 301 = 365$ cách.
    ]
  ],
  side-note(title: "Nhắc bài", [
    Hãy phân biệt cực kỳ rõ:
    - *Đúng 3 nhóm:* Chỉ tính 1 hàm sinh.
    - *Nhiều nhất 3 nhóm:* Cộng dồn nhiều hàm sinh.
    Gặp chữ "nhiều nhất", bấm Casio tính tổng các số Stirling là lựa chọn khôn ngoan nhất!
  ])
)

== 5. Bài 4 - Luyện tập tốc độ
#eg-box(title: [Đề bài])[
  Có 8 nhân viên được chia vào 3 dự án mật (các dự án chưa được đặt tên). Mỗi dự án phải có ít nhất 1 người. Hỏi có bao nhiêu cách chia?
]

#theory-layout(
  [
    #cach2-box[
      Đây đúng chuẩn là chia 8 người phân biệt vào 3 nhóm vô danh (không rỗng), tức là số Stirling loại hai $S_8^3$.
      
      *Cách 1: Trắc nghiệm (Bấm Casio 5 giây)*
      Bấm trực tiếp công thức tổng Sigma với $n=8, k=3$:
      `1/3! * \sum_{X=0}^3 ( (-1)^(3-X) * 3CX * X^8 )`
      Màn hình hiện ngay kết quả: $966$. Xong bài!
      
      *Cách 2: Tự luận (Hàm sinh + Nhặt hệ số siêu tốc)*
      EGF của 3 nhóm vô danh là $frac((e^x - 1)^3, 3!)$.
      Số cách là:
      $N = 8! [x^8] frac((e^x - 1)^3, 3!).$
      
      Khai triển tử số: $(e^x - 1)^3 = e^(3x) - 3 e^(2x) + 3 e^x - 1.$
      Thay $e^(k x)$ bằng $k^8$ (theo Bí kíp 1.6):
      $N = frac(3^8 - 3 dot 2^8 + 3 dot 1^8 - 0, 3!) = frac(6561 - 3 dot 256 + 3, 6) = 966.$
      
      Vậy có *966 cách*. Cả 2 cách đều cho ra kết quả khớp nhau hoàn toàn!
    ]
  ],
  side-note(title: "Nhắc bài", [
    Khi đã thuộc bài, bạn không cần phải cắm cúi viết $(e^x - 1)^k$ ra nháp nữa. 
    Cứ hễ thấy cụm từ "Vật phân biệt, Hộp vô danh, Không rỗng" là tự tin lấy Casio ra bấm thẳng số Stirling.
  ])
)

== 6. Bài 5 - Số Bell (Đỉnh cao Casio)
#eg-box(title: [Đề bài])[
  Cô giáo muốn chia 6 học sinh vào các nhóm thảo luận (không quy định số lượng nhóm, miễn là mỗi học sinh đều có nhóm). Các nhóm hoàn toàn vô danh. Hỏi có tổng cộng bao nhiêu cách chia?
]

#theory-layout(
  [
    #cach2-box[
      Đề bài không cho trước số nhóm. Do có 6 học sinh nên số nhóm $k$ có thể chạy từ $1$ đến $6$.
      Tổng số cách (còn gọi là số Bell $B_6$) chính là tổng các số Stirling:
      $N = S_6^1 + S_6^2 + S_6^3 + S_6^4 + S_6^5 + S_6^6.$
      
      *Cách 1: Tự luận (Hàm sinh)*
      Ta sẽ phải tính $N = sum_(k=1)^6 6! [x^6] frac((e^x - 1)^k, k!)$.
      Việc phải khai triển tay từ bậc 1 đến bậc 6 của $(e^x - 1)^k$ trong phòng thi là "nhiệm vụ bất khả thi" và cực kỳ dễ tính nhầm.
      
      *Cách 2: Trắc nghiệm (Casio cứu mạng)*
      Sử dụng Casio tính từng số hạng cực nhanh (chỉ cần ấn nút `LEFT` đổi cận trên và đổi mẫu số $k!$ là xong):
      - $S_6^1 = 1$
      - $S_6^2 = 31$ (Bấm Casio `k=2, n=6`)
      - $S_6^3 = 90$ (Bấm Casio `k=3, n=6`)
      - $S_6^4 = 65$ (Bấm Casio `k=4, n=6`)
      - $S_6^5 = 15$ (Bấm Casio `k=5, n=6`)
      - $S_6^6 = 1$ (Hiển nhiên 6 người vào 6 nhóm thì mỗi người 1 nhóm).
      
      Cộng lại: $N = 1 + 31 + 90 + 65 + 15 + 1 = 203$.
      Vậy có *203 cách*. Casio chứng tỏ sức mạnh hủy diệt ở bài này!
    ]
  ],
  side-note(title: "Số Bell", [
    Khi bài toán không giới hạn số nhóm (chỉ yêu cầu chia hết người vào các nhóm vô danh), tổng số cách chia chính là Số Bell.
    
    Trong phòng thi, hãy nhớ dùng phím `LEFT` thần thánh của máy tính Casio để quay lại sửa số $k$ và cộng dồn các số Stirling!
  ])
)

== 7. Bài 6 - Mức vận dụng cao

#eg-box(title: [Đề bài])[
  Chia $7$ học sinh phân biệt thành đúng $3$ nhóm vô danh, không nhóm nào rỗng, sao cho *có đúng một nhóm chỉ gồm $1$ học sinh*. Hỏi có bao nhiêu cách chia?
]

#theory-layout(
  [
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
  ],
  side-note(title: "Nâng cao", [
    Với bài toán chỉ định chi tiết thành phần nhóm (ví dụ: nhóm đúng 1 người), ta không dùng số Stirling được nữa mà phải xây dựng từng EGF riêng biệt. 
    
    _Lưu ý:_ Chỉ những nhóm vô danh nào có cấu trúc *giống hệt nhau* thì ta mới gom lại và chia cho giai thừa của số lượng nhóm đó.
  ])
)

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

#theory-layout(
  [
    #cach2-box[
      OGF Euler của bài toán là
      $P_3(x) = frac(1, (1 - x)(1 - x^2)(1 - x^3)).$

      Ta cần hệ số của $x^6$.

      Việc lấy hệ số này tương đương đếm số nghiệm nguyên không âm của
      $a + 2 b + 3 c = 6.$

      #align(center)[
        #table(
          columns: (1fr, 1.5fr, 2fr),
          align: center,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { white },
          [*Giá trị của $c$*], [*Phương trình thu được*], [*Số nghiệm $b$*],
          [$c = 0$], [$a + 2 b = 6$], [Có $4$ nghiệm ($b=0,1,2,3$)],
          [$c = 1$], [$a + 2 b = 3$], [Có $2$ nghiệm ($b=0,1$)],
          [$c = 2$], [$a + 2 b = 0$], [Có $1$ nghiệm ($b=0$)],
        )
      ]

      Tổng cộng:
      $N = 4 + 2 + 1 = 7.$

      Vậy có *7 kiểu chia*.
      
      _Cụ thể 7 kiểu chia (phân hoạch của 6 thành nhiều nhất 3 phần) đó là:_
      - $6$ (vào 1 hộp)
      - $5 + 1$ (vào 2 hộp)
      - $4 + 2$ (vào 2 hộp)
      - $3 + 3$ (vào 2 hộp)
      - $4 + 1 + 1$ (vào 3 hộp)
      - $3 + 2 + 1$ (vào 3 hộp)
      - $2 + 2 + 2$ (vào 3 hộp)
    ]
  ],
  side-note(title: "Nhắc bài", [
    Dấu hiệu Case 4: Cả vật và hộp đều giống nhau $\to$ Phân hoạch số.
    
    Phương trình đếm nghiệm $a+2b+3c=...$ được suy ra trực tiếp từ các số mũ trong phần mẫu của Tích Euler $(1-x)(1-x^2)(1-x^3)$.
  ])
)

== 3. Bài 2 - Mức thông hiểu

#eg-box(title: [Đề bài])[
  Chia $9$ vật giống nhau vào *đúng $4$* hộp vô danh, mỗi hộp đều không rỗng. Hỏi có bao nhiêu kiểu chia?
]

#theory-layout(
  [
    #cach2-box[
      “Đúng $4$ hộp không rỗng” nghĩa là ta đang phân hoạch $9$ thành đúng $4$ phần dương.

      OGF tương ứng là
      $Q(x) = frac(x^4, (1 - x)(1 - x^2)(1 - x^3)(1 - x^4)).$

      Vì vậy số cách là hệ số của $x^9$, tức là hệ số của $x^5$ trong
      $frac(1, (1 - x)(1 - x^2)(1 - x^3)(1 - x^4)).$

      Điều này tương đương đếm số nghiệm nguyên không âm của
      $a + 2 b + 3 c + 4 d = 5.$

      #align(center)[
        #table(
          columns: (1fr, 2fr, 2fr),
          align: center,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { white },
          [*Giá trị của $d$*], [*Phương trình thu được*], [*Số nghiệm $c, b$*],
          [$d = 0$], [$a + 2 b + 3 c = 5$], [Có $5$ nghiệm],
          [$d = 1$], [$a + 2 b + 3 c = 1$], [Có $1$ nghiệm],
        )
      ]

      Tổng cộng:
      $N = 5 + 1 = 6.$

      Vậy có *6 kiểu chia*.
      
      _Cụ thể 6 kiểu chia đó là (các phân hoạch của 9 thành đúng 4 phần dương):_
      - $6 + 1 + 1 + 1$
      - $5 + 2 + 1 + 1$
      - $4 + 3 + 1 + 1$
      - $4 + 2 + 2 + 1$
      - $3 + 3 + 2 + 1$
      - $3 + 2 + 2 + 2$
    ]
  ],
  side-note(title: "Dịch chuyển", [
    Với yêu cầu "Đúng $4$ hộp không rỗng", mẹo ở đây là ta "đặt cọc" trước vào mỗi hộp 1 vật. 
    
    Tức là đã dùng $4$ vật, còn lại $5$ vật tự do. Lúc này bài toán mới quay về đúng chuẩn: "chia $5$ vật vào nhiều nhất $4$ hộp".
  ])
)

== 4. Bài 3 - Mức vận dụng

#eg-box(title: [Đề bài])[
  Hỏi có bao nhiêu phân hoạch của $8$ thành các số hạng *lẻ*?
]

#theory-layout(
  [
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
  ],
  side-note(title: "Định lý kỳ diệu", [
    Bài này vận dụng một định lý cực hay của Euler: "Số cách phân hoạch một số thành các phần *lẻ* luôn luôn BẰNG số cách phân hoạch số đó thành các phần *phân biệt*".
    
    Nhờ định lý này, ta chỉ cần đếm cách chia các phần phân biệt là ra đáp án!
  ])
)

== 5. Bài 4 - Mức vận dụng cao

#eg-box(title: [Đề bài])[
  Chia $12$ vật giống nhau vào đúng $4$ hộp vô danh, mỗi hộp đều có ít nhất $2$ vật. Hỏi có bao nhiêu kiểu chia?
]

#theory-layout(
  [
    #cach2-box[
      Vì mỗi hộp có ít nhất $2$ vật và có đúng $4$ hộp, nên trước hết ta đặt sẵn $2$ vật vào mỗi hộp. Như vậy đã dùng hết $8$ vật, còn lại $4$ vật để phân phối thêm.

      Sau bước dịch này, bài toán trở thành:

      “Phân hoạch $4$ thành nhiều nhất $4$ phần”.

      OGF tương ứng là
      $frac(1, (1 - x)(1 - x^2)(1 - x^3)(1 - x^4)).$

      Ta cần hệ số của $x^4$, tức là đếm số nghiệm nguyên không âm của
      $a + 2 b + 3 c + 4 d = 4.$

      #align(center)[
        #table(
          columns: (1fr, 2fr, 2fr),
          align: center,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { white },
          [*Giá trị của $d$*], [*Phương trình thu được*], [*Số nghiệm $c, b$*],
          [$d = 0$], [$a + 2 b + 3 c = 4$], [Có $4$ nghiệm],
          [$d = 1$], [$a + 2 b + 3 c = 0$], [Có $1$ nghiệm],
        )
      ]

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
  ],
  side-note(title: "Dịch chuyển kép", [
    Tương tự Bài 2, ta "cài cắm" trước vật vào hộp để triệt tiêu điều kiện dư thừa.
    
    4 hộp, mỗi hộp ít nhất 2 vật $\to$ cài sẵn $4 times 2 = 8$ vật. Còn lại đúng $4$ vật thả tự do vào *nhiều nhất* 4 hộp.
  ])
)

== 6. Bài 5 - Toán thực tế (Phân phối tiền)

#eg-box(title: [Đề bài])[
  An có 10 nghìn đồng, muốn mua các con tem có mệnh giá 1k, 2k và 5k sao cho vừa hết số tiền. Hỏi An có bao nhiêu cách mua?
]

#theory-layout(
  [
    #cach2-box[
      Gọi số tem 1k, 2k, 5k lần lượt là $a, b, c$.
      Ta cần tìm số nghiệm nguyên không âm của phương trình:
      $a + 2b + 5c = 10.$

      Phương trình này tương đương với việc tìm hệ số của $x^{10}$ trong khai triển Tích Euler:
      $frac(1, (1-x)(1-x^2)(1-x^5)).$

      Ta lập bảng biện luận theo $c$ (vì $c$ có hệ số lớn nhất):

      #align(center)[
        #table(
          columns: (1fr, 2fr, 2fr),
          align: center,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { white },
          [*Giá trị $c$*], [*Phương trình thu được*], [*Số nghiệm $b$*],
          [$c = 0$], [$a + 2b = 10$], [Có $6$ nghiệm ($b=0..5$)],
          [$c = 1$], [$a + 2b = 5$], [Có $3$ nghiệm ($b=0,1,2$)],
          [$c = 2$], [$a + 2b = 0$], [Có $1$ nghiệm ($b=0$)],
        )
      ]

      Tổng cộng: $N = 6 + 3 + 1 = 10.$

      Vậy có *10 cách mua tem*.
    ]
  ],
  side-note(title: "Tính thực tiễn", [
    Phân hoạch số không chỉ là lý thuyết suông! 
    
    Bài toán đổi tiền là minh chứng rõ ràng nhất của dạng Tích Euler: mỗi tờ tiền/con tem là một hộp, nhưng ta không đếm số lượng hộp, ta chỉ đếm Mệnh giá (kích thước của phần).
  ])
)

== 7. Bài 6 - Giới hạn kích thước (Mức vận dụng cao)

#eg-box(title: [Đề bài])[
  Hỏi có bao nhiêu phân hoạch của 8 thành các số hạng không vượt quá 3?
]

#theory-layout(
  [
    #cach2-box[
      Vì các số hạng không vượt quá 3, nên ta chỉ được phép dùng các số 1, 2, 3.
      
      Hàm sinh tương ứng (chỉ có các mẫu chứa bậc 1, 2, 3) là:
      $P(x) = frac(1, (1-x)(1-x^2)(1-x^3)).$

      Ta cần tìm hệ số của $x^8$, tức là số nghiệm của phương trình:
      $a + 2b + 3c = 8.$

      Lập bảng biện luận theo $c$:

      #align(center)[
        #table(
          columns: (1fr, 2fr, 2fr),
          align: center,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { white },
          [*Giá trị $c$*], [*Phương trình thu được*], [*Số nghiệm $b$*],
          [$c = 0$], [$a + 2b = 8$], [Có $5$ nghiệm],
          [$c = 1$], [$a + 2b = 5$], [Có $3$ nghiệm],
          [$c = 2$], [$a + 2b = 2$], [Có $2$ nghiệm],
        )
      ]

      _Chú ý:_ Không có $c=3$ vì $3 times 3 = 9 > 8$.

      Tổng cộng: $N = 5 + 3 + 2 = 10.$

      Vậy có *10 cách*.
    ]
  ],
  side-note(title: "Giới hạn thành phần", [
    Dạng bài Giới hạn kích thước rất hay gặp. 
    
    Chặn trên ở kích thước nào ($k=3$) thì Tích Euler chỉ nhân đến mẫu số $(1-x^3)$ là dừng lại.
  ])
)

== 8. Bài 7 - Dịch biến thu nhỏ (Phân hoạch chẵn)

#eg-box(title: [Đề bài])[
  Hỏi có bao nhiêu phân hoạch của 12 thành các số hạng *chẵn*?
]

#theory-layout(
  [
    #cach2-box[
      Vì các số hạng đều chẵn, ta chỉ được dùng các phần có kích thước là $2, 4, 6, 8, 10, 12$.
      
      Phương trình phân hoạch là:
      $2a + 4b + 6c + 8d + 10e + 12f = 12.$

      Nhận thấy tất cả các hệ số đều chia hết cho 2, ta chia cả hai vế cho 2:
      $a + 2b + 3c + 4d + 5e + 6f = 6.$

      Phương trình này chính là phương trình đếm số phân hoạch của 6 thành các phần bất kỳ!

      *Ta liệt kê các phân hoạch của 6:*
      - 1 phần: $6$ (1 cách)
      - 2 phần: $5 + 1, 4 + 2, 3 + 3$ (3 cách)
      - 3 phần: $4 + 1 + 1, 3 + 2 + 1, 2 + 2 + 2$ (3 cách)
      - 4 phần: $3 + 1 + 1 + 1, 2 + 2 + 1 + 1$ (2 cách)
      - 5 phần: $2 + 1 + 1 + 1 + 1$ (1 cách)
      - 6 phần: $1 + 1 + 1 + 1 + 1 + 1$ (1 cách)

      Tổng cộng: $1 + 3 + 3 + 2 + 1 + 1 = 11$ phân hoạch của 6.

      Vậy số phân hoạch của 12 thành các số hạng chẵn là *11*.
    ]
  ],
  side-note(title: "Thu nhỏ bài toán", [
    Mẹo "chém đôi": Phân hoạch số $2N$ thành các phần CHẴN thực chất chính là bài toán phân hoạch số $N$ thành các phần BẤT KỲ. 
    
    Chỉ một bước chia 2, bài toán đã nhẹ đi một nửa!
  ])
)

== 9. Bài 8 - Nghiệm nguyên hệ số tự do

#eg-box(title: [Đề bài])[
  Tìm số nghiệm nguyên không âm của phương trình: $3x + 5y + 7z = 30$.
]

#theory-layout(
  [
    #cach2-box[
      Đây là phương trình Diophantine với hệ số không liên tiếp. Nó tương đương với việc tìm hệ số của $x^{30}$ trong khai triển Tích Euler:
      $frac(1, (1-x^3)(1-x^5)(1-x^7)).$

      Ta lập bảng biện luận theo $z$ (ẩn có hệ số lớn nhất để bảng ngắn nhất):

      #align(center)[
        #table(
          columns: (1fr, 2fr, 3fr),
          align: center,
          fill: (col, row) => if row == 0 { rgb("E8EAF6") } else { white },
          [*Giá trị $z$*], [*Phương trình thu được*], [*Số nghiệm $x$ và $y$*],
          [$z = 0$], [$3x + 5y = 30$], [Có $3$ nghiệm ($y=0,3,6$)],
          [$z = 1$], [$3x + 5y = 23$], [Có $2$ nghiệm ($y=1,4$)],
          [$z = 2$], [$3x + 5y = 16$], [Có $1$ nghiệm ($y=2$)],
          [$z = 3$], [$3x + 5y = 9$], [Có $1$ nghiệm ($y=0 -> x=3$)],
          [$z = 4$], [$3x + 5y = 2$], [Có $0$ nghiệm (2 quá nhỏ)],
        )
      ]

      _(Giải thích mẹo nhẩm: Ở pt $3x+5y=30$, ta có $3x = 30-5y = 5(6-y)$. Vì $3x$ chia hết cho 3, nên $(6-y)$ phải chia hết cho 3, kết hợp $y \le 6$ suy ra $y \in {0,3,6}$)._

      Tổng cộng: $N = 3 + 2 + 1 + 1 = 7.$

      Vậy phương trình có *7 nghiệm nguyên không âm*.
    ]
  ],
  side-note(title: "Hệ số tự do", [
    Đây là dạng bài hay gặp nhất trong thi HSG và Đại học. 
    
    Bí quyết giải siêu nhanh: Luôn chọn ẩn có *hệ số lớn nhất* để lập bảng, số trường hợp cần xét sẽ giảm đi đáng kể. Nhẩm nghiệm dựa vào tính chia hết.
  ])
)

== 10. Bài 9 - Sự đối xứng huyền thoại (Biểu đồ Ferrers)

#eg-box(title: [Đề bài])[
  Chứng minh rằng: Số cách chia 10 vật giống nhau vào *nhiều nhất 4 hộp* vô danh LUÔN BẰNG số cách phân hoạch 10 thành *các phần không vượt quá 4*.
]

#theory-layout(
  [
    #cach2-box[
      Đề bài yêu cầu chứng minh sự bằng nhau giữa 2 bài toán đếm tưởng chừng không liên quan:
      1. Phân hoạch 10 thành nhiều nhất 4 phần.
      2. Phân hoạch 10 thành các phần có kích thước tối đa là 4.

      *Chứng minh bằng Biểu đồ Ferrers:*
      Xét một phân hoạch của 10 thành nhiều nhất 4 phần, ví dụ: $10 = 4 + 3 + 2 + 1$.
      Ta vẽ biểu đồ bằng các dấu chấm, mỗi phần là một hàng ngang:
      $dots.c dots.c dots.c dots.c$  (4)
      $dots.c dots.c dots.c$         (3)
      $dots.c dots.c$                (2)
      $dots.c$                       (1)

      Bây giờ, ta "nhìn dọc" biểu đồ này (chuyển vị), ta đếm số chấm trên mỗi cột dọc:
      Cột 1 có 4 chấm.
      Cột 2 có 3 chấm.
      Cột 3 có 2 chấm.
      Cột 4 có 1 chấm.
      
      Phân hoạch mới đọc theo cột dọc là: $4 + 3 + 2 + 1$. Kích thước lớn nhất của một cột bằng chính *số hàng* của biểu đồ cũ. Vì số hàng $\le 4$ nên kích thước các phần mới cũng $\le 4$.

      Sự biến đổi "Hàng $arrow.l.r$ Cột" này là một song ánh. Cứ mỗi cách xếp $\le 4$ hàng, ta lại thu được một cách xếp mà mỗi cột $\le 4$ chấm. 
      Do đó, số lượng hai loại phân hoạch này luôn bằng nhau. (ĐPCM)
    ]
  ],
  side-note(title: "Biểu đồ Ferrers", [
    Phép lật "Hàng - Cột" của Biểu đồ Ferrers là một trong những vẻ đẹp toán học vĩ đại nhất của Phân hoạch số. 
    
    Nhờ nó, ta biến đổi bài toán "Chặn trên số lượng" thành bài toán "Chặn trên kích thước", đưa 2 bài về chung một đáp số!
  ])
)

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
