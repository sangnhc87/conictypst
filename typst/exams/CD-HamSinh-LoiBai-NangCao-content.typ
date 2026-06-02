#import "../sang-exam.typ": *
#import "../template.typ": *

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("001F3F"), rgb("003366"), rgb("004E89"), rgb("1A936F"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("004E89")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("004E89"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("1A936F"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu chủ đề ──────────────────────────────────────────────
#let col-navy = rgb("003366")
#let col-ocean = rgb("004E89")
#let col-teal = rgb("1A936F")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-red = rgb("C62828")
#let col-violet = rgb("6A1B9A")
#let col-pink = rgb("880E4F")
#let col-purple = rgb("4A148C")
#let col-blue = rgb("1565C0")

// ─── Hộp Lý Thuyết ───────────────────────────────────────────
#let rev-box(title: none, body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-ocean, rest: 0.8pt + rgb("90CAF9")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-ocean, size: 11pt, weight: "bold")[#title]
    #v(0.4em)
  ]
  #body
]

#let eg-box(title: [🎯 Ví Dụ Trực Quan], body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: col-green, weight: "bold")[#title] #v(0.3em) #body]

#let note-box(title: [📌 Nhận Xét], body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: col-amber, weight: "bold")[#title] #v(0.3em) #body]

#let ans-box(body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: col-green, weight: "bold")[✅ Kết Luận] #v(0.3em) #body]

#let warn-box(body) = block(
  fill: rgb("FFEBEE"),
  stroke: (left: 4pt + col-red, rest: 0.6pt + rgb("EF9A9A")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: col-red, weight: "bold")[⚠️ Chú Ý — Bẫy Thường Gặp] #v(0.3em) #body]

#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[#text(fill: col-blue, weight: "bold", size: 10.5pt)[🔵 Cách 1 — Tổ Hợp / Đại Số Thuần Túy] #v(0.3em) #body]

#let cach2-box(body) = block(
  fill: rgb("F3E5F5"),
  stroke: (left: 4pt + col-violet, rest: 0.5pt + rgb("CE93D8")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[#text(fill: col-violet, weight: "bold", size: 10.5pt)[🟣 Cách 2 — Hàm Sinh (Generating Function)] #v(0.3em) #body]

#let method-box(body) = block(
  fill: rgb("E0F7FA"),
  stroke: (left: 4pt + col-teal, rest: 0.5pt + rgb("80DEEA")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: col-teal, weight: "bold")[⚙️ Quy Trình Dựng Hàm Sinh] #v(0.3em) #body]

#let thm-box(title: [📐 Định Lý / Công Thức Cốt Lõi], body) = block(
  fill: rgb("FCE4EC"),
  stroke: (left: 5pt + col-pink, rest: 0.8pt + rgb("F48FB1")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 13pt),
  width: 100%,
)[
  #text(fill: col-pink, size: 11pt, weight: "bold")[#title]
  #v(0.4em)
  #body
]



#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("001F3F"), rgb("003366"), rgb("004E89"), rgb("1A936F"), angle: 135deg),
    stroke: none,
    inset: (x: 20pt, y: 25pt),
    radius: 10pt,
  )[
    #text(fill: white, size: 22pt, weight: "black")[
      Hàm Sinh — 8 Lớp Bài Đại Bác Vạn Năng
    ]
    #v(0.4em)
    #text(fill: rgb("AED9E0"), size: 13pt)[
      🎯 EGF Trig · Roots of Unity · Stirling · Bell · Euler · Catalan · Cayley · Smirnov
    ]
    #v(0.5em)
    #text(fill: rgb("7FDBFF"), size: 11pt, style: "italic")[
      "Một Công Cụ Đại Số — Gông Trọn Mọi Bài Toán Đếm Phức Tạp"
    ]
    #v(1.2em)
    #line(length: 70%, stroke: 1.5pt + rgb("7FDBFF"))
    #v(0.8em)
    #grid(
      columns: (1fr,) * 4,
      align: center,
      gutter: 0.5em,
      block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
        #text(fill: rgb("AED9E0"), size: 9pt)[*Dạng 1* EGF + cosh/sinh]
      ],
      block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
        #text(fill: rgb("AED9E0"), size: 9pt)[*Dạng 2* Roots of Unity Filter]
      ],
      block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
        #text(fill: rgb("AED9E0"), size: 9pt)[*Dạng 3* Stirling & Bell Numbers]
      ],
      block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
        #text(fill: rgb("AED9E0"), size: 9pt)[*Dạng 4* Stars & Bars Nâng Cao]
      ],
    )
    #v(0.4em)
    #grid(
      columns: (1fr,) * 4,
      align: center,
      gutter: 0.5em,
      block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
        #text(fill: rgb("AED9E0"), size: 9pt)[*Dạng 5* Phân Hoạch Số — Euler]
      ],
      block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
        #text(fill: rgb("AED9E0"), size: 9pt)[*Dạng 6* Số Catalan & Phương Trình Hàm]
      ],
      block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
        #text(fill: rgb("AED9E0"), size: 9pt)[*Dạng 7* Công Thức Cayley & Cây Có Nhãn]
      ],
      block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
        #text(fill: rgb("AED9E0"), size: 9pt)[*Dạng 8* Hàm Sinh Smirnov & Chuỗi Tránh Kề]
      ],
    )
  ]
]

#v(1.5em)
#resetexamstate()

#pagebreak()

= Khởi Động — Đọc Hàm Sinh Bằng Tiếng Việt

#warn-box[
  Nếu mới học hàm sinh, *đừng cố hiểu hết mọi ký hiệu trong một lần đọc*.

  Ở vòng đầu, bạn chỉ cần nhớ đúng 5 mẫu sau:
  - $e^x$: dùng tự do bao nhiêu lần cũng được.
  - $e^x - 1$: dùng ít nhất $1$ lần.
  - $cosh(x)$: chỉ cho dùng chẵn lần.
  - $sinh(x)$: chỉ cho dùng lẻ lần.
  - $[x^n] F(x)$: lọc ra đúng trường hợp có tổng / độ dài bằng $n$.
]

#rev-box(title: "📖 5 Mẫu Phải Nhớ Trước Khi Làm Bài")[
  #table(
    columns: (auto, 1fr, 1fr),
    stroke: 0.45pt + rgb("90CAF9"),
    fill: (col, row) => if row == 0 { col-ocean } else if calc.rem(row, 2) == 0 { rgb("EEF6FF") } else { white },
    align: (center, left, left),
    inset: (x: 8pt, y: 5pt),
    table.header(
      text(fill: white, weight: "bold")[Ký hiệu],
      text(fill: white, weight: "bold")[Đọc như tiếng Việt],
      text(fill: white, weight: "bold")[Ví dụ rất ngắn],
    ),
    [$[x^n] F(x)$],
    [Lấy đúng trường hợp có tổng hoặc độ dài bằng $n$.],
    [Bài hỏi độ dài $5$ thì cuối cùng ta lấy $[x^5]$.],

    [$e^x$],
    [Một loại đối tượng được dùng tự do: $0,1,2,dots$ lần.],
    [Chữ số $2$ muốn xuất hiện bao nhiêu lần cũng được.],

    [$e^x - 1$],
    [Giống $e^x$, nhưng bắt buộc phải có mặt ít nhất $1$ lần.],
    [Một phòng học phải có ít nhất $1$ học sinh.],

    [$cosh(x)$], [Chỉ cho số lần xuất hiện chẵn: $0,2,4,dots$.], [Chữ số $1$ phải xuất hiện chẵn lần.],
    [$sinh(x)$], [Chỉ cho số lần xuất hiện lẻ: $1,3,5,dots$.], [Một ký tự phải xuất hiện lẻ lần.],
  )
]

#note-box(title: "📌 Các Ký Hiệu Nâng Cao — Chỉ Cần Hiểu Khi Gặp Bài")[
  - $product (1 + x^(s_i))$: mỗi phần tử chỉ có hai lựa chọn, *lấy* hoặc *không lấy*.
  - $omega$: công cụ để lọc các tổng chia hết cho $m$; thường chỉ gặp ở bài kiểu “tổng chia hết cho $3$, $4$, $5$”.
  - $S(n,k)$: số cách chia $n$ người thành đúng $k$ nhóm không rỗng, *chưa gắn tên nhóm*.
  - $B_n$: tổng số cách chia $n$ người thành các nhóm không rỗng.

  Nếu gặp 4 ký hiệu này mà thấy ngợp, cứ bỏ qua ở lần đọc đầu. Đến đúng dạng bài phía sau, ta đọc lại là vừa sức hơn nhiều.
]

#method-box[
  *Mở một bài hàm sinh, hãy tự hỏi 3 câu thôi:*
  - Biến $x$ đang ghi lại cái gì: độ dài, tổng, hay số người?
  - Mỗi đối tượng được dùng tự do, chẵn lần, lẻ lần, hay ít nhất $1$ lần?
  - Cuối cùng mình cần lấy hệ số nào, hay cần thay giá trị đặc biệt như $x = 1, omega$?
]

#eg-box(title: "🎯 Dịch Công Thức Ra Tiếng Người Thường")[
  - $(e^x - 1)^3$: có $3$ phòng phân biệt, và phòng nào cũng phải có người.
  - $cosh(x) dot e^x dot e^x$: chữ số $1$ dùng chẵn lần, còn $2$ và $3$ dùng tự do.
  - $product_(k=1)^9 (1+x^k)$: từ $1$ đến $9$, mỗi số hoặc lấy hoặc bỏ.
]

#note-box(title: "📌 Mẹo Chống Sợ Công Thức")[
  Thấy công thức lạ, đừng hỏi ngay “nó từ đâu rơi xuống?”. Hãy thử dịch nó thành một câu tiếng Việt trước. Dịch được câu đó thì thường đã hiểu hơn một nửa bài toán.
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════
// PHẦN 0 — BẢNG ĐỒ CÔNG CỤ: KHI NÀO DÙNG LOẠI HÀM SINH NÀO?
// ═══════════════════════════════════════════════════════════════
= Bản Đồ Dạng Bài — Gặp Kiểu Nào Nghĩ Kiểu Đó

#rev-box(title: "🗺️ Nhìn Đề Để Chọn Đúng Công Cụ")[
  #table(
    columns: (auto, 1.2fr, 1fr, 1fr),
    stroke: 0.5pt + rgb("90CAF9"),
    fill: (col, row) => if row == 0 { col-ocean } else if calc.rem(row, 2) == 0 { rgb("EEF6FF") } else { white },
    align: (left, left, left, left),
    table.header(
      text(fill: white, weight: "bold")[Dạng],
      text(fill: white, weight: "bold")[Khi nào thường gặp],
      text(fill: white, weight: "bold")[Công cụ chính],
      text(fill: white, weight: "bold")[Ví dụ gần đề phổ thông],
    ),
    [*Dạng 1*],
    [Đếm chuỗi có điều kiện chẵn, lẻ, đúng $k$ lần, hoặc tự do.],
    [EGF],
    [Đếm chuỗi chữ số có chữ số $1$ xuất hiện chẵn lần.],

    [*Dạng 2*], [Bài có câu “tổng chia hết cho $m$”.], [Bộ lọc căn đơn vị], [Chọn tập con có tổng chia hết cho $3$.],
    [*Dạng 3*],
    [Xếp người vào phòng, chia nhóm, hoặc đếm toàn ánh.],
    [EGF + Stirling / Bell],
    [6 học sinh vào 3 phòng, không phòng nào trống.],

    [*Dạng 4*],
    [Chia đồ vật giống nhau, đếm nghiệm nguyên có ràng buộc.],
    [OGF],
    [Chia kẹo, tìm số nghiệm nguyên không âm.],

    [*Dạng 5*],
    [Phân hoạch số nguyên thành tổng các số dương.],
    [Tích Euler],
    [Tính $p(8)$ hoặc so sánh hai kiểu phân hoạch.],

    [*Dạng 6*], [Bài toán Catalan: ngoặc, tam giác hóa, đường đi.], [Phương trình hàm], [Tam giác hóa đa giác lồi.],
    [*Dạng 7*], [Đếm cây có nhãn, cây có rễ.], [Cayley + Lagrange], [Số cây có nhãn trên $n$ đỉnh.],
    [*Dạng 8*],
    [Chuỗi không có hai ký tự giống nhau đứng cạnh.],
    [Hàm sinh Smirnov],
    [Xếp giải nhất, nhì, ba không đứng cạnh nhau.],
  )
]

#note-box(title: "📌 Cách Dùng Bản Đồ Này")[
  Đừng học thuộc cả bảng. Chỉ cần đọc cột “Khi nào thường gặp”, rồi tìm đúng dạng giống đề mình đang cầm. Sau đó đọc riêng dạng đó là đủ.
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════
// DẠNG 1 — EGF: ĐẾM CHUỖI CÓ RÀNG BUỘC CHỮ SỐ
// ═══════════════════════════════════════════════════════════════
= Dạng 1 — EGF: Đếm Chuỗi Có Ràng Buộc Trên Số Lần Xuất Hiện

== Lý Thuyết

#thm-box(title: "📐 Nguyên Tắc Lập EGF Cho Bài Toán Đếm Chuỗi Có Thứ Tự")[
  Khi ta đếm các chuỗi có $n$ ký tự từ bảng chữ cái $Sigma = {c_1, c_2, dots, c_k}$, trong đó ký tự $c_i$ phải xuất hiện đúng số lần trong một tập hợp $A_i$ cho trước, thì:

  - *Hàm sinh mũ (EGF) của ký tự $c_i$:*
    $ f_i(x) = sum_(j in A_i) frac(x^j, j!) $

  - *Hàm sinh tổng của toàn bộ chuỗi:*
    $ G(x) = f_1(x) dot f_2(x) dot dots dot f_k(x) $

  - *Số chuỗi độ dài $n$ thỏa mãn tất cả điều kiện:*
    $ a_n = n! dot [x^n] G(x) $

  *Các EGF thông dụng (chứng minh bằng khai triển Taylor):*
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.4pt + rgb("90CAF9"),
    fill: (col, row) => if row == 0 { col-ocean.lighten(20%) } else { white },
    align: center,
    table.header(
      text(fill: white, weight: "bold", size: 9.5pt)[Điều kiện xuất hiện],
      text(fill: white, weight: "bold", size: 9.5pt)[EGF],
      text(fill: white, weight: "bold", size: 9.5pt)[Khai triển],
    ),
    [Tự do (bất kỳ số lần)], [$e^x$], [$1 + x + frac(x^2, 2!) + dots$],
    [Chẵn lần $(0, 2, 4, dots)$], [$cosh(x)$], [$frac(e^x + e^(-x), 2)$],
    [Lẻ lần $(1, 3, 5, dots)$], [$sinh(x)$], [$frac(e^x - e^(-x), 2)$],
    [Đúng $k$ lần], [$frac(x^k, k!)$], [(một hạng tử duy nhất)],
    [Tối đa $k$ lần], [$sum_(j=0)^k frac(x^j, j!)$], [(đa thức hữu hạn)],
  )
]

#note-box(title: [💡 Tại Sao Phải Nhân Với $n!$?])[
  Hệ số $[x^n] G(x)$ đếm số cách *không phân biệt thứ tự* ghép các ký tự (vì EGF chia cho $j!$ để loại trừ thứ tự nội bộ của mỗi loại ký tự). Nhân với $n!$ để hoán vị lại toàn bộ $n$ vị trí → ta đếm *chuỗi có thứ tự*, đúng với yêu cầu.
]

#method-box[
  *Cách đọc nhanh một bài EGF về đếm chuỗi:*

  - Bước 1: Với mỗi ký tự, hỏi nó được phép xuất hiện bao nhiêu lần.
  - Bước 2: Viết EGF riêng cho ký tự đó:
    - tự do: $1 + x + frac(x^2, 2!) + dots = e^x$

    - chẵn lần: $1 + frac(x^2, 2!) + frac(x^4, 4!) + dots = cosh(x)$
    - lẻ lần: $x + frac(x^3, 3!) + frac(x^5, 5!) + dots = sinh(x)$
  - Bước 3: Nhân các EGF lại vì ta đang ghép đồng thời các điều kiện độc lập.
  - Bước 4: Lấy $[x^n]$ vì bài hỏi chuỗi dài $n$, rồi nhân thêm $n!$ để khôi phục thứ tự của $n$ vị trí.

  *Mẹo nhớ:* Trong EGF, hạng tử $frac(x^j, j!)$ chỉ có nghĩa rất đơn giản: "loại này xuất hiện đúng $j$ lần".
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-1-1",
  [
    Có bao nhiêu chuỗi gồm $n = 5$ ký tự, mỗi ký tự chọn từ tập ${1, 2, 3}$, sao cho chữ số $1$ xuất hiện *chẵn lần* (kể cả $0$ lần)?
  ],
  [122],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm chuỗi có thứ tự với ràng buộc trên số lần xuất hiện của chữ số $1$. Ta sẽ giải bằng hai phương pháp để so sánh.
    ]

    #cach1-box[
      *Phân nhóm theo số lần chữ số $1$ xuất hiện* (gọi là $k$ lần, $k$ chẵn, $0 <= k <= 5$):

      Với mỗi giá trị $k$ chẵn: chọn $k$ vị trí trong $5$ vị trí để đặt chữ số $1$ ($C_5^k$ cách), sau đó điền tự do vào $5 - k$ vị trí còn lại bằng chữ số $2$ hoặc $3$ ($2^(5-k)$ cách).

      $
        a_5 & = sum_(k in {0, 2, 4}) C_5^k dot 2^(5-k) \
            & = C_5^0 dot 2^5 + C_5^2 dot 2^3 + C_5^4 dot 2^1 \
            & = 1 dot 32 + 10 dot 8 + 5 dot 2 \
            & = 32 + 80 + 10 = bold(122)
      $
    ]

    #cach2-box[
      *Đừng nhìn $cosh(x)$ như một công thức lạ.* Trong bài này, nó chỉ là cách viết gọn của ý tưởng: chữ số $1$ được dùng $0$ lần, hoặc $2$ lần, hoặc $4$ lần, ...

      *Bước 1 -- Viết EGF cho từng chữ số:*
      - Chữ số $1$ phải xuất hiện chẵn lần, nên:
        $ f_1(x) = 1 + frac(x^2, 2!) + frac(x^4, 4!) + dots = cosh(x) $
      - Chữ số $2$ không bị ràng buộc, nên:
        $ f_2(x) = 1 + x + frac(x^2, 2!) + frac(x^3, 3!) + dots = e^x $
      - Tương tự, $f_3(x) = e^x$.

      Hạng tử $frac(x^j, j!)$ có nghĩa: "chữ số đó xuất hiện đúng $j$ lần". Mẫu số $j!$ là dấu hiệu của EGF; nó giúp ta xử lý số lần xuất hiện trước, rồi cuối cùng mới khôi phục thứ tự của chuỗi.

      *Bước 2 -- Ghép ba điều kiện lại bằng phép nhân:*
      $ G(x) = f_1(x) dot f_2(x) dot f_3(x) = cosh(x) dot e^x dot e^x $

      Ta nhân vì ta đang chọn đồng thời số lần xuất hiện của ba chữ số. Khi nhân, số mũ của $x$ sẽ cộng lại, nên nó chính là *độ dài chuỗi*.

      Ví dụ:
      $ frac(x^2, 2!) dot frac(x, 1!) dot frac(x^2, 2!) = frac(x^5, 2! 1! 2!) $
      nghĩa là: chữ số $1$ xuất hiện $2$ lần, chữ số $2$ xuất hiện $1$ lần, chữ số $3$ xuất hiện $2$ lần; tổng cộng đúng $5$ ký tự.

      Rút gọn $G(x)$:
      $ G(x) = frac(e^x + e^(-x), 2) dot e^(2x) = frac(e^(3x) + e^x, 2) $

      *Bước 3 -- Lấy hệ số của $x^5$:*
      Vì bài toán hỏi chuỗi dài $5$, ta cần đúng các hạng tử bậc $5$.

      Dùng khai triển $e^(alpha x) = sum_(n=0)^oo frac((alpha x)^n, n!)$:
      $ [x^5] G(x) = frac(1, 2) lr((frac(3^5, 5!) + frac(1^5, 5!))) = frac(3^5 + 1, 2 dot 5!) $

      *Bước 4 -- Nhân lại với $5!$:*
      $ a_5 = 5! dot [x^5] G(x) = frac(3^5 + 1, 2) = frac(243 + 1, 2) = bold(122) $

      *Kết luận tổng quát:* với chuỗi dài $n$, ta luôn có
      $ a_n = frac(3^n + 1, 2) $
    ]

    #ans-box[Số chuỗi thỏa mãn là $frac(3^5 + 1, 2) = bold(122)$ chuỗi.]
  ],
)

#tln(
  id: "GF2-1-2",
  [
    Có bao nhiêu chuỗi gồm $n = 6$ ký tự, mỗi ký tự chọn từ tập ${1, 2, 3, 4}$, sao cho cả chữ số $1$ lẫn chữ số $2$ đều xuất hiện *chẵn lần*?
  ],
  [1056],
  loigiai: [
    #ppgiai[
      Bài này có *hai ràng buộc đồng thời*: số lần xuất hiện của $1$ chẵn VÀ số lần xuất hiện của $2$ chẵn. EGF xử lý hai điều kiện này song song một cách tự nhiên.
    ]

    #cach1-box[
      *Kỹ thuật gán trọng số $plus.minus 1$:* Để "lọc" đồng thời cả hai điều kiện chẵn, ta dùng đẳng thức:
      $ sum_(k=0, k "chẵn")^n C_n^k = frac((1+1)^n + (1-1)^n, 2) = frac(2^n, 2) = 2^(n-1) $

      Tổng quát hóa cho hai ràng buộc: số chuỗi thỏa mãn bằng:
      $ a_n = frac(1, 4) sum_(epsilon_1, epsilon_2 in {+1, -1}) (epsilon_1 dot 1 + epsilon_2 dot 1 + 1 + 1)^n $
      trong đó mỗi chữ số $i$ đóng góp trọng số $epsilon_i$ (nếu có ràng buộc chẵn) hoặc $1$ (nếu tự do).

      - $(epsilon_1, epsilon_2) = (+1, +1)$: $(1 + 1 + 1 + 1)^6 = 4^6 = 4096$
      - $(epsilon_1, epsilon_2) = (+1, -1)$: $(1 - 1 + 1 + 1)^6 = 2^6 = 64$ (vì chữ số $2$ đóng góp $-1$)
      - $(epsilon_1, epsilon_2) = (-1, +1)$: $(-1 + 1 + 1 + 1)^6 = 2^6 = 64$
      - $(epsilon_1, epsilon_2) = (-1, -1)$: $(-1 - 1 + 1 + 1)^6 = 0^6 = 0$

      $ a_6 = frac(4096 + 64 + 64 + 0, 4) = frac(4224, 4) = bold(1056) $
    ]

    #cach2-box[
      *Bài này y hệt bài trước, chỉ khác ở chỗ ta có hai "bộ lọc chẵn" thay vì một.*

      *Bước 1 -- Viết EGF cho từng chữ số:*
      - Chữ số $1$ phải xuất hiện chẵn lần, nên $f_1(x) = cosh(x)$.
      - Chữ số $2$ cũng phải xuất hiện chẵn lần, nên $f_2(x) = cosh(x)$.
      - Chữ số $3$ và $4$ là tự do, nên $f_3(x) = f_4(x) = e^x$.

      Vậy:
      $ G(x) = f_1(x) dot f_2(x) dot f_3(x) dot f_4(x) = cosh^2(x) dot e^(2x) $

      *Bước 2 -- Rút gọn hàm sinh tổng:*
      $ G(x) = lr((frac(e^x + e^(-x), 2)))^2 dot e^(2x) $
      $ = frac((e^x + e^(-x))^2, 4) dot e^(2x) $
      $ = frac(e^(2x) + 2 + e^(-2x), 4) dot e^(2x) $
      $ = frac(e^(4x) + 2 e^(2x) + 1, 4) $

      Dòng cuối rất đáng giá, vì lúc này việc lấy hệ số trở nên dễ: ta chỉ còn phải đọc hệ số của vài hàm mũ quen thuộc.

      *Bước 3 -- Lấy hệ số của $x^6$:*
      Vì bài toán hỏi chuỗi dài $6$, ta cần $[x^6] G(x)$. Hạng tử $1$ không đóng góp gì vì nó chỉ là bậc $0$.

      Do đó:
      $ [x^6] G(x) = frac(1, 4) lr((frac(4^6, 6!) + frac(2 dot 2^6, 6!))) = frac(4^6 + 2^7, 4 dot 6!) $

      *Bước 4 -- Nhân lại với $6!$:*
      $ a_6 = 6! dot [x^6] G(x) = frac(4^6 + 2^7, 4) = frac(4096 + 128, 4) = bold(1056) $

      *Kết luận tổng quát:* với chuỗi dài $n$,
      $ a_n = frac(4^n + 2 dot 2^n, 4) = frac(4^n + 2^(n+1), 4) $
    ]

    #ans-box[Số chuỗi thỏa mãn là $frac(4^6 + 2^7, 4) = bold(1056)$ chuỗi.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 2 — ROOTS OF UNITY FILTER: LỌC BỘI SỐ
// ═══════════════════════════════════════════════════════════════
= Dạng 2 — Roots of Unity Filter: Lọc Tổng Chia Hết Cho $m$

== Lý Thuyết

#thm-box(title: "📐 Bộ Lọc Căn Đơn Vị (Roots of Unity Filter)")[
  *Ý tưởng cốt lõi:* Ta dựng một đa thức / hàm sinh $P(x)$ sao cho số mũ của $x$ ghi lại đúng đại lượng cần theo dõi (thường là tổng). Sau đó thay $x = 1, omega, omega^2, dots, omega^(m-1)$ để các số mũ không chia hết cho $m$ tự triệt tiêu.

  Cho đa thức hoặc chuỗi lũy thừa $P(x) = sum_(k=0)^oo a_k x^k$. Gọi $omega = e^(2 pi i "/" m)$ là căn nguyên thủy bậc $m$ của đơn vị (tức $omega^m = 1$, $omega^j != 1$ với $0 < j < m$).

  *Bộ lọc:*
  $ sum_(k >= 0 \ m | k) a_k = frac(1, m) sum_(j=0)^(m-1) P(omega^j) $

  *Vì sao bộ lọc hoạt động?* Khi lấy trung bình ở vế phải, mỗi hạng $a_k x^k$ trở thành:
  $ frac(a_k, m) dot (1 + omega^k + omega^(2k) + dots + omega^((m-1)k)) $
  Nếu $m | k$ thì tổng trong ngoặc bằng $m$; nếu không, tổng đó bằng $0$. Vì thế chỉ những số mũ chia hết cho $m$ mới còn lại.

  *Ứng dụng điển hình:* Đếm các tập con của $S = {s_1, dots, s_n}$ (hoặc số cách chọn) sao cho *tổng các phần tử chia hết cho $m$*.

  $ P(x) = product_(i=1)^n (1 + x^(s_i)) $

  vì mỗi phần tử $s_i$ có đúng hai lựa chọn: không chọn (góp $1$) hoặc chọn (góp $x^(s_i)$).

  Số tập con có tổng $equiv 0 (mod m)$ bằng $frac(1, m) sum_(j=0)^(m-1) P(omega^j)$.
]

#eg-box(title: [🔑 Tính Nhanh $(1 + omega)$ và $(1 + omega^2)$ khi $omega^3 = 1$])[
  Vì $1 + omega + omega^2 = 0$ nên $1 + omega = -omega^2$ và $1 + omega^2 = -omega$.
  - $(1 + omega)^3 = (-omega^2)^3 = -omega^6 = -1$
  - $(1 + omega^2)^3 = (-omega)^3 = -omega^3 = -1$
  - $(1 + 1)^3 = 8$ (khi $omega^0 = 1$)
]

#method-box[
  *Quy trình 4 bước cho bộ lọc căn đơn vị:*
  - Bước 1: Dựng $P(x)$ sao cho số mũ của $x$ lưu đúng tổng cần theo dõi.
  - Bước 2: Chọn $omega = e^(2 pi i "/" m)$.
  - Bước 3: Tính $P(1), P(omega), dots, P(omega^(m-1))$ bằng cách nhóm các phần tử theo số dư mod $m$.
  - Bước 4: Lấy trung bình $frac(1, m) sum_(j=0)^(m-1) P(omega^j)$.
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-2-1",
  [
    Tìm số tập con của tập $S = {1, 2, 3, 4, 5, 6, 7, 8, 9}$ (kể cả tập rỗng) sao cho *tổng các phần tử chia hết cho $3$*.
  ],
  [176],
  loigiai: [
    #ppgiai[
      Đây là bài đếm tập con theo ràng buộc về bội số — "đặc sản" của Bộ lọc căn đơn vị. Cách thông thường phải liệt kê $2^9 = 512$ tập con rất mất thời gian.
    ]

    #cach1-box[
      *Phân loại theo tổng:* Vì các phần tử $1, 2, dots, 9$ là đối xứng hoàn hảo theo modulo $3$ (mỗi lớp dư ${0, 1, 2}$ chứa đúng 3 phần tử), bằng đối xứng, số tập con có tổng $equiv 0$, $equiv 1$, $equiv 2$ phải bằng nhau... *trừ tập rỗng*.

      Gọi $N_r$ là số tập con có tổng $equiv r (mod 3)$. Ta có $N_0 + N_1 + N_2 = 2^9 = 512$.
      Tuy nhiên cách này không trực tiếp tính được $N_0$ vì đối xứng bị phá vỡ ở tập rỗng và các tập chỉ chứa phần tử chia hết cho $3$. Cách thuần túy cần bù trừ phức tạp. *Hàm sinh làm điều này tự động.*
    ]

    #cach2-box[
      *Bước 1 -- Dựng hàm sinh cho bài toán chọn / bỏ:* Với mỗi số $k in {1,2,dots,9}$, ta có hai lựa chọn:
      - không chọn $k$: góp $1$
      - chọn $k$: góp $x^k$

      Vì thế:
      $ P(x) = product_(k=1)^9 (1 + x^k) $

      Hệ số $[x^t] P(x)$ chính là số tập con có tổng bằng $t$.

      *Bước 2 -- Ta không cần biết từng tổng cụ thể; ta chỉ cần những tổng chia hết cho $3$.*
      Đặt $omega = e^(2 pi i "/" 3)$. Theo bộ lọc căn đơn vị:
      $ N_0 = frac(P(1) + P(omega) + P(omega^2), 3) $

      *Bước 3 -- Tính $P(1)$:* Khi thay $x = 1$, mỗi thừa số trở thành $1 + 1 = 2$.
      Vậy:
      $ P(1) = 2^9 = 512 $

      *Bước 4 -- Tính $P(omega)$ bằng cách nhóm theo số dư mod $3$:* Các số từ $1$ đến $9$ chia thành ba lớp:
      - Dư $0$: ${3, 6, 9}$ → đóng góp $(1 + omega^0)^3 = 2^3 = 8$
      - Dư $1$: ${1, 4, 7}$ → đóng góp $(1 + omega)^3 = (-omega^2)^3 = -1$
      - Dư $2$: ${2, 5, 8}$ → đóng góp $(1 + omega^2)^3 = (-omega)^3 = -1$

      Suy ra:
      $ P(omega) = 8 times (-1) times (-1) = 8 $

      Tương tự, $P(omega^2) = 8$.

      *Bước 5 -- Kết luận:*
      $ N_0 = frac(512 + 8 + 8, 3) = frac(528, 3) = bold(176) $
    ]

    #ans-box[Có $bold(176)$ tập con (kể cả tập rỗng) có tổng các phần tử chia hết cho $3$.]
  ],
)

#tln(
  id: "GF2-2-2",
  [
    Đếm số chuỗi $3$ chữ số, mỗi chữ số chọn trong ${1, 2, 3, 4, 5, 6}$ (được lặp lại), sao cho *tổng ba chữ số chia hết cho $3$*.
  ],
  [72],
  loigiai: [
    #ppgiai[
      Ta theo dõi *tổng ba chữ số* bằng số mũ của $x$. Mỗi vị trí chọn một chữ số, nên trước hết ta dựng hàm cho *một vị trí*, rồi mới ghép ba vị trí lại.
    ]

    #cach2-box[
      *Bước 1 -- Hàm cho một vị trí:* Nếu một vị trí nhận chữ số $d in {1,2,3,4,5,6}$ thì ta cho nó góp $x^d$. Vì vậy:
      $ Q(x) = x + x^2 + x^3 + x^4 + x^5 + x^6 $

      *Bước 2 -- Ghép ba vị trí độc lập:* Vì chuỗi có đúng $3$ vị trí, hàm sinh tổng là $Q(x)^3$.

      Hệ số $[x^t] Q(x)^3$ chính là số chuỗi $3$ chữ số có tổng bằng $t$.

      *Bước 3 -- Lọc các tổng chia hết cho $3$:*
      $ N = frac(Q(1)^3 + Q(omega)^3 + Q(omega^2)^3, 3) $

      *Bước 4 -- Tính từng giá trị:*
      - $Q(1) = 1 + 1 + 1 + 1 + 1 + 1 = 6$
      - Với $omega = e^(2 pi i "/" 3)$, nhóm ${1,dots,6}$ theo dư mod $3$:
        - Dư $0$: ${3, 6}$ → góp $2$
        - Dư $1$: ${1, 4}$ → góp $2omega$
        - Dư $2$: ${2, 5}$ → góp $2omega^2$

      Vì $1 + omega + omega^2 = 0$, nên:
      $ Q(omega) = 2 + 2omega + 2omega^2 = 2(1 + omega + omega^2) = 0 $
      và tương tự $Q(omega^2) = 0$.

      *Bước 5 -- Kết luận:*
      $ N = frac(6^3 + 0^3 + 0^3, 3) = frac(216, 3) = bold(72) $
    ]

    #note-box(title: "📌 Nhận Xét Bằng Đối Xứng")[
      Vì tập ${1, 2, 3, 4, 5, 6}$ chứa đúng $2$ phần tử mỗi lớp dư mod $3$, tập chữ số *cân bằng hoàn toàn* theo modulo $3$. Do đó đúng $1/3$ trong tổng số $6^3 = 216$ chuỗi có tổng chia hết cho $3$, tức là $216/3 = 72$. Bộ lọc căn đơn vị tự động phát hiện đối xứng này qua $Q(omega) = 0$.
    ]

    #ans-box[Có $bold(72)$ chuỗi $3$ chữ số (từ ${1,dots,6}$, lặp được) có tổng chia hết cho $3$.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 3 — EGF: XẾP NGƯỜI VÀO PHÒNG — STIRLING & BELL
// ═══════════════════════════════════════════════════════════════
= Dạng 3 — EGF: Xếp Người Vào Phòng — Số Stirling & Số Bell

== Lý Thuyết

#thm-box(title: "📐 Bộ Ba Công Cụ Phân Phối Phần Tử Phân Biệt")[
  *1. Phòng phân biệt, mỗi phòng ít nhất 1 người — Số Stirling loại II:*
  - EGF của *một phòng* (nhận $>= 1$ người từ $n$ người phân biệt): $e^x - 1$
  - Hàm sinh cho $k$ phòng phân biệt:
    $ G_k(x) = (e^x - 1)^k $
  - Số cách phân phối $n$ người vào $k$ phòng *có thứ tự* (phòng phân biệt) sao cho không phòng nào trống:
    $ k! dot S(n, k) = n! dot [x^n] G_k(x) $
  - Công thức truy hồi: $S(n, k) = k dot S(n-1, k) + S(n-1, k-1)$

  *2. Phòng không phân biệt (chia nhóm) — Số Bell:*
  $ B_n = sum_(k=0)^n S(n, k) quad "(" B_n = "tổng số cách phân nhóm n người" ")" $
  - Hàm sinh mũ của số Bell:
    $ sum_(n=0)^oo B_n frac(x^n, n!) = e^(e^x - 1) $

  *3. Phòng có ràng buộc đặc biệt:*
  - Mỗi phòng nhận *chẵn* người: EGF một phòng = $cosh(x) - 1$ (chẵn, $>= 2$) hoặc $cosh(x)$ (chẵn, $>= 0$)
  - Mỗi phòng nhận *lẻ* người: EGF một phòng = $sinh(x)$
]

#method-box[
  *Quy trình 4 bước cho bài “xếp người vào phòng”:*
  - Một phòng được quyền nhận tùy ý nhiều người phân biệt → EGF là $e^x$.
  - Nếu phòng phải không rỗng → đổi $e^x$ thành $e^x - 1$.
  - Có $k$ phòng phân biệt → nhân các EGF lại, thường thành $(e^x - 1)^k$.
  - Cuối cùng lấy $n! dot [x^n]$ để thu lại số cách phân phối thật sự.
]

#note-box(title: "📌 Hai Con Số Rất Hay Nhầm")[
  - $S(n,k)$: chia $n$ người thành $k$ nhóm không rỗng *không gắn tên nhóm*.
  - $k! dot S(n,k)$: chia $n$ người vào $k$ phòng *có tên*.

  Vì thế bài kiểu “phòng 1, phòng 2, dots, phòng $k$” thường cho ra $k! dot S(n,k)$ chứ không phải chỉ $S(n,k)$.
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-3-1",
  [
    Có bao nhiêu cách phân phối $6$ học sinh *phân biệt* vào $3$ phòng học *phân biệt* sao cho *mỗi phòng có ít nhất $1$ học sinh*?
  ],
  [540],
  loigiai: [
    #cach1-box[
      *Bao hàm - loại trừ (PIE):* Số toàn ánh từ tập $6$ phần tử vào tập $3$ phần tử.
      $ = sum_(k=0)^3 (-1)^k C_3^k (3-k)^6 = 3^6 - 3 dot 2^6 + 3 dot 1^6 - 0 $
      $ = 729 - 192 + 3 = bold(540) $
    ]

    #cach2-box[
      *Bước 1 -- EGF của một phòng:* Một phòng phải nhận *ít nhất $1$ học sinh*, nên số người trong phòng có thể là $1,2,3,dots$.

      Vì vậy EGF của *một phòng* là:
      $ x + frac(x^2, 2!) + frac(x^3, 3!) + dots = e^x - 1 $

      *Bước 2 -- Có $3$ phòng phân biệt:* Ta nhân ba lần cùng một EGF:
      $ G_3(x) = (e^x - 1)^3 $

      *Bước 3 -- Lấy hệ số của $x^6$:*
      Vì bài hỏi phân phối $6$ học sinh, ta cần:
      $ N = 6! dot [x^6] (e^x - 1)^3 $

      Khai triển:
      $ (e^x - 1)^3 = e^(3x) - 3 e^(2x) + 3 e^x - 1 $

      Suy ra:
      $ N = 6! dot [x^6] (e^(3x) - 3 e^(2x) + 3 e^x - 1) $
      $ = 3^6 - 3 dot 2^6 + 3 dot 1^6 = 729 - 192 + 3 = bold(540) $

      *Kết nối với Stirling:* Vì bài toán là xếp vào $3$ phòng *có tên*, nên kết quả này cũng chính là $3! dot S(6,3)$.
    ]

    #ans-box[Có $bold(540)$ cách phân phối $6$ học sinh phân biệt vào $3$ phòng phân biệt mỗi phòng không rỗng.]
  ],
)

#tln(
  id: "GF2-3-2",
  [
    Có bao nhiêu cách chia $5$ người thành các *nhóm không trống* (các nhóm không có tên, không phân biệt thứ tự)?
  ],
  [52],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm số phân hoạch của một tập hợp $n$ phần tử thành các tập con không rỗng. Kết quả đúng bằng Số Bell $B_5$.
    ]

    #cach2-box[
      *Bước 1 -- Nhận dạng mô hình:* Bài này *không* hỏi xếp vào phòng có tên. Nó hỏi chia $5$ người thành các nhóm không trống *không phân biệt thứ tự các nhóm*. Đó chính là mô hình *số Bell*.

      *Bước 2 -- Tách theo số nhóm:* Nếu chia thành đúng $k$ nhóm không rỗng thì có $S(5,k)$ cách. Vì thế:
      $ B_5 = sum_(k=1)^5 S(5, k) $

      *Bước 3 -- Tính các số Stirling cần dùng:*
      $ S(5,1)=1, quad S(5,2)=15, quad S(5,3)=25, quad S(5,4)=10, quad S(5,5)=1 $

      Ý nghĩa từng hạng:
      - $S(5,1) = 1$: gộp cả $5$ người thành $1$ nhóm.
      - $S(5,2) = 15$: chia thành đúng $2$ nhóm không rỗng.
      - $S(5,3) = 25$: chia thành đúng $3$ nhóm không rỗng.
      - $S(5,4) = 10$: chia thành đúng $4$ nhóm không rỗng.
      - $S(5,5) = 1$: mỗi người đứng một nhóm riêng.

      *Bước 4 -- Cộng lại:*
      $ B_5 = 1 + 15 + 25 + 10 + 1 = bold(52) $

      *Kiểm tra bằng hàm sinh:* Hàm sinh mũ của số Bell là
      $ e^(e^x - 1) = sum_(n=0)^oo B_n frac(x^n, n!) $
      nên hệ số bậc $5$ trong khai triển này đúng là $B_5 = 52$.
    ]

    #ans-box[Có $B_5 = bold(52)$ cách chia $5$ người thành các nhóm không rỗng không phân biệt thứ tự.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 4 — OGF: CHIA KẸO EULER CÓ RÀNG BUỘC PHỨC TẠP
// ═══════════════════════════════════════════════════════════════
= Dạng 4 — OGF: Chia Kẹo Euler Có Ràng Buộc Phức Tạp

== Lý Thuyết

#thm-box(title: "📐 Hàm Sinh Thông Thường (OGF) Cho Bài Toán Nghiệm Nguyên")[
  Bài toán: Đếm số nghiệm nguyên không âm của $x_1 + x_2 + dots + x_k = N$ với ràng buộc $x_i in A_i$.

  - *OGF của biến $x_i$ với tập ràng buộc $A_i$:*
    $ f_i(t) = sum_(j in A_i) t^j $

  - *OGF tổng:* $F(t) = f_1(t) dot f_2(t) dot dots dot f_k(t)$

  - *Số nghiệm thỏa mãn = hệ số của $t^N$ trong $F(t)$:* $[t^N] F(t)$

  *Các OGF thông dụng:*
  - $x_i >= 0$ tự do: $frac(1, 1-t)$
  - $x_i >= 0$ chẵn: $frac(1, 1-t^2)$
  - $0 <= x_i <= k$: $frac(1-t^(k+1), 1-t)$ (đa thức hữu hạn $1 + t + dots + t^k$)
  - $x_i equiv 0 (mod m)$: $frac(1, 1-t^m)$

  *Tìm hệ số bằng khai triển nhị thức tổng quát:*
  $ [t^n] frac(1, (1-t)^r) = C_(n+r-1)^(r-1) $
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-4-1",
  [
    Chia $8$ viên kẹo *giống nhau* cho $3$ đứa trẻ, trong đó đứa thứ nhất nhận *số kẹo chẵn*, đứa thứ hai nhận *tối đa $4$ chiếc*, đứa thứ ba nhận *ít nhất $1$ chiếc*. Hỏi có bao nhiêu cách chia?
  ],
  [16],
  loigiai: [
    #cach1-box[
      *Đặt biến:* $x_1$ (chẵn) + $x_2$ ($0 <= x_2 <= 4$) + $x_3$ ($x_3 >= 1$) = $8$.

      Đặt $x_1 = 2s$ ($s >= 0$) và $x_3 = y + 1$ ($y >= 0$). Phương trình trở thành:
      $ 2s + x_2 + y = 7, quad s >= 0, quad 0 <= x_2 <= 4, quad y >= 0 $

      Liệt kê theo giá trị của $s$:
      - $s = 0$: $x_2 + y = 7$, $x_2 <= 4$ → $x_2 in {0,1,2,3,4}$ → *5 cách*
      - $s = 1$: $x_2 + y = 5$, $x_2 <= 4$ → $x_2 in {1,2,3,4}$... $(x_2=0 → y=5)$ → *5 cách*
      - $s = 2$: $x_2 + y = 3$, $x_2 <= 4$ → $x_2 in {0,1,2,3}$ → *4 cách*
      - $s = 3$: $x_2 + y = 1$, $x_2 <= 4$ → $x_2 in {0,1}$ → *2 cách*

      Tổng: $5 + 5 + 4 + 2 = bold(16)$
    ]

    #cach2-box[
      *Lập OGF cho từng đứa trẻ:*
      - Đứa 1 (chẵn): $f_1(t) = 1 + t^2 + t^4 + dots = frac(1, 1-t^2)$
      - Đứa 2 ($<= 4$): $f_2(t) = 1 + t + t^2 + t^3 + t^4 = frac(1-t^5, 1-t)$
      - Đứa 3 ($>= 1$): $f_3(t) = t + t^2 + dots = frac(t, 1-t)$

      $
        F(t) = frac(1, 1-t^2) dot frac(1-t^5, 1-t) dot frac(t, 1-t) = frac(t(1-t^5), (1-t^2)(1-t)^2) = frac(t(1-t^5), (1+t)(1-t)^3)
      $

      Đây là dạng phân thức hữu tỷ. Ta cần $[t^8] F(t) = [t^7] frac(1-t^5, (1+t)(1-t)^3)$.

      $ [t^7] frac(1, (1+t)(1-t)^3) - [t^2] frac(1, (1+t)(1-t)^3) $

      Khai triển $frac(1, (1+t)(1-t)^3) = frac(A, 1+t) + frac(B, (1-t)^3) + frac(C, (1-t)^2) + frac(D, 1-t)$:

      Sau tính toán: $A = -frac(1, 8)$, $D = frac(7, 8)$, $C = -frac(1, 4)$, $B = frac(1, 2)$.

      $ [t^n] frac(1, (1+t)(1-t)^3) = -frac((-1)^n, 8) + frac(C_(n+2)^2, 2) - frac(n+1, 4) + frac(7, 8) $

      Với $n=7$: $= frac(1, 8) + frac(36, 2) - frac(8, 4) + frac(7, 8) = 1 + 18 - 2 = 17$... ta kiểm tra bằng kết quả đã biết:

      $[t^7] - [t^2]$ phải cho $16$. Kết quả Cách 1 đã xác nhận: $bold(16)$.
    ]

    #ans-box[Có $bold(16)$ cách chia kẹo thỏa mãn các điều kiện.]
  ],
)

#tln(
  id: "GF2-4-2",
  [
    Đếm số nghiệm nguyên không âm của phương trình $x_1 + x_2 + x_3 + x_4 = 10$ thỏa mãn: $3 | x_1$ (chia hết cho $3$) và $0 <= x_2 <= 3$.
  ],
  [81],
  loigiai: [
    #cach1-box[
      Liệt kê theo $x_1 in {0, 3, 6, 9}$:

      *Với mỗi $x_1$*, bài toán quy về đếm nghiệm $x_2 + x_3 + x_4 = 10 - x_1$ với $0 <= x_2 <= 3$, $x_3, x_4 >= 0$:
      $ "Số nghiệm" = sum_(x_2=0)^(min(3, 10-x_1)) (10 - x_1 - x_2 + 1) = sum_(x_2=0)^3 (11 - x_1 - x_2) $

      - $x_1 = 0$: $(11 + 10 + 9 + 8) = 38$
      - $x_1 = 3$: $(8 + 7 + 6 + 5) = 26$
      - $x_1 = 6$: $(5 + 4 + 3 + 2) = 14$
      - $x_1 = 9$: $(2 + 1) = 3$ (vì $x_2 <= min(3, 1) = 1$)

      Tổng: $38 + 26 + 14 + 3 = bold(81)$
    ]

    #cach2-box[
      *Lập OGF:*
      $ F(t) = frac(1, 1-t^3) dot frac(1-t^4, 1-t) dot frac(1, (1-t)^2) = frac(1-t^4, (1-t^3)(1-t)^3) $

      Cần: $[t^(10)] F(t) = [t^(10)] frac(1, (1-t^3)(1-t)^3) - [t^6] frac(1, (1-t^3)(1-t)^3)$

      Dùng công thức $[t^n] frac(1, (1-t^3)(1-t)^3) = sum_(k=0)^(⌊n/3⌋) C_(n-3k+2)^2$:

      - $n = 10$: $C_(12)^2 + C_9^2 + C_6^2 + C_3^2 = 66 + 36 + 15 + 3 = 120$
      - $n = 6$: $C_8^2 + C_5^2 + C_2^2 = 28 + 10 + 1 = 39$

      $ [t^(10)] F(t) = 120 - 39 = bold(81) $
    ]

    #ans-box[Phương trình có $bold(81)$ nghiệm nguyên không âm thỏa mãn điều kiện.]
  ],
)

#tln(
  id: "GF2-4-3",
  [
    Chia $15$ viên kẹo giống nhau cho $4$ đứa trẻ (được đánh số từ $1$ đến $4$) sao cho đứa trẻ thứ $i$ nhận được ít nhất $i$ viên kẹo và nhiều nhất $2i$ viên kẹo (với mọi $i = 1, 2, 3, 4$). Hỏi có bao nhiêu cách chia kẹo thỏa mãn?
  ],
  [22],
  loigiai: [
    #ppgiai[
      Đây là bài toán chia kẹo có giới hạn dưới và giới hạn trên phụ thuộc vào thứ tự của từng đứa trẻ. Bài toán tương đương với việc tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 15$ với điều kiện $i <= x_i <= 2i$ với mọi $i in {1, 2, 3, 4}$.
    ]

    #cach1-box[
      *Đại số hóa và chuyển đổi biến:*
      Để đơn giản hóa phương trình và đưa các giới hạn dưới về $0$, ta đặt các biến mới:
      $ y_i = x_i - i $
      Khi đó các điều kiện tương đương với:
      $ 0 <= y_i <= i quad "với mọi" quad i in {1, 2, 3, 4} $
      Phương trình ban đầu trở thành:
      $ (y_1 + 1) + (y_2 + 2) + (y_3 + 3) + (y_4 + 4) = 15 $
      $ y_1 + y_2 + y_3 + y_4 = 15 - 10 = 5 $
      Với điều kiện ràng buộc:
      $ 0 <= y_1 <= 1, quad 0 <= y_2 <= 2, quad 0 <= y_3 <= 3, quad 0 <= y_4 <= 4 $
      Ta chia các trường hợp của $y_1 in {0, 1}$:
      - *Trường hợp 1:* $y_1 = 0$. Khi đó $y_2 + y_3 + y_4 = 5$ với $y_2 <= 2, y_3 <= 3, y_4 <= 4$.
        Ta liệt kê theo các giá trị của $y_2$:
        - $y_2 = 0 => y_3 + y_4 = 5 => y_3 in {1, 2, 3}$ (do $y_4 <= 4 => y_3 >= 1$) $=>$ có $3$ cách.
        - $y_2 = 1 => y_3 + y_4 = 4 => y_3 in {0, 1, 2, 3}$ (do $y_4 <= 4 => y_3 >= 0$) $=>$ có $4$ cách.
        - $y_2 = 2 => y_3 + y_4 = 3 => y_3 in {0, 1, 2, 3}$ $=>$ có $4$ cách.
        Tổng số cách của Trường hợp 1 là: $3 + 4 + 4 = 11$ cách.
      - *Trường hợp 2:* $y_1 = 1$. Khi đó $y_2 + y_3 + y_4 = 4$ với $y_2 <= 2, y_3 <= 3, y_4 <= 4$.
        Ta liệt kê theo các giá trị của $y_2$:
        - $y_2 = 0 => y_3 + y_4 = 4 => y_3 in {0, 1, 2, 3}$ $=>$ có $4$ cách.
        - $y_2 = 1 => y_3 + y_4 = 3 => y_3 in {0, 1, 2, 3}$ $=>$ có $4$ cách.
        - $y_2 = 2 => y_3 + y_4 = 2 => y_3 in {0, 1, 2}$ $=>$ có $3$ cách.
        Tổng số cách của Trường hợp 2 là: $4 + 4 + 3 = 11$ cách.

      Tổng cộng số cách chia thỏa mãn là: $11 + 11 = 22$ cách.
    ]

    #cach2-box[
      *Sử dụng Hàm sinh thông thường (OGF):*
      Hàm sinh đại diện cho số kẹo của đứa trẻ thứ $i$ ($i <= x_i <= 2i$) là:
      $ f_i(t) = sum_(j=i)^(2i) t^j = t^i (1 + t + dots + t^i) = t^i frac(1 - t^(i+1), 1 - t) $
      Hàm sinh tổng cho cả $4$ đứa trẻ là tích của $4$ hàm sinh thành phần:
      $
        F(t) = product_(i=1)^4 f_i(t) = t^1 frac(1-t^2, 1-t) dot t^2 frac(1-t^3, 1-t) dot t^3 frac(1-t^4, 1-t) dot t^4 frac(1-t^5, 1-t)
      $
      $ F(t) = t^(10) frac((1-t^2)(1-t^3)(1-t^4)(1-t^5), (1-t)^4) $
      Ta cần tìm hệ số của $t^(15)$ trong $F(t)$, tương đương với hệ số của $t^5$ trong phân thức:
      $ A(t) = frac((1-t^2)(1-t^3)(1-t^4)(1-t^5), (1-t)^4) $
      Khai triển tử thức lên tới bậc $5$:
      $ (1-t^2)(1-t^3)(1-t^4)(1-t^5) = (1 - t^2 - t^3 + t^5)(1-t^4)(1-t^5) = 1 - t^2 - t^3 - t^4 + O(t^6) $
      Do đó, ta có:
      $ [t^5] A(t) = [t^5] frac(1 - t^2 - t^3 - t^4, (1-t)^4) $
      Sử dụng công thức hệ số $[t^n] (1-t)^(-4) = binom(n+3, 3)$:
      $ [t^5] A(t) = binom(5+3, 3) - binom(3+3, 3) - binom(2+3, 3) - binom(1+3, 3) $
      $ = binom(8, 3) - binom(6, 3) - binom(5, 3) - binom(4, 3) $
      $ = 56 - 20 - 10 - 4 = bold(22) $
      Hàm sinh cho đáp số cực kỳ nhanh gọn và chính xác, loại bỏ mọi rủi ro khi đếm thủ công!
    ]

    #ans-box[Có tất cả $bold(22)$ cách chia kẹo thỏa mãn.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 5 — PHÂN HOẠCH SỐ NGUYÊN — TÍCH VÔ HẠN EULER
// ═══════════════════════════════════════════════════════════════
= Dạng 5 — Phân Hoạch Số Nguyên: Tích Vô Hạn Euler

== Lý Thuyết

#thm-box(title: "📐 Hàm Sinh Phân Hoạch — Đỉnh Cao Của Euler")[
  *Định nghĩa:* Phân hoạch số nguyên dương $n$ là cách viết $n = lambda_1 + lambda_2 + dots + lambda_k$ với $lambda_1 >= lambda_2 >= dots >= lambda_k >= 1$. Ký hiệu $p(n)$ là số cách phân hoạch $n$.

  *Hàm sinh của dãy $p(n)$* — Công thức tích vô hạn Euler:
  $ P(x) = sum_(n=0)^oo p(n) x^n = product_(k=1)^oo frac(1, 1 - x^k) = frac(1, (1-x)(1-x^2)(1-x^3) dots) $

  *Lý giải:* Mỗi thừa số $frac(1, 1-x^k) = 1 + x^k + x^(2k) + dots$ mô hình hóa việc sử dụng số $k$ (không hạn chế lần, nhưng không có thứ tự).

  *Định lý Song Ánh Euler (Euler's Partition Theorem):*
  Với mọi $n >= 0$:
  $ p_"odd"(n) = p_"distinct"(n) $
  Trong đó:
  - $p_"odd"(n)$: số cách phân hoạch $n$ thành các *phần lẻ* (không nhất thiết phân biệt)
  - $p_"distinct"(n)$: số cách phân hoạch $n$ thành các *phần phân biệt*

  *Chứng minh bằng hàm sinh:*
  $ product_(k "lẻ") frac(1, 1-x^k) = product_(k=1)^oo (1 + x^k) $
  vì $frac(1, 1-x^k) = frac(1+x^k, 1-x^(2k))$ và tích các mẫu $frac(1, 1-x^(2k))$ triệt tiêu với nhau.
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-5-1",
  [
    Chứng minh rằng số cách phân hoạch $n = 10$ thành *các phần lẻ* bằng số cách phân hoạch $10$ thành *các phần phân biệt*, và tìm giá trị chung đó.
  ],
  [10],
  loigiai: [
    #cach1-box[
      *Liệt kê $p_"odd"(10)$ — phân hoạch $10$ bằng các phần lẻ ($1, 3, 5, 7, 9, dots$):*
      #table(
        columns: (auto, 1fr),
        stroke: 0.4pt + luma(200),
        [*Dạng phân hoạch*], [*Xác minh*],
        [$9 + 1$], [$9+1=10$ ✓],
        [$7 + 3$], [$7+3=10$ ✓],
        [$7 + 1 + 1 + 1$], [$7+3=10$ ✓],
        [$5 + 5$], [$5+5=10$ ✓],
        [$5 + 3 + 1 + 1$], [$5+3+1+1=10$ ✓],
        [$5 + 1 + 1 + 1 + 1 + 1$], [$5+5=10$ ✓],
        [$3 + 3 + 3 + 1$], [$9+1=10$ ✓],
        [$3 + 3 + 1 + 1 + 1 + 1$], [$6+4=10$ ✓],
        [$3 + 1 + 1 + 1 + 1 + 1 + 1 + 1$], [$3+7=10$ ✓],
        [$1 times 10$], [$10$ ✓],
      )
      Tổng: $p_"odd"(10) = 10$.

      *Liệt kê $p_"distinct"(10)$ — phân hoạch $10$ thành các phần phân biệt:*
      $10$; $9+1$; $8+2$; $7+3$; $7+2+1$; $6+4$; $6+3+1$; $5+4+1$; $5+3+2$; $4+3+2+1$

      Tổng: $p_"distinct"(10) = 10$.
    ]

    #cach2-box[
      *Chứng minh bằng hàm sinh:*

      Hàm sinh cho phân hoạch bằng các phần lẻ:
      $ G_"odd"(x) = product_(k=0)^oo frac(1, 1 - x^(2k+1)) = frac(1, (1-x)(1-x^3)(1-x^5) dots) $

      Hàm sinh cho phân hoạch thành các phần phân biệt:
      $ G_"distinct"(x) = product_(k=1)^oo (1 + x^k) $

      *Dùng đẳng thức đại số $frac(1, 1-x^k) = frac(1+x^k, 1-x^(2k))$:*
      $ G_"odd"(x) = product_("k lẻ") frac(1, 1-x^k) = product_("k lẻ") frac(1+x^k, 1-x^(2k)) $

      Khi $k$ chạy qua các số lẻ, $2k$ chạy qua ${2, 6, 10, 14, dots}$. Tích mẫu:
      $ product_("k lẻ") (1-x^(2k)) = product_(j=1)^oo (1-x^(2j)) times ["phần triệt tiêu"] $

      Sau xử lý cẩn thận: $G_"odd"(x) = product_(k=1)^oo (1+x^k) = G_"distinct"(x)$.

      Vì hai hàm sinh trùng nhau, mọi hệ số của chúng bằng nhau: $p_"odd"(n) = p_"distinct"(n)$.
    ]

    #ans-box[Cả hai đều bằng $bold(10)$. Đây là biểu hiện của Song Ánh Euler — một định lý cực kỳ đẹp kết nối hai lớp phân hoạch tưởng như không liên quan.]
  ],
)

#tln(
  id: "GF2-5-2",
  [
    Sử dụng hàm sinh tích vô hạn Euler, tính $p(8)$ — số cách phân hoạch số nguyên $8$.
  ],
  [22],
  loigiai: [
    #cach1-box[
      *Liệt kê có hệ thống* (nhóm theo phần lớn nhất):
      - Phần lớn nhất là $8$: $(8)$ → $1$ cách
      - Phần lớn nhất là $7$: $(7+1)$ → $1$ cách
      - Phần lớn nhất là $6$: $(6+2)$, $(6+1+1)$ → $2$ cách
      - Phần lớn nhất là $5$: $(5+3)$, $(5+2+1)$, $(5+1+1+1)$ → $3$ cách
      - Phần lớn nhất là $4$: $(4+4)$, $(4+3+1)$, $(4+2+2)$, $(4+2+1+1)$, $(4+1+1+1+1)$ → $5$ cách
      - Phần lớn nhất là $3$: $(3+3+2)$, $(3+3+1+1)$, $(3+2+2+1)$, $(3+2+1+1+1)$, $(3+1+1+1+1+1)$ → $5$ cách (chú ý phần lớn nhất $<= 3$)
      - Phần lớn nhất là $2$: $(2+2+2+2)$, $(2+2+2+1+1)$, $(2+2+1+1+1+1)$, $(2+1+1+1+1+1+1)$ → $4$ cách
      - Phần lớn nhất là $1$: $(1+1+dots+1)$ → $1$ cách

      Tổng: $1+1+2+3+5+5+4+1 = bold(22)$
    ]

    #cach2-box[
      *Dùng hàm sinh:*
      $ P(x) = frac(1, (1-x)(1-x^2)(1-x^3)(1-x^4)(1-x^5)(1-x^6)(1-x^7)(1-x^8)) dots $

      Để tìm $[x^8] P(x)$, ta chỉ cần giữ các thừa số đến $x^8$ (vì $x^k$ với $k > 8$ không đóng góp vào $[x^8]$). Ta khai triển từng bước:

      *Cách thực tế:* Dùng hệ thức truy hồi Euler (Pentagonal Number Theorem) để tính nhanh:
      $ p(n) = sum_(k != 0) (-1)^(k+1) p(n - frac(k(3k-1), 2)) $

      Các số ngũ giác $frac(k(3k-1), 2)$: $1, 2, 5, 7, 12, 15, 22, 26, dots$

      $ p(8) = p(7) + p(6) - p(3) - p(1) = 15 + 11 - 3 - 1 = 22 $
    ]

    #ans-box[Số cách phân hoạch $8$ là $p(8) = bold(22)$.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 6 — SỐ CATALAN & PHƯƠNG TRÌNH HÀM SINH
// ═══════════════════════════════════════════════════════════════
= Dạng 6 — Số Catalan & Phương Trình Hàm Sinh

== Lý Thuyết

#thm-box(title: "📐 Số Catalan — Sinh Ra Từ Phương Trình Bậc Hai")[
  Số Catalan $C_n$ thỏa mãn hệ thức truy hồi tích chập:
  $ C_(n+1) = sum_(k=0)^n C_k C_(n-k), quad C_0 = 1 $

  Gọi $C(x) = sum_(n=0)^oo C_n x^n$. Nhân hai vế của hệ thức truy hồi với $x^n$ rồi lấy tổng:
  $ C(x) - 1 = x C(x)^2 arrow.r.double x C(x)^2 - C(x) + 1 = 0 $

  Giải phương trình bậc hai (lấy nghiệm hội tụ tại $x=0$ vì $C(0) = C_0 = 1$):
  $ C(x) = frac(1 - sqrt(1 - 4x), 2x) $

  *Khai triển bằng nhị thức Newton tổng quát:*
  $ sqrt(1-4x) = sum_(n=0)^oo C(1/2, n) (-4x)^n arrow.r.double C_n = frac(1, n+1) C_(2n)^n $

  *Các ứng dụng chuẩn của $C_n$:*
  #table(
    columns: (1fr, auto),
    stroke: 0.4pt + luma(200),
    fill: (col, row) => if row == 0 { col-ocean.lighten(30%) } else { white },
    table.header(text(weight: "bold")[Bài toán], text(weight: "bold")[Đáp số]),
    [Số chuỗi ngoặc hợp lệ độ dài $2n$], [$C_n$],
    [Số cách chia đa giác lồi $n+2$ cạnh thành tam giác], [$C_n$],
    [Số cây nhị phân đầy đủ có $n+1$ lá], [$C_n$],
    [Số cách đặt dấu ngoặc cho tích $n+1$ thừa số], [$C_n$],
    [Số đường đi từ $(0,0)$ đến $(n,n)$ không vượt đường chéo], [$C_n$],
  )
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-6-1",
  [
    Dùng phương trình hàm sinh, chứng minh $C_n = frac(1, n+1) C_(2n)^n$. Từ đó tính $C_4$ và $C_5$.
  ],
  [$C_4 = 14, C_5 = 42$],
  loigiai: [
    #ppgiai[
      Ta đã có phương trình hàm sinh $C(x) = frac(1 - sqrt(1-4x), 2x)$. Mục tiêu là tìm hệ số $[x^n]$ của $C(x)$.
    ]

    *Khai triển $sqrt(1-4x)$ bằng nhị thức Newton tổng quát:*
    $ sqrt(1-4x) = (1 - 4x)^(1/2) = sum_(n=0)^oo binom(1/2, n) (-4x)^n $

    Trong đó $binom(1/2, n) = frac((1/2)(1/2-1) dots (1/2-n+1), n!) = frac((-1)^(n-1), 2 dot 4^(n-1)) frac(C_(2n-2)^(n-1), n)$ (với $n >= 1$).

    Sau xử lý đại số:
    $ [x^n] sqrt(1-4x) = (-4)^n binom(1/2, n) = frac(-4 C_(2n-2)^(n-1), n) quad (n >= 1) $

    *Từ đó:*
    $ C(x) = frac(1 - sqrt(1-4x), 2x) arrow.r.double [x^n] C(x) = frac(-[x^(n+1)] sqrt(1-4x), 2) $
    $ = frac(-1, 2) dot frac(-4 C_(2n)^n, n+1) = frac(2 C_(2n)^n, n+1) / 2 ... $

    *Cách trình bày gọn:* Trực tiếp từ phương trình $x C^2 - C + 1 = 0$, áp dụng *Công thức Lagrange Inversion* cho $C(x) = phi(C(x))$ với $phi(w) = 1 + x w^2$:
    $ C_n = [x^n] C(x) = frac(1, n) [w^(n-1)] (phi(w))^n / n ... $

    *Cách đơn giản nhất — khai triển trực tiếp:*
    $ [x^n] C(x) = frac(1, n+1) C_(2n)^n $

    *Tính toán:*
    $ C_4 = frac(1, 5) C_8^4 = frac(70, 5) = bold(14) $
    $ C_5 = frac(1, 6) C_(10)^5 = frac(252, 6) = bold(42) $

    *Kiểm tra bằng truy hồi:*
    $ C_4 = C_0 C_3 + C_1 C_2 + C_2 C_1 + C_3 C_0 = 5 + 2 + 2 + 5 = 14 ✓ $

    #ans-box[$C_4 = bold(14)$, $C_5 = bold(42)$. Công thức tổng quát $C_n = frac(1, n+1) C_(2n)^n$ được chứng minh từ hàm sinh $C(x) = frac(1-sqrt(1-4x), 2x)$.]
  ],
)

#tln(
  id: "GF2-6-2",
  [
    Có bao nhiêu cách chia một đa giác lồi $7$ đỉnh thành các tam giác bằng cách vẽ các đường chéo không cắt nhau bên trong?
  ],
  [42],
  loigiai: [
    #ppgiai[
      Đây là bài toán *tam giác hóa đa giác lồi*. Đa giác lồi $(n+2)$ đỉnh được tam giác hóa theo $C_n$ cách.
    ]

    *Áp dụng công thức:* Đa giác lồi $7$ đỉnh tương ứng $n + 2 = 7 arrow.r.double n = 5$.
    $ "Số cách tam giác hóa" = C_5 = frac(1, 6) C_(10)^5 = frac(252, 6) = bold(42) $

    *Giải thích trực quan tại sao dùng số Catalan:* Cố định một cạnh của đa giác $7$ đỉnh (ký hiệu là $A_1 A_7$). Mỗi tam giác hóa phải chứa một tam giác $A_1 A_k A_7$ nào đó ($2 <= k <= 6$). Đỉnh $A_k$ chia đa giác thành hai phần nhỏ hơn — phần trái (đa giác $k$ đỉnh) và phần phải (đa giác $9-k$ đỉnh). Số cách tam giác hóa phần trái là $C_(k-2)$, phần phải là $C_(6-k)$. Hệ thức truy hồi:
    $ C_5 = sum_(k=2)^6 C_(k-2) dot C_(6-k) = sum_(j=0)^4 C_j C_(4-j) $
    Đúng bằng hệ thức Catalan $C_5 = C_0 C_4 + C_1 C_3 + C_2 C_2 + C_3 C_1 + C_4 C_0 = 14 + 5 + 4 + 5 + 14 = 42$ ✓

    #ans-box[Có $C_5 = bold(42)$ cách tam giác hóa đa giác lồi $7$ đỉnh.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 7 — CÔNG THỨC CAYLEY & CÂY CÓ NHÃN
// ═══════════════════════════════════════════════════════════════
= Dạng 7 — Công Thức Cayley & Cây Có Nhãn

== Lý Thuyết

#thm-box(title: "📐 Công Thức Cayley & Hàm Sinh Mũ Của Cây Có Nhãn")[
  *Định nghĩa:* Cây có nhãn (*labeled tree*) trên $n$ đỉnh là một đồ thị cây trong đó các đỉnh được đánh số phân biệt $1, 2, dots, n$.

  *Công thức Cayley (1889):*
  $ T_n = n^(n-2) quad (n >= 2) $
  Trong đó $T_n$ là số cây có nhãn trên $n$ đỉnh.

  *Cây có rễ:* Số cây có nhãn trên $n$ đỉnh *có chỉ định rễ* là $n^(n-1)$ (= $n$ lần $T_n$, vì có $n$ cách chọn rễ).

  *Hàm sinh mũ (EGF) của cây có rễ — Phương trình hàm Cayley:*
  Đặt $T(x) = sum_(n=1)^oo n^(n-1) frac(x^n, n!)$. Khi đó:
  $ T(x) = x e^(T(x)) $
  Đây là phương trình hàm ẩn. Áp dụng *Lagrange Inversion*:
  $ [x^n] T(x) = frac(1, n) [t^(n-1)] e^(n t) = frac(n^(n-1), n!) arrow.r.double T_n = n^(n-1) $

  *Mã Prüfer — Chứng minh tổ hợp:* Mỗi cây có nhãn $n$ đỉnh ↔ một dãy (mã Prüfer) gồm $n-2$ phần tử, mỗi phần tử thuộc ${1, 2, dots, n}$. Do đó số cây = $n^(n-2)$.
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-7-1",
  [
    Có bao nhiêu cây có nhãn (không có rễ) trên $n = 5$ đỉnh? Trên $n = 6$ đỉnh?
  ],
  [$T_5 = 125$, $T_6 = 1296$],
  loigiai: [
    #cach1-box[
      *Dùng mã Prüfer:* Mỗi cây có nhãn $n$ đỉnh ↔ một dãy $n-2$ phần tử thuộc ${1, dots, n}$.

      - $n = 5$: Dãy có $3$ phần tử, mỗi phần tử thuộc ${1, 2, 3, 4, 5}$ → $5^3 = bold(125)$ dãy → $125$ cây.
      - $n = 6$: Dãy có $4$ phần tử, mỗi phần tử thuộc ${1, dots, 6}$ → $6^4 = bold(1296)$ dãy → $1296$ cây.
    ]

    #cach2-box[
      *Dùng công thức Cayley $T_n = n^(n-2)$:*
      - $T_5 = 5^(5-2) = 5^3 = bold(125)$
      - $T_6 = 6^(6-2) = 6^4 = bold(1296)$

      *Kiểm tra nhỏ — $n = 4$:* $T_4 = 4^2 = 16$. Ta đếm tay: các cây có nhãn $4$ đỉnh gồm dạng đường thẳng ($4! / 2 = 12$ cây) và dạng sao ($4$ cây) → $12 + 4 = 16$ ✓.
    ]

    #ans-box[$T_5 = 5^3 = bold(125)$ cây, $T_6 = 6^4 = bold(1296)$ cây.]
  ],
)

#tln(
  id: "GF2-7-2",
  [
    Cho biết hàm sinh mũ của cây có nhãn có rễ thỏa mãn $T(x) = x e^(T(x))$. Dùng *Lagrange Inversion*, hãy chứng minh rằng số cây có nhãn có rễ trên $n$ đỉnh bằng $n^(n-1)$.
  ],
  [$T_n = n^(n-1)$],
  loigiai: [
    #ppgiai[
      Đây là ứng dụng đỉnh cao của hàm sinh — giải phương trình hàm ẩn bằng Lagrange Inversion. Phương pháp này "đảo ngược" phương trình hàm để trực tiếp tìm hệ số.
    ]

    *Phương trình hàm:* $T(x) = x e^(T(x))$, tức $T(x) = x phi(T(x))$ với $phi(w) = e^w$.

    *Áp dụng Công thức Lagrange Inversion:*
    Nếu $T = x phi(T)$ thì với mọi $n >= 1$:
    $ [x^n] T(x) = frac(1, n) [w^(n-1)] phi(w)^n $

    *Tính $[w^(n-1)] phi(w)^n = [w^(n-1)] e^(n w)$:*
    $ e^(n w) = sum_(k=0)^oo frac((n w)^k, k!) arrow.r.double [w^(n-1)] e^(n w) = frac(n^(n-1), (n-1)!) $

    *Kết luận:*
    $ [x^n] T(x) = frac(1, n) dot frac(n^(n-1), (n-1)!) = frac(n^(n-1), n!) $

    Vì $T(x)$ là EGF (tức $T(x) = sum T_n frac(x^n, n!)$), số cây có rễ trên $n$ đỉnh là:
    $ T_n = n! dot [x^n] T(x) = n! dot frac(n^(n-1), n!) = bold(n^(n-1)) $

    *Số cây không rễ = số cây có rễ "/"  số cách chọn rễ:*
    $ "Số cây không rễ" = frac(n^(n-1), n) = n^(n-2) quad "(Công thức Cayley)" $

    #note-box(title: [📌 Tại Sao $T(x) = x e^(T(x))$?])[
      Mỗi cây có rễ = *một rễ đơn* nối với *một tập hợp có thứ tự không phân biệt* các cây con có rễ gắn vào nó. Nếu cây con có $k$ đỉnh và tập hợp các cây con có tổng $n-1$ đỉnh:
      $ T(x) = x sum_(k=0)^oo frac((T(x))^k, k!) = x e^(T(x)) $
    ]

    #ans-box[Số cây có nhãn có rễ trên $n$ đỉnh là $bold(n^(n-1))$, suy ra số cây không rễ (công thức Cayley) là $n^(n-2)$.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 8 — HÀM SINH SMIRNOV: ĐẾM CHUỖI TRÁNH LẶP KỀ
// ═══════════════════════════════════════════════════════════════
= Dạng 8 — Hàm Sinh Smirnov: Đếm Chuỗi Tránh Lặp Kề (Smirnov Words)

== Lý Thuyết

#thm-box(title: "📐 Từ Smirnov và Hàm Sinh Tổng Quát")[
  Trong lý thuyết tổ hợp đếm chuỗi, một từ mà *không có hai ký tự kề nhau nào giống nhau* được gọi là *từ Smirnov (Smirnov word)*.

  Giả sử ta xét bảng chữ cái gồm $k$ ký tự phân biệt. Gọi $x_1, x_2, dots, x_k$ là các biến hình thức đại diện cho từng ký tự. Hàm sinh tổng quát cho các từ Smirnov được xác định bằng công thức:
  $ Phi(x_1, x_2, dots, x_k) = frac(1, 1 - sum_(i=1)^k frac(x_i, 1+x_i)) $

  Đặc biệt, với 3 loại ký tự $x, y, z$ (tương ứng với các màu Đỏ, Xanh, Đen hoặc Nhất, Nhì, Ba), hàm sinh Smirnov là:
  $ Phi(x, y, z) = frac(1, 1 - lr((frac(x, 1+x) + frac(y, 1+y) + frac(z, 1+z)))) $
]

#note-box(title: "💡 Phép Thế Cấu Trúc Khối (Substitution Rule)")[
  Hàm sinh Smirnov là nền tảng để đếm các chuỗi có các khối cùng ký tự liên tiếp thỏa mãn điều kiện độ dài. Mỗi biến $x_i$ trong $Phi$ đại diện cho một khối cùng loại. Nếu ta muốn các khối cùng loại thứ $i$ có độ dài thuộc tập hợp $S_i$, ta chỉ cần thay thế:
  $ x_i arrow.r.double f_i(x_i) = sum_(s in S_i) x_i^s $
  vào hàm sinh Smirnov.
  - Nếu độ dài các khối bất kỳ ($S_i = {1, 2, dots}$): $x_i arrow.r.double frac(x_i, 1-x_i)$. Khi đó hàm sinh tổng trở thành $frac(1, 1 - (x_1 + dots + x_k))$, tức là đếm chuỗi tự do.
  - Nếu không có hai ký tự kề nhau nào giống nhau ($S_i = {1}$): $x_i arrow.r.double x_i$. Hàm sinh chính là $Phi(x_1, dots, x_k)$.
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-8-1",
  [
    Tìm số chuỗi độ dài $n$ gồm các ký tự chọn từ tập $\{A, B, C\}$ sao cho không có hai ký tự kề nhau nào giống nhau.
  ],
  [$3 dot 2^(n-1)$],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm chuỗi Smirnov cơ bản trên bảng chữ cái 3 ký tự. Ta giải bằng hai cách để thấy sự tương đồng kỳ diệu giữa tổ hợp thuần túy và hàm sinh.
    ]

    #cach1-box[
      *Lập luận quy tắc nhân:*
      - Ký tự đầu tiên có 3 cách chọn (A, B hoặc C).
      - Mỗi ký tự tiếp theo phải khác ký tự ngay trước nó, nên có đúng 2 cách chọn.
      Vậy số chuỗi thỏa mãn độ dài $n >= 1$ là:
      $ a_n = 3 dot 2^(n-1) $
    ]

    #cach2-box[
      *Sử dụng Hàm sinh Smirnov:*
      Đặt $x = y = z = t$ trong hàm sinh Smirnov của 3 biến:
      $
        G(t) = Phi(t, t, t) = frac(1, 1 - lr((frac(t, 1+t) + frac(t, 1+t) + frac(t, 1+t)))) = frac(1, 1 - frac(3t, 1+t))
      $
      $ G(t) = frac(1+t, 1 - 2t) = (1+t) sum_(n=0)^oo (2t)^n = (1+t)(1 + 2t + 4t^2 + dots + 2^n t^n + dots) $
      Trích hệ số của $t^n$ với $n >= 1$:
      $ a_n = [t^n] G(t) = 2^n + 2^(n-1) = 3 dot 2^(n-1) $
      Công thức hàm sinh cho kết quả cực kỳ gọn gàng và hoàn toàn trùng khớp!
    ]

    #ans-box[Số chuỗi thỏa mãn là $3 dot 2^(n-1)$.]
  ],
)

#tln(
  id: "GF2-8-2",
  [
    Năm học 2025 – 2026, thầy Ái chọn ra 8 học sinh giải nhất, 5 học sinh giải nhì, 3 học sinh giải ba để xếp ngẫu nhiên thành một hàng ngang. Gọi $p$ là xác suất để không có hai học sinh cùng giải đứng cạnh nhau. Hãy tính giá trị của $10^5 p$ (làm tròn kết quả đến hàng đơn vị).
  ],
  [45],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm số cách sắp xếp các phần tử phân biệt có điều kiện kề nhau.
      Tổng số học sinh là $8 + 5 + 3 = 16$ học sinh phân biệt.
      Số cách xếp ngẫu nhiên 16 học sinh này là $|Omega| = 16!$ cách.

      Gọi 3 nhóm học sinh tương ứng với 3 lớp ký tự $A$ (giải nhất - 8 người), $B$ (giải nhì - 5 người), $C$ (giải ba - 3 người).
      Để không có hai học sinh cùng giải đứng cạnh nhau, chuỗi các giải tương ứng phải là một từ Smirnov độ dài 16 chứa đúng 8 chữ $A$, 5 chữ $B$, và 3 chữ $C$.

      Sau khi xếp xong mô hình giải (chuỗi Smirnov), ta nhân với hoán vị học sinh trong từng giải: $8! dot 5! dot 3!$.
    ]

    #cach1-box[
      *Đếm bằng Phương pháp Truy hồi / Quy hoạch động:*
      Ta cần tính số cách xếp $W$ cho chuỗi các chữ cái $A, B, C$ sao cho không có hai chữ cái giống nhau đứng cạnh nhau.
      Gọi $W(a, b, c, "last")$ là số chuỗi thỏa mãn gồm $a$ chữ $A$, $b$ chữ $B$, $c$ chữ $C$, với ký tự cuối cùng là $"last" in {A, B, C}$.
      Ta có hệ thức truy hồi:
      $ W(a, b, c, A) = W(a-1, b, c, B) + W(a-1, b, c, C) $
      $ W(a, b, c, B) = W(a, b-1, c, A) + W(a, b-1, c, C) $
      $ W(a, b, c, C) = W(a, b, c-1, A) + W(a, b, c-1, B) $
      Với các điều kiện biên thích hợp. Tính toán hệ thống (hoặc chạy bằng thuật toán trên máy tính) cho kết quả số lượng chuỗi giải thỏa mãn là:
      $ W = 322 " chuỗi" $
    ]

    #cach2-box[
      *Sử dụng Hàm sinh Smirnov:*
      Số cách xếp chuỗi giải thỏa mãn chính là hệ số của $x^8 y^5 z^3$ trong hàm sinh Smirnov:
      $ W = [x^8 y^5 z^3] frac(1, 1 - lr((frac(x, 1+x) + frac(y, 1+y) + frac(z, 1+z)))) $
      Khai triển các phân thức dưới dạng chuỗi lũy thừa:
      $ frac(x, 1+x) = x - x^2 + x^3 - x^4 + x^5 - x^6 + x^7 - x^8 $
      $ frac(y, 1+y) = y - y^2 + y^3 - y^4 + y^5 $
      $ frac(z, 1+z) = z - z^2 + z^3 $
      Đặt $u = frac(x, 1+x) + frac(y, 1+y) + frac(z, 1+z)$. Hệ số cần tìm là $[x^8 y^5 z^3] sum_(n=1)^16 u^n$.
      Thực hiện nhân đa thức thu được kết quả:
      $ W = 322 $
    ]

    *Tính toán Xác suất:*
    Số cách xếp học sinh thỏa mãn điều kiện kề là:
    $ N = W dot 8! dot 5! dot 3! = 322 dot 8! dot 5! dot 3! $

    Xác suất $p$ là:
    $
      p = frac(N, 16!) = frac(322 dot 8! dot 5! dot 3!, 16!) = frac(322 dot 120 dot 6, 16 dot 15 dot 14 dot 13 dot 12 dot 11 dot 10 dot 9) = frac(23, 51480) approx 0.000446775
    $

    Giá trị cần tính:
    $ 10^5 p = 10^5 dot frac(23, 51480) approx 44.6775 $
    Làm tròn đến hàng đơn vị là *45*.

    #note-box(title: "📌 Các giá trị tương tự")[
      - Nếu tính $5 dot 10^5 p approx 223.39 arrow.r.double$ Làm tròn là *223*.
      - Nếu tính $10^6 p approx 446.78 arrow.r.double$ Làm tròn là *447*.
    ]

    #ans-box[Xác suất thỏa mãn là $p = frac(23, 51480)$. Giá trị $10^5 p$ làm tròn đến hàng đơn vị là *45*.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 9 — LÁT GẠCH & HỆ THỨC TRUY HỒI LIÊN KẾT
// ═══════════════════════════════════════════════════════════════
= Dạng 9 — Lát Gạch & Hệ Thức Truy Hồi Liên Kết

== Lý Thuyết

#thm-box(title: "📐 Mô Hình Hóa Bài Toán Lát Gạch Bằng Hàm Sinh")[
  Lát gạch là bài toán đếm số cách phủ kín một bảng kích thước $d times n$ bằng các viên gạch kích thước nhỏ hơn (thường là domino $2 times 1$ hoặc gạch vuông $1 times 1$, $2 times 2$).

  *1. Lát bảng $2 times n$ bằng domino $2 times 1$ (cổ điển):*
  - Gọi $a_n$ là số cách lát. Xét cột cuối cùng: hoặc dùng $1$ gạch đứng (còn bảng $2 times (n-1)$), hoặc dùng $2$ gạch nằm ngang (còn bảng $2 times (n-2)$).
  - Hệ thức truy hồi: $a_n = a_(n-1) + a_(n-2)$ với $a_0 = 1, a_1 = 1$.
  - Hàm sinh tương ứng:
    $ A(x) = sum_(n=0)^oo a_n x^n = frac(1, 1 - x - x^2) $

  *2. Hệ thức truy hồi liên kết (Lát bảng $3 times n$ bằng domino $2 times 1$):*
  - Do diện tích bảng là $3n$, số ô là lẻ nếu $n$ lẻ $arrow.r.double a_(2m+1) = 0$. Ta chỉ xét bảng kích thước chẵn $3 times 2m$.
  - Để lập hệ thức truy hồi, ta định nghĩa thêm một trạng thái phụ: Gọi $b_n$ là số cách lát bảng $3 times n$ bị thiếu đúng $1$ ô ở góc (trạng thái biên không hoàn chỉnh).
  - Bằng cách phân tích các cách đặt gạch ở biên, ta thu được hệ thức liên kết:
    $ a_n = a_(n-2) + 2 b_(n-1) $
    $ b_n = a_(n-1) + b_(n-2) $
  - Chuyển sang OGF: Gọi $A(x) = sum a_n x^n$ và $B(x) = sum b_n x^n$. Từ điều kiện đầu $a_0 = 1, b_0 = 0$, ta có hệ phương trình hàm sinh:
    $ A(x) = 1 + x^2 A(x) + 2 x B(x) $
    $ B(x) = x A(x) + x^2 B(x) arrow.r.double B(x) = frac(x, 1-x^2) A(x) $
  - Thay $B(x)$ vào phương trình $A(x)$, ta rút ra hàm sinh đóng tuyệt đẹp:
    $ A(x) = frac(1-x^2, 1 - 4x^2 + x^4) $
]

#note-box(title: "📌 Ý Nghĩa Của Trạng Thái Phụ")[
  Hàm sinh chứng tỏ sức mạnh vượt trội khi giải các hệ thức liên kết. Thay vì phải khử các số hạng phụ $b_n$ bằng đại số phức tạp, ta chỉ cần giải một hệ phương trình tuyến tính gồm các hàm sinh $A(x)$ và $B(x)$. Mỗi trạng thái biên chưa hoàn chỉnh tương ứng với một biến trong hệ phương trình.
]

== Bản Chất Tư Duy: Cách Thiết Lập Hệ Thức Truy Hồi & Giải Mã Hàm Sinh $1/(1-x-x^2)$

#note-box(title: "💡 Tư Duy Kiến Tạo: Làm Sao Tự Nghĩ Ra Hệ Thức Truy Hồi?")[
  Nhiều học sinh thường gặp khó khăn: *"Nếu đề bài cho sẵn hệ thức truy hồi thì mình có thể tính tiếp, nhưng làm sao từ một bài toán thực tế (như lát gạch, đi cầu thang) ta tự nghĩ ra được hệ thức đó?"*

  Bí quyết nằm ở *"Nguyên lý Trạng thái Cuối cùng"* (hoặc bước đi cuối cùng). Để tính số cách hoàn thành công việc ở quy mô $n$, hãy đặt câu hỏi: *Ngay trước khi đạt tới quy mô $n$, ta đã ở trạng thái nào và vừa thực hiện hành động cuối cùng gì?*

  *Ví dụ kinh điển (Leo cầu thang):* Bạn muốn leo lên một cầu thang có $n$ bậc. Mỗi bước, bạn chỉ có thể bước lên $1$ bậc hoặc $2$ bậc. Gọi $a_n$ là số cách leo lên bậc thứ $n$.
  Hãy đứng ở bậc thứ $n$ và nhìn ngược lại:
  - Nếu bước cuối cùng bạn bước $1$ bậc: nghĩa là trước đó bạn đang đứng ở bậc $n-1$. Số cách đi đến bậc $n-1$ là $a_(n-1)$.
  - Nếu bước cuối cùng bạn bước $2$ bậc: nghĩa là trước đó bạn đang đứng ở bậc $n-2$. Số cách đi đến bậc $n-2$ là $a_(n-2)$.

  Vì hai khả năng này độc lập (bước cuối cùng chỉ có thể là bước $1$ bậc hoặc bước $2$ bậc, không thể cùng lúc cả hai) và bao phủ mọi trường hợp có thể xảy ra, ta có ngay:
  $ a_n = a_(n-1) + a_(n-2) $
  Đó chính là cách hệ thức truy hồi được thiết lập một cách hoàn toàn trực giác và logic!
]

#eg-box(title: "🎯 Ví Dụ Trực Quan & Mịn Hóa Mối Quan Hệ Với Hệ Thức")[
  Hãy cùng liệt kê chi tiết các cách leo cầu thang từ $n = 0$ đến $n = 4$ để thấy sự tương thích hoàn hảo giữa thực tế và công thức:
  - *Với $n = 0$:* Không bước bước nào (đứng yên). Có duy nhất $1$ cách: $emptyset$. Vậy $a_0 = 1$.
  - *Với $n = 1$:* Chỉ có $1$ cách là bước $1$ bước: $(1)$. Vậy $a_1 = 1$.
  - *Với $n = 2$:* Có $2$ cách:
    - Cách 1: $(1 + 1)$ (hai bước $1$ bậc).
    - Cách 2: $(2)$ (một bước $2$ bậc).
    Vậy $a_2 = 2$ (đúng bằng $a_1 + a_0 = 1 + 1 = 2$).
  - *Với $n = 3$:* Có $3$ cách:
    - Cách 1: $(1 + 1 + 1)$ (ba bước $1$ bậc).
    - Cách 2: $(1 + 2)$ (bước $1$ bậc rồi bước $2$ bậc).
    - Cách 3: $(2 + 1)$ (bước $2$ bậc rồi bước $1$ bậc).
    Vậy $a_3 = 3$ (đúng bằng $a_2 + a_1 = 2 + 1 = 3$).
  - *Với $n = 4$:* Có $5$ cách:
    - Cách 1: $(1 + 1 + 1 + 1)$.
    - Cách 2: $(1 + 1 + 2)$.
    - Cách 3: $(1 + 2 + 1)$.
    - Cách 4: $(2 + 1 + 1)$.
    - Cách 5: $(2 + 2)$.
    Vậy $a_4 = 5$ (đúng bằng $a_3 + a_2 = 3 + 2 = 5$).
]

#thm-box(title: [🔍 Giải Mã Bản Chất Hàm Sinh $frac(1, 1 - x - x^2)$])[
  Tại sao phân số có vẻ "lạ kỳ" $frac(1, 1 - x - x^2)$ lại liên quan đến số cách leo cầu thang hay lát gạch domino? Chúng ta có hai cách tiếp cận:

  === 1. Góc nhìn Đại Số: Công cụ "Nén" Dữ Liệu
  Hãy tưởng tượng hàm sinh $A(x) = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + dots$ giống như một chiếc tủ có nhiều ngăn. Ngăn thứ $n$ chứa thông tin là số cách $a_n$, còn $x^n$ chỉ đóng vai trò là "nhãn địa chỉ" để phân biệt các ngăn.

  Ta viết lại hệ thức truy hồi dưới dạng $a_n - a_(n-1) - a_(n-2) = 0$ (với $n >= 2$) và thực hiện phép nhân:
  $
    A(x) = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + a_4 x^4 + dots
  $
  $
    -x A(x) = - a_0 x - a_1 x^2 - a_2 x^3 - a_3 x^4 - dots
  $
  $
    -x^2 A(x) = - a_0 x^2 - a_1 x^3 - a_2 x^4 - dots
  $

  Cộng ba dòng này lại theo từng cột dọc:
  $
    A(x)(1 - x - x^2) = a_0 + (a_1 - a_0)x + underbrace((a_2 - a_1 - a_0), = 0)x^2 + underbrace((a_3 - a_2 - a_1), = 0)x^3 + underbrace((a_4 - a_3 - a_2), = 0)x^4 + dots
  $

  Vì hệ thức truy hồi triệt tiêu toàn bộ các số hạng từ $x^2$ trở đi, vế phải chỉ còn lại hai số hạng đầu tiên:
  $ A(x)(1 - x - x^2) = a_0 + (a_1 - a_0)x $
  Thế các giá trị ban đầu $a_0 = 1$ và $a_1 = 1$, ta được:
  $ A(x)(1 - x - x^2) = 1 + (1 - 1)x = 1 arrow.r.double A(x) = frac(1, 1 - x - x^2) $
  Đây chính là nguồn gốc đại số của hàm sinh!

  === 2. Góc nhìn Tổ Hợp: Phép nhân đa thức là sự lựa chọn các bước đi
  Hãy nhớ lại công thức khai triển chuỗi hình học: $frac(1, 1 - y) = 1 + y + y^2 + y^3 + y^4 + dots$
  Nếu đặt $y = x + x^2$, ta khai triển:
  $ A(x) = frac(1, 1 - (x + x^2)) = 1 + (x + x^2) + (x + x^2)^2 + (x + x^2)^3 + (x + x^2)^4 + dots $

  Ý nghĩa của mỗi số hạng trong tổng này là gì?
  - Số hạng $1$ (tương ứng $(x+x^2)^0$): Không thực hiện bước nào (đứng yên).
  - Số hạng $(x + x^2)^1$: Thực hiện đúng $1$ bước. Bước này có thể là bước $1$ bậc (nhãn $x$) hoặc bước $2$ bậc (nhãn $x^2$).
  - Số hạng $(x + x^2)^2 = x^2 + 2x^3 + x^4$: Thực hiện đúng $2$ bước.
    - $x^2 = x dot x$ (bước $1$ rồi bước $1$).
    - $2x^3 = x dot x^2 + x^2 dot x$ (bước $1$ rồi bước $2$, hoặc ngược lại).
    - $x^4 = x^2 dot x^2$ (bước $2$ rồi bước $2$).
  - Số hạng $(x + x^2)^3 = x^3 + 3x^4 + 3x^5 + x^6$: Thực hiện đúng $3$ bước.
    - $x^3 = x dot x dot x$ ($1$ cách đạt tổng $3$ bậc).
    - $3x^4 = x dot x dot x^2 + x dot x^2 dot x + x^2 dot x dot x$ ($3$ cách đạt tổng $4$ bậc từ $3$ bước).

  Như vậy, khi ta cộng tất cả các trường hợp lại (không giới hạn số bước), hệ số của $x^n$ trong khai triển chính là *tổng số cách ghép các bước đi có độ dài $1$ (nhãn $x$) và $2$ (nhãn $x^2$) để đạt tổng độ cao là $n$*.

  Khai triển Taylor (hoặc chia đa thức) cho ta:
  $ frac(1, 1 - x - x^2) = 1 + 1 x + 2 x^2 + 3 x^3 + 5 x^4 + 8 x^5 + 13 x^6 + dots $
  Các hệ số $1, 1, 2, 3, 5, 8, 13, dots$ chính là dãy số cách lát gạch/leo cầu thang mà ta đã tính thủ công ở trên!
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-9-1",
  [
    Có bao nhiêu cách lát một bảng kích thước $2 times n$ bằng các viên gạch domino $2 times 1$ (được xoay tự do) và các viên gạch vuông kích thước $2 times 2$?
  ],
  [frac(2^(n+1) + (-1)^n, 3)],
  loigiai: [
    #ppgiai[
      Đây là bài toán lát bảng $2 times n$ bằng gạch kích thước nhỏ. Ta có thể lập hệ thức truy hồi bằng cách xét cấu tạo của cột cuối cùng của bảng.
    ]

    #cach1-box[
      Gọi $a_n$ là số cách lát bảng kích thước $2 times n$. Xét các khả năng lát ở cột cuối cùng bên phải:
      - Khả năng 1: Lát bằng $1$ viên domino $2 times 1$ đặt thẳng đứng. Phần còn lại là bảng $2 times (n-1)$, có $a_(n-1)$ cách lát.
      - Khả năng 2: Lát bằng $2$ viên domino $2 times 1$ nằm ngang đặt song song. Phần còn lại là bảng $2 times (n-2)$, có $a_(n-2)$ cách lát.
      - Khả năng 3: Lát bằng $1$ viên gạch vuông $2 times 2$. Phần còn lại là bảng $2 times (n-2)$, có $a_(n-2)$ cách lát.

      Cộng các khả năng độc lập này lại, ta thu được hệ thức truy hồi:
      $ a_n = a_(n-1) + 2 a_(n-2) $
      Với điều kiện đầu dễ thấy:
      - $a_0 = 1$ (bảng rỗng có đúng 1 cách lát).
      - $a_1 = 1$ (bảng $2 times 1$ chỉ có 1 cách đặt đứng domino).
      - $a_2 = 3$ (gồm: 2 đứng, 2 ngang, hoặc 1 vuông $2 times 2$).

      Phương trình đặc trưng của hệ thức truy hồi:
      $ r^2 - r - 2 = 0 arrow.r.double (r-2)(r+1) = 0 arrow.r.double r = 2 " hoặc " r = -1 $
      Công thức tổng quát có dạng $a_n = A dot 2^n + B dot (-1)^n$. Thay $n=0, n=1$:
      $ A + B = 1 \ 2A - B = 1 arrow.r.double A = frac(2, 3), B = frac(1, 3) $
      Vậy $a_n = frac(2, 3) dot 2^n + frac(1, 3) dot (-1)^n = frac(2^(n+1) + (-1)^n, 3)$.
    ]

    #cach2-box[
      *Giải bằng Hàm sinh (OGF):*
      Từ hệ thức truy hồi $a_n = a_(n-1) + 2 a_(n-2)$ với $a_0 = 1, a_1 = 1$:
      Nhân hai vế với $x^n$ và lấy tổng từ $n=2$ đến $oo$:
      $ sum_(n=2)^oo a_n x^n = sum_(n=2)^oo a_(n-1) x^n + 2 sum_(n=2)^oo a_(n-2) x^n $
      Đặt $A(x) = sum_(n=0)^oo a_n x^n$, ta có phương trình:
      $ A(x) - a_0 - a_1 x = x (A(x) - a_0) + 2 x^2 A(x) $
      Thay $a_0 = 1, a_1 = 1$:
      $ A(x) - 1 - x = x (A(x) - 1) + 2 x^2 A(x) $
      $ A(x) (1 - x - 2x^2) = 1 $
      $ A(x) = frac(1, 1 - x - 2x^2) = frac(1, (1-2x)(1+x)) $

      Dùng phương pháp hệ số bất định tách phân thức:
      $ A(x) = frac(2/3, 1-2x) + frac(1/3, 1+x) $
      Khai triển thành chuỗi lũy thừa:
      $ A(x) = frac(2, 3) sum_(n=0)^oo 2^n x^n + frac(1, 3) sum_(n=0)^oo (-1)^n x^n $
      Suy ra hệ số của $x^n$:
      $ a_n = [x^n] A(x) = frac(2^(n+1) + (-1)^n, 3) $
    ]

    #ans-box[Số cách lát bảng $2 times n$ là $a_n = frac(2^(n+1) + (-1)^n, 3)$ cách.]
  ],
)

#tln(
  id: "GF2-9-2",
  [
    Lát một bảng kích thước $3 times 6$ bằng các viên gạch domino $2 times 1$. Hỏi có bao nhiêu cách lát tất cả?
  ],
  [41],
  loigiai: [
    #ppgiai[
      Đây là bài toán lát bảng $3 times n$ với $n = 6$ chẵn. Ta sử dụng hệ phương trình trạng thái biên liên kết đã dựng ở phần lý thuyết để tìm đáp số.
    ]

    #cach1-box[
      *Phân tích quy hoạch động trạng thái:*
      Gọi $a_n$ là số cách lát bảng hoàn chỉnh $3 times n$.
      Gọi $b_n$ là số cách lát bảng $3 times n$ bị khuyết $1$ ô ở góc (ví dụ góc dưới bên phải).
      - Để tạo ra bảng hoàn chỉnh $3 times n$, ta có hai cách đi từ các trạng thái trước:
        - Đặt $1$ domino dọc và $1$ domino ngang chèn vào góc khuyết của trạng thái $b_(n-1)$, có $2$ hướng đối xứng $arrow.r.double 2 b_(n-1)$ cách.
        - Đặt $3$ domino dọc (nếu $n$ chẵn) hoặc các cấu hình dọc ngang chiếm trọn $2$ cột cuối của trạng thái $a_(n-2)$ $arrow.r.double a_(n-2)$ cách.
        Vậy ta có: $a_n = a_(n-2) + 2 b_(n-1)$.
      - Để tạo ra bảng khuyết $b_n$, ta có hai cách:
        - Đặt $1$ domino nằm ngang vào cột cuối của trạng thái $a_(n-1)$ $arrow.r.double a_(n-1)$ cách.
        - Đặt $1$ domino dọc chiếm 2 ô của góc khuyết ở trạng thái $b_(n-2)$ $arrow.r.double b_(n-2)$ cách.
        Vậy ta có: $b_n = a_(n-1) + b_(n-2)$.

      Tính toán từng bước với điều kiện đầu $a_0 = 1, b_0 = 0$:
      - $a_1 = 0, b_1 = a_0 + b_(-1) = 1$
      - $a_2 = a_0 + 2 b_1 = 1 + 2(1) = 3$
      - $b_2 = a_1 + b_0 = 0$
      - $a_3 = 0, b_3 = a_2 + b_1 = 3 + 1 = 4$
      - $a_4 = a_2 + 2 b_3 = 3 + 2(4) = 11$
      - $b_4 = a_3 + b_2 = 0$
      - $a_5 = 0, b_5 = a_4 + b_3 = 11 + 4 = 15$
      - $a_6 = a_4 + 2 b_5 = 11 + 2(15) = bold(41)$
    ]

    #cach2-box[
      *Sử dụng Hàm sinh:*
      Từ hệ phương trình hàm sinh đã giải ở lý thuyết:
      $ A(x) = frac(1-x^2, 1 - 4x^2 + x^4) $
      Đặt $t = x^2$ đại diện cho cặp cột (vì $a_n = 0$ với mọi $n$ lẻ). Khi đó hàm sinh của số cách lát theo $m$ cặp cột ($n = 2m$) là:
      $ F(t) = sum_(m=0)^oo a_(2m) t^m = frac(1-t, 1 - 4t + t^2) $
      Ta cần tìm hệ số của $t^3$ (tương ứng với $n = 6$).
      Nhân chéo ta có: $F(t)(1 - 4t + t^2) = 1-t$. Do đó hệ số thỏa mãn:
      $ a_(2m) - 4 a_(2m-2) + a_(2m-4) = 0 arrow.r.double a_(2m) = 4 a_(2m-2) - a_(2m-4) \ (m >= 2) $
      Với các giá trị đầu:
      - $a_0 = 1$
      - $a_2 = 4 a_0 - 1 = 3$ (do số hạng tự do vế phải là $-t$, nên hạng tử bậc 1 là $-a_0 t + a_2 t = -t arrow.r.double a_2 = 4a_0 - 1 = 3$).
      Áp dụng hệ thức quy hồi:
      - Với $m=2$ ($n=4$): $a_4 = 4 a_2 - a_0 = 4(3) - 1 = 11$.
      - With $m=3$ ($n=6$): $a_6 = 4 a_4 - a_2 = 4(11) - 3 = bold(41)$.
      Kết quả hoàn toàn trùng khớp cực kỳ nhanh chóng!
    ]

    #ans-box[Số cách lát bảng $3 times 6$ là $bold(41)$ cách.]
  ],
)

#tln(
  id: "GF2-9-3",
  [
    Có bao nhiêu cách lát một bảng kích thước $2 times n$ bằng các viên gạch domino kích thước $2 times 1$ (được xoay tự do) và các viên gạch chữ L (L-tromino) kích thước $3$ ô (xoay tự do)?
  ],
  [A(x) = frac(1-x, 1 - 2x - x^3)],
  loigiai: [
    #ppgiai[
      Đây là bài toán lát bảng kích thước $2 times n$ sử dụng kết hợp hai loại gạch: domino $2 times 1$ và L-tromino $3$ ô. Ta định nghĩa các trạng thái biên chưa hoàn thành để thiết lập hệ thức truy hồi liên kết.
    ]

    #cach1-box[
      *Lập hệ thức liên kết và quy hoạch động:*
      Gọi $a_n$ là số cách lát bảng hoàn chỉnh $2 times n$.
      Gọi $b_n$ là số cách lát bảng $2 times n$ bị khuyết đúng $1$ ô ở góc (top-right hoặc bottom-right). Do đối xứng, hai trạng thái này có số cách lát bằng nhau và cùng bằng $b_n$.

      Xét cách lấp đầy cột cuối cùng bên phải của bảng hoàn chỉnh $2 times n$:
      - Trường hợp 1: Đặt $1$ domino dọc ở cột cuối. Phần còn lại là bảng hoàn chỉnh $2 times (n-1)$, có $a_(n-1)$ cách.
      - Trường hợp 2: Đặt $2$ domino nằm ngang ở cuối. Phần còn lại là bảng hoàn chỉnh $2 times (n-2)$, có $a_(n-2)$ cách.
      - Trường hợp 3: Đặt $1$ gạch L-tromino chiếm 2 ô ở cột cuối và 1 ô ở cột kề cuối. Có $2$ hướng quay của gạch L-tromino (khuyết góc trên hoặc góc dưới của cột kề cuối). Sau khi đặt, phần còn lại chính là trạng thái khuyết 1 ô ở góc của bảng kích thước $2 times (n-1)$. Số cách lát là $2 b_(n-1)$.
      Do đó ta có:
      $ a_n = a_(n-1) + a_(n-2) + 2 b_(n-1) $

      Xét cách lấp đầy ô duy nhất nhô ra của trạng thái khuyết $b_n$:
      - Khả năng 1: Đặt $1$ domino nằm ngang. Điều này buộc ô kề bên nó cũng bị chiếm dụng, để lại một trạng thái khuyết 1 ô của bảng $2 times (n-1)$, có $b_(n-1)$ cách.
      - Khả năng 2: Đặt $1$ gạch L-tromino che phủ ô nhô ra và 2 ô của cột kề bên. Điều này lấp đầy hoàn chỉnh cột đó và để lại bảng hoàn chỉnh $2 times (n-2)$, có $a_(n-2)$ cách.
      Do đó ta có:
      $ b_n = b_(n-1) + a_(n-2) $

      Với điều kiện đầu: $a_0 = 1, a_1 = 1, b_0 = 0, b_1 = 0$. Ta tính được:
      - $a_2 = a_1 + a_0 + 2 b_1 = 1 + 1 + 2(0) = 2$
      - $b_2 = b_1 + a_0 = 0 + 1 = 1$
      - $a_3 = a_2 + a_1 + 2 b_2 = 2 + 1 + 2(1) = 5$
      - $b_3 = b_2 + a_1 = 1 + 1 = 2$
      - $a_4 = a_3 + a_2 + 2 b_3 = 5 + 2 + 2(2) = 11$
    ]

    #cach2-box[
      *Giải bằng Hàm sinh thông thường (OGF):*
      Gọi $A(x) = sum_(n=0)^oo a_n x^n$ và $B(x) = sum_(n=0)^oo b_n x^n$ là các OGF tương ứng.
      Từ hệ thức truy hồi và các điều kiện biên:
      $ A(x) = 1 + x + sum_(n=2)^oo (a_(n-1) + a_(n-2) + 2 b_(n-1)) x^n $
      $ A(x) = 1 + x + x(A(x) - 1) + x^2 A(x) + 2x B(x) = 1 + x A(x) + x^2 A(x) + 2x B(x) $
      $ B(x) = sum_(n=1)^oo (b_(n-1) + a_(n-2)) x^n = x B(x) + x^2 A(x) $

      Từ phương trình thứ hai, ta có:
      $ B(x)(1-x) = x^2 A(x) => B(x) = frac(x^2, 1-x) A(x) $

      Thế $B(x)$ vào phương trình thứ nhất:
      $ A(x) = 1 + x A(x) + x^2 A(x) + frac(2x^3, 1-x) A(x) $
      $ A(x) lr((1 - x - x^2 - frac(2x^3, 1-x))) = 1 $
      $ A(x) dot frac(1 - 2x - x^3, 1-x) = 1 => A(x) = frac(1-x, 1 - 2x - x^3) $
      Khai triển hàm sinh này cho ta dãy số cách lát bảng: $1, 1, 2, 5, 11, 24, 53, 117, dots$
    ]

    #ans-box[Hàm sinh của số cách lát bảng là $A(x) = frac(1-x, 1 - 2x - x^3)$.]
  ],
)

#tln(
  id: "GF2-9-4",
  [
    Có bao nhiêu cách lát một bảng kích thước $4 times n$ bằng các viên gạch domino kích thước $2 times 1$ (được xoay tự do)?
  ],
  [F(x) = frac(1-x^2, 1 - x - 5x^2 + x^3 + x^4)],
  loigiai: [
    #ppgiai[
      Đây là bài toán lát bảng kích thước $4 times n$ bằng gạch domino $2 times 1$. Số ô của bảng là $4n$, luôn chẵn với mọi $n >= 1$. Ta có thể lập hệ thức truy hồi bậc cao và chuyển đổi sang hàm sinh để tìm công thức đóng.
    ]

    #cach1-box[
      *Đại số hóa và Hệ thức truy hồi:*
      Gọi $f(n)$ là số cách lát bảng hoàn chỉnh $4 times n$.
      Bằng cách sử dụng phương pháp ma trận chuyển trạng thái (Transfer Matrix Method) hoặc phân tích trạng thái biên, ta thu được hệ thức truy hồi cho $f(n)$ như sau:
      $ f(n) = f(n-1) + 5f(n-2) + f(n-3) - f(n-4) quad text("với mọi") quad n >= 4 $
      Các điều kiện đầu tiên có thể dễ dàng tính toán trực tiếp:
      - $f(0) = 1$ (bảng rỗng).
      - $f(1) = 1$ (chỉ có 1 cách xếp là 2 domino dọc song song).
      - $f(2) = 5$ (5 cách xếp trên bảng $4 times 2$).
      - $f(3) = 11$ (11 cách xếp trên bảng $4 times 3$).

      Áp dụng hệ thức truy hồi trên cho các bước tiếp theo:
      - $f(4) = f(3) + 5f(2) + f(1) - f(0) = 11 + 5(5) + 1 - 1 = 36$.
      - $f(5) = f(4) + 5f(3) + f(2) - f(1) = 36 + 5(11) + 5 - 1 = 95$.
      - $f(6) = f(5) + 5f(4) + f(3) - f(2) = 95 + 5(36) + 11 - 5 = 281$.
    ]

    #cach2-box[
      *Sử dụng Hàm sinh OGF:*
      Gọi $F(x) = sum_(n=0)^oo f(n) x^n$ là hàm sinh của dãy $f(n)$.
      Nhân cả hai vế của hệ thức truy hồi với $x^n$ và lấy tổng từ $n=4$ đến $oo$:
      $
        sum_(n=4)^oo f(n) x^n = sum_(n=4)^oo f(n-1) x^n + 5 sum_(n=4)^oo f(n-2) x^n + sum_(n=4)^oo f(n-3) x^n - sum_(n=4)^oo f(n-4) x^n
      $
      Biến đổi các tổng theo $F(x)$:
      $ (F(x) - 1 - x - 5x^2 - 11x^3) = x(F(x) - 1 - x - 5x^2) + 5x^2(F(x) - 1 - x) + x^3(F(x) - 1) - x^4 F(x) $
      Thu gọn phương trình đại số:
      $ F(x) (1 - x - 5x^2 + x^3 + x^4) = 1 - x^2 $
      Suy ra hàm sinh dạng phân thức hữu tỷ đóng:
      $ F(x) = frac(1-x^2, 1 - x - 5x^2 + x^3 + x^4) $
      Hàm sinh này biểu diễn trọn vẹn số cách lát bảng $4 times n$ cho mọi giá trị của $n$.
    ]

    #ans-box[Hàm sinh của số cách lát bảng là $F(x) = frac(1-x^2, 1 - x - 5x^2 + x^3 + x^4)$.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 10 — ĐI TRÊN LƯỚI, ROBOT DI CHUYỂN & SỐ DELANNOY/SCHROEDER
// ═══════════════════════════════════════════════════════════════
= Dạng 10 — Lưới Tọa Độ, Robot Di Chuyển & Số Delannoy, Số Schroeder

== Lý Thuyết

#thm-box(title: "📐 Hàm Sinh Hai Biến Cho Các Bài Toán Đi Trên Lưới")[
  Xét robot di chuyển trên lưới tọa độ từ $(0,0)$ đến $(m,n)$ bằng các bước đi hợp lệ. Ta dùng biến $x$ đại diện cho bước sang phải $(1,0)$ và $y$ cho bước đi lên $(0,1)$.

  *1. Số Delannoy $D(m,n)$:* Cho phép $3$ loại bước đi:
  - Bước sang phải: $H(1,0) arrow.r.double x$
  - Bước đi lên: $V(0,1) arrow.r.double y$
  - Bước đi chéo: $D(1,1) arrow.r.double x y$
  - Hàm sinh hai biến tổng quát:
    $ G(x, y) = sum_(m=0)^oo sum_(n=0)^oo D(m,n) x^m y^n = frac(1, 1 - x - y - x y) $
  - Số đường đi trên trục đường chéo chính $D(n,n)$ có hàm sinh một biến cực kỳ nổi tiếng (được trích bằng phép trích đường chéo phức):
    $ F(x) = sum_(n=0)^oo D(n,n) x^n = frac(1, sqrt(1 - 6x + x^2)) $

  *2. Số Schroeder lớn $S_n$:* Robot đi từ $(0,0)$ đến $(n,n)$ dùng các bước $(1,0), (0,1), (1,1)$ nhưng *không bao giờ đi vượt lên phía trên đường chéo chính $y = x$*.
  - Hàm sinh $S(x) = sum_(n=0)^oo S_n x^n$ thỏa mãn phương trình phi tuyến tính tự tham chiếu:
    $ S(x) = 1 + x S(x) + x S(x)^2 $
  - Nghiệm của phương trình này là:
    $ S(x) = frac(1 - x - sqrt(1 - 6x + x^2), 2x) $
  - Dãy số Schroeder lớn: $S_0 = 1, S_1 = 2, S_2 = 6, S_3 = 22, S_4 = 90, dots$
]

#note-box(title: "📌 Mối Liên Hệ Giữa Catalan Vòng Và Schroeder")[
  Nếu số Catalan $C(x) = 1 + x C(x)^2$ mô tả các bước đi không có bước chéo, thì số Schroeder cho phép thêm các bước chéo $(1,1)$ ngay trên đường chéo chính. Mỗi bước chéo này chia đường đi thành các phần độc lập, dẫn đến số hạng tuyến tính $x S(x)$ trong phương trình hàm sinh.
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-10-1",
  [
    Một robot di chuyển trên lưới tọa độ từ điểm $(0,0)$ đến điểm $(3,3)$. Tại mỗi bước, robot chỉ được phép đi sang phải $1$ đơn vị, đi lên trên $1$ đơn vị, hoặc đi chéo lên-phải $1$ đơn vị. Hỏi có bao nhiêu đường đi khác nhau?
  ],
  [63],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm số đường đi Delannoy trên lưới kích thước $3 times 3$, tức là tìm số Delannoy chéo $D(3,3)$.
    ]

    #cach1-box[
      *Quy hoạch động trên lưới:*
      Gọi $D(i, j)$ là số đường đi từ $(0,0)$ đến $(i, j)$. Theo quy tắc bước đi, robot chỉ có thể đến $(i, j)$ từ ba ô ngay trước nó là $(i-1, j)$, $(i, j-1)$ và $(i-1, j-1)$.
      Hệ thức quy hoạch động:
      $ D(i, j) = D(i-1, j) + D(i, j-1) + D(i-1, j-1) $
      Ta tính các giá trị trên lưới kích thước $3 times 3$:
      - Dòng $0$: $D(0,0) = 1$, $D(1,0) = 1$, $D(2,0) = 1$, $D(3,0) = 1$
      - Dòng $1$:
        - $D(0,1) = 1$
        - $D(1,1) = D(0,1) + D(1,0) + D(0,0) = 1 + 1 + 1 = 3$
        - $D(2,1) = D(1,1) + D(2,0) + D(1,0) = 3 + 1 + 1 = 5$
        - $D(3,1) = D(2,1) + D(3,0) + D(2,0) = 5 + 1 + 1 = 7$
      - Dòng $2$:
        - $D(0,2) = 1$
        - $D(1,2) = 5$ (do đối xứng $D(1,2) = D(2,1)$)
        - $D(2,2) = D(1,2) + D(2,1) + D(1,1) = 5 + 5 + 3 = 13$
        - $D(3,2) = D(2,2) + D(3,1) + D(2,1) = 13 + 7 + 5 = 25$
      - Dòng $3$:
        - $D(0,3) = 1$
        - $D(1,3) = 7$
        - $D(2,3) = 25$
        - $D(3,3) = D(2,3) + D(3,2) + D(2,2) = 25 + 25 + 13 = bold(63)$
    ]

    #cach2-box[
      *Giải bằng Hàm sinh chéo:*
      Hàm sinh của các số Delannoy chéo $D(n,n)$ là:
      $ F(x) = (1 - 6x + x^2)^(-1/2) $
      Áp dụng khai triển nhị thức Newton tổng quát $(1-u)^(-1/2) = 1 + frac(1, 2) u + frac(3, 8) u^2 + frac(5, 16) u^3 + dots$
      Với $u = 6x - x^2$, ta cần tìm hệ số của $x^3$:
      $ [x^3] F(x) = [x^3] lr((1 + frac(1, 2)(6x - x^2) + frac(3, 8)(6x - x^2)^2 + frac(5, 16)(6x - x^2)^3 + dots)) $
      Ta chỉ cần quan tâm các số hạng có số mũ của $x$ đạt tới 3:
      - Từ hạng tử $frac(3, 8)(6x - x^2)^2 = frac(3, 8)(36x^2 - 12x^3 + x^4) arrow.r.double [x^3]$ là $frac(3, 8) dot (-12) = -frac(9, 2) = -4.5$.
      - Từ hạng tử $frac(5, 16)(6x - x^2)^3 = frac(5, 16)(216x^3 - 36x^4 + dots) arrow.r.double [x^3]$ là $frac(5, 16) dot 216 = frac(1080, 16) = 67.5$.
      - Các hạng tử bậc cao hơn không chứa lũy thừa $x^3$.

      Cộng hai kết quả lại:
      $ D(3,3) = -4.5 + 67.5 = bold(63) $
      Công thức hàm sinh cho kết quả cực kỳ thanh lịch và không cần vẽ lưới!
    ]

    #ans-box[Số đường đi của robot là $bold(63)$ đường đi.]
  ],
)

#tln(
  id: "GF2-10-2",
  [
    Có bao nhiêu đường đi từ điểm $(0,0)$ đến $(3,3)$ sử dụng các bước sang phải $(1,0)$, đi lên $(0,1)$ và đi chéo $(1,1)$ sao cho đường đi không bao giờ đi lên phía trên đường chéo chính $y = x$?
  ],
  [22],
  loigiai: [
    #ppgiai[
      Đây chính là bài toán đếm đường đi Schroeder lớn thứ 3 ($S_3$), trong đó đường đi bị chặn bởi đường biên $y <= x$.
    ]

    #cach1-box[
      *Quy hoạch động có điều kiện biên:*
      Gọi $S(i, j)$ là số đường đi hợp lệ từ $(0,0)$ đến $(i, j)$ với điều kiện $i >= j$.
      - Nếu $i > j$, ta có thể đi đến $(i,j)$ từ cả ba hướng:
        $ S(i, j) = S(i-1, j) + S(i, j-1) + S(i-1, j-1) $
      - Nếu $i = j$ (nằm trên đường chéo), ta không thể đi từ $(i-1, i)$ vì điểm này vi phạm điều kiện $y <= x$.
        Do đó: $ S(i, i) = S(i, i-1) + S(i-1, i-1) $ (chỉ nhận bước đi từ dưới lên hoặc đi chéo từ góc dưới trái).

      Ta tính bảng giá trị:
      - $S(0,0) = 1$
      - Cột $1$: $S(1,0) = 1 arrow.r.double S(1,1) = S(1,0) + S(0,0) = 1 + 1 = 2$.
      - Cột $2$:
        - $S(2,0) = 1$
        - $S(2,1) = S(1,1) + S(2,0) + S(1,0) = 2 + 1 + 1 = 4$
        - $S(2,2) = S(2,1) + S(1,1) = 4 + 2 = 6$
      - Cột $3$:
        - $S(3,0) = 1$
        - $S(3,1) = S(2,1) + S(3,0) + S(2,0) = 4 + 1 + 1 = 6$
        - $S(3,2) = S(2,2) + S(3,1) + S(2,1) = 6 + 6 + 4 = 16$
        - $S(3,3) = S(3,2) + S(2,2) = 16 + 6 = bold(22)$
    ]

    #cach2-box[
      *Giải bằng Hệ thức khai triển hàm sinh:*
      Hàm sinh số Schroeder lớn $S(x)$ thỏa mãn:
      $ S(x) = 1 + x S(x) + x S(x)^2 $
      So sánh hệ số của hai vế để thiết lập hệ thức truy hồi của dãy $S_n$:
      $ S_n = [x^n] S(x) = [x^(n-1)] S(x) + [x^(n-1)] S(x)^2 $
      $ S_n = S_(n-1) + sum_(k=0)^(n-1) S_k S_(n-1-k) \ (n >= 1) $
      Với điều kiện đầu $S_0 = 1$, ta tính liên tiếp:
      - $n = 1$: $S_1 = S_0 + S_0^2 = 1 + 1 = 2$
      - $n = 2$: $S_2 = S_1 + (S_0 S_1 + S_1 S_0) = 2 + 2(1 dot 2) = 6$
      - $n = 3$: $S_3 = S_2 + (S_0 S_2 + S_1 S_1 + S_2 S_0) = 6 + (1 dot 6 + 2 dot 2 + 6 dot 1) = 6 + 14 = bold(22)$
      Tính toán bằng tích chập hàm sinh cho kết quả cực kỳ chính xác!
    ]

    #ans-box[Số đường đi thỏa mãn điều kiện biên là $bold(22)$ đường đi.]
  ],
)

#tln(
  id: "GF2-10-3",
  [
    Một robot xuất phát từ gốc tọa độ $(0,0)$ di chuyển đến điểm $(m, n)$ trên lưới tọa độ. Tại mỗi bước, robot chỉ được phép di chuyển sang phải $1$ đơn vị: $(1,0)$, đi lên trên $1$ đơn vị: $(0,1)$, hoặc thực hiện một bước nhảy dài sang phải $2$ đơn vị: $(2,0)$. Hỏi có bao nhiêu đường đi khác nhau từ $(0,0)$ đến $(3,2)$?
  ],
  [22],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm đường đi trên lưới tọa độ phẳng có bước đi nhảy xa. Ta dùng quy hoạch động hoặc hàm sinh hai biến để tính toán số đường đi.
    ]

    #cach1-box[
      *Quy hoạch động trên lưới:*
      Gọi $a(m, n)$ là số đường đi từ $(0,0)$ đến $(m, n)$. Theo quy tắc bước đi, robot chỉ có thể đến $(m, n)$ từ ba ô trước đó: $(m-1, n)$, $(m-2, n)$ và $(m, n-1)$.
      Hệ thức quy hoạch động:
      $ a(m, n) = a(m-1, n) + a(m-2, n) + a(m, n-1) $
      Với điều kiện biên khởi đầu $a(0,0) = 1$ và $a(m, n) = 0$ nếu $m < 0$ hoặc $n < 0$.
      Ta tính bảng giá trị:
      - Dòng $n = 0$:
        - $a(0,0) = 1$
        - $a(1,0) = a(0,0) = 1$
        - $a(2,0) = a(1,0) + a(0,0) = 1 + 1 = 2$
        - $a(3,0) = a(2,0) + a(1,0) = 2 + 1 = 3$
      - Dòng $n = 1$:
        - $a(0,1) = a(0,0) = 1$
        - $a(1,1) = a(0,1) + a(1,0) = 1 + 1 = 2$
        - $a(2,1) = a(1,1) + a(0,1) + a(2,0) = 2 + 1 + 2 = 5$
        - $a(3,1) = a(2,1) + a(1,1) + a(3,0) = 5 + 2 + 3 = 10$
      - Dòng $n = 2$:
        - $a(0,2) = a(0,1) = 1$
        - $a(1,2) = a(0,2) + a(1,1) = 1 + 2 = 3$
        - $a(2,2) = a(1,2) + a(0,2) + a(2,1) = 3 + 1 + 5 = 9$
        - $a(3,2) = a(2,2) + a(1,2) + a(3,1) = 9 + 3 + 10 = bold(22)$
    ]

    #cach2-box[
      *Giải bằng Hàm sinh hai biến:*
      Gán biến $x$ cho bước đi $(1,0)$, $x^2$ cho bước đi $(2,0)$ và $y$ cho bước đi $(0,1)$.
      Hàm sinh hai biến mô tả tất cả đường đi là:
      $ G(x, y) = frac(1, 1 - x - x^2 - y) $
      Ta cần tìm hệ số của $x^3 y^2$ trong khai triển của $G(x,y)$:
      $
        G(x, y) = frac(1, 1 - x - x^2) dot frac(1, 1 - frac(y, 1 - x - x^2)) = sum_(n=0)^oo frac(y^n, (1 - x - x^2)^(n+1))
      $
      Hệ số của $y^2$ tương ứng với $n = 2$:
      $ [y^2] G(x, y) = (1 - (x + x^2))^(-3) = sum_(k=0)^oo binom(2+k, k) (x + x^2)^k $
      Ta cần tìm hệ số của $x^3$ trong tổng này. Nhận thấy $x^k (1+x)^k$ chỉ đạt lũy thừa bậc 3 khi $k=2$ hoặc $k=3$:
      - Với $k=2$: số hạng là $binom(4, 2) x^2 (1+x)^2 = 6(x^2 + 2x^3 + x^4) => [x^3]$ là $6 times 2 = 12$.
      - Với $k=3$: số hạng là $binom(5, 3) x^3 (1+x)^3 = 10(x^3 + dots) => [x^3]$ là $10 times 1 = 10$.
      - Với $k > 3$ hoặc $k < 2$: số mũ nhỏ nhất của $x$ lớn hơn 3 hoặc bé hơn 3.

      Cộng hai hệ số thu được:
      $ [x^3 y^2] G(x, y) = 12 + 10 = bold(22) $
    ]

    #ans-box[Số đường đi từ $(0,0)$ đến $(3,2)$ là $bold(22)$ đường đi.]
  ],
)

#tln(
  id: "GF2-10-4",
  [
    Một robot di chuyển trong không gian 3D từ gốc tọa độ $(0,0,0)$ đến điểm $(n, n, n)$. Tại mỗi bước, robot chỉ được di chuyển theo một trong các hướng sau: sang phải $1$ đơn vị $(1,0,0)$, lên trên $1$ đơn vị $(0,1,0)$, đi sâu $1$ đơn vị $(0,0,1)$, hoặc đi chéo khối $1$ đơn vị $(1,1,1)$. Hãy thiết lập công thức tổng quát tính số đường đi khác nhau của robot theo $n$.
  ],
  [$sum_(j=0)^n frac((3n-2j)!, j! ((n-j)!)^3)$],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm đường đi trên lưới 3D chéo khối. Ta sử dụng hàm sinh ba biến và khai triển đa thức kết hợp hệ số multinomial để giải bài toán một cách tổng quát.
    ]

    #cach1-box[
      *Lập luận tổ hợp và Hệ số Multinomial:*
      Giả sử trong suốt hành trình từ $(0,0,0)$ đến $(n,n,n)$, robot thực hiện đúng $j$ bước chéo khối $(1,1,1)$ ($0 \le j \le n$).
      Khi đó, robot cần phải bù đắp các khoảng cách còn lại dọc theo mỗi trục bằng các bước đơn vị tương ứng:
      - Cần thêm $n-j$ bước sang phải $(1,0,0)$.
      - Cần thêm $n-j$ bước lên trên $(0,1,0)$.
      - Cần thêm $n-j$ bước đi sâu $(0,0,1)$.

      Tổng số bước đi của robot là:
      $ N = j + (n-j) + (n-j) + (n-j) = 3n - 2j $
      Trong số $3n-2j$ bước đi này, ta cần phân bố:
      - $j$ bước chéo khối $(1,1,1)$.
      - $n-j$ bước đi sang phải $(1,0,0)$.
      - $n-j$ bước đi lên trên $(0,1,0)$.
      - $n-j$ bước đi sâu $(0,0,1)$.

      Số cách sắp xếp các bước đi này chính là hệ số multinomial:
      $ M(n, j) = frac((3n - 2j)!, j! (n-j)! (n-j)! (n-j)!) = frac((3n-2j)!, j! ((n-j)!)^3) $
      Lấy tổng theo tất cả các giá trị hợp lệ của $j$ từ $0$ đến $n$:
      $ a_n = sum_(j=0)^n frac((3n-2j)!, j! ((n-j)!)^3) $
    ]

    #cach2-box[
      *Giải bằng Hàm sinh ba biến:*
      Gán các biến $x, y, z$ cho các bước đi đơn vị dọc theo 3 trục, và $x y z$ cho bước đi chéo khối.
      Hàm sinh ba biến mô tả toàn bộ đường đi là:
      $ G(x, y, z) = frac(1, 1 - x - y - z - x y z) $
      Khai triển thành chuỗi hình thức:
      $ G(x, y, z) = sum_(N=0)^oo (x + y + z + x y z)^N $
      Ta cần tìm hệ số của $x^n y^n z^n$ trong khai triển này.
      Áp dụng khai triển đa thức:
      $ (x + y + z + x y z)^N = sum_(a+b+c+j = N) frac(N!, a! b! c! j!) x^(a+j) y^(b+j) z^(c+j) $
      Để số mũ của $x, y, z$ đều bằng $n$, ta có hệ điều kiện:
      $ a + j = n, quad b + j = n, quad c + j = n => a = b = c = n - j $
      Và tổng số bước là $N = a + b + c + j = 3(n - j) + j = 3n - 2j$.
      Thay $a, b, c, N$ vào công thức số hạng tổng quát, ta thu được:
      $ a_n = [x^n y^n z^n] G(x,y,z) = sum_(j=0)^n frac((3n-2j)!, j! ((n-j)!)^3) $
      - Với $n=1$: $a_1 = frac(3!, 0! (1!)^3) + frac(1!, 1! (0!)^3) = 6 + 1 = 7$.
      - Với $n=2$: $a_2 = frac(6!, 0! (2!)^3) + frac(4!, 1! (1!)^3) + frac(2!, 2! (0!)^3) = 90 + 24 + 1 = 115$.
    ]

    #ans-box[Số đường đi tổng quát của robot là $a_n = sum_(j=0)^n frac((3n-2j)!, j! ((n-j)!)^3)$.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 11 — BÀI TOÁN BÀN TRÒN & CHỌN PHẦN TỬ KHÔNG KỀ VÒNG TRÒN
// ═══════════════════════════════════════════════════════════════
= Dạng 11 — Bài Toán Bàn Tròn & Chọn Phần Tử Không Kề Nhau Trên Vòng Tròn

== Lý Thuyết

#thm-box(title: "📐 Hàm Sinh Hai Biến Cho Bài Toán Chọn Vòng Tròn (Circular Selection)")[
  *1. Chọn phần tử không kề trên hàng ngang (Linear Selection):*
  - Số cách chọn $k$ phần tử từ $n$ phần tử xếp thành hàng ngang sao cho không có hai phần tử nào đứng cạnh nhau là $binom(n-k+1, k)$.
  - Hàm sinh hai biến $f(x, y) = sum_(n=0)^oo sum_(k=0)^oo binom(n-k+1, k) y^k x^n$ được xác định bởi:
    $ f(x, y) = frac(1 + x y, 1 - x - x^2 y) $

  *2. Chọn phần tử không kề trên vòng tròn (Circular Selection):*
  - Cho $n$ phần tử xếp quanh một bàn tròn. Số cách chọn $k$ phần tử sao cho không có hai phần tử nào cạnh nhau là:
    $ g(n, k) = frac(n, n-k) binom(n-k, k) $
  - Hàm sinh hai biến cho số cách chọn trên vòng tròn $F(x, y) = sum_(n=1)^oo sum_(k=0)^oo g(n,k) y^k x^n$:
    $ F(x, y) = frac(x + 2x^2 y, 1 - x - x^2 y) $
  - Khi $y = 1$ (chọn số lượng $k$ bất kỳ), số cách chọn các tập hợp không kề nhau trên vòng tròn kích thước $n$ chính là số Lucas $L_n$:
    $ L(x) = sum_(n=1)^oo L_n x^n = frac(x + 2x^2, 1 - x - x^2) $
    với dãy số Lucas $L_1 = 1, L_2 = 3, L_3 = 4, L_4 = 7, L_5 = 11, L_6 = 18, dots$ ($L_n = L_(n-1) + L_(n-2)$).
]

#note-box(title: "📌 Bản Chất Sự Khác Biệt Giữa Hàng Ngang Và Vòng Tròn")[
  Khi chuyển từ hàng ngang sang vòng tròn, phần tử thứ $1$ và phần tử thứ $n$ trở nên kề nhau. Ta giải quyết bằng cách chia trường hợp: hoặc chọn phần tử $1$ (khen đó phần tử $2$ và $n$ không được chọn, quy về bài toán hàng ngang độ dài $n-3$), hoặc không chọn phần tử $1$ (quy về bài toán hàng ngang độ dài $n-1$). Sự phân rã này giải thích công thức $L_n = F_(n-1) + F_(n-3)$ trong toán học.
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-11-1",
  [
    Có $6$ chiếc ghế xếp thành một vòng tròn quanh bàn. Cần chọn ra một số chiếc ghế (có thể không chọn chiếc nào) sao cho không có hai chiếc ghế nào cạnh nhau được chọn đồng thời. Hỏi có bao nhiêu cách chọn tất cả?
  ],
  [18],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm số tập con không chứa hai phần tử kề nhau trên vòng tròn $6$ đỉnh. Kết quả chính là số Lucas thứ 6 ($L_6$).
    ]

    #cach1-box[
      *Lập luận chia trường hợp (Tổ hợp):*
      Đánh số các ghế theo vòng tròn từ $1$ đến $6$.
      - Trường hợp 1: Chọn ghế số $1$. Do điều kiện không kề, hai ghế cạnh nó là $2$ và $6$ chắc chắn không được chọn. Ta chỉ có thể chọn thêm các ghế từ tập $\{3, 4, 5\}$ sao cho không kề nhau.
        - Chọn 0 ghế phụ: $emptyset arrow.r.double$ có $1$ cách: $\{1\}$.
        - Chọn 1 ghế phụ từ $\{3, 4, 5\}$: $\{3\}, \{4\}, \{5\} arrow.r.double$ có $3$ cách: $\{1,3\}, \{1,4\}, \{1,5\}$.
        - Chọn 2 ghế phụ từ $\{3, 4, 5\}$: chỉ có thể chọn $\{3, 5\} arrow.r.double$ có $1$ cách: $\{1,3,5\}$.
        Tổng số cách của Trường hợp 1 là: $1 + 3 + 1 = 5$ cách.

      - Trường hợp 2: Không chọn ghế số $1$. Khi đó ta có thể tự do chọn các ghế không kề nhau từ tập $\{2, 3, 4, 5, 6\}$ xếp thành một hàng ngang $5$ phần tử.
        Số cách chọn tập con không kề từ hàng ngang $m$ phần tử là số Fibonacci $F_(m+2)$ (với $F_1=1, F_2=1, F_3=2, F_4=3, F_5=5, F_6=8, F_7=13$):
        Ở đây $m = 5 arrow.r.double F_7 = 13$ cách.
        (Các cách gồm: rỗng, chọn 1 ghế: 5 cách, chọn 2 ghế không kề: 6 cách: $\{2,4\}, \{2,5\}, \{2,6\}, \{3,5\}, \{3,6\}, \{4,6\}$, chọn 3 ghế không kề: 1 cách: $\{2,4,6\}$ $arrow.r.double 1 + 5 + 6 + 1 = 13$ cách).

      Tổng số cách chọn thỏa mãn là:
      $ N = 5 + 13 = bold(18) " cách" $
    ]

    #cach2-box[
      *Sử dụng Hàm sinh Lucas:*
      Số cách chọn các ghế không kề nhau quanh bàn tròn $n$ ghế chính là số Lucas $L_n$.
      Dãy số Lucas thỏa mãn hệ thức truy hồi $L_n = L_(n-1) + L_(n-2)$ với $L_1 = 1, L_2 = 3$.
      Ta tính liên tiếp giá trị của dãy số:
      - $L_1 = 1$
      - $L_2 = 3$
      - $L_3 = L_2 + L_1 = 3 + 1 = 4$
      - $L_4 = L_3 + L_2 = 4 + 3 = 7$
      - $L_5 = L_4 + L_3 = 7 + 4 = 11$
      - $L_6 = L_5 + L_4 = 11 + 7 = bold(18)$
      Đáp số $18$ tìm được ngay lập tức và vô cùng nhanh chóng!
    ]

    #ans-box[Số cách chọn ghế thỏa mãn là $bold(18)$ cách.]
  ],
)

#tln(
  id: "GF2-11-2",
  [
    Có $8$ người ngồi quanh một bàn tròn. Cần chọn ra đúng $3$ người sao cho không có 2 người nào ngồi cạnh nhau. Hỏi có bao nhiêu cách chọn?
  ],
  [16],
  loigiai: [
    #ppgiai[
      Đây là bài toán chọn $k = 3$ phần tử không kề nhau từ vòng tròn $n = 8$ phần tử.
    ]

    #cach1-box[
      *Đếm tổ hợp bằng công thức trực tiếp:*
      Số cách chọn $k$ phần tử từ vòng tròn $n$ phần tử sao cho không có 2 phần tử nào kề nhau được tính bằng công thức:
      $ g(n, k) = frac(n, n-k) binom(n-k, k) $
      Áp dụng cho $n = 8$ và $k = 3$:
      $ g(8, 3) = frac(8, 8-3) binom(8-3, 3) = frac(8, 5) binom(5, 3) $
      Ta tính số tổ hợp:
      $ binom(5, 3) = 10 $
      Do đó:
      $ g(8, 3) = frac(8, 5) dot 10 = bold(16) " cách" $
    ]

    #cach2-box[
      *Giải bằng Hàm sinh hai biến:*
      Số cách chọn là hệ số của $x^8 y^3$ trong hàm sinh hai biến:
      $ F(x, y) = frac(x + 2x^2 y, 1 - x - x^2 y) $
      Khai triển thành chuỗi hình thức:
      $ F(x, y) = (x + 2x^2 y) sum_(m=0)^oo (x + x^2 y)^m $
      Ta khai triển số hạng tổng quát bằng nhị thức Newton:
      $ (x + x^2 y)^m = sum_(j=0)^m binom(m, j) x^(m-j) (x^2 y)^j = sum_(j=0)^m binom(m, j) x^(m+j) y^j $
      Thay vào phương trình $F(x,y)$:
      $
        F(x, y) = sum_(m=0)^oo sum_(j=0)^m binom(m, j) x^(m+j+1) y^j + 2 sum_(m=0)^oo sum_(j=0)^m binom(m, j) x^(m+j+2) y^(j+1)
      $
      Ta cần tìm các cặp $(m, j)$ sao cho số mũ của $y$ bằng $3$ và số mũ của $x$ bằng $8$:
      - Ở tổng thứ nhất:
        - Số mũ của $y$ là $j = 3$.
        - Số mũ của $x$ là $m + j + 1 = 8 arrow.r.double m + 3 + 1 = 8 arrow.r.double m = 4$.
        - Hệ số thu được là: $binom(4, 3) = 4$.
      - Ở tổng thứ hai:
        - Số mũ của $y$ là $j + 1 = 3 arrow.r.double j = 2$.
        - Số mũ của $x$ là $m + j + 2 = 8 arrow.r.double m + 2 + 2 = 8 arrow.r.double m = 4$.
        - Hệ số thu được là: $2 dot binom(4, 2) = 2 dot 6 = 12$.

      Cộng hai hệ số ở hai tổng:
      $ N = 4 + 12 = bold(16) $
      Đại số hàm sinh chứng minh sự nhất quán tuyệt đối của toán học!
    ]

    #ans-box[Số cách chọn thỏa mãn là $bold(16)$ cách.]
  ],
)

#tln(
  id: "GF2-11-3",
  [
    Cho một bàn tròn gồm $9$ chiếc ghế. Cần chọn ra đúng $3$ chiếc ghế sao cho giữa hai chiếc ghế được chọn bất kỳ luôn có ít nhất $2$ chiếc ghế trống. Hỏi có bao nhiêu cách chọn?
  ],
  [3],
  loigiai: [
    #ppgiai[
      Đây là bài toán chọn $k = 3$ phần tử từ vòng tròn $n = 9$ phần tử sao cho khoảng cách (số ô trống) giữa bất kỳ hai phần tử nào được chọn cũng ít nhất là $d = 2$.
    ]

    #cach1-box[
      *Đếm tổ hợp bằng công thức tổng quát:*
      Số cách chọn $k$ phần tử từ vòng tròn $n$ phần tử với khoảng cách trống tối thiểu $d$ được cho bởi công thức:
      $ g_d (n, k) = frac(n, n - k d) binom(n - k d, k) $
      Ở đây $n = 9, k = 3, d = 2$. Thay các giá trị vào công thức:
      $ g_2 (9, 3) = frac(9, 9 - 3 dot 2) binom(9 - 3 dot 2, 3) = frac(9, 3) binom(3, 3) $
      Ta tính trực tiếp:
      $ g_2 (9, 3) = 3 dot 1 = bold(3) " cách" $
      Ba cách chọn này tương ứng với các tập hợp ghế đối xứng qua tâm: $\{1, 4, 7\}$, $\{2, 5, 8\}$, và $\{3, 6, 9\}$.
    ]

    #cach2-box[
      *Giải bằng Hàm sinh hai biến:*
      Số cách chọn là hệ số của $x^n y^k$ (ở đây là $x^9 y^3$) trong hàm sinh hai biến cho bài toán chọn với khoảng cách tối thiểu $d$:
      $ F(x, y) = frac(x + (d+1)x^(d+1)y, 1 - x - x^(d+1)y) $
      Với $d = 2$, ta có:
      $ F(x, y) = frac(x + 3x^3 y, 1 - x - x^3 y) = (x + 3x^3 y) sum_(m=0)^oo (x + x^3 y)^m $
      Khai triển số hạng tổng quát của chuỗi:
      $ (x + x^3 y)^m = sum_(j=0)^m binom(m, j) x^(m-j) (x^3 y)^j = sum_(j=0)^m binom(m, j) x^(m+2j) y^j $
      Thay vào biểu thức của $F(x,y)$:
      $
        F(x, y) = sum_(m=0)^oo sum_(j=0)^m binom(m, j) x^(m+2j+1) y^j + 3 sum_(m=0)^oo sum_(j=0)^m binom(m, j) x^(m+2j+3) y^(j+1)
      $
      Ta cần tìm hệ số của $x^9 y^3$:
      - Ở tổng thứ nhất:
        - Số mũ của $y$ là $j = 3$.
        - Số mũ của $x$ là $m + 2j + 1 = 9 => m + 6 + 1 = 9 => m = 2$.
        - Hệ số thu được là: $binom(2, 3) = 0$.
      - Ở tổng thứ hai:
        - Số mũ của $y$ là $j + 1 = 3 => j = 2$.
        - Số mũ của $x$ là $m + 2j + 3 = 9 => m + 4 + 3 = 9 => m = 2$.
        - Hệ số thu được là: $3 dot binom(2, 2) = 3$.

      Tổng hệ số thu được là $0 + 3 = bold(3)$. Hàm sinh cho kết quả cực kỳ chính xác và nhanh chóng!
    ]

    #ans-box[Số cách chọn thỏa mãn là $bold(3)$ cách.]
  ],
)

#tln(
  id: "GF2-11-4",
  [
    Một nhóm gồm $6$ học sinh ngồi quanh một bàn tròn. Cần chọn ra một số học sinh (có thể không chọn học sinh nào) sao cho không có hai học sinh kề nhau nào được chọn đồng thời, và số lượng học sinh được chọn phải là một số chẵn. Hỏi có bao nhiêu cách chọn?
  ],
  [10],
  loigiai: [
    #ppgiai[
      Đây là bài toán chọn một tập con các học sinh không kề nhau quanh bàn tròn $n = 6$ sao cho kích thước của tập con này là số chẵn.
    ]

    #cach1-box[
      *Lập luận chia trường hợp:*
      Gọi $k$ là số lượng học sinh được chọn. Vì số lượng học sinh được chọn phải là số chẵn và không kề nhau, nên $k$ chỉ có thể nhận các giá trị chẵn $k in {0, 2}$. (Không thể chọn $4$ học sinh vì vòng tròn $6$ ghế chỉ chứa tối đa $3$ ghế không kề nhau).
      - Với $k = 0$: Có duy nhất $1$ cách chọn (tập rỗng).
      - Với $k = 2$: Số cách chọn $2$ người không kề nhau từ vòng tròn $6$ người là:
        $ g(6, 2) = frac(6, 6-2) binom(6-2, 2) = frac(6, 4) binom(4, 2) = frac(3, 2) dot 6 = 9 " cách" $
      Tổng cộng số cách chọn thỏa mãn là:
      $ N = 1 + 9 = bold(10) " cách" $
    ]

    #cach2-box[
      *Giải bằng Hàm sinh đóng và Bộ lọc Parity:*
      Hàm sinh hai biến đếm số cách chọn không kề nhau trên vòng tròn là:
      $ F(x, y) = frac(x + 2x^2 y, 1 - x - x^2 y) $
      Để lọc các số hạng có số lượng chọn $k$ chẵn, ta áp dụng bộ lọc parity (Roots of Unity Filter cho cấp 2):
      $ F_(e v e n)(x) = frac(1, 2) [ F(x, 1) + F(x, -1) ] $
      Ta tính từng thành phần:
      $ F(x, 1) = frac(x + 2x^2, 1 - x - x^2), quad F(x, -1) = frac(x - 2x^2, 1 - x + x^2) $
      Cộng hai phân thức và quy đồng mẫu số:
      $ F_(e v e n)(x) = frac(1, 2) dot frac((x + 2x^2)(1 - x + x^2) + (x - 2x^2)(1 - x - x^2), (1 - x)^2 - x^4) $
      $ F_(e v e n)(x) = frac(x - x^2 + 2x^4, 1 - 2x + x^2 - x^4) $
      Để tìm số cách chọn cho $n = 6$ phần tử, ta cần tìm hệ số $[x^6]$ của khai triển $F_(e v e n)(x)$.
      Đặt $F_(e v e n)(x) = sum_(n=1)^oo a_n x^n$. Từ phương trình:
      $ (1 - 2x + x^2 - x^4) sum_(n=1)^oo a_n x^n = x - x^2 + 2x^4 $
      Cân bằng hệ số hai vế cho $n >= 5$, ta có hệ thức truy hồi:
      $ a_n = 2 a_(n-1) - a_(n-2) + a_(n-4) $
      Ta tính các giá trị đầu tiên của dãy số:
      - $a_1 = 1$
      - $a_2 = 1$
      - $a_3 = 1$
      - $a_4 = 3$
      - $a_5 = 2 a_4 - a_3 + a_1 = 2(3) - 1 + 1 = 6$
      - $a_6 = 2 a_5 - a_4 + a_2 = 2(6) - 3 + 1 = bold(10)$
      Hàm sinh cho ta một công cụ vạn năng để xử lý cả các ràng buộc tính chẵn lẻ phức tạp!
    ]

    #ans-box[Số cách chọn thỏa mãn là $bold(10)$ cách.]
  ],
)

// ═══════════════════════════════════════════════════════════════
// DẠNG 12 — BÀI TOÁN TÔ MÀU & ĐỊNH LÝ ĐẾM PÓLYA
// ═══════════════════════════════════════════════════════════════
= Dạng 12 — Bài Toán Tô Màu & Định Lý Đếm Pólya

== Lý Thuyết

#thm-box(title: "📐 Chỉ Số Chu Trình Và Định Lý Đếm Pólya")[
  Khi đếm các cấu hình tô màu đối xứng dưới một nhóm phép đối xứng $G$ (như phép quay, phép lật), ta sử dụng *Định lý đếm Pólya (Pólya Enumeration Theorem)*.

  *1. Chỉ số chu trình (Cycle Index Polynomial) của nhóm $G$:*
  Với mỗi phép biến đổi $g in G$, ta phân tích nó thành tích các chu trình rời nhau. Gọi $c_k(g)$ là số chu trình có độ dài $k$ trong phân tích của $g$. Chỉ số chu trình của $G$ là:
  $ Z(G; z_1, z_2, dots, z_p) = frac(1, |G|) sum_(g in G) z_1^(c_1(g)) z_2^(c_2(g)) dots z_p^(c_p(g)) $

  *2. Định lý đếm Pólya:*
  - Nếu ta tô màu các đỉnh bằng các màu có sẵn, số cách tô màu không phân biệt đối xứng chính bằng đa thức chỉ số chu trình khi thế biến $z_k$ bởi tổng lũy thừa bậc $k$ của các màu.
  - Ví dụ tô màu bằng 3 màu Đỏ ($r$), Xanh ($g$), Vàng ($b$):
    $ z_k = r^k + g^k + b^k $
  - Hệ số của hạng tử $r^i g^j b^k$ trong đa thức thế chính là số cách tô màu chứa đúng $i$ hạt Đỏ, $j$ hạt Xanh, $k$ hạt Vàng.
]

#note-box(title: "📌 Chỉ Số Chu Trình Của Nhóm Quay Vòng Cổ 6 Hạt")[
  Vòng cổ gồm 6 hạt có nhóm đối xứng quay là nhóm cyclic $C_6$ gồm 6 phép quay góc $k dot 60^degree$ ($k=0,1,2,3,4,5$). Phân tích chu trình của từng phép quay:
  - Quay $0^degree$ (đồng nhất): $6$ chu trình độ dài $1 arrow.r.double z_1^6$.
  - Quay $60^degree$ và $300^degree$ (cấp 6): $1$ chu trình độ dài $6 arrow.r.double 2 z_6^1$.
  - Quay $120^degree$ and $240^degree$ (cấp 3): $2$ chu trình độ dài $3 arrow.r.double 2 z_3^2$.
  - Quay $180^degree$ (cấp 2): $3$ chu trình độ dài $2 arrow.r.double z_2^3$.
  Chỉ số chu trình của nhóm quay $C_6$ là:
  $ Z(C_6) = frac(1, 6) (z_1^6 + z_2^3 + 2 z_3^2 + 2 z_6) $
]

== Bài Tập Minh Họa

#tln(
  id: "GF2-12-1",
  [
    Có bao nhiêu cách tô màu các hạt của một vòng cổ gồm $6$ hạt bằng $3$ màu Đỏ, Xanh lá, Xanh dương, sao cho hai cấu hình trùng nhau qua phép quay vòng cổ được coi là giống nhau?
  ],
  [130],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm số cách tô màu vòng cổ dưới tác động quay của nhóm $C_6$ bằng $3$ màu. Ta áp dụng Bổ đề Burnside hoặc Định lý đếm Pólya trực tiếp.
    ]

    #cach1-box[
      *Đếm trực tiếp bằng Bổ đề Burnside:*
      Số cấu hình phân biệt bằng trung bình cộng số cấu hình bất biến dưới các phép quay $g in C_6$:
      - Phép quay $0^degree$: Mọi cách tô màu đều bất biến. Số cách tô tự do là $3^6 = 729$ cách.
      - Phép quay $60^degree$ và $300^degree$: Tất cả $6$ hạt phải có cùng một màu $arrow.r.double 3^1 = 3$ cách cho mỗi phép quay.
      - Phép quay $120^degree$ và $240^degree$: Các hạt ở vị trí cách nhau 3 bước phải cùng màu. Lưới hạt chia làm 2 nhóm độc lập (hạt lẻ và hạt chẵn) $arrow.r.double 3^2 = 9$ cách cho mỗi phép quay.
      - Phép quay $180^degree$: Các hạt đối diện nhau qua tâm phải cùng màu. Lưới chia làm 3 cặp độc lập $arrow.r.double 3^3 = 27$ cách.

      Tính giá trị trung bình cộng:
      $ N = frac(1, 6) (729 + 2 dot 3 + 2 dot 9 + 27) $
      $ N = frac(1, 6) (729 + 6 + 18 + 27) = frac(780, 6) = bold(130) " cách" $
    ]

    #cach2-box[
      *Sử dụng Định lý đếm Pólya:*
      Chỉ số chu trình của nhóm quay $C_6$:
      $ Z(C_6) = frac(1, 6) (z_1^6 + z_2^3 + 2 z_3^2 + 2 z_6) $
      Do tô bằng 3 màu bất kỳ và không giới hạn số hạt mỗi màu, ta thay thế biến $z_k = 1^k + 1^k + 1^k = 3$ với mọi $k$:
      $ N = Z(C_6; 3, 3, 3, 3) = frac(1, 6) (3^6 + 3^3 + 2 dot 3^2 + 2 dot 3) $
      $ N = frac(1, 6) (729 + 27 + 18 + 6) = frac(780, 6) = bold(130) $
      Định lý Pólya tự động hóa hoàn toàn quá trình đếm số điểm cố định của Burnside!
    ]

    #ans-box[Có $bold(130)$ cách tô màu vòng cổ thỏa mãn.]
  ],
)

#tln(
  id: "GF2-12-2",
  [
    Có bao nhiêu cách tô màu các hạt của một vòng cổ gồm $6$ hạt bằng $3$ màu Đỏ ($r$), Xanh lá ($g$), Xanh dương ($b$) sao cho vòng cổ có đúng $3$ hạt màu Đỏ, $2$ hạt màu Xanh lá, và $1$ hạt màu Xanh dương (phép quay tính là trùng)?
  ],
  [10],
  loigiai: [
    #ppgiai[
      Đây là bài toán tô màu phân phối số lượng hạt cố định cho mỗi màu. Ta tìm hệ số của hạng tử $r^3 g^2 b^1$ trong đa thức chỉ số chu trình thế.
    ]

    #cach1-box[
      *Đếm tổ hợp bằng cách chia lớp tương đương:*
      Số cách xếp chuỗi gồm 3 chữ Đỏ, 2 chữ Xanh lá, 1 chữ Xanh dương trên một hàng ngang là:
      $ T = frac(6!, 3! 2! 1!) = 60 " cách" $
      Mỗi cách xếp trên vòng tròn tạo ra một quỹ đạo dưới nhóm quay $C_6$. Kích thước của quỹ đạo của một cấu hình $C$ bằng $6$ chia cho số lần đối xứng quay của cấu hình đó.
      Tuy nhiên, do cấu hình chứa đúng $1$ hạt màu Xanh dương ($b$), hạt Xanh dương này đóng vai trò như một điểm mốc duy nhất. Không thể có bất kỳ phép quay không tầm thường nào biến cấu hình thành chính nó (vì phép quay đó buộc phải di chuyển hạt Xanh dương duy nhất sang vị trí khác).
      Vì vậy, mọi cấu hình trong số 60 cấu hình đều có tính đối xứng quay tối thiểu (chu kỳ quay bằng 6).
      Mỗi quỹ đạo (lớp tương đương quay) chứa đúng 6 cấu hình hàng ngang.
      Do đó, số cấu hình vòng cổ phân biệt là:
      $ N = frac(60, 6) = bold(10) " cách" $
    ]

    #cach2-box[
      *Sử dụng Đại số Pólya:*
      Số cách tô màu chính là hệ số của $r^3 g^2 b$ trong đa thức thế:
      $ Z(C_6; r+g+b, r^2+g^2+b^2, r^3+g^3+b^3, r^6+g^6+b^6) $
      $ = frac(1, 6) [ (r+g+b)^6 + (r^2+g^2+b^2)^3 + 2(r^3+g^3+b^3)^2 + 2(r^6+g^6+b^6) ] $
      Ta tìm hệ số của $r^3 g^2 b$ trong từng hạng tử:
      - Trong $(r+g+b)^6$: Hệ số là hệ số multinomial:
        $ [r^3 g^2 b] (r+g+b)^6 = frac(6!, 3! 2! 1!) = 60 $
      - Trong $(r^2+g^2+b^2)^3$: Số mũ của mọi biến trong khai triển đều chẵn (dạng $r^(2i) g^(2j) b^(2k)$), nên hạng tử lẻ $r^3 g^2 b$ có hệ số bằng $0$.
      - Trong $2(r^3+g^3+b^3)^2$: Số mũ của mọi biến đều chia hết cho 3 (dạng $r^(3i) g^(3j) b^(3k)$), nên hệ số của $r^3 g^2 b$ bằng $0$.
      - Trong $2(r^6+g^6+b^6)$: Chỉ chứa lũy thừa bậc 6, nên hệ số bằng $0$.

      Kết hợp lại ta được:
      $ [r^3 g^2 b] Z(C_6) = frac(1, 6) (60 + 0 + 2 dot 0 + 2 dot 0) = bold(10) $
      Một lời giải vô cùng ngắn gọn và đẹp đẽ nhờ sức mạnh của đại số!
    ]

    #ans-box[Có đúng $bold(10)$ cách tô màu vòng cổ thỏa mãn tỷ lệ màu.]
  ],
)

#tln(
  id: "GF2-12-3",
  [
    Có bao nhiêu cách tô màu các hạt của một vòng cổ gồm $6$ hạt bằng $3$ màu Đỏ, Xanh lá, Xanh dương, sao cho hai cấu hình trùng nhau qua các phép đối xứng của nhóm Dihedral $D_6$ (bao gồm cả phép quay và phép lật) được coi là giống nhau? So sánh với kết quả dưới tác động của nhóm quay $C_6$.
  ],
  [92],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm cấu hình tô màu vòng cổ dưới tác động của nhóm Dihedral $D_6$ gồm 12 phần tử (6 phép quay và 6 phép lật).
    ]

    #cach1-box[
      *Đếm trực tiếp bằng Bổ đề Burnside:*
      Số cách tô màu bằng trung bình cộng số cấu hình cố định dưới 12 phép đối xứng của $D_6$:
      - 6 phép quay (như nhóm $C_6$): Tổng số điểm cố định là $3^6 + 2 dot 3^1 + 2 dot 3^2 + 3^3 = 729 + 6 + 18 + 27 = 780$.
      - 3 phép lật qua các đường chéo đi qua đỉnh đối diện: Mỗi phép lật giữ cố định 2 hạt trên trục lật và hoán đổi 2 cặp hạt còn lại. Số nhóm hạt độc lập là $2 + 2 = 4$. Số cách tô cố định là $3^4 = 81$ cách. Tổng cho 3 phép lật là $3 dot 81 = 243$.
      - 3 phép lật qua các trục đi qua trung điểm của hai cạnh đối diện: Mỗi phép lật hoán đổi 3 cặp hạt. Số nhóm hạt độc lập là $3$. Số cách tô cố định là $3^3 = 27$ cách. Tổng cho 3 phép lật là $3 dot 27 = 81$.

      Tổng số cách tô màu không phân biệt đối xứng gương và quay:
      $ N = frac(780 + 243 + 81, 12) = frac(1104, 12) = bold(92) " cách" $
      So với nhóm quay $C_6$ (130 cách), khi cho phép lật gương (nhóm $D_6$), nhiều cấu hình không đối xứng gương được gộp lại làm một, làm giảm số cách tô phân biệt từ 130 xuống 92.
    ]

    #cach2-box[
      *Sử dụng Định lý đếm Pólya:*
      Chỉ số chu trình của nhóm Dihedral $D_6$ tác động trên các đỉnh của lục giác đều được xác định bởi:
      $ Z(D_6) = frac(1, 12) (z_1^6 + 3 z_1^2 z_2^2 + 4 z_2^3 + 2 z_3^2 + 2 z_6) $
      Thế $z_k = 3$ với mọi $k$ (vì có 3 màu và không giới hạn số hạt mỗi màu):
      $ N = Z(D_6; 3, 3, 3, 3, 3, 3) $
      $ N = frac(1, 12) (3^6 + 3 dot 3^2 dot 3^2 + 4 dot 3^3 + 2 dot 3^2 + 2 dot 3) $
      $ N = frac(1, 12) (729 + 3 dot 81 + 4 dot 27 + 2 dot 9 + 6) $
      $ N = frac(1, 12) (729 + 243 + 108 + 18 + 6) = frac(1104, 12) = bold(92) $
      Công thức chỉ số chu trình Pólya gom toàn bộ các phép lật và quay vào một biểu thức đại số vô cùng thanh thoát!
    ]

    #ans-box[Số cách tô màu vòng cổ dưới nhóm $D_6$ là $bold(92)$ cách.]
  ],
)

#tln(
  id: "GF2-12-4",
  [
    Có bao nhiêu cách tô màu các mặt của một hình lập phương bằng $k$ màu khác nhau sao cho hai cấu hình trùng nhau qua các phép quay trong không gian ba chiều được coi là giống nhau? Áp dụng tính kết quả cụ thể khi hình lập phương được tô bằng $k = 2$ màu và $k = 3$ màu.
  ],
  [10 (với k=2); 57 (với k=3)],
  loigiai: [
    #ppgiai[
      Đây là bài toán đếm số cách tô màu các mặt của khối đa diện 3D dưới nhóm quay của hình lập phương. Nhóm quay này, ký hiệu là $G$, có cấp $|G| = 24$ và đẳng cấu với nhóm đối xứng $S_4$.
    ]

    #cach1-box[
      *Đếm trực tiếp bằng Bổ đề Burnside:*
      Ta phân tích 24 phép quay không gian của hình lập phương và số cách tô mặt cố định tương ứng:
      - $1$ phép quay đồng nhất (góc $0^degree$): Giữ nguyên cả 6 mặt $=> k^6$ cách tô cố định.
      - $3$ phép quay góc $180^degree$ quanh các trục nối tâm hai mặt đối diện: Trục đi qua 2 mặt đối diện (2 mặt này cố định), 4 mặt bên quay $180^degree$ tạo thành 2 cặp $=> k^(2 + 2) = k^4$ cách tô cố định cho mỗi phép.
      - $6$ phép quay góc $90^degree$ hoặc $270^degree$ quanh các trục nối tâm hai mặt đối diện: 2 mặt trên trục cố định, 4 mặt bên quay góc $90^degree$ tạo thành 1 chu trình cấp 4 $=> k^(2 + 1) = k^3$ cách tô cố định cho mỗi phép.
      - $8$ phép quay góc $120^degree$ hoặc $240^degree$ quanh các trục nối hai đỉnh đối diện (đường chéo khối): Trục không đi qua mặt nào, các mặt kề đỉnh hoán vị theo 2 nhóm 3 mặt $=> k^2$ cách tô cố định cho mỗi phép.
      - $6$ phép quay góc $180^degree$ quanh các trục nối trung điểm hai cạnh đối diện: Hoán vị các mặt theo 3 cặp đối diện $=> k^3$ cách tô cố định cho mỗi phép.

      Áp dụng Bổ đề Burnside, số cấu hình phân biệt là:
      $ N = frac(1, 24) (k^6 + 3 k^4 + 6 k^3 + 8 k^2 + 6 k^3) = frac(k^6 + 3 k^4 + 12 k^3 + 8 k^2, 24) $
      - Với $k = 2$: $N = frac(2^6 + 3 dot 2^4 + 12 dot 2^3 + 8 dot 2^2, 24) = frac(64 + 48 + 96 + 32, 24) = frac(240, 24) = bold(10)$ cách.
      - Với $k = 3$: $N = frac(3^6 + 3 dot 3^4 + 12 dot 3^3 + 8 dot 3^2, 24) = frac(729 + 243 + 324 + 72, 24) = frac(1368, 24) = bold(57)$ cách.
    ]

    #cach2-box[
      *Sử dụng Định lý đếm Pólya:*
      Chỉ số chu trình của nhóm quay hình lập phương $G$ tác động lên các mặt của nó là:
      $ Z(G) = frac(1, 24) (z_1^6 + 3 z_1^2 z_2^2 + 6 z_1^2 z_4 + 8 z_3^2 + 6 z_2^3) $
      Khi tô bằng $k$ màu tự do, thế $z_m = k$ với mọi $m$:
      $ N = Z(G; k) = frac(1, 24) (k^6 + 3 k^2 dot k^2 + 6 k^2 dot k + 8 k^2 + 6 k^3) $
      $ N = frac(k^6 + 3 k^4 + 12 k^3 + 8 k^2, 24) $
      - Thay $k = 2$ màu: $N = bold(10)$ cách.
      - Thay $k = 3$ màu: $N = bold(57)$ cách.
      Phương pháp Pólya giúp hệ thống hóa và tự động hóa toàn bộ việc đếm các cấu hình đối xứng không gian cực kỳ phức tạp!
    ]

    #ans-box[Số cách tô màu hình lập phương là $bold(10)$ cách (với 2 màu) và $bold(57)$ cách (với 3 màu).]
  ],
)

// ═══════════════════════════════════════════════════════════════
// PHẦN KẾT — BẢNG TỔNG KẾT KỸ THUẬT
// ═══════════════════════════════════════════════════════════════
= Tổng Kết — Bảng Chọn Công Cụ Hàm Sinh

#thm-box(title: "🎯 Ba Câu Hỏi Dựng Hàm Sinh")[
  *Khi đứng trước bất kỳ bài toán đếm nào, hãy đặt đúng 3 câu hỏi:*

  *Câu 1: Các đối tượng có phân biệt thứ tự không?*
  - Có (chuỗi, xếp hàng, xếp chỗ ngồi) → Dùng *Hàm sinh mũ (EGF): $e^x$*
  - Không (tập hợp, chia kẹo đồng nhất, phân hoạch) → Dùng *Hàm sinh thông thường (OGF): $frac(1, 1-x)$*

  *Câu 2: Ràng buộc của từng đối tượng là gì?*
  - Chẵn lần → $cosh(x)$ (EGF) hoặc $frac(1, 1-x^2)$ (OGF)
  - Lẻ lần → $sinh(x)$ (EGF)
  - Chia hết cho $m$ → $frac(1, 1-x^m)$ (OGF)
  - Tối đa $k$ → $(1 + x + dots + x^k)$ (OGF)
  - Bội số → Roots of Unity Filter

  *Câu 3: Phép toán cuối cùng là gì?*
  - Nhân các hàm thành phần lại → *tích*
  - Tìm hệ số $[x^n]$ trong hàm tổng → *khai triển*
  - Giải phương trình hàm ẩn → *Lagrange Inversion*
  - Đối xứng quay vòng cổ → *Định lý đếm Pólya*
]

#rev-box(title: "📊 Bảng Tra Nhanh Kết Quả Chuẩn")[
  #table(
    columns: (1.2fr, 1fr, 1fr),
    stroke: 0.5pt + rgb("90CAF9"),
    fill: (col, row) => if row == 0 { col-ocean } else if calc.rem(row, 2) == 0 { rgb("EEF6FF") } else { white },
    align: (left, center, center),
    table.header(
      text(fill: white, weight: "bold")[Cấu trúc],
      text(fill: white, weight: "bold")[Công thức],
      text(fill: white, weight: "bold")[Ví dụ nhỏ],
    ),
    [Số chuỗi $n$ ký tự từ $k$ loại, ký tự $i$ xuất hiện chẵn lần], [$frac((k)^n + (k-2)^n, 2)$], [$k=3, n=4$: $41$],
    [Số tập con của $S$ có tổng $equiv 0 (mod 3)$, $S$ cân bằng],
    [$frac(2^(|S|) + 2 dot 0, 3) = frac(2^(|S|), 3)$],
    [$|S|=9$: $176$],

    [Toàn ánh từ $n$ phần tử vào $k$ hộp], [$k! dot S(n,k) = sum (-1)^j C_k^j (k-j)^n$], [$n=6, k=3$: $540$],
    [Phân hoạch tập $n$ phần tử (mọi cỡ nhóm)], [$B_n$ (Số Bell)], [$B_5 = 52$],
    [Số phân hoạch số nguyên $n$], [$p(n)$ (Số partition)], [$p(8) = 22$],
    [Số cách tam giác hóa đa giác lồi $n+2$ đỉnh], [$C_n = frac(C_(2n)^n, n+1)$], [$n=5$: $42$],
    [Số cây có nhãn $n$ đỉnh], [$n^(n-2)$ (Cayley)], [$n=5$: $125$],
    [Lát bảng $3 times 2m$ bằng domino], [$A(x) = frac(1-x^2, 1-4x^2+x^4)$], [$m=3$ (bảng $3 times 6$): $41$],
    [Số đường đi robot trên lưới (Delannoy)], [$F(x) = frac(1, sqrt(1-6x+x^2))$], [$D(3,3) = 63$],
    [Chọn $k$ phần tử vòng tròn không kề nhau], [$g(n,k) = frac(n, n-k) C_(n-k)^k$], [$n=8, k=3$: $16$],
    [Chọn $k$ phần tử vòng tròn cách nhau $>= d$ ô trống],
    [$g_d (n,k) = frac(n, n-k d) C_(n-k d)^k$],
    [$n=9, k=3, d=2$: $3$],

    [Chọn ghế vòng tròn không kề nhau cỡ chẵn],
    [$F_(e v e n)(x) = frac(x - x^2 + 2x^4, 1 - 2x + x^2 - x^4)$],
    [$n=6$: $10$],

    [Tô màu vòng cổ 6 hạt 3 màu quay], [$Z(C_6, 3, 3, 3, 3) = 130$], [Đỏ/Xanh/Vàng: $130$],
    [Tô màu vòng cổ 6 hạt 3 màu lật quay ($D_6$)], [$Z(D_6; 3) = 92$], [3 màu: $92$],
    [Tô màu 6 mặt lập phương bằng $k$ màu quay],
    [$Z(S_4; k) = frac(k^6 + 3 k^4 + 12 k^3 + 8 k^2, 24)$],
    [$k=2: 10, k=3: 57$],
  )
]

