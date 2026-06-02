import codecs

content = r"""#import "../sang-exam.typ": *
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
    #text(fill: rgb("E8EAF6"), size: 14pt)[Nền tảng gỡ rối · Xử lý Thuế luỹ tiến · Đỉnh cao Hàm đa trị]
    #v(0.55em)
    #text(fill: rgb("C5CAE9"), size: 11pt, style: "italic")[(Sát thủ diệt gọn các bài toán kinh tế vận dụng cao)]
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
      [I. Nền tảng tư duy: Gỡ rối ngôn ngữ Kinh Tế], [II. Ví dụ khởi động: Thuế cố định],
      [III. Mở khoá Đẳng Cấp: Thuế luỹ tiến & Hàm đa trị], [IV. Bài tập phân tầng có lời giải chi tiết],
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

= I. Nền tảng tư duy: Gỡ rối ngôn ngữ Kinh Tế

Nhiều học sinh sợ bài toán kinh tế không phải vì Toán khó, mà vì không hiểu "ngôn ngữ Kinh tế". Hãy gỡ rối ngay từ những khái niệm căn bản nhất.

== 1. Ba biến số cốt lõi

#rev-box(title: [Công thức Vàng của Lợi nhuận])[
  $ P(x) = F(x) - C(x) - T(x) $
  Trong đó:
  - $P(x)$ (Profit): Lợi nhuận thu được.
  - $F(x)$ (Revenue): Tổng doanh thu (tiền thu về từ việc bán $x$ sản phẩm).
  - $C(x)$ (Cost): Tổng chi phí sản xuất.
  - $T(x)$ (Tax): Tổng thuế phải đóng.
]

== 2. Cái bẫy "Bình quân" và "Mỗi sản phẩm"

Rất nhiều đề bài không cho thẳng Tổng chi phí $C(x)$, mà lại cho **"Chi phí bình quân trên 1 sản phẩm"** (ký hiệu là $G(x)$ hoặc $macron(C)(x)$). Tương tự với Thuế phụ thu "trên mỗi sản phẩm".

#note-box(title: [Quy tắc nhân x])[
  Nếu đề cho "bình quân" hoặc "mỗi sản phẩm", hãy nhớ ngay thao tác **NHÂN VỚI $x$**.
  
  $ "Tổng chi phí " C(x) = x dot G(x) $
  $ "Tổng thuế " T(x) = x dot "Thuế của 1 sản phẩm" $
]

== 3. Quy trình 4 bước tối ưu Lợi Nhuận

#theory-layout(
  [
    #eg-box(title: [Các bước giải chuẩn mực])[
      1. **Phiên dịch đề:** Chuyển tất cả về hàm tổng $F(x), C(x), T(x)$. Đừng quên nhân $x$ nếu đề có chữ "bình quân".
      2. **Lập hàm Lợi nhuận:** $P(x) = F(x) - C(x) - T(x)$.
      3. **Tối ưu (Đạo hàm):** Giải phương trình $P'(x) = 0$.
      4. **Kết luận:** Kiểm tra điều kiện của $x$ (phải nguyên, nằm trong khoảng cho phép) và kết luận nghiệm.
    ]
  ],
  side-note(title: "Nghiệm không nguyên?", [
    Nếu giải $P'(x)=0$ ra $x$ lẻ (VD: $x approx 333.33$), thì phải xét hai số nguyên gần nhất (333 và 334), thay vào hàm $P(x)$ xem số nào cho lợi nhuận cao hơn. Tuy nhiên với hàm bậc 3 thông thường, số nào gần bề hoành hơn thường cho max.
  ])
)

= II. Ví dụ khởi động: Bài toán Thuế cố định

#tln(
  id: "DTCP-01",
  [Một công ty sản xuất $x$ sản phẩm ($x in [1, 600]$). Biết hàm doanh thu là $F(x) = 0.001x^3 - 1.999x^2 + 1006x + 250$ (nghìn đồng). Chi phí bình quân cho mỗi sản phẩm là $G(x) = 0.001x + frac(250, x) + 1$ (nghìn đồng). Nhà nước đánh thuế phụ thu $5$ nghìn đồng cho mỗi sản phẩm bán ra. Hỏi công ty cần sản xuất bao nhiêu sản phẩm để lợi nhuận đạt giá trị lớn nhất?],
  [$333$ hoặc $334$],
  loigiai: [
    #ppgiai[Ý tưởng gỡ rối: Chuyển chi phí bình quân thành tổng chi phí, lập hàm lợi nhuận và dùng đạo hàm.]
    
    #step[Bước 1: Chuyển "bình quân" và "mỗi sản phẩm" thành TỔNG]
    - Tổng chi phí: 
      $ C(x) = x dot G(x) = x (0.001x + frac(250, x) + 1) = 0.001x^2 + 250 + x $
    - Tổng thuế:
      $ T(x) = 5x $

    #step[Bước 2: Lập hàm Lợi nhuận $P(x)$]
    $ P(x) &= F(x) - C(x) - T(x) \
           &= (0.001x^3 - 1.999x^2 + 1006x + 250) - (0.001x^2 + x + 250) - 5x \
           &= 0.001x^3 - 2x^2 + 1000x $

    #step[Bước 3: Tối ưu hoá (Đạo hàm)]
    $ P'(x) = 0.003x^2 - 4x + 1000 $
    Giải phương trình $P'(x) = 0$:
    $ 0.003x^2 - 4x + 1000 = 0 <=> 3x^2 - 4000x + 1000000 = 0 $
    $ Delta = (-4000)^2 - 4 dot 3 dot 1000000 = 4000000 => sqrt(Delta) = 2000 $
    $ x = frac(4000 + 2000, 6) = 1000 quad "(Loại vì " x > 600) $
    $ x = frac(4000 - 2000, 6) = frac(2000, 6) approx 333.33 quad "(Nhận)" $

    #step[Bước 4: Kết luận]
    Vì số sản phẩm $x$ phải là số nguyên, ta xét hai giá trị lân cận là $333$ và $334$. Thay vào $P(x)$, ta được:
    $ P(333) approx 148148.14 \
      P(334) approx 148148.14 $
    Cả hai mức sản xuất đều cho mức lợi nhuận xấp xỉ bằng nhau và là lớn nhất.
    #eg-box(title: [Kết luận])[Công ty cần sản xuất *333* hoặc *334* sản phẩm.]
  ]
)

#pagebreak()

= III. Mở khoá Đẳng Cấp: Thuế luỹ tiến & Hàm đa trị

Ở phần trước, thuế áp dụng cho mọi sản phẩm là như nhau (5 nghìn đồng/sản phẩm). Tuy nhiên, trong thực tế và các đề thi Vận Dụng Cao, nhà nước thường áp dụng *Thuế luỹ tiến* để hạn chế sản xuất quá mức hoặc bảo vệ môi trường.

== 1. Thuế luỹ tiến là gì?

Thuế luỹ tiến là loại thuế mà *mức thuế suất thay đổi tuỳ theo số lượng sản phẩm*. 
Ví dụ: 
- Dưới 200 sản phẩm: Không thu thuế ($T=0$).
- Từ sản phẩm thứ 201 trở đi: Mỗi sản phẩm vượt mức 200 sẽ bị thu thuế 10 nghìn đồng.

Khi đó, tổng thuế $T(x)$ không còn là một đường thẳng $T(x) = ax$ nữa, mà bị bẻ gãy thành nhiều nhánh. Đây chính là *Hàm đa trị (Piecewise function)*.

== 2. Cách thiết lập Hàm đa trị cho Thuế

#rev-box(title: [Xây dựng hàm thuế phân nhánh])[
  Nếu đề bài có cấu trúc: "Sản xuất đến $x_0$ sản phẩm thì thuế là $t_1$. Từ sản phẩm thứ $x_0 + 1$ trở đi, phần dôi ra chịu thuế $t_2$".
  
  Hàm thuế $T(x)$ được viết dưới dạng:
  $ T(x) = cases(
    t_1 dot x & "nếu " 0 <= x <= x_0 \,
    t_1 dot x_0 + t_2 dot (x - x_0) & "nếu " x > x_0
  ) $
]

== 3. Kỹ thuật "Truy tìm đỉnh" trên hàm đa trị

Khi hàm $T(x)$ phân nhánh, hàm Lợi nhuận $P(x) = F(x) - C(x) - T(x)$ cũng bị phân nhánh tương ứng. Để tìm giá trị lớn nhất (GTLN) của $P(x)$, ta thực hiện 3 bước:

#theory-layout(
  [
    #cach1-box[
      *Bước 1:* Lập hệ phương trình phân nhánh cho $P(x)$.
      $ P(x) = cases( P_1(x) & (x <= x_0) \, P_2(x) & (x > x_0) ) $
      
      *Bước 2:* Xét riêng từng hàm $P_1(x)$ trên $(0, x_0]$ và $P_2(x)$ trên $(x_0, +infinity)$.
      - Giải $P_1'(x) = 0 ->$ tìm $x_1$, so sánh xem $x_1$ có thuộc khoảng không.
      - Giải $P_2'(x) = 0 ->$ tìm $x_2$, so sánh xem $x_2$ có thuộc khoảng không.
      
      *Bước 3:* Lập bảng biến thiên kép hoặc so sánh trực tiếp các giá trị cực đại của $P_1(x_1)$, $P_2(x_2)$ và điểm gãy $P(x_0)$ để chốt lại đỉnh cao nhất.
    ]
  ],
  side-note(title: "Bẫy điểm gãy", [
    Rất nhiều học sinh bỏ quên giá trị tại điểm chuyển giao $x_0$. Trong một số trường hợp, cực đại rơi đúng vào điểm gãy (nơi hàm số không có đạo hàm) chứ không nằm ở các điểm $P'(x)=0$.
  ])
)

#pagebreak()

= IV. Bài tập phân tầng có lời giải chi tiết

== Cấp độ 1: Thuế luỹ tiến 2 mức cơ bản

#tln(
  id: "DTCP-02",
  [Một doanh nghiệp sản xuất $x$ sản phẩm ($x in [1, 1000]$). Doanh thu và chi phí tính bằng: $F(x) = -0.002x^3 + 4x^2 + 500x$ và $C(x) = 2x^2 + 100x + 1000$. Chính sách thuế như sau: 200 sản phẩm đầu tiên được miễn thuế. Từ sản phẩm thứ 201 trở đi, mỗi sản phẩm bị đánh thuế $200$ (nghìn đồng). Hỏi doanh nghiệp nên sản xuất bao nhiêu sản phẩm để lợi nhuận cực đại?],
  [$200$],
  loigiai: [
    #ppgiai[Lập hàm thuế phân nhánh, sau đó lập hàm Lợi nhuận $P(x)$ và tối ưu từng nhánh.]
    
    #step[Bước 1: Lập hàm thuế đa trị $T(x)$]
    - Nếu $x <= 200$: Không đóng thuế $=> T(x) = 0$.
    - Nếu $x > 200$: Thuế cho phần dôi ra $(x - 200)$ là $200(x - 200)$.
      $ => T(x) = 200x - 40000 $

    #step[Bước 2: Lập hàm Lợi nhuận $P(x)$ phân nhánh]
    $ P(x) &= F(x) - C(x) - T(x) \
           &= (-0.002x^3 + 4x^2 + 500x) - (2x^2 + 100x + 1000) - T(x) \
           &= -0.002x^3 + 2x^2 + 400x - 1000 - T(x) $
           
    Phân nhánh:
    $ P(x) = cases(
      -0.002x^3 + 2x^2 + 400x - 1000 & "khi " x <= 200 \,
      -0.002x^3 + 2x^2 + 200x + 39000 & "khi " x > 200
    ) $

    #step[Bước 3: Tối ưu trên từng nhánh]
    *Nhánh 1 ($x <= 200$):*
    $ P_1'(x) = -0.006x^2 + 4x + 400 $
    Giải $P_1'(x) = 0 => x approx 753.8 > 200$ (Loại).
    Vì $P_1'(x) > 0$ trên $[0, 200]$ nên hàm đồng biến. Cực đại nhánh 1 đạt tại biên phải $x = 200$.
    $ P_1(200) = 143000 $

    *Nhánh 2 ($x > 200$):*
    $ P_2'(x) = -0.006x^2 + 4x + 200 $
    Giải $P_2'(x) = 0 => x approx 713.6$ (Nhận vì $> 200$).
    Cực đại của nhánh 2 đạt tại $x approx 714$.
    $ P_2(714) approx 135832 $

    #step[Bước 4: So sánh và Kết luận]
    Ta thấy $143000 > 135832$. Đỉnh tại $x = 200$ (hưởng trọn mức miễn thuế) cho lợi nhuận cao hơn đỉnh ở nhánh thứ hai.
    #eg-box(title: [Kết luận])[Nên sản xuất *200* sản phẩm.]
  ]
)

== Cấp độ 2: Thuế luỹ tiến 3 mức (Vận dụng cao)

#tln(
  id: "DTCP-03",
  [Một công ty luyện kim sản xuất $x$ tấn thép. Tổng doanh thu là $F(x) = -x^3 + 90x^2 + 1000x$ và tổng chi phí sản xuất là $C(x) = 15x^2 + 500x + 2000$. Thuế bảo vệ môi trường được tính luỹ tiến 3 mức: 
  - 10 tấn đầu: Miễn thuế.
  - Từ trên 10 tấn đến 30 tấn: Thuế $100$ đ/tấn cho phần vượt.
  - Trên 30 tấn: Thuế $300$ đ/tấn cho phần vượt 30 tấn (cộng dồn các phần trước).
  Hỏi sản lượng $x$ tối ưu là bao nhiêu?],
  [$51$],
  loigiai: [
    #ppgiai[Lập $T(x)$ qua 3 mốc: 10 và 30. Cực đại có thể là một trong các đỉnh đạo hàm hoặc chính điểm gãy.]
    
    #step[Bước 1: Lập hàm thuế $T(x)$]
    - $x <= 10$: $T(x) = 0$.
    - $10 < x <= 30$: $T(x) = 100(x - 10) = 100x - 1000$.
    - $x > 30$: Thuế của phần 20 tấn giữa (từ 10 đến 30) là $20 times 100 = 2000$. Cộng phần vượt 30:
      $T(x) = 2000 + 300(x - 30) = 300x - 7000$.

    #step[Bước 2: Lập Lợi nhuận trước thuế $L(x) = F(x) - C(x)$]
    $ L(x) = (-x^3 + 90x^2 + 1000x) - (15x^2 + 500x + 2000) = -x^3 + 75x^2 + 500x - 2000 $

    #step[Bước 3: Lập hàm $P(x)$ đa trị và đạo hàm $P'(x)$]
    $ P(x) = cases(
      -x^3 + 75x^2 + 500x - 2000 & (x <= 10) \,
      -x^3 + 75x^2 + 400x - 1000 & (10 < x <= 30) \,
      -x^3 + 75x^2 + 200x + 5000 & (x > 30)
    ) $

    - *Nhánh 1 ($x <= 10$):* $P_1'(x) = -3x^2 + 150x + 500 > 0$ với mọi $x <= 10 =>$ tăng dần đến $x=10$.
      $ P(10) = 9500 $
    - *Nhánh 2 ($10 < x <= 30$):* $P_2'(x) = -3x^2 + 150x + 400$. Giải $P_2'(x)=0 => x approx 52.5 > 30$ (Loại). Hàm đồng biến trên khoảng này, đỉnh tại biên $x=30$.
      $ P(30) = 51500 $
    - *Nhánh 3 ($x > 30$):* $P_3'(x) = -3x^2 + 150x + 200 = 0 => x = frac(-150 + sqrt(150^2 - 4(-3)(200)), -6) approx 51.29$.
      Giá trị lớn nhất nhánh 3 tại $x=51$. (Vì $x$ nguyên nên so sánh $P(51)$ và $P(52)$).
      $ P(51) = -(51)^3 + 75(51)^2 + 200(51) + 5000 = 77631 $
      $ P(52) = -(52)^3 + 75(52)^2 + 200(52) + 5000 = 77568 $

    #step[Bước 4: So sánh 3 đỉnh]
    So sánh: Điểm gãy $x=10$ ($P=9500$), Điểm gãy $x=30$ ($P=51500$), Đỉnh nhánh 3 $x=51$ ($P=77631$).
    Ta thấy đỉnh tại $x=51$ là cực đại toàn cục.
    #eg-box(title: [Kết luận])[Sản lượng tối ưu là *51* tấn.]
  ]
)
"""

with codecs.open('/Users/admin/conictypst/typst/exams/CD-DoanhThu-ChiPhi-Thue.typ', 'w', encoding='utf-8') as f:
    f.write(content)
