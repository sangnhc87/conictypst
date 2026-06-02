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
    fill: gradient.linear(rgb("09152E"), rgb("102A63"), rgb("1A237E"), rgb("3949AB"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("C5CAE9"), size: 11pt, weight: "bold", tracking: 2pt)[
      CHUYÊN ĐỀ ĐỀ THI TUYỂN SINH 12
    ]
    #v(0.55em)
    #text(fill: white, size: 22pt, weight: "black")[Tối Ưu Lợi Nhuận: Doanh Thu - Chi Phí - Thuế]
    #v(0.45em)
    #text(fill: rgb("E8EAF6"), size: 14pt)[Tư duy Hàm Đa Trị Cases · Gỡ rối từng Nhánh · Chinh phục mọi mức Thuế]
    #v(0.55em)
    #text(fill: rgb("C5CAE9"), size: 11pt, style: "italic")[(Phương pháp "chia để trị" — Chia bài toán thành các nhánh, xử lý từng nhánh)]
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
      [I. Hàm đa trị Cases là gì? Tổng quan], [II. Thuế cố định: Cases 1 nhánh đơn giản],
      [III. Thuế luỹ tiến: Cases 2 nhánh — 3 nhánh], [IV. Bài tập phân tầng có lời giải Cases],
    )
  ]
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("283593"))
    grid(
      columns: (1fr, auto),
      [Chuyên đề đề thi: Doanh thu - Chi phí - Thuế], [GV Nguyễn Văn Sang],
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

= I. Hàm đa trị Cases là gì? Tổng quan

Nhiều học sinh sợ bài toán kinh tế vì không biết cách chuyển lời văn thành công thức toán. *Bí quyết là: Mọi bài toán Doanh Thu - Chi Phí - Thuế đều có thể biểu diễn bằng một hàm cases đa trị.* Hãy nắm vững cách viết cases, mọi thứ sẽ trở nên đơn giản.

== 1. Công thức gốc và Hàm Cases

#rev-box(title: [Công thức Vàng])[
  $ P(x) = F(x) - C(x) - T(x) $
  Trong đó:
  - $P(x)$: Lợi nhuận sau cùng.
  - $F(x)$: Tổng doanh thu từ việc bán $x$ sản phẩm.
  - $C(x)$: Tổng chi phí sản xuất.
  - $T(x)$: Tổng thuế phải đóng — đây chính là nơi phát sinh cases.
]

#rev-box(title: [Tại sao cần Cases?])[
  Thuế thường \*thay đổi theo số lượng\* — đây là cốt lõi của bài toán. Do đó $T(x)$ không phải một công thức duy nhất, mà là *hàm đa trị* (piecewise function) viết dưới dạng:

  $ T(x) = cases(
    "Nhánh 1" & "khi " x " nhỏ" ,
    "Nhánh 2" & "khi " x " vừa" ,
    "Nhánh 3" & "khi " x " lớn"
  ) $

  Vì $T(x)$ phân nhánh, kéo theo $P(x) = F(x) - C(x) - T(x)$ cũng phân nhánh tương ứng.
]

== 2. Cái bẫy "Bình quân"

Nhiều đề không cho thẳng $C(x)$ mà cho \*"Chi phí bình quân mỗi sản phẩm"\* là $G(x)$. Ghi nhớ quy tắc bất di bất dịch:

#note-box(title: [Quy tắc nhân x])[
  $ C(x) = x dot G(x) quad "và" quad T(x) = x dot ("Thuế mỗi sản phẩm") $
]

== 3. Quy trình 3 bước "Chia để trị" với Cases

#theory-layout(
  [
    #cach1-box[
      *Bước 1 — Dựng hàm Cases cho $T(x)$:*
      Đọc kỹ chính sách thuế, chia thành các mốc (ngưỡng) sản lượng. Viết $T(x) = cases(...)$.

      *Bước 2 — Dựng hàm Cases cho $P(x)$:*
      $P(x) = F(x) - C(x) - T(x)$. Mỗi nhánh của $T(x)$ cho ra một nhánh của $P(x)$.
      $ P(x) = cases( P_1(x) & "Nhánh 1" , P_2(x) & "Nhánh 2" , P_3(x) & "Nhánh 3" ) $

      *Bước 3 — Săn đỉnh từng nhánh:*
      - Mỗi nhánh: giải $P_k'(x) = 0$, kiểm tra nghiệm có thuộc khoảng của nhánh không.
      - Đừng quên các *điểm gãy* (điểm chuyển giao giữa các nhánh) — đôi khi đỉnh nằm ngay tại đây.
      - So sánh tất cả ứng viên, chọn giá trị $P(x)$ cao nhất.
    ]
  ],
  side-note(title: "Điểm gãy là bẫy", [
    Hàm cases \*không có đạo hàm tại điểm nối\*. Nếu các nhánh đều đơn điệu hoặc nghiệm đạo hàm nằm ngoài khoảng, cực đại rất có thể nằm ngay tại điểm gãy!
  ])
)

#pagebreak()

= II. Thuế cố định: Cases 1 nhánh đơn giản

Khi thuế không đổi theo số lượng (thuế cố định), $T(x)$ chỉ có 1 nhánh — đây là dạng đơn giản nhất. Nhưng ta vẫn nên tập viết dưới dạng cases để hình thành thói quen.

#tln(
  id: "DTCP-01",
  [Một công ty sản xuất $x$ sản phẩm ($x in [1, 600]$). Biết hàm doanh thu là $F(x) = 0.001x^3 - 1.999x^2 + 1006x + 250$ (nghìn đồng). Chi phí bình quân cho mỗi sản phẩm là $G(x) = 0.001x + frac(250, x) + 1$ (nghìn đồng). Nhà nước đánh thuế phụ thu $5$ nghìn đồng cho mỗi sản phẩm bán ra. Hỏi công ty cần sản xuất bao nhiêu sản phẩm để lợi nhuận đạt giá trị lớn nhất?],
  [$333$ hoặc $334$],
  loigiai: [
    #reset-step()
    #ppgiai[Bài toán có thuế cố định 5 nghìn/sp nên $T(x) = 5x$ — chỉ 1 nhánh duy nhất. Nhưng hãy tập nhìn nó như một cases "1 nhánh".]

    #step[Viết $T(x)$ dưới dạng cases (chỉ 1 nhánh)]
    $ T(x) = cases(5x & "với mọi " x) $
    Thực ra đơn giản là $T(x) = 5x$. Còn chi phí bình quân phải nhân $x$:
    $ C(x) = x dot G(x) = x(0.001x + frac(250, x) + 1) = 0.001x^2 + x + 250 $

    #step[Lập $P(x)$]
    $ P(x) &= F(x) - C(x) - T(x) \
           &= (0.001x^3 - 1.999x^2 + 1006x + 250) - (0.001x^2 + x + 250) - 5x \
           &= 0.001x^3 - 2x^2 + 1000x $

    #step[Đạo hàm, tìm đỉnh]
    $ P'(x) = 0.003x^2 - 4x + 1000 $
    Giải $P'(x) = 0$:
    $ 0.003x^2 - 4x + 1000 = 0 <=> 3x^2 - 4000x + 1000000 = 0 $
    $ Delta = (-4000)^2 - 4 dot 3 dot 1000000 = 4000000 => sqrt(Delta) = 2000 $
    $ => hoac(
      x = frac(4000 + 2000, 6) = 1000 &" (Loại vì " > 600 ")",
      x = frac(4000 - 2000, 6) = frac(1000, 3) approx 333.33 &" (Nhận)"
    ) $

    #step[Kết luận]
    Vì $x$ phải nguyên, xét $333$ và $334$:
    $ P(333) approx 148148.14, quad P(334) approx 148148.14 $
    Cả hai cho lợi nhuận xấp xỉ bằng nhau và là lớn nhất.
    #eg-box(title: [Kết luận])[Công ty cần sản xuất *333* hoặc *334* sản phẩm.]
  ]
)

#v(1em)
#note-box(title: "Bài tập tự luyện")[
#tln(
  id: "DTCP-01b",
  [Một công ty sản xuất $x$ sản phẩm ($x in [1, 500]$). Doanh thu $F(x) = 0.001x^3 - 1.999x^2 + 810x + 100$ (nghìn đồng). Chi phí bình quân $G(x) = 0.001x + frac(100, x) + 2$ (nghìn đồng). Thuế phụ thu $8$ nghìn đồng mỗi sản phẩm. Tìm $x$ để lợi nhuận lớn nhất.],
  [$250$],
  loigiai: [
    #reset-step()
    #ppgiai[Học sinh tự giải theo mẫu trên.]

    #step[$T(x) = cases(8x & "với mọi " x)$]
    $ C(x) = 0.001x^2 + 2x + 100 $

    #step[Lập $P(x)$]
    $ P(x) = 0.001x^3 - 2x^2 + 800x $

    #step[Đạo hàm]
    $ P'(x) = 0.003x^2 - 4x + 800 = 0 $
    $ 3x^2 - 4000x + 800000 = 0 $
    $ Delta = 6400000 => sqrt(Delta) = 2500 $
    $ => hoac(
      x = frac(4000 + 2500, 6) approx 1083.33 &" (Loại vì " > 500 ")",
      x = frac(4000 - 2500, 6) = 250 &" (Nhận)"
    ) $

    #step[Kết luận]
    $x=250$ nguyên, là đỉnh duy nhất.
    #eg-box(title: [Kết luận])[Công ty cần sản xuất *250* sản phẩm.]
  ]
)
]

#pagebreak()

= III. Thuế luỹ tiến: Cases 2 nhánh — 3 nhánh

Đây là phần trọng tâm. Thuế thay đổi theo ngưỡng sản lượng $a, b, c...$ tạo ra các nhánh khác nhau. Mỗi ngưỡng là một *điểm gãy* trong hàm $cases$.

== 1. Nguyên tắc dựng $T(x)$ dạng Cases

#rev-box(title: [Công thức Cases cho Thuế 2 mức])[
  Cho ngưỡng $a$: dưới $a$ thuế $t_1$đ/sp, vượt $a$ thuế $t_2$đ/sp cho phần dôi ra.

  $ T(x) = cases(
    t_1 dot x & 0 <= x <= a ,
    t_1 dot a + t_2 dot (x - a) & x > a
  ) $

  \*Lưu ý:\* Nhánh trên ($x > a$) bao gồm: thuế của $a$ sản phẩm đầu cộng thuế phần vượt.
]

#rev-box(title: [Công thức Cases cho Thuế 3 mức])[
  Cho 2 ngưỡng $a < b$: dưới $a$ thuế $t_1$, $a$ đến $b$ thuế $t_2$, vượt $b$ thuế $t_3$ (cho phần vượt tương ứng).

  $ T(x) = cases(
    t_1 dot x & 0 <= x <= a ,
    t_1 dot a + t_2 dot (x - a) & a < x <= b ,
    t_1 dot a + t_2 dot (b - a) + t_3 dot (x - b) & x > b
  ) $

  \*Mẹo:\* Nhánh cuối = (thuế cố định tích luỹ 2 mức trước) + $t_3(x - b)$.
]

== 2. Sơ đồ "Săn đỉnh" trên Cases

#theory-layout(
  [
    #cach1-box[
      Với $P(x) = cases(P_1, P_2, P_3)$:

      *Nhánh 1:* Giải $P_1'(x) = 0 ->$ thu được $x_1$.
      - Nếu $x_1 in "khoảng nhánh 1"$ $->$ giữ lại.
      - Nếu không $->$ xét 2 đầu mút khoảng.

      *Nhánh 2:* Giải $P_2'(x) = 0 ->$ thu được $x_2$.
      - Kiểm tra điều kiện tương tự.

      *Nhánh 3:* Giải $P_3'(x) = 0 ->$ thu được $x_3$.

      *Tổng kết:* So sánh $P$ tại các ứng viên: $x_1, x_2, x_3$ và các *điểm gãy* $a, b$.
    ]
  ],
  side-note(title: "Mẹo kiểm tra nhanh", [
    Nếu $P_k'(x) > 0$ trên toàn khoảng nhánh $k$ thì nhánh đồng biến, đỉnh tại biên phải. Nếu $P_k'(x) < 0$ thì nghịch biến, đỉnh tại biên trái. Khỏi cần giải phương trình!
  ])
)

#pagebreak()

= IV. Bài tập phân tầng có lời giải theo Cases

== Cấp độ 1: Cases 2 nhánh cơ bản

*Đặc điểm:* Có 1 điểm gãy. $T(x)$ gồm 2 nhánh. $P(x)$ cũng 2 nhánh.

#tln(
  id: "DTCP-02",
  [Một doanh nghiệp sản xuất $x$ sản phẩm ($x in [1, 1000]$). Doanh thu $F(x) = -0.002x^3 + 4x^2 + 500x$, chi phí $C(x) = 2x^2 + 100x + 1000$. Chính sách thuế: 200 sản phẩm đầu miễn thuế. Từ sản phẩm thứ 201 trở đi, mỗi sản phẩm bị đánh thuế $200$ (nghìn đồng). Hỏi doanh nghiệp nên sản xuất bao nhiêu sản phẩm để lợi nhuận cực đại?],
  [$200$],
  loigiai: [
    #reset-step()
    #ppgiai[Điểm gãy tại $x=200$. Dựng cases cho $T(x)$, từ đó suy ra $P(x)$.]

    #step[Dựng $T(x)$ dạng Cases]
    $ T(x) = cases(
      0 & 0 <= x <= 200 ,
      200 dot (x - 200) & x > 200
    ) = cases(
      0 & x <= 200 ,
      200x - 40000 & x > 200
    ) $

    #step[Dựng $P(x)$ dạng Cases]
    $ L(x) = F(x) - C(x) = (-0.002x^3 + 4x^2 + 500x) - (2x^2 + 100x + 1000) = -0.002x^3 + 2x^2 + 400x - 1000 $

    $ P(x) = cases(
      -0.002x^3 + 2x^2 + 400x - 1000 & x <= 200 ,
      -0.002x^3 + 2x^2 + 200x + 39000 & x > 200
    ) $

    #step[Săn đỉnh từng nhánh]

    *Nhánh 1 ($x <= 200$):*
    $ P_1'(x) = 0 <=> -0.006x^2 + 4x + 400 = 0 $
    $ => hoac(
      x approx 755.0 &" (Loại vì " > 200 ")",
      x approx -88.3 &" (Loại vì " < 0 ")"
    ) $
    Kiểm tra dấu: $P_1'(x) > 0$ trên $[0, 200] ->$ hàm đồng biến.
    $=>$ Đỉnh nhánh 1 tại biên phải: $x = 200$.
    $ P(200) = -(0.002)(200)^3 + 2(200)^2 + 400(200) - 1000 = 143000 $

    *Nhánh 2 ($x > 200$):*
    $ P_2'(x) = 0 <=> -0.006x^2 + 4x + 200 = 0 $
    $ => hoac(
      x approx 713.4 &" (Nhận vì " > 200 ")",
      x approx -46.7 &" (Loại vì " < 0 ")"
    ) $
    $=>$ Đỉnh nhánh 2 tại $x approx 714$.
    $ P(714) approx 135832 $

    #step[Tổng kết & Kết luận]
    Các ứng viên: Điểm gãy $x=200 -> P = 143000$; Đỉnh nhánh 2 $x=714 -> P approx 135832$.

    $ 143000 > 135832 $ nên đỉnh toàn cục tại $x = 200$.

    #eg-box(title: [Kết luận])[Nên sản xuất *200* sản phẩm (hưởng trọn mức miễn thuế).]
  ]
)

#v(1em)
#note-box(title: "Bài tập tự luyện: Cases 2 nhánh")[
#tln(
  id: "DTCP-02b",
  [Một doanh nghiệp sản xuất $x$ sản phẩm ($x in [1, 1000]$). $F(x) = -0.001x^3 + 3x^2 + 600x$, $C(x) = 1.5x^2 + 200x + 500$. Chính sách thuế: 300 sản phẩm đầu miễn thuế. Từ sản phẩm thứ 301 trở đi, mỗi sản phẩm bị đánh thuế $1200$ (nghìn đồng). Tìm sản lượng tối ưu.],
  [$300$],
  loigiai: [
    #reset-step()
    #ppgiai[Dựng Cases cho $T(x)$ và $P(x)$. Điểm gãy $x=300$.]

    #step[$T(x)$ dạng Cases]
    $ T(x) = cases(0 & x <= 300 , 1200(x - 300) & x > 300) = cases(0 & x <= 300 , 1200x - 360000 & x > 300) $

    #step[$P(x)$ dạng Cases]
    $ P(x) = cases(
      -0.001x^3 + 1.5x^2 + 400x - 500 & x <= 300 ,
      -0.001x^3 + 1.5x^2 - 800x + 359500 & x > 300
    ) $

    #step[Săn đỉnh từng nhánh]

    *Nhánh 1 ($x <= 300$):*
    $ P_1'(x) = 0 <=> -0.003x^2 + 3x + 400 = 0 $
    $ => hoac(
      x approx 1119.1 &" (Loại vì " > 300 ")",
      x approx -119.1 &" (Loại vì " < 0 ")"
    ) $
    $P_1'(x) > 0$ trên $[0, 300] ->$ đồng biến, đỉnh tại $x=300$.
    $ P(300) = 227500 $

    *Nhánh 2 ($x > 300$):*
    $ P_2'(x) = -0.003x^2 + 3x - 800 $
    $P_2'(300) = -170 < 0 ->$ nghịch biến ngay từ đầu nhánh.

    #step[Kết luận]
    Nhánh 1 tăng dần đến $x=300$, nhánh 2 giảm dần từ $x=300$. Đỉnh nằm ngay tại điểm gãy.
    #eg-box(title: [Kết luận])[Nên sản xuất *300* sản phẩm.]
  ]
)
]

#pagebreak()

== Cấp độ 2: Cases 3 nhánh — Vận dụng cao

*Đặc điểm:* 2 điểm gãy $a < b$. $T(x)$ và $P(x)$ đều 3 nhánh. Phải xét cả 3 nhánh và 2 điểm gãy.

#tln(
  id: "DTCP-03",
  [Một công ty luyện kim sản xuất $x$ tấn thép. Tổng doanh thu $F(x) = -x^3 + 90x^2 + 1000x$, tổng chi phí $C(x) = 15x^2 + 500x + 2000$. Thuế bảo vệ môi trường tính luỹ tiến 3 mức:
  - 10 tấn đầu: Miễn thuế.
  - Từ trên 10 đến 30 tấn: Thuế $100$ đ/tấn cho phần vượt.
  - Trên 30 tấn: Thuế $300$ đ/tấn cho phần vượt 30 tấn (cộng dồn các phần trước).
  Hỏi sản lượng $x$ tối ưu là bao nhiêu?],
  [$51$],
  loigiai: [
    #reset-step()
    #ppgiai[2 điểm gãy: $a=10$, $b=30$. Dựng Cases 3 nhánh, săn đỉnh toàn cục.]

    #step[Dựng $T(x)$ dạng Cases 3 nhánh]

    $ T(x) = cases(
      0 & 0 <= x <= 10 ,
      100(x - 10) = 100x - 1000 & 10 < x <= 30 ,
      100 dot 20 + 300(x - 30) = 300x - 7000 & x > 30
    ) $

    (Nhánh 3: tích luỹ mức 2 là $100 times 20 = 2000$, cộng $300(x - 30)$, rút gọn thành $300x - 7000$)

    #step[$L(x) = F(x) - C(x)$ phần lợi nhuận trước thuế]
    $ L(x) = -x^3 + 75x^2 + 500x - 2000 $

    #step[Dựng $P(x)$ dạng Cases 3 nhánh]

    $ P(x) = cases(
      -x^3 + 75x^2 + 500x - 2000 & x <= 10 ,
      -x^3 + 75x^2 + 400x - 1000 & 10 < x <= 30 ,
      -x^3 + 75x^2 + 200x + 5000 & x > 30
    ) $

    #step[Săn đỉnh từng nhánh]

    *Nhánh 1 ($x <= 10$):*
    $ P_1'(x) = -3x^2 + 150x + 500 > 0$ (luôn dương với $x <= 10$).
    $=>$ Đồng biến, đỉnh tại điểm gãy $x = 10$.
    $ P(10) = 9500 $

    *Nhánh 2 ($10 < x <= 30$):*
    $ P_2'(x) = -3x^2 + 150x + 400 $
    $P_2'(30) = -2700 + 4500 + 400 = 2200 > 0 ->$ đồng biến trên toàn khoảng.
    $=>$ Đỉnh tại điểm gãy $x = 30$.
    $ P(30) = 51500 $

    *Nhánh 3 ($x > 30$):*
    $ P_3'(x) = 0 <=> -3x^2 + 150x + 200 = 0 $
    $ => hoac(
      x = frac(-150 - sqrt(24900), -6) approx 51.29 &" (Nhận vì " > 30 ")",
      x = frac(-150 + sqrt(24900), -6) approx -1.29 &" (Loại)"
    ) $
    Nghiệm thuộc khoảng nhánh 3 $=>$ đây là đỉnh nhánh 3.
    Vì $x$ nguyên, so sánh $x=51$ và $x=52$:
    $ P(51) = 77631, quad P(52) = 77568 $
    $=>$ Đỉnh nhánh 3 tại $x = 51$ ($P = 77631$).

    #step[Tổng kết các ứng viên]

    #table(
      columns: 3,
      align: center,
      table.header([Ứng viên], [$x$], [$P(x)$]),
      [Điểm gãy $a$], [$10$], [$9500$],
      [Điểm gãy $b$], [$30$], [$51500$],
      [Đỉnh nhánh 3], [$51$], [$77631$],
    )

    $ 77631 > 51500 > 9500 $ nên đỉnh toàn cục tại $x = 51$.

    #eg-box(title: [Kết luận])[Sản lượng tối ưu là *51* tấn.]
  ]
)

#v(1em)
#note-box(title: "Bài tập tự luyện: Cases 3 nhánh")[
#tln(
  id: "DTCP-03b",
  [Một công ty luyện kim sản xuất $x$ tấn thép. $F(x) = -2x^3 + 150x^2 + 2000x$, $C(x) = 30x^2 + 800x + 5000$. Thuế luỹ tiến 3 mức:
  - 20 tấn đầu: Miễn thuế.
  - Từ trên 20 đến 40 tấn: Thuế $200$ đ/tấn cho phần vượt.
  - Trên 40 tấn: Thuế $900$ đ/tấn cho phần vượt 40 tấn.
  Tìm sản lượng $x$ tối ưu.],
  [$41$],
  loigiai: [
    #reset-step()
    #ppgiai[2 điểm gãy: $a=20$, $b=40$. Dựng Cases 3 nhánh.]

    #step[$T(x)$ dạng Cases]
    $ T(x) = cases(
      0 & x <= 20 ,
      200(x - 20) = 200x - 4000 & 20 < x <= 40 ,
      200 dot 20 + 900(x - 40) = 900x - 32000 & x > 40
    ) $

    #step[Bước 2 và 3: $P(x)$ dạng Cases]
    $ P(x) = cases(
      -2x^3 + 120x^2 + 1200x - 5000 & x <= 20 ,
      -2x^3 + 120x^2 + 1000x - 1000 & 20 < x <= 40 ,
      -2x^3 + 120x^2 + 300x + 27000 & x > 40
    ) $

    #step[Săn đỉnh từng nhánh]

    *Nhánh 1 ($x <= 20$):* $P_1'(x) = -6x^2 + 240x + 1200 > 0$ $=>$ đồng biến.
    $=>$ Đỉnh tại $x = 20$: $P(20) = 51000$.

    *Nhánh 2 ($20 < x <= 40$):* $P_2'(x) = -6x^2 + 240x + 1000 > 0$ $=>$ đồng biến.
    $=>$ Đỉnh tại $x = 40$: $P(40) = 103000$.

    *Nhánh 3 ($x > 40$):*
    $ P_3'(x) = 0 <=> -6x^2 + 240x + 300 = 0 $
    $ => hoac(
      x approx 41.2 &" (Nhận vì " > 40 ")",
      x approx -1.2 &" (Loại vì " < 0 ")"
    ) $
    Xét $x=41$ và $x=42$:
    $ P(41) = 103178, quad P(42) = 103084 $
    $=>$ Đỉnh nhánh 3 tại $x = 41$.

    #step[Tổng kết]
    $P(20)=51000$, $P(40)=103000$, $P(41)=103178$. Đỉnh cao nhất: $x=41$.
    #eg-box(title: [Kết luận])[Sản lượng tối ưu là *41* tấn.]
  ]
)
]

#pagebreak()

== Tổng kết: Bảng so sánh các dạng Cases

#compare-box(title: [Tư duy Cases — Nhìn là giải được])[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + col-teal,
    inset: 8pt,
    table.header(
      [*Dạng bài*], [*Số nhánh*], [*Điểm gãy*], [*Chiến lược*]
    ),
    [Thuế cố định], [$1$], [Không có], [Giải $P'(x)=0$ như bình thường],
    [Thuế 2 mức], [$2$], [$1$ điểm gãy $a$], [Săn đỉnh 2 nhánh + điểm gãy $a$],
    [Thuế 3 mức], [$3$], [$2$ điểm gãy $a < b$], [Săn đỉnh 3 nhánh + 2 điểm gãy],
  )

  #v(0.5em)
  *Ghi nhớ:* Luôn viết $T(x) = cases(...)$ trước, rồi $P(x) = cases(...)$. Sau đó xử lý từng nhánh như một bài toán độc lập. Cuối cùng so sánh tất cả ứng viên để chọn đỉnh cao nhất.
]

#v(1em)

#eg-box(title: [Lời nhắn])[
  Khi gặp bất kỳ bài toán Doanh Thu - Chi Phí - Thuế nào, việc đầu tiên là \*dựng ngay hàm cases\*. Một khi đã có $P(x) = cases(dots.c, dots.c)$, bài toán trở thành việc tìm GTLN của vài hàm đơn giản trên các khoảng rời rạc. \*Chia để trị\* chính là chìa khoá!
]
