#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// CẤU HÌNH TRANG
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.88em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("004D40"), rgb("00695C"), rgb("00897B"), angle: 135deg),
  stroke: none,
  inset: (x: 16pt, y: 11pt),
  radius: 6pt,
  above: 1.9em,
  below: 1.3em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("00695C")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("00695C"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("BF360C"), size: 11pt, weight: "bold", "▸ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let c-teal = rgb("00695C")
#let c-amber = rgb("BF360C")
#let c-green = rgb("1B5E20")

#let theory-box(body) = block(
  fill: rgb("E0F2F1"),
  stroke: (left: 4pt + c-teal, rest: 0.8pt + rgb("80CBC4")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

#let cannon-box(title, body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 5pt + rgb("D84315"), rest: 0.7pt + rgb("FFAB91")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("BF360C"), weight: "bold")[🧨 #title]
  #v(0.35em)
  #body
]

#let note-box(title: "Ghi chú", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + c-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// ─── Bảng màu chủ đề ─────────────────────────────────────────
#let c-teal = rgb("00695C")
#let c-navy = rgb("0D47A1")
#let c-amber = rgb("BF360C")
#let c-violet = rgb("4A148C")
#let c-green = rgb("1B5E20")
#let c-slate = rgb("37474F")
#let c-emerald = rgb("00695C")

// ─── Hộp lý thuyết ───────────────────────────────────────────
#let theory-box(body) = block(
  fill: rgb("E0F2F1"),
  stroke: (left: 4pt + c-teal, rest: 0.8pt + rgb("80CBC4")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

#let insight-box(title: "💡 Trực Giác", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + c-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let key-box(body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + rgb("F9A825"), rest: 0.6pt + rgb("FFF176")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("E65100"), weight: "bold")[🔑 Công Thức Then Chốt]
  #v(0.3em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FBE9E7"),
  stroke: (left: 4pt + c-amber, rest: 0.6pt + rgb("FFAB91")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: c-amber, weight: "bold")[⚠️ Lỗi Sai Thường Gặp]
  #v(0.3em)
  #body
]

#let example-box(n: "", body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + c-green, rest: 0.6pt + rgb("C5E1A5")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[📝 Ví Dụ #n]
  #v(0.3em)
  #body
]

#let qopen(body) = block(
  fill: rgb("EDE7F6"),
  stroke: (left: 3pt + c-violet, rest: 0.5pt + rgb("D1C4E9")),
  radius: (right: 5pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: c-violet, weight: "bold", size: 9.5pt)[❓ Câu Hỏi Gợi Mở]
  #v(0.22em)
  #body
]

#let recognize-box(title, body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + c-navy, rest: 0.6pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-navy, weight: "bold")[🔍 #title]
  #v(0.3em)
  #body
]

#let route-box(title: "🧭 Cách Nghĩ Chậm", body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 4pt + rgb("EF6C00"), rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("E65100"), weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let cannon-box(title, body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 5pt + rgb("D84315"), rest: 0.7pt + rgb("FFAB91")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("BF360C"), weight: "bold")[🧨 #title]
  #v(0.35em)
  #body
]

// TRANG BÌA
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("051F1A"), rgb("002B25"), rgb("004D40"), rgb("00695C"), angle: 150deg),
    inset: (x: 2.2cm, y: 1.8cm),
    radius: 12pt,
  )[
    #text(fill: rgb("80CBC4"), size: 11pt, weight: "bold")[CHUYÊN ĐỀ ĐỀ THI TUYỂN SINH 12]
    #v(0.6em)
    #text(fill: white, size: 28pt, weight: "black")[Tô Màu Ẩn Dụ: Đại Bác Vạn Năng]
    #v(0.15em)
    #text(fill: rgb("A7FFEB"), size: 14pt, style: "italic")[Một Nguyên Lý Bắn Nát Mọi Bài Toán Khó]
    #v(1.2em)
    #line(length: 60%, stroke: 1pt + rgb("80CBC4"))
  ]
]

#v(1.2em)

= Phần I: Vũ khí cốt lõi - Từ Súng Lục đến Đại Bác

Nhiều học sinh thường bối rối khi gặp các bài toán: "Lập số không có 2 chữ số kề nhau giống nhau", "Sơn nhà", "Tô màu bản đồ"... vì họ cố nhớ hàng tá công thức cho từng dạng. 
Chuyên đề này sẽ đập tan sự phức tạp đó. Bạn chỉ cần 2 vũ khí: *Súng Lục* (dùng cho hàng thẳng) và *Đại Bác Vạn Năng* (dùng cho vòng khép kín).

== 1. Súng Lục (Quy tắc nhân cho Hàng Thẳng)

Khi các đối tượng xếp thành 1 hàng ngang (hoặc 1 cành cây không khép kín).

#theory-box[
  *Tư duy Súng Lục:*
  - Ô đầu tiên được tự do chọn: có $k$ cách.
  - Từ ô thứ hai trở đi, mỗi ô chỉ cần KHÁC ô đứng ngay trước nó: có $k-1$ cách.
  
  *Công thức:* $N = k(k-1)^{n-1}$
]

== 2. Đại Bác Vạn Năng (Nguyên lý Xoá - Chập)

Khi đồ thị bị *khép kín* (tạo thành vòng tròn, lưới, bản đồ), "Súng Lục" bị vô hiệu hoá vì ô cuối cùng vừa phải khác ô áp chót, vừa phải khác ô đầu tiên. Lúc này, ta lôi *Đại Bác Vạn Năng* ra.

#cannon-box("Đại Bác Vạn Năng: Cắt Liên Kết - Trừ Dính Cục")[
  Muốn phá một vòng khép kín, ta chủ động *Cắt đứt một ranh giới (Xoá cạnh)* để nó duỗi ra thành hàng thẳng (hoặc hình dễ hơn). Nhưng khi cắt ranh giới, ta vô tình đếm thừa những trường hợp 2 ô đó bị trùng màu. Vậy ta phải *TRỪ ĐI* trường hợp 2 ô đó bị *Chập làm một (Chập đỉnh)*.
  
  $ "Đếm(Đồ thị gốc)" = "Đếm(Cắt 1 ranh giới)" - "Đếm(Chập 2 ô đó làm 1)" $
]

*Ví dụ minh hoạ sức mạnh Đại Bác với VÒNG TRÒN $n$ ĐỈNH (Tư duy Truy hồi):*
- Cắt 1 cạnh của vòng tròn $n$ đỉnh $->$ Ta được 1 hàng thẳng $n$ đỉnh. Số cách tô là $k(k-1)^(n-1)$.
- Chập 2 đỉnh kề nhau của vòng tròn $->$ Ta được 1 vòng tròn $(n-1)$ đỉnh. Số cách tô là $P_(n-1)$.
Nên ta có hệ thức truy hồi (Đại Bác bắn lùi):
$ P_n = k(k-1)^(n-1) - P_(n-1) $
Bắt đầu với tam giác (vòng 3 đỉnh): $P_3 = k(k-1)(k-2)$ (chọn 3 màu khác nhau).
Từ đó, ta có thể dễ dàng lập bảng tính truy hồi cho các vòng lớn hơn (ví dụ với $k=3$ màu):

#align(center)[
  #table(
    columns: 3,
    align: center,
    stroke: 0.5pt + c-teal,
    inset: 7pt,
    table.header([*Số đỉnh $n$*], [*Phép tính truy hồi: $P_n = 3 dot 2^(n-1) - P_(n-1)$*], [*Kết quả $P_n$*]),
    [$3$ (Tam giác)], [$P_3 = 3 dot 2 dot 1$], [$6$],
    [$4$ (Tứ giác)], [$P_4 = 3 dot 2^3 - P_3 = 24 - 6$], [$18$],
    [$5$ (Ngũ giác)], [$P_5 = 3 dot 2^4 - P_4 = 48 - 18$], [$30$],
    [$6$ (Lục giác)], [$P_6 = 3 dot 2^5 - P_5 = 96 - 30$], [$66$],
  )
]
Học sinh chỉ cần cộng trừ nhanh trên bảng là ra đáp số, không cần học thuộc công thức đóng phức tạp!

#pagebreak()

= Phần II: Tám lớp vỏ bọc ngụy trang trong đề thi

Dưới đây là 8 "vỏ bọc" phổ biến nhất mà các đề thi thường ngụy trang. Tất cả đều sẽ bị bẻ gãy bởi Súng Lục hoặc Đại Bác Vạn Năng.

== Lớp Vỏ 1 🔢 — Dãy Số và Mật Khẩu

#recognize-box("Đại Bác 1 — Chụp Hàng Thẳng")[
  *Vỏ bọc hay gặp:* "lập số ... chữ số", "mật khẩu ... ký tự", "mã sản phẩm",
  "dãy ký hiệu ... phần tử", "mã OTP", "chuỗi xác thực".

  *Cú bắn chuẩn:* đóng đề về một hàng thẳng $n$ vị trí.
  Nếu mỗi vị trí chỉ cần khác vị trí sát trước nó thì dùng ngay hàng thẳng:
  - ô đầu tự do → $N = k(k-1)^(n-1)$;
  - ô đầu bị cấm $1$ giá trị (thường là chữ số $0$) → $N = (k-1)^n$.

  *Biến thể phổ thông hay nấp:* số có nhiều chữ số, mã ghế, số báo danh, chuỗi đèn LED thẳng, biển quảng cáo có các ô liên tiếp.

  *Bẫy cuối:* nếu đề chỉ cấm một ký hiệu đặc biệt, ví dụ "không có hai số $1$ liên tiếp", thì đó không còn là tô màu thuần nữa mà chuyển sang DP/Fibonacci.
]

#v(0.5em)

#tn(
  [Một dải băng giấy được chia làm $4$ ô liên tiếp. Có cọ vẽ $3$ màu (Đỏ, Xanh, Vàng). Bạn cần tô màu sao cho hai ô kề nhau phải khác màu. Hỏi có bao nhiêu cách tô dải băng này?],
  (
    [$3^4 = 81$],
    True([$3 dot 2^3 = 24$]),
    [$4 dot 3 = 12$],
    [$3 dot 2 dot 1 = 6$],
  ),
  loigiai: [
    Đây là mô hình hàng thẳng cơ bản nhất: $n=4$ ô, $k=3$ màu.
    
    - Ô đầu tiên thoái mái chọn, có $3$ cách.
    - Từ ô thứ hai trở đi, mỗi ô chỉ cần né đi $1$ màu của ô đứng trước nó. Vậy mỗi ô đều có $3 - 1 = 2$ cách lựa chọn.
    
    Áp dụng công thức Đại Bác 1: 
    $N = k(k-1)^(n-1) = 3 dot 2^3 = 24$ cách.
    
    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(4) {
          rect((i*1.3, 0), (i*1.3 + 1, 0.8), fill: rgb("FFEBEE"), stroke: 1.5pt + c-slate)
        }
        content((0.5, 0.4), text(weight: "bold")[3])
        content((1.8, 0.4), text(weight: "bold")[2])
        content((3.1, 0.4), text(weight: "bold")[2])
        content((4.4, 0.4), text(weight: "bold")[2])
        content((2.45, -0.4), text(size: 8.5pt, weight: "bold")[Các ô kề nhau bị cấm lặp màu])
      })
    ]
  ]
)

#v(0.5em)

#tn(
  [Có bao nhiêu số tự nhiên có $5$ chữ số, lấy từ tập $\{1, 2, 3, 4, 5\}$,
    không có hai chữ số liên tiếp bằng nhau?],
  (
    [$4 dot 5^3 = 500$],
    True([$5 dot 4^4 = 1280$]),
    [$5^5 = 3125$],
    [$5 dot 4^3 = 320$],
  ),
  loigiai: [
    Đây là hàng thẳng gồm $5$ vị trí, với $5$ chữ số cho phép và không có chữ số $0$ nên ô đầu không bị hạn chế riêng.

    - Chữ số đầu có $5$ cách chọn.
    - Mỗi chữ số tiếp theo chỉ cần khác chữ số đứng ngay trước, nên có $4$ cách.

    Do đó
    $N = 5 dot 4^4 = 5 dot 256 = 1280.$

    Vậy có $1280$ số thỏa mãn.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(5) {
          rect((i*1.5, 0), (i*1.5 + 1.1, 1), fill: rgb("E8EAF6"), stroke: 1.5pt + c-navy, radius: 2pt)
          if i > 0 {
            line((i*1.5 - 0.4, 0.5), (i*1.5, 0.5), mark: (end: "stealth", size: 0.15), stroke: 1.5pt + c-amber)
          }
        }
        content((0.55, 0.5), text(weight: "bold")[5])
        for i in range(1, 5) {
          content((i*1.5 + 0.55, 0.5), text(weight: "bold")[4])
        }
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Biển số xe gồm $3$ chữ cái tiếp theo $3$ chữ số. Mỗi chữ số lấy từ $\{0..9\}$;
    chữ số đầu ≠ $0$; không có hai chữ số liên tiếp bằng nhau.
    Số biển số hợp lệ (chỉ tính phần $3$ chữ số) là:],
  (
    [$720$],
    True([$9 dot 9 dot 9 = 729$]),
    [$9 dot 10 dot 9 = 810$],
    [$10 dot 9^2 = 810$],
  ),
  loigiai: [
    Ta chỉ cần xét phần $3$ chữ số ở cuối biển số.

    - Chữ số đầu tiên không được bằng $0$, nên có $9$ cách chọn.
    - Chữ số thứ hai phải khác chữ số thứ nhất, nên vẫn có $9$ cách.
    - Chữ số thứ ba chỉ cần khác chữ số thứ hai, nên cũng có $9$ cách.

    Vậy
    $N = 9 dot 9 dot 9 = 9^3 = 729.$

    Số biển số hợp lệ ở phần chữ số là $729$.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(3) {
          rect((i*1.5, 0), (i*1.5 + 1.1, 1), fill: rgb("FFFDE7"), stroke: 1.5pt + c-navy, radius: 2pt)
          if i > 0 {
            line((i*1.5 - 0.4, 0.5), (i*1.5, 0.5), mark: (end: "stealth", size: 0.15), stroke: 1.2pt + c-slate)
            content((i*1.5 - 0.2, 0.75), text(size: 8pt)[≠])
          }
        }
        content((0.55, 0.5), text(weight: "bold")[9 ch])
        for i in range(1, 3) {
          content((i*1.5 + 0.55, 0.5), text(weight: "bold")[9 ch])
        }
        content((0.55, -0.4), text(size: 8pt)[Khác 0])
      })
    ]
  ],
)

#v(0.5em)

#tln(
  id: "CB-OTP",
  [Một hệ thống bảo mật tạo mã OTP ngang gồm $6$ ô. Mỗi ô được điền tự động một chữ số từ $1$ đến $5$. Để tránh rủi ro người dùng nhập sai do phím đúp, hệ thống cấm hai ô kề nhau có cùng chữ số. Tính số lượng mã OTP hợp lệ có thể tạo ra. *(Điền đáp án là một số nguyên)*],
  [$5120$],
  loigiai: [
    Đây là một bài toán cấu trúc hàng thẳng với $n=6$ ô và $k=5$ giá trị (chữ số).

    - Ô thứ nhất nằm tự do, có đủ $5$ lựa chọn.
    - Từ ô thứ hai đến ô thứ sáu ($5$ ô), mỗi ô chỉ cần khác với ô đứng ngay trước nó, do đó mỗi ô có $4$ lựa chọn.

    Số cách tạo mã là $N = 5 dot 4^5 = 5120.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(6) {
          rect((i * 1.5, 0), (i * 1.5 + 1.1, 1), fill: rgb("E3F2FD"), stroke: 1pt + c-navy, radius: 2pt)
          if i > 0 {
            line((i * 1.5 - 0.4, 0.5), (i * 1.5, 0.5), mark: (end: "stealth", size: 0.15), stroke: 1.2pt + c-amber)
            content((i * 1.5 - 0.2, 0.7), text(size: 8pt, fill: c-amber, weight: "bold")[≠])
          }
        }
        content((0.55, 0.5), text(weight: "bold")[5 ch])
        for i in range(1, 6) {
          content((i * 1.5 + 0.55, 0.5), text(weight: "bold")[4 ch])
        }
      })
    ]
  ],
)

#v(0.5em)

#example-box(n: "1 — Biến Tấu: Dãy Nhị Phân Không Có Hai Số 1 Liên Tiếp")[
  *Đây là bài toán tô màu biến thể:* dãy $n$ bit $\{0,1\}$ sao cho không có $"11"$
  (hai chữ số $1$ liên tiếp).

  *Lưu ý:* Đây *không* phải là hàng thẳng $k=2$ thông thường vì ràng buộc
  chỉ áp dụng cho chữ số $1$ (không cấm "$00$"). Đây là bài toán đếm bằng quy hoạch
  động (DP), không phải đơn thuần tô màu.
  Số dãy: $a_n$ trong đó $a_1=2$, $a_2=3$, $a_n = a_{n-1}+a_{n-2}$ (Fibonacci).
]

#v(0.5em)

== Lớp Vỏ 2 🏠 — Sơn Nhà, Cột, Hàng Rào, Dải Màu

#recognize-box("Đại Bác 2 — Sơn Dọc Một Dãy Thật")[
  *Vỏ bọc hay gặp:* "dãy nhà liền kề", "cột đèn trên đường thẳng",
  "hàng rào $n$ tấm ván", "sơn $n$ đoạn", "băng màu $n$ ô", "dãy ghế khán đài".

  *Cú bắn chuẩn:* bản chất vẫn là hàng thẳng, nhưng phải soi kỹ *điều kiện ở biên*:
  - nếu chỉ cấm hai vật sát nhau trùng màu → dùng công thức hàng thẳng;
  - nếu đầu và cuối cũng bị ràng buộc → chuyển ngay sang Đại Bác 3;
  - nếu đề gài điều kiện "dùng đủ màu", "không quá ... màu" → phải tách trường hợp hoặc inclusion-exclusion.

  *Biến thể phổ thông hay nấp:* sơn chậu hoa xếp dọc, ghế rạp, cọc tiêu, pano quảng cáo, dãy cửa hàng sát nhau.

  *Bẫy cuối:* nhìn vật thể thật rất dễ bị cuốn theo ngữ cảnh. Chỉ cần hỏi lại: "chúng có đang tạo thành đúng *một dãy* không?".
]

#v(0.5em)

#tn(
  [Một hàng rào gồm $7$ tấm ván xếp thẳng. Có $4$ màu sơn.
    Hai tấm liền kề phải khác màu. Số cách sơn là:],
  (
    [$4 dot 3^5 = 972$],
    True([$4 dot 3^6 = 2916$]),
    [$4^7 = 16384$],
    [$3^7 = 2187$],
  ),
  loigiai: [
    Hàng rào là một hàng thẳng gồm $7$ tấm, với $4$ màu sơn.

    - Tấm đầu tiên có $4$ cách chọn màu.
    - Mỗi tấm sau chỉ cần khác tấm đứng liền trước, nên có $3$ cách.

    Do đó
    $N = 4 dot 3^6 = 4 dot 729 = 2916.$

    Vậy số cách sơn là $2916$.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(7) {
          rect((i*1.2, 0), (i*1.2 + 0.8, 1.5), fill: rgb("FFFFFF"), stroke: 1.5pt + c-teal, radius: 1pt)
          let v = if i == 0 { "4" } else { "3" }
          content((i*1.2 + 0.4, 0.75), text(weight: "bold", fill: c-teal)[#v])
        }
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Một dãy $6$ căn nhà liền tiếp cần sơn bằng $3$ màu.
    Hai nhà kề nhau phải khác màu; thêm điều kiện nhà đầu tiên và nhà cuối cùng
    cũng phải khác màu. Số cách sơn là:],
  (
    [$96$],
    True([$66$]),
    [$60$],
    [$72$],
  ),
  loigiai: [
    Nếu nhà đầu tiên cũng phải khác nhà cuối cùng, dãy nhà này không còn là hàng thẳng nữa mà trở thành vòng $C_6$.

    Với $n=6$, $k=3$, ta áp dụng công thức vòng tròn:
    $N = (3-1)^6 + (-1)^6(3-1).$

    Suy ra
    $N = 2^6 + 2 = 64 + 2 = 66.$

    Vậy số cách sơn là $66$.
  ],
)

#v(0.5em)

#tln(
  id: "CB-LED",
  [Tại phố đi bộ người ta thiết kế một dãy đèn LED gồm $8$ module sáng thẳng hàng để tạo hiệu ứng sóng chạy. Người thiết kế lập trình dùng $4$ loại bóng màu. Yêu cầu là hai module kề nhau luôn phát màu khác nhau, và đặc biệt module đầu dãy phải khác màu module cuối dãy. Tính số cách cấu hình màu. *(Điền đáp án là một số nguyên)*],
  [$6564$],
  loigiai: [
    Mặc dù bề ngoài là một "hàng thẳng", nhưng điều kiện đặc biệt "đầu dãy khác cuối dãy" đã kéo cấu trúc này cuộn lại, tạo thành một đồ thị vòng tròn $C_8$.

    Áp dụng công thức vòng tròn với $n=8$ và $k=4$ màu:
    $N = (k-1)^n + (-1)^n (k-1).$

    Vào phép tính:
    $N = (4-1)^8 + (-1)^8(4-1) = 3^8 + 3 = 6561 + 3 = 6564.$

    Vậy có $6564$ cách.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(8) {
          circle((i * 1.2, 0), radius: 0.35, fill: rgb("FFF9C4"), stroke: 1.2pt + c-slate)
          content((i * 1.2, 0), text(size: 9pt, weight: "bold")[$i+1$])
          if i < 7 {
            line((i * 1.2 + 0.35, 0), (i * 1.2 + 1.2 - 0.35, 0), stroke: 1.5pt + c-teal)
          }
        }
        bezier((0, 0.35), (7 * 1.2, 0.35), (3 * 1.2, 2.5), stroke: (dash: "dashed", paint: c-amber, thickness: 1.5pt))
        content((3 * 1.2 + 0.6, 1.2), text(fill: c-amber, weight: "bold")[Cấm 1 kề 8 (kéo thành vòng)])
      })
    ]
  ],
)

#v(0.5em)

== Lớp Vỏ 3 🔄 — Vòng Đèn, Bàn Tròn, Vòng Hoa (Vị Trí Cố Định)

#recognize-box("Đại Bác 3 — Cắt Vòng Cố Định")[
  *Vỏ bọc hay gặp:* "vòng đèn $n$ bóng", "$n$ bông hoa xếp vòng tròn",
  "$n$ ô trên mặt đồng hồ", "$n$ múi cam", "các ghế quanh vòng nhưng vị trí đã chốt".

  *Cú bắn chuẩn:* đây là hàng thẳng bị khóa thêm một cạnh cuối cùng: *ô cuối cũng phải khác ô đầu*.
  Sử dụng công thức truy hồi: $P_n = k(k-1)^(n-1) - P_(n-1)$ với $P_3 = k(k-1)(k-2)$, lập bảng tính tiến dần đến $n$.

  *Biến thể phổ thông hay nấp:* đồng hồ 12 số, bánh xe chia múi, vòng gạch trang trí, đèn LED viền bảng hiệu, pizza cắt sẵn.

  *Bẫy cuối:* nếu đề nói "hai cách giống nhau khi xoay/lật" thì thôi không dùng tư duy Đại Bác Vạn Năng này nữa, mà chuyển sang Đại Bác 8.
]

#tn(
  [$8$ bóng đèn màu được gắn cố định trên một vòng tròn trang trí.
    Có $4$ màu đèn. Hai bóng liền kề phải khác màu. Số cách bố trí là:],
  (
    [$3^8 = 6561$],
    True[$3^8 + 3 = 6564$],
    [$4 dot 3^7 = 8748$],
    [$3^8 - 3 = 6558$],
  ),
  loigiai: [
    #reset-step()
    *Giải chi tiết:*
    #step[Xây dựng hệ thức truy hồi]
    - Cắt 1 dây nối giữa bóng 1 và bóng 8, vòng tròn duỗi thẳng thành hàng 8 bóng. Số cách tô hàng 8 bóng là: $4 times 3^7 = 8748$.
    - Chập bóng 1 và bóng 8 làm một, ta được vòng tròn có 7 bóng.
    - Vậy số cách tô vòng tròn 8 bóng $P_8$ được tính qua công thức truy hồi:
      $ P_n = 4 dot 3^(n-1) - P_(n-1) $
    
    #step[Lập bảng truy hồi]
    Ta xuất phát từ vòng 3 bóng (tam giác): $P_3 = 4 times 3 times 2 = 24$ cách.
    Lập bảng tính tiến dần đến 8 bóng:
    #align(center)[
      #table(
        columns: 3,
        align: center,
        stroke: 0.5pt + c-teal,
        inset: 6pt,
        table.header([*Số bóng $n$*], [*Công thức truy hồi: $P_n = 4 dot 3^(n-1) - P_(n-1)$*], [*Số cách $P_n$*]),
        [$3$], [$P_3 = 4 dot 3 dot 2$], [$24$],
        [$4$], [$P_4 = 108 - 24$], [$84$],
        [$5$], [$P_5 = 324 - 84$], [$240$],
        [$6$], [$P_6 = 972 - 240$], [$732$],
        [$7$], [$P_7 = 2916 - 732$], [$2184$],
        [$8$], [$P_8 = 8748 - 2184$], [*6564*],
      )
    ]
    Vậy có *6564* cách bố trí.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(8) {
          let a = i * 45deg
          circle((calc.cos(a)*1.5, calc.sin(a)*1.5), radius: 0.3, fill: rgb("FFF9C4"), stroke: 1.5pt + c-amber)
          let a_next = (i+1) * 45deg
          line((calc.cos(a)*1.5, calc.sin(a)*1.5), (calc.cos(a_next)*1.5, calc.sin(a_next)*1.5), stroke: 1.5pt + c-slate)
        }
        content((0,0), text(size: 9pt, weight: "bold")[8 Bóng])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Tô màu $7$ vùng của một bánh pizza cắt đều $7$ miếng xếp thành vòng.
    Có $3$ màu; hai miếng kề nhau phải khác màu. Số cách tô là:],
  (
    [$2^7 = 128$],
    True([$2^7 - 2 = 126$]),
    [$2^7 + 2 = 130$],
    [$3 dot 2^6 = 192$],
  ),
  loigiai: [
    Bảy miếng pizza tạo thành một vòng tròn $C_7$, với $3$ màu và điều kiện các miếng kề nhau phải khác màu.

    Áp dụng công thức vòng tròn:
    $N = (3-1)^7 + (-1)^7(3-1).$

    Suy ra
    $N = 2^7 - 2 = 128 - 2 = 126.$

    Vậy số cách tô là $126$.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(7) {
          let a1 = i * 360deg / 7
          let a2 = (i+1) * 360deg / 7
          arc((0,0), radius: 1.4, start: a1, stop: a2, mode: "PIE", fill: rgb("FFEBEE"), stroke: 1.5pt + c-slate)
        }
        content((0,-1.8), text(size: 9pt, weight: "bold")[Pizza $C_7$])
      })
    ]
  ],
)

#v(0.5em)

#tln(
  id: "CB-RLT",
  [Một bàn quay roulette CỐ ĐỊNH được chia làm $6$ múi bằng nhau. Người thợ dùng $5$ màu sơn để sơn lên các múi này sao cho múi kề nhau phải có màu khác nhau để dễ phân biệt. Khung bàn quay gắn chặt vào mặt tường nên không xét tính chất đối xứng xoay (vị trí múi trên cùng, múi dưới cùng luôn phân biệt). Tính số cách hoàn thiện bàn quay này.],
  [$4100$],
  loigiai: [
    Vòng quay gắn cố định trên tường, nên khoảng không này chuẩn xác là đồ thị vòng tròn $C_6$ bình thường. Điểm mấu chốt là "Không xét đối xứng xoay", nên khóa hẳn Đại Bác 3 thay vì nhảy qua Burnside.

    Áp dụng công thức tô màu vòng:
    $N = (k-1)^n + (-1)^n (k-1).$

    Với $n=6, k=5$:
    $N = (5-1)^6 + (-1)^6(5-1) = 4^6 + 4 = 4096 + 4 = 4100.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.3
        for i in range(6) {
          let a1 = i * 60deg
          let a2 = (i + 1) * 60deg
          arc((0, 0), radius: r, start: a1, stop: a2, mode: "PIE", fill: rgb("E8EAF6"), stroke: 1.2pt + c-slate)

          let am = i * 60 + 30
          content((calc.cos(am * 1deg) * r * 0.7, calc.sin(am * 1deg) * r * 0.7), text(
            size: 10pt,
            weight: "bold",
          )[$i+1$])
        }
        content((0, -r - 0.4), text(size: 9pt, weight: "bold", fill: c-navy)[Điểm chốt (Vị trí cố định)])
      })
    ]
  ],
)

#pagebreak()

== Lớp Vỏ 4 ⬛ — Bảng $2 times n$

#recognize-box("Đại Bác 4 — Quét Theo Cột 2×n")[
  *Vỏ bọc hay gặp:* "bảng $2 times n$ ô", "lịch $2$ hàng $n$ cột",
  "mặt tiền nhà $2$ tầng $n$ cửa sổ", "hành lang $2$ bên $n$ phòng", "hai dãy phòng song song".

  *Cú bắn chuẩn:* nghĩ theo *cột*, không nghĩ theo từng ô rời rạc.
  Cột đầu có $k(k-1)$ cách, còn mỗi cột sau đóng góp hệ số
  $k^2-3k+3$,
  nên
  $N_(2 times n) = k(k-1)(k^2-3k+3)^(n-1).$

  *Biến thể phổ thông hay nấp:* cửa sổ 2 tầng, ghế hai dãy, logo hai hàng, kệ trên-dưới, dãy phòng hai bên hành lang.

  *Bẫy cuối:* kề chéo *không* bị cấm nếu đề chỉ nói kề cạnh. Chỉ cần đổi điều kiện kề là công thức sẽ thay ngay.

  #v(0.4em)
  #align(center)[
    #cetz.canvas(length: 1.35cm, {
      import cetz.draw: *

      // Draw Grid column i-1
      rect((0, 0.5), (1.2, 1.7), fill: rgb("E0F2F1"), stroke: 1.5pt + c-slate, radius: 2pt)
      rect((0, -0.9), (1.2, 0.3), fill: rgb("FFCDD2"), stroke: 1.5pt + c-slate, radius: 2pt)

      // Draw Grid column i
      rect((2.4, 0.5), (3.6, 1.7), fill: white, stroke: 1.2pt + c-slate, radius: 2pt)
      rect((2.4, -0.9), (3.6, 0.3), fill: white, stroke: 1.2pt + c-slate, radius: 2pt)

      // Ràng buộc kề
      // Ngang: a_(i-1) != a_i và b_(i-1) != b_i
      line((1.2, 1.1), (2.4, 1.1), mark: (both: "stealth", size: 0.12), stroke: 1pt + c-amber)
      line((1.2, -0.3), (2.4, -0.3), mark: (both: "stealth", size: 0.12), stroke: 1pt + c-amber)

      // Dọc: a_(i-1) != b_(i-1) và a_i != b_i
      line((0.6, 0.5), (0.6, 0.3), mark: (both: "stealth", size: 0.1), stroke: 1pt + c-teal)
      line((3.0, 0.5), (3.0, 0.3), mark: (both: "stealth", size: 0.1), stroke: 1pt + c-teal)

      content((0.6, 1.1), text(weight: "bold")[$a_(i-1)$])
      content((0.6, -0.3), text(weight: "bold")[$b_(i-1)$])
      content((3.0, 1.1), text(weight: "bold")[$a_i$])
      content((3.0, -0.3), text(weight: "bold")[$b_i$])

      content((0.6, 2.1), text(size: 8pt, fill: c-teal, weight: "bold")[Cột $i-1$ (đã tô)])
      content((3.0, 2.1), text(size: 8pt, fill: c-amber, weight: "bold")[Cột $i$ (cần tô)])

      content((1.8, 1.4), text(size: 7.5pt, fill: c-amber, weight: "bold")[≠])
      content((1.8, -0.6), text(size: 7.5pt, fill: c-amber, weight: "bold")[≠])
      content((-0.2, 0.4), text(size: 7.5pt, fill: c-teal, weight: "bold")[≠])
      content((3.8, 0.4), text(size: 7.5pt, fill: c-teal, weight: "bold")[≠])
    })
  ]

  *Giải thích dẫn xuất trực quan:*
  Ta thực hiện tô màu lần lượt từ trái sang phải, theo từng cột:
  - *Cột 1:* Gồm hai ô kề nhau. Ô trên có $k$ cách chọn màu, ô dưới kề nó nên có $k-1$ cách chọn. Vậy cột 1 có $k(k-1)$ cách tô.
  - *Xét bước chuyển tiếp từ cột trước sang cột sau:*
    Giả sử cột trước đã tô xong với 2 màu cụ thể là *Màu A* (ở trên) và *Màu B* (ở dưới). (Vì kề nhau nên chắc chắn A khác B).
    Bây giờ ta cần chọn màu cho *ô Trên* và *ô Dưới* của cột mới kế bên sao cho: ô Trên khác A (kề ngang), ô Dưới khác B (kề ngang), và ô Trên khác ô Dưới (kề dọc).
    
    Chọn màu cho *ô Trên* trước: Vì ô Trên phải khác A, nên nó có $k-1$ cách chọn màu. 
    Ta chia làm 2 trường hợp dựa theo màu của ô Trên:
    - *Trường hợp 1 (ô Trên lấy đúng Màu B):* Có đúng $1$ cách chọn. Lúc này, ô Dưới kề dọc với ô Trên (màu B) và kề ngang với ô có màu B. Thực chất cả 2 ô kề của ô Dưới đều cùng là màu B. Do đó, ô Dưới chỉ cần né đúng 1 màu B này $=>$ có $k-1$ cách chọn.
      $=> N_1 = 1 dot (k-1) = k-1$ cách.
    - *Trường hợp 2 (ô Trên lấy màu khác B):* Có $(k-1) - 1 = k-2$ cách chọn (vì phải khác cả A và B). Lúc này, ô Dưới kề dọc với ô Trên (một màu X khác B) và kề ngang với ô có màu B. Vì hai màu này khác nhau, ô Dưới bị cấm cả $2$ màu $=>$ còn $k-2$ cách chọn.
      $=> N_2 = (k-2) dot (k-2) = (k-2)^2$ cách.

    Cộng cả 2 trường hợp lại, số cách chọn cặp màu cho cột tiếp theo (Hệ số chuyển đổi $H$) là:
    $ H = (k-1) + (k-2)^2 = k - 1 + k^2 - 4k + 4 = k^2 - 3k + 3. $
    Nhân liên tiếp hệ số $H$ cho các cột sau, ta được công thức tổng quát.
]

#example-box(n: "4 — Bảng 2×3, 3 màu")[
  $k=3$, $n=3$: $N = 3 dot 2 dot (9-9+3)^2 = 6 dot 9 = 54.$

  *Kiểm tra bằng tô trực tiếp:* Cột 1: $(a_1, b_1)$ với $a_1 != b_1$ → $3 dot 2 = 6$ cách.
  Từ cột 1 → cột 2: $k^2 - 3k + 3 = 3$ cách. Từ cột 2 → cột 3: lại $3$ cách.
  $N = 6 dot 3 dot 3 = 54$ ✓
]

#v(0.5em)

#tn(
  [Một bảng $2 times 2$ đơn giản nhất được tô bằng $4$ màu khác nhau. Hai ô kề cạnh không được lặp màu. Hỏi có bao nhiêu cách tô?],
  (
    [$36$],
    [$48$],
    [$60$],
    True([$84$]),
  ),
  loigiai: [
    Đây là bảng $2 times 2$, áp dụng Đại Bác số 4 với $n=2$ cột, $k=4$ màu.
    - Cột 1 có: $k(k-1) = 4 dot 3 = 12$ cách.
    - Cột 2 có hệ số truyền: $k^2-3k+3 = 16-12+3 = 7$ cách.
    
    Vậy số cách tô là $N = 12 dot 7 = 84.$
    
  ]
)

#v(0.5em)

== Lớp Vỏ 4b 🧩 — Lưới Khuyết và Ghép Khối (Đại Bác Vạn Năng)

#note-box(title: "Đại Bác Vạn Năng: Quy Tắc Quét Cột Từng Bước (Giải mọi Lưới Khuyết)")[
  *Tư duy tổng quát:* Bất kỳ lưới $2 times n$ nào bị khuyết, méo mó, hay lắp ghép kỳ lạ đều có chung một cách giải duy nhất: *Quét từ trái sang phải theo từng cột đứng*.
  
  Học sinh chỉ cần nắm vững *3 Quy tắc Vạn năng* sau để tự suy luận hệ số nhân cho từng cột mà không cần học thuộc lòng từng mô hình:

  1. *Quy tắc 1: Cột khởi đầu (Cột 1)*
     - Số cách tô một cột đứng gồm $h$ ô liên tiếp là: $k(k-1)^{h-1}$.
     - Ví dụ: Cột 1 cao 1 ô $=>$ có $k$ cách. Cột 1 cao 2 ô $=>$ có $k(k-1)$ cách.
  
  2. *Quy tắc 2: Chuyển tiếp Cột đầy đủ (Tiêu chuẩn)*
     - Nếu cột mới cao $h$ ô kề đầy đủ sang cột trước cũng cao $h$ ô:
       - Nếu $h=1$: Nhân thêm hệ số $(k-1)$.
       - Nếu $h=2$: Nhân thêm hệ số chuyển tiếp cột đầy đủ $H = k^2 - 3k + 3$ (với $k=4$ thì $H=7$).

  3. *Quy tắc 3: Chuyển tiếp Cột Khuyết / Biến dạng*
     - Ta tô lần lượt từng ô của cột mới. Số cách chọn màu của mỗi ô chỉ phụ thuộc vào số ô đã tô kề sát nó:
       - *Ô chỉ kề sát với 1 ô đã tô màu* (dù kề ngang hay kề dọc): Luôn có $(k-1)$ cách chọn.
       - *Ô kề sát với 2 ô đã tô màu* (mà 2 ô đó kề nhau nên khác màu nhau): Luôn có $(k-2)$ cách chọn.
     - *Hệ quả:* 
       - *Khuyết giảm (Ví dụ: cột trước 2 ô -> cột mới 1 ô):* Ô duy nhất của cột mới chỉ kề ngang với 1 ô cột trước $=>$ Nhân thêm $(k-1)$.
       - *Khuyết tăng (Ví dụ: cột trước 1 ô -> cột mới 2 ô):* Ô kề ngang cột trước nhân $(k-1)$, ô còn lại chỉ kề dọc ô này nên cũng nhân $(k-1)$ $=>$ Tổng cộng nhân $(k-1)^2$.

  #v(0.3em)
  #block(
    fill: rgb("F9F9F9"),
    inset: 10pt,
    radius: 4pt,
    stroke: 0.5pt + rgb("DDDDDD"),
    width: 100%,
  )[
    *Chứng minh & Bản chất toán học (Tại sao công thức đúng?)*
    
    Hãy cùng khám phá nguồn gốc thực tế của các con số này dưới góc nhìn của học sinh khi tự tay tô màu (với bộ $k=4$ màu: Đỏ, Xanh, Vàng, Tím):
    
    #grid(
      columns: (1fr, 1.2fr),
      gutter: 1cm,
      align(center)[
        #cetz.canvas(length: 0.8cm, {
          import cetz.draw: *
          // Ô đã tô màu (Đỏ)
          rect((0, 0), (1, 1), fill: rgb("FFCDD2"), stroke: 1pt + black)
          content((0.5, 0.5), text(size: 8pt)[Đỏ])
          
          // Ô mới cần tô (?)
          rect((1.8, 0), (2.8, 1), fill: white, stroke: 1.2pt + black)
          content((2.3, 0.5), text(size: 9pt, weight: "bold")[?])
          
          // Mũi tên
          line((1.0, 0.5), (1.8, 0.5), mark: (end: "stealth", size: 0.1), stroke: 1pt + red)
          
          content((1.4, 0.8), text(size: 7.5pt, fill: red, weight: "bold")[Né Đỏ])
          content((1.4, -0.4), text(size: 8pt, weight: "bold")[k-1 = 3 cách])
        })
        #v(0.2em)
        _Né 1 ô đã tô lân cận_
      ],
      align(center)[
        #cetz.canvas(length: 0.8cm, {
          import cetz.draw: *
          // Cột cũ
          rect((0, 1), (1, 2), fill: rgb("FFCDD2"), stroke: 1pt + black)
          content((0.5, 1.5), text(size: 8pt)[Đỏ])
          rect((0, 0), (1, 1), fill: rgb("E3F2FD"), stroke: 1pt + black)
          content((0.5, 0.5), text(size: 8pt)[Xanh])
          
          // Cột mới (TH2)
          rect((1.8, 1), (2.8, 2), fill: rgb("FFF9C4"), stroke: 1.2pt + black)
          content((2.3, 1.5), text(size: 8pt)[Vàng])
          rect((1.8, 0), (2.8, 1), fill: white, stroke: 1.2pt + black)
          content((2.3, 0.5), text(size: 9pt, weight: "bold")[?])
          
          // Mũi tên chéo / ngang chỉ ràng buộc
          line((1.0, 0.5), (1.8, 0.5), stroke: (dash: "dashed", paint: black, thickness: 0.8pt))
          line((2.3, 1.0), (2.3, 0.5), stroke: (dash: "dashed", paint: black, thickness: 0.8pt))
          
          content((1.4, 0.2), text(size: 7.5pt, weight: "bold")[né Xanh])
          content((2.9, 0.75), text(size: 7.5pt, weight: "bold")[né Vàng])
          content((1.9, -0.4), text(size: 8pt, weight: "bold")[k-2 = 2 cách])
        })
        #v(0.2em)
        _Né 2 ô khác màu (Trường hợp 2 của H)_
      ]
    )
    
    #v(0.5em)
    *Chi tiết từng quy tắc:*
    - *Tại sao ô kề sát 1 ô đã tô lại có $k-1 = 3$ cách?*
      Khi ô mới chỉ chạm cạnh đúng 1 ô đã sơn xong (ví dụ ô đó màu Đỏ). Để tránh trùng màu kề cạnh, ô mới chỉ cần tránh duy nhất màu Đỏ. Vậy ta còn lại $4 - 1 = 3$ màu để tự do chọn lựa.
      
    - *Tại sao ô kề sát 2 ô đã tô lại có $k-2 = 2$ cách?*
      Khi ô mới kẹt giữa và chạm cạnh 2 ô đã sơn xong (ví dụ ô bên trái màu Đỏ, ô bên dưới màu Xanh). Vì hai ô kề đó chạm cạnh nhau nên chúng bắt buộc mang 2 màu khác nhau. Do đó, ô mới phải né cả Đỏ và Xanh $=>$ còn $4 - 2 = 2$ màu để chọn.
      
    - *Tại sao chuyển tiếp cột 2 ô lại nhân thêm $H = k^2 - 3k + 3 = 7$ cách?*
      Giả sử cột cũ có ô trên màu Đỏ, ô dưới màu Xanh. Khi tô cột mới (gồm ô trên mới và ô dưới mới), ta chia làm 2 trường hợp:
      - _Trường hợp 1:_ Tô ô trên mới trùng màu ô dưới cũ (tô màu *Xanh* - có 1 cách). Lúc này, ô dưới mới kề ngang ô màu Xanh và kề dọc ô trên mới cũng màu Xanh $=>$ Chỉ cần tránh màu Xanh $=>$ có $k-1 = 3$ cách chọn. Số cách: $1 times 3 = 3$ cách.
      - _Trường hợp 2:_ Tô ô trên mới khác màu ô dưới cũ (né Đỏ của ô trên cũ và né Xanh của ô dưới cũ $=>$ có $k-2 = 2$ cách chọn). Khi đó, ô dưới mới kề với hai ô mang hai màu khác nhau $=>$ phải né cả 2 màu này $=>$ có $k-2 = 2$ cách chọn. Số cách: $2 times 2 = 4$ cách.
      - _Cộng lại:_ Ta có $3 + 4 = 7$ cách chuyển tiếp (với $k$ màu, tổng quát là $(1 times (k-1)) + ((k-2) times (k-2)) = k^2 - 3k + 3$).
  ]
  #v(0.3em)


  #v(0.5em)
  #block(
    fill: rgb("FFF8E1"),
    inset: 10pt,
    radius: 4pt,
    stroke: 0.5pt + rgb("FFE082"),
    width: 100%,
  )[
    *Mở rộng tư duy: Khi số màu $k != 4$ hoặc chiều cao cột $> 2$ ô?*
    
    *1. Khi số màu thay đổi (Ví dụ: $k=3$ màu hoặc $k=5$ màu):*
    - Bản chất các quy tắc vạn năng đều được thiết lập dưới dạng biến số $k$ tổng quát. Khi số màu thay đổi, ta chỉ việc thế giá trị $k$ tương ứng vào:
      - Với $k=3$ màu: Né 1 ô $=> k-1 = 2$ cách; Né 2 ô khác màu $=> k-2 = 1$ cách; Chuyển tiếp cột đầy đủ $H = k^2-3k+3 = 3$ cách.
      - Với $k=5$ màu: Né 1 ô $=> 4$ cách; Né 2 ô khác màu $=> 3$ cách; Chuyển tiếp cột đầy đủ $H = 25-15+3 = 13$ cách.
      
    *2. Khi lưới cao hơn (Ví dụ: cột cao $h = 3$ ô hoặc $h = 4$ ô):*
    - Quy tắc quét cột và quy tắc tô từng ô *vẫn giữ nguyên 100%*. 
    - Khi tô một cột mới cao $h$ ô kề sát cột cũ, ta luôn tô lần lượt các ô của cột mới từ trên xuống dưới. Mỗi ô khi tô chỉ cần nhìn về các ô lân cận đã được tô màu trước đó để né màu:
      1. Ô bên trái nó (kề ngang - thuộc cột cũ).
      2. Ô ngay trên nó trong cùng cột (kề dọc - thuộc cột mới đang tô).
    - Vì thế, số cách tô của mỗi ô chỉ đơn giản là đếm xem nó kề sát bao nhiêu ô đã có màu trước đó và áp dụng đúng *Quy tắc 3*.
    - _Ví dụ chuyển tiếp cột $3 times 1$ (3 ô dọc):_
      Giả sử cột cũ đã tô xong. Ta tô cột mới gồm 3 ô $(x, y, z)$ tương ứng từ trên xuống:
      - Ô $x$ chỉ kề ngang 1 ô của cột cũ $=> k-1$ cách.
      - Ô $y$ kề dọc ô $x$ (mới tô) và kề ngang 1 ô của cột cũ $=> y$ kề sát 2 ô đã tô. Do 2 ô này có thể trùng hoặc khác màu, ta chia 2 trường hợp tương tự như khi tính $H$ của cột 2 ô.
      - Ô $z$ kề dọc ô $y$ và kề ngang 1 ô của cột cũ $=> z$ kề sát 2 ô đã tô. Ta lại tiếp tục nhân chuyển tiếp tương tự.
      $=>$ Phương pháp quét cột thực chất là một chuỗi các bước chuyển tiếp cục bộ từ trên xuống dưới và từ trái qua phải. Học sinh chỉ cần nắm vững quy tắc né màu tại chỗ là có thể tự tin xử lý mọi hình dạng lưới!
  ]
  #v(0.5em)

  Để học sinh dễ hiểu nhất, ta dùng bộ $k=4$ màu: {*Đỏ, Xanh, Vàng, Tím*} để phân tích từng cột của 4 mô hình dưới đây. Với mỗi mô hình, hãy chú ý cách ta xác định loại cột và gọi đúng tên quy tắc trước khi tính.

  #v(0.5em)
  *🔷 Mô hình A — Lưới khuyết góc (Đuôi thừa)*

  Đây là lưới $2 times 3$ nhưng bị khuyết mất ô góc dưới-phải. Nhìn theo cột từ trái sang phải, ta thấy: Cột 1 đầy đủ 2 ô, Cột 2 đầy đủ 2 ô, rồi Cột 3 chỉ còn 1 ô đơn độc ở hàng trên.

  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      rect((0,0), (1,1), fill: rgb("E8F5E9"), stroke: 1.2pt + black)
      rect((0,1), (1,2), fill: rgb("E8F5E9"), stroke: 1.2pt + black)
      rect((1,0), (2,1), fill: rgb("E3F2FD"), stroke: 1.2pt + black)
      rect((1,1), (2,2), fill: rgb("E3F2FD"), stroke: 1.2pt + black)
      rect((2,1), (3,2), fill: rgb("FFE0B2"), stroke: 1.2pt + black)
      content((0.5, 1.5), text(size: 8pt, weight: "bold")[C.1])
      content((1.5, 1.5), text(size: 8pt, weight: "bold")[C.2])
      content((2.5, 1.5), text(size: 8pt, weight: "bold")[C.3])
      content((2.5, 0.5), text(size: 8pt, fill: rgb("AAAAAA"))[✕])
    })
  ]

  - *Cột 1 → Quy tắc 1 (Cột khởi đầu, cao 2 ô):*
    Ô trên tự do chọn 4 màu; ô dưới kề dọc nên chỉ né 1 màu. Hệ số: $k(k-1) = 4 times 3 = *12*$ cách.

  - *Cột 2 → Quy tắc 2 (Chuyển tiếp cột đầy đủ, cao 2 ô):*
    Cột 2 kề toàn bộ sang Cột 1 với cùng chiều cao 2 ô — đây là chuyển tiếp chuẩn. Hệ số chuyển tiếp: $H = k^2 - 3k + 3 = 16 - 12 + 3 = *7*$ cách.

  - *Cột 3 → Quy tắc 3 (Khuyết giảm, ô đơn chỉ kề 1 ô):*
    Ô duy nhất của Cột 3 chỉ chạm cạnh ngang với ô trên của Cột 2 (phía dưới trống rỗng). Nó chỉ cần né đúng 1 màu $=>$ Hệ số: $k - 1 = *3*$ cách.

  #align(center)[
    *Tổng số cách:*
    $N = 12 times 7 times 3 = bold(252)$ *cách*
  ]

  #v(0.7em)
  *🔶 Mô hình B — Lưới khuyết giữa (Đứt ruột)*

  Lưới này có "vết nứt" ở giữa: Cột 2 chỉ còn 1 ô ở hàng trên, ô hàng dưới bị xoá. Điều thú vị là sau Cột 2 "thu hẹp", Cột 3 lại "nở rộng" trở lại thành 2 ô — đây là biến dạng khuyết tăng.

  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      rect((0,0), (1,1), fill: rgb("E8F5E9"), stroke: 1.2pt + black)
      rect((0,1), (1,2), fill: rgb("E8F5E9"), stroke: 1.2pt + black)
      rect((1,1), (2,2), fill: rgb("FFE0B2"), stroke: 1.2pt + black)
      content((1.5, 0.5), text(size: 8pt, fill: rgb("AAAAAA"))[✕])
      rect((2,0), (3,1), fill: rgb("E3F2FD"), stroke: 1.2pt + black)
      rect((2,1), (3,2), fill: rgb("E3F2FD"), stroke: 1.2pt + black)
      content((0.5, 1.5), text(size: 8pt, weight: "bold")[C.1])
      content((1.5, 1.5), text(size: 8pt, weight: "bold")[C.2])
      content((2.5, 1.5), text(size: 8pt, weight: "bold")[C.3])
    })
  ]

  - *Cột 1 → Quy tắc 1 (Cột khởi đầu, cao 2 ô):*
    $k(k-1) = 4 times 3 = *12*$ cách.

  - *Cột 2 → Quy tắc 3 (Khuyết giảm, ô đơn chỉ kề 1 ô):*
    Ô của Cột 2 chỉ chạm cạnh ngang 1 ô của Cột 1 (ô hàng trên) — vì phía dưới Cột 2 trống. Nó chỉ cần né 1 màu. Hệ số: $k - 1 = *3*$ cách.

  - *Cột 3 → Quy tắc 3 (Khuyết tăng, tô từng ô từ trên xuống):*
    Cột 3 "phình" ra thành 2 ô sau Cột 2 vốn chỉ có 1 ô. Ta tô từng ô:
    - _Ô trên Cột 3:_ Chỉ kề ngang 1 ô của Cột 2 $=>$ $k-1 = 3$ cách.
    - _Ô dưới Cột 3:_ Kề dọc với ô trên vừa tô (đây là ô kề duy nhất, vì phía trái không có ô nào). Chỉ né 1 màu $=>$ $k-1 = 3$ cách.
    - Hệ số tổng của Cột 3: $(k-1) times (k-1) = 3 times 3 = *9*$ cách.

  #align(center)[
    *Tổng số cách:*
    $N = 12 times 3 times 9 = bold(324)$ *cách*
  ]

  #v(0.7em)
  *🔷 Mô hình C — Lưới thắt eo (Cầu nối 1 ô)*

  Đây là mô hình ghép: hai khối $2 times 2$ nối với nhau bởi 1 ô cầu nối duy nhất. Điểm mấu chốt là sau ô cầu nối, lưới lại "nở" ra thành 2 ô — giống Mô hình B nhưng ở quy mô lớn hơn.

  #align(center)[
    #cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      // Khối Trái
      rect((0,0), (1,1), fill: rgb("E8F5E9"), stroke: 1.2pt + black)
      rect((0,1), (1,2), fill: rgb("E8F5E9"), stroke: 1.2pt + black)
      rect((1,0), (2,1), fill: rgb("E8F5E9"), stroke: 1.2pt + black)
      rect((1,1), (2,2), fill: rgb("E8F5E9"), stroke: 1.2pt + black)
      // Cầu nối
      rect((2,1), (3,2), fill: rgb("FFE0B2"), stroke: 1.4pt + black)
      content((2.5, 0.5), text(size: 8pt, fill: rgb("AAAAAA"))[✕])
      // Khối Phải
      rect((3,0), (4,1), fill: rgb("E3F2FD"), stroke: 1.2pt + black)
      rect((3,1), (4,2), fill: rgb("E3F2FD"), stroke: 1.2pt + black)
      rect((4,0), (5,1), fill: rgb("E3F2FD"), stroke: 1.2pt + black)
      rect((4,1), (5,2), fill: rgb("E3F2FD"), stroke: 1.2pt + black)
      content((0.5, 2.4), text(size: 7.5pt, fill: rgb("1B5E20"), weight: "bold")[Khối Trái])
      content((2.5, 2.4), text(size: 7.5pt, fill: rgb("BF360C"), weight: "bold")[Cầu])
      content((3.5, 2.4), text(size: 7.5pt, fill: rgb("0D47A1"), weight: "bold")[Khối Phải])
    })
  ]

  - *Khối Trái — Cột 1 & Cột 2 (Quy tắc 1 rồi Quy tắc 2):*
    Bảng $2 times 2$ hoàn chỉnh. Cột 1: $12$ cách; Cột 2 kề đủ Cột 1: $H = 7$ cách.
    $=>$ Khối Trái đóng góp $12 times 7 = *84*$ cách.

  - *Cột 3 — Cầu nối (Quy tắc 3, Khuyết giảm):*
    Ô cầu nối chỉ chạm cạnh với đúng 1 ô của Cột 2 (ô hàng trên). Hệ số: $k - 1 = *3*$ cách.

  - *Khối Phải — Cột 4 & Cột 5:*
    - _Cột 4 (Quy tắc 3, Khuyết tăng):_ Lưới lại nở 2 ô sau cầu nối 1 ô. Tô từng ô từ trên xuống: ô trên kề ngang ô cầu nối $=>$ $k-1=3$ cách; ô dưới chỉ kề dọc ô trên $=>$ $k-1=3$ cách. Hệ số Cột 4: $3 times 3 = *9*$ cách.
    - _Cột 5 (Quy tắc 2, Chuyển tiếp đầy đủ):_ Cột 5 kề toàn bộ Cột 4 với cùng chiều cao 2 ô. Hệ số: $H = *7*$ cách.
    $=>$ Khối Phải đóng góp $9 times 7 = *63*$ cách.

  #align(center)[
    *Tổng số cách:*
    $N = 84 times 3 times 63 = bold(15.876)$ *cách*
  ]

  #v(0.7em)
  *🔶 Mô hình D — Lưới bậc thang (Stepped Grid)*

  Lưới này trông như một cầu thang đi xuống: ô đầu nằm hàng trên, sau đó mở rộng ra 2 ô, rồi thu về 1 ô ở hàng dưới. Đây là mô hình điển hình của "Khuyết tăng rồi lại Khuyết giảm".

  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      rect((0,1), (1,2), fill: rgb("E8F5E9"), stroke: 1.2pt + black)
      content((0.5, 0.5), text(size: 8pt, fill: rgb("AAAAAA"))[✕])
      rect((1,0), (2,1), fill: rgb("E3F2FD"), stroke: 1.2pt + black)
      rect((1,1), (2,2), fill: rgb("E3F2FD"), stroke: 1.2pt + black)
      rect((2,0), (3,1), fill: rgb("FFE0B2"), stroke: 1.2pt + black)
      content((2.5, 1.5), text(size: 8pt, fill: rgb("AAAAAA"))[✕])
      content((0.5, 1.5), text(size: 8pt, weight: "bold")[C.1])
      content((1.5, 1.5), text(size: 8pt, weight: "bold")[C.2])
      content((2.5, 0.5), text(size: 8pt, weight: "bold")[C.3])
    })
  ]

  - *Cột 1 → Quy tắc 1 (Cột khởi đầu, cao 1 ô):*
    Ô đơn độc, hoàn toàn tự do. Hệ số: $k = *4*$ cách.

  - *Cột 2 → Quy tắc 3 (Khuyết tăng, tô từng ô từ trên xuống):*
    Từ 1 ô phình ra 2 ô. Chú ý ô trên Cột 2 kề ngang ô Cột 1, còn ô dưới Cột 2 không kề ngang với bất kỳ ô nào của Cột 1 (vì Cột 1 chỉ có ô trên):
    - _Ô trên Cột 2:_ Kề ngang Cột 1 $=>$ né 1 màu $=>$ $k - 1 = 3$ cách.
    - _Ô dưới Cột 2:_ Không kề ngang; chỉ kề dọc với ô trên vừa tô $=>$ né 1 màu $=>$ $k - 1 = 3$ cách.
    - Hệ số tổng Cột 2: $(k-1)^2 = 3 times 3 = *9*$ cách.

  - *Cột 3 → Quy tắc 3 (Khuyết giảm, ô đơn chỉ kề 1 ô):*
    Ô duy nhất của Cột 3 ở hàng dưới, chỉ chạm cạnh ngang với ô dưới của Cột 2. Phía trên Cột 3 trống rỗng. Hệ số: $k - 1 = *3*$ cách.

  #align(center)[
    *Tổng số cách:*
    $N = 4 times 9 times 3 = bold(108)$ *cách*
  ]
]

#v(0.5em)

== Lớp Vỏ 5 🚩 — Cờ và Băng Màu Phân Vùng

#recognize-box("Đại Bác 5 — Bắn Vào Cờ, Logo, Bảng Hiệu")[
  *Vỏ bọc hay gặp:* "thiết kế lá cờ $n$ dải", "tô màu $n$ băng song song",
  "phân chia bảng hiệu thành $n$ vùng dọc/ngang", "logo chia mảng", "poster nhiều panel".

  *Cú bắn chuẩn:* trước hết hỏi xem các vùng có thật sự xếp tuyến tính không.
  - nếu là các dải song song đơn giản → quay về đại bác hàng thẳng;
  - nếu là các mảng hình học kề nhau phức tạp → lập đồ thị đối ngẫu mini rồi tính như đồ thị.

  *Biến thể phổ thông hay nấp:* cờ nhiều dải, áo đấu chia mảng, menu nhiều vùng, bảng quảng cáo cắt ô, mặt tiền chia panel.

  *Bẫy cuối:* hai vùng chỉ chạm nhau ở *một điểm* thì chưa chắc được xem là kề. Phải đọc đúng chữ "chung cạnh" hay "chung đoạn biên".
]

#tn(
  [Thiết kế lá cờ gồm $5$ dải dọc song song, mỗi dải một màu trong $4$ màu.
    Hai dải liền kề không được cùng màu. Số thiết kế là:],
  (
    [$4 dot 3^3 = 108$],
    True([$4 dot 3^4 = 324$]),
    [$3^5 = 243$],
    [$4^5 = 1024$],
  ),
  loigiai: [
    Lá cờ có $5$ dải dọc song song, nên cấu trúc ẩn là một hàng thẳng gồm $5$ ô.

    - Dải đầu tiên có $4$ cách chọn màu.
    - Mỗi dải tiếp theo phải khác dải sát bên, nên có $3$ cách.

    Do đó
    $N = 4 dot 3^4 = 4 dot 81 = 324.$

    Vậy có $324$ thiết kế.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(5) {
          rect((i, 0), (i + 1, 3), fill: rgb("F5F5F5"), stroke: 1.5pt + c-navy)
          let v = if i == 0 { "4" } else { "3" }
          content((i + 0.5, 1.5), text(weight: "bold")[#v])
        }
        content((2.5, -0.5), text(size: 9pt, weight: "bold")[Cờ 5 dải])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Một lá cờ hình chữ nhật chia thành $4$ tam giác bởi $2$ đường chéo.
    Gọi $4$ tam giác là Bắc ($B$), Đông ($Đ$), Nam ($N$), Tây ($T$).
    Cạnh kề: $B$–$Đ$, $Đ$–$N$, $N$–$T$, $T$–$B$ (cùng chung một cạnh biên).
    Có $3$ màu; hai vùng kề phải khác màu. Số cách tô là:],
  (
    [$12$],
    [$15$],
    True([$18$]),
    [$24$],
  ),
  loigiai: [
    Ta không tô trực tiếp theo hình học, mà đổi sang đồ thị đối ngẫu.

    Bốn tam giác $B, Đ, N, T$ chỉ kề nhau theo chu trình
    $B$–$Đ$–$N$–$T$–$B$,
    nên đồ thị đối ngẫu là vòng $C_4$.

    Do đó số cách tô là
    $P(C_4, 3) = 3 dot 2 dot 3 = 18.$

    Vậy có $18$ cách tô.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *

        // Left: Flag divided into 4 triangles
        let x_flag = 0
        rect((x_flag - 2, -1.2), (x_flag + 2, 1.2), stroke: 1.5pt + c-slate)
        line((x_flag - 2, -1.2), (x_flag + 2, 1.2), stroke: 1.2pt + c-slate)
        line((x_flag - 2, 1.2), (x_flag + 2, -1.2), stroke: 1.2pt + c-slate)

        content((x_flag, 0.6), text(weight: "bold")[B])
        content((x_flag + 1.1, 0), text(weight: "bold")[Đ])
        content((x_flag, -0.6), text(weight: "bold")[N])
        content((x_flag - 1.1, 0), text(weight: "bold")[T])
        content((x_flag, -1.7), text(size: 8.5pt, weight: "bold")[Lá cờ chia 4 phần])

        // Right: Dual graph
        let x_dual = 5
        let r = 1.0
        let pB = (x_dual, r)
        let pD = (x_dual + r, 0)
        let pN = (x_dual, -r)
        let pT = (x_dual - r, 0)

        line(pB, pD, pN, pT, pB, stroke: 1.5pt + c-teal)

        circle(pB, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
        circle(pD, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
        circle(pN, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
        circle(pT, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)

        content(pB, text(size: 8.5pt, weight: "bold")[B])
        content(pD, text(size: 8.5pt, weight: "bold")[Đ])
        content(pN, text(size: 8.5pt, weight: "bold")[N])
        content(pT, text(size: 8.5pt, weight: "bold")[T])

        content((x_dual, -1.7), text(size: 8.5pt, weight: "bold")[Đồ thị đối ngẫu $C_4$])

        // Arrow from flag to dual
        line((x_flag + 2.3, 0), (x_dual - 1.5, 0), mark: (end: "stealth", size: 0.15), stroke: 1pt + c-slate)
        content((x_flag + 3.1, 0.3), text(size: 7.5pt, style: "italic")[Đối ngẫu])
      })
    ]
  ],
)

#v(0.5em)

#tln(
  id: "CB-SHIELD",
  [Một huy chương vàng của hiệp hội được chế tác dạng chiếc khiên, chia làm $5$ phân khu bởi hai vành chéo chữ "X" và viền bao quanh. Sơ đồ vùng kề nhau ở đó tạo thành cấu trúc vòng khép kín. Người ta có $4$ loại men màu để phủ ngập lên đó bằng phương pháp châm men. Giới hạn vật lí buộc các phân khu tiếp giáp mặt biên phải được châm khác chất men. Tổng số thiết kế màu là bao nhiêu? *(Điền số nguyên)*],
  [$240$],
  loigiai: [
    Mặc dù bề mặt hình khiên rất rối, bài toán đã ngầm cho biết cấu trúc kề nhau uốn cong thành đúng vòng một biên $C_5$, đây là dạng bắn tỉa đối ngẫu của Đại Bác 5 & 7.

    Khi đưa về $C_n$ thì mọi thứ nhẹ tựa lông hồng nhờ Đại Bác số 3 (Công thức vòng):
    $P(C_n, k) = (k-1)^n + (-1)^n (k-1).$

    Vào thực chiến với $n=5, k=4$:
    $N = (4-1)^5 + (-1)^5(4-1) = 3^5 - 3 = 243 - 3 = 240.$

    Hiệp hội có $240$ mẫu khiên.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.2
        for i in range(5) {
          let a1 = i * 72deg + 90deg
          let a2 = (i + 1) * 72deg + 90deg
          let p1 = (calc.cos(a1) * r, calc.sin(a1) * r)
          let p2 = (calc.cos(a2) * r, calc.sin(a2) * r)
          line(p1, p2, stroke: 1.5pt + c-slate)
        }
        for i in range(5) {
          let a = i * 72deg + 90deg
          let p = (calc.cos(a) * r, calc.sin(a) * r)
          circle(p, radius: 0.25, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
          content(p, text(size: 7.5pt)[V#(i + 1)])
        }
        content((0, -1.8), text(size: 8.5pt, style: "italic")[Đối ngẫu 5 mảng $C_5$])
      })
    ]
  ],
)

#pagebreak()

== Lớp Vỏ 6 📅 — Lịch Học, Phân Ca, Phân Nhóm Không Chồng Lấp

#recognize-box("Đại Bác 6 — Kéo Về Đồ Thị Xung Đột")[
  *Vỏ bọc hay gặp:* "xếp lịch $n$ môn vào $k$ buổi; nhóm học cả hai môn...",
  "phân $n$ nhân viên vào $k$ ca; một số cặp có xung đột...",
  "chia $n$ vật/người vào $k$ nhóm; một số cặp không được cùng nhóm".

  *Cú bắn chuẩn:* không quan tâm tên môn hay tên người, chỉ quan tâm *cặp nào không được đứng chung*.
  + Mỗi môn/người/vật → một đỉnh.
  + Mỗi cặp xung đột → một cạnh.
  + Màu = buổi/ca/nhóm.

  *Biến thể phổ thông hay nấp:* phòng thi, chia lớp, phân ca trực, xếp đội, phân khu vực làm việc, lịch hội thảo.

  *Bẫy cuối:* nhiều đề rất dài nhưng đồ thị sau cùng chỉ là $P_n$, $C_n$, $K_3$, sao, hoặc vài cụm rời nhau. Đừng sợ câu chữ, hãy vẽ xung đột trước.
]

#example-box(n: "6 — Lịch 4 Môn")[
  *Đề:* Có $4$ môn $A, B, C, D$. Xếp vào $3$ buổi. Các cặp cùng nhóm học:
  nhóm $alpha$: $\{A,B\}$; nhóm $beta$: $\{B,C\}$; nhóm $gamma$: $\{C,D\}$; nhóm $delta$: $\{A,D\}$.

  *Đồ thị xung đột:* cạnh $A$–$B$, $B$–$C$, $C$–$D$, $A$–$D$ → vòng $C_4$.

  *Số lịch:* $P(C_4, 3) = 18.$

  #v(0.4em)
  #align(center)[
    #cetz.canvas(length: 1.35cm, {
      import cetz.draw: *

      let pA = (0, 1.0)
      let pB = (1.2, 0)
      let pC = (0, -1.0)
      let pD = (-1.2, 0)

      line(pA, pB, pC, pD, pA, stroke: 1.5pt + c-teal)
      circle(pA, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
      circle(pB, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
      circle(pC, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
      circle(pD, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)

      content(pA, text(size: 8.5pt, weight: "bold")[A])
      content(pB, text(size: 8.5pt, weight: "bold")[B])
      content(pC, text(size: 8.5pt, weight: "bold")[C])
      content(pD, text(size: 8.5pt, weight: "bold")[D])
      content((0, -1.55), text(size: 8.5pt, weight: "bold")[Đồ thị xung đột là vòng $C_4$])
    })
  ]
]

#v(0.5em)

#tn(
  [Có $5$ môn học $A, B, C, D, E$. Các nhóm học sinh:
    nhóm 1: $\{A,B\}$; nhóm 2: $\{B,C\}$; nhóm 3: $\{C,D\}$;
    nhóm 4: $\{D,E\}$; nhóm 5: $\{A,E\}$.
    Xếp $5$ môn vào $3$ buổi sao cho không nhóm nào có $2$ môn cùng buổi.
    Số cách xếp lịch là:],
  (
    [$20$],
    [$24$],
    True([$30$]),
    [$36$],
  ),
  loigiai: [
    Vẽ đồ thị xung đột, ta được các cạnh
    $A$–$B$, $B$–$C$, $C$–$D$, $D$–$E$, $A$–$E$,
    tức là đúng một vòng $C_5$.

    Vì có $3$ buổi nên ta cần tính $P(C_5, 3)$:
    $P(C_5, 3) = (3-1)^5 + (-1)^5(3-1) = 32-2 = 30.$

    Vậy số cách xếp lịch là $30$.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let pts = ( (0,1.5), (1.4, 0.4), (0.9, -1.2), (-0.9, -1.2), (-1.4, 0.4) )
        let labels = ("A", "B", "C", "D", "E")
        for i in range(5) {
           line(pts.at(i), pts.at(calc.rem(i+1, 5)), stroke: 1.5pt + c-teal)
        }
        for i in range(5) {
           circle(pts.at(i), radius: 0.3, fill: white, stroke: 1.5pt + c-teal)
           content(pts.at(i), text(weight: "bold")[#labels.at(i)])
        }
        content((0, -2), text(size: 9pt, weight: "bold")[Đồ thị $C_5$])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Ba học sinh $X, Y, Z$ không được cùng nhóm; hai học sinh $P, Q$ không được cùng nhóm.
    Chia $5$ học sinh vào $3$ nhóm (mỗi học sinh thuộc đúng một nhóm).
    Số cách chia là:],
  (
    [$12$],
    [$18$],
    [$24$],
    True([$36$]),
  ),
  loigiai: [
    Đồ thị xung đột: $X$–$Y$, $Y$–$Z$, $X$–$Z$ (tam giác $K_3$) và $P$–$Q$.
    Hai thành phần độc lập: $K_3$ và cạnh $P$–$Q$ ($= K_2$).
    $P(K_3, 3) = 3 dot 2 dot 1 = 6.$
    $P(K_2, 3) = 3 dot 2 = 6.$
    Vì hai thành phần độc lập nên
    $N = P(K_3, 3) dot P(K_2, 3) = 6 dot 6 = 36.$
  ],
)

#v(0.5em)

#tln(
  id: "CB-MEDIC",
  [Tại trung tâm điều phối y tế, có một ca trưởng và $4$ điều dưỡng chuyên môn siêu việt. Tuy nhiên, tính cách làm việc của ca trưởng lại quá mạnh nên không có điều dưỡng nào có thể trực chung ca với vị này. Ngược lại, $4$ điều dưỡng kia phối hợp rất gắn kết và không hề xung đột lẫn nhau. Để điều phối vào $3$ ca trực chính trong ngày, mỗi người được chia vào một ca độc lập (có thể nằm chung nếu không xung đột). Tính số cách xếp y tế khả dĩ.],
  [$48$],
  loigiai: [
    Không cần quan tâm ai tên gì, ta bám vào lưới chằng chịt của Đại Bác 6. Khi phác họa đồ thị xung đột, vị ca trưởng (ở tâm) bị gạch mặt (tạo nét xung đột cạnh) với cả $4$ điều dưỡng vòng ngoài. Bốn người kia không bị nối với nhau cạnh nào. Đây chính là một ngôi sao $K_{1,4}$.

    - Vị trí chốt tâm (ca trưởng) có quyền càn quét trước với đủ $3$ cách chọn ca để xếp.
    - Cả $4$ đỉnh góc ngoài sau khi tâm bị khoá thì độc lập chọn ca, mỗi chóp chỉ cần né đúng ca của trung tâm. Vậy mỗi điều dưỡng có $3-1 = 2$ cách lựa.

    Đâm thẳng nhát chốt quy tắc nhân:
    $N = 3 dot 2^4 = 3 dot 16 = 48.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let c_pt = (0, 0)
        let pts = ((1, 1), (1, -1), (-1, -1), (-1, 1))
        for p in pts {
          line(c_pt, p, stroke: 1.2pt + c-teal)
          circle(p, radius: 0.25, fill: rgb("E3F2FD"), stroke: 1.2pt + c-navy)
        }
        circle(c_pt, radius: 0.25, fill: rgb("FFCDD2"), stroke: 1.5pt + c-amber)
        content(c_pt, text(size: 8pt)[C])
        content((0, -1.6), text(size: 8.5pt, weight: "bold", fill: c-navy)[Xung đột sao $K_(1,4)$])
      })
    ]
  ],
)

#v(0.5em)

== Lớp Vỏ 7 🗺️ — Tô Màu Hình Phẳng và Bản Đồ

#recognize-box("Đại Bác 7 — Vẽ Đối Ngẫu Hình Phẳng")[
  *Vỏ bọc hay gặp:* "tô màu các vùng của bản đồ", "tô màu $n$ vùng của hình phẳng",
  "tam giác / tứ giác / lục giác chia thành nhiều phần", "phân ô ruộng", "bản vẽ chia khu".

  *Cú bắn chuẩn:* đừng tính trực tiếp trên hình.
  + Mỗi *vùng* → một đỉnh.
  + Hai đỉnh nối cạnh khi hai vùng có *chung đoạn biên*.
  + Sau đó tính $P(G_"đối ngẫu", k)$ như một bài tô màu đồ thị bình thường.

  *Biến thể phổ thông hay nấp:* bản đồ, mô hình ruộng đất, mặt gạch chia mảng, hình ghép tam giác, khu dân cư chia lô.

  *Bẫy cuối:* hai vùng chỉ chạm ở *một điểm* thì không nối cạnh. Đây là lỗi sai rất phổ biến khi vẽ đối ngẫu.
]

#tn(
  [Một tam giác lớn chia thành $4$ tam giác nhỏ bằng cách nối trung điểm
    các cạnh: tam giác Trên ($T$), Trái ($L$), Phải ($R$), Giữa ($M$).
    $M$ kề $T$, $L$, $R$; còn $T$, $L$, $R$ không kề nhau.
    Có $3$ màu; hai vùng kề phải khác màu. Số cách tô là:],
  (
    [$18$],
    True([$24$]),
    [$30$],
    [$36$],
  ),
  loigiai: [
    Vì vùng giữa $M$ kề với cả $T,L,R$, còn $T,L,R$ không kề nhau, đồ thị đối ngẫu là sao $K_{1,3}$.

    - Vùng giữa $M$ có $3$ cách chọn màu.
    - Mỗi vùng lá $T,L,R$ chỉ cần khác màu với $M$, nên mỗi vùng có $2$ cách.

    Do đó
    $P(K_{1,3}, 3) = 3 dot 2^3 = 24.$

    Vậy có $24$ cách tô.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *

        // Left: Triangle division
        let x_tri = 0
        let pA = (x_tri, 1.6)
        let pB = (x_tri - 1.6, -0.8)
        let pC = (x_tri + 1.6, -0.8)
        let pAB = (x_tri - 0.8, 0.4)
        let pBC = (x_tri, -0.8)
        let pAC = (x_tri + 0.8, 0.4)

        // Draw outer triangle and inner divisions
        line(pA, pB, pC, pA, stroke: 1.5pt + c-slate)
        line(pAB, pBC, pAC, pAB, stroke: 1.2pt + c-slate)

        content((x_tri, 0.8), text(weight: "bold")[T])
        content((x_tri - 0.7, -0.4), text(weight: "bold")[L])
        content((x_tri + 0.7, -0.4), text(weight: "bold")[R])
        content((x_tri, -0.1), text(weight: "bold")[M])
        content((x_tri, -1.4), text(size: 8.5pt, weight: "bold")[Tam giác chia 4 phần])

        // Right: Dual graph (star graph K_{1,3})
        let x_dual = 5
        let pM_d = (x_dual, 0)
        let pT_d = (x_dual, 1.2)
        let pL_d = (x_dual - 1.0, -0.6)
        let pR_d = (x_dual + 1.0, -0.6)

        line(pM_d, pT_d, stroke: 1.5pt + c-teal)
        line(pM_d, pL_d, stroke: 1.5pt + c-teal)
        line(pM_d, pR_d, stroke: 1.5pt + c-teal)

        circle(pM_d, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
        circle(pT_d, radius: 0.22, fill: rgb("E3F2FD"), stroke: 1.2pt + c-teal)
        circle(pL_d, radius: 0.22, fill: rgb("E3F2FD"), stroke: 1.2pt + c-teal)
        circle(pR_d, radius: 0.22, fill: rgb("E3F2FD"), stroke: 1.2pt + c-teal)

        content(pM_d, text(size: 8.5pt, weight: "bold")[M])
        content(pT_d, text(size: 8.5pt, weight: "bold")[T])
        content(pL_d, text(size: 8.5pt, weight: "bold")[L])
        content(pR_d, text(size: 8.5pt, weight: "bold")[R])

        content((x_dual, -1.4), text(size: 8.5pt, weight: "bold")[Đồ thị đối ngẫu $K_(1,3)$])

        // Arrow
        line((x_tri + 1.9, 0), (x_dual - 1.5, 0), mark: (end: "stealth", size: 0.15), stroke: 1pt + c-slate)
        content((x_tri + 2.7, 0.3), text(size: 7.5pt, style: "italic")[Đối ngẫu])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Lục giác đều chia thành $6$ tam giác đều bởi $3$ đường chéo chính.
    Tô mỗi tam giác một màu trong $4$ màu; hai tam giác kề cạnh nhau phải khác màu.
    *(Đồ thị đối ngẫu là vòng $C_6$.)*
    Số cách tô là:],
  (
    [$4 dot 3^5 = 972$],
    [$700$],
    True([$732$]),
    [$756$],
  ),
  loigiai: [
    Đề đã gợi ý rõ đồ thị đối ngẫu là vòng $C_6$.

    Vì có $4$ màu, ta tính
    $P(C_6, 4) = (4-1)^6 + (-1)^6(4-1).$

    Suy ra
    $P(C_6, 4) = 3^6 + 3 = 729 + 3 = 732.$

    Vậy số cách tô là $732$.
  ],
)

#v(0.5em)

#tln(
  id: "CB-CITY",
  [Tại khu đô thị ven sông, một văn phòng kiến trúc quy hoạch một quảng trường trung tâm hình khuyên và chỉa ra rẻ quạt $5$ khu phố bám xung quanh khối quảng trường này. Hệ thống thảm thực vật $6$ phân khu này được đấu thầu phủ màu rực rỡ dùng $4$ giống cỏ màu khác biệt. Nếu các khu vực có chung đoạn biên đất tiếp xúc thì cấm dùng cùng loại hạt giống, hỏi mô hình đô thị có bao nhiêu phương án phối màu họa bì? *(Điền số nguyên)*],
  [$120$],
  loigiai: [
    Cấu trúc không gian của bản đồ quy hoạch này chính là một bánh xe (quảng trường giữa bao bởi 5 khu xung quanh).
    Gỡ ra cho hết bụi đất, đồ thị đối ngẫu chính là Bánh xe $W_6$ gồm 1 đỉnh tâm kề với mâm vòng viền ngoài $C_5$.

    Để phủ màu công phá $W_6$, ta bắn tỉa ngòi nổ trung tâm trước:
    - Đỉnh trung tâm nằm lõi kề mọi đỉnh ngoài, nên ta ưu tiên chọn và khoá nó trước: Có $4$ cách chèn cỏ cho quảng trường.
    - Một khi "hạt nhân" đã được ghim 1 màu, vành $5$ khu phố bên ngoài mất quyền dùng màu đó nữa. Bộ vành chuyển ngay thành Đại Bác 3 (vòng tròn $C_5$) đánh với số màu co lại $4 - 1 = 3$ màu còn lại.

    Tô vòng $C_5$ bằng $3$ màu:
    $N_"vành" = (3-1)^5 + (-1)^5(3-1) = 32 - 2 = 30.$

    Tổng số cấu hình phối cảnh toàn dự án là hệ quả quy tắc nhân:
    $N = 4 dot 30 = 120.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.3
        let c_pt = (0, 0)
        for i in range(5) {
          let a1 = i * 72deg
          let a2 = (i + 1) * 72deg
          let p1 = (calc.cos(a1) * r, calc.sin(a1) * r)
          let p2 = (calc.cos(a2) * r, calc.sin(a2) * r)
          line(p1, p2, stroke: 1.2pt + c-slate)
          line(c_pt, p1, stroke: 1.2pt + c-slate)
        }
        circle(c_pt, radius: 0.25, fill: rgb("FFCDD2"), stroke: 1.2pt + c-slate)
        for i in range(5) {
          let a = i * 72deg
          let p = (calc.cos(a) * r, calc.sin(a) * r)
          circle(p, radius: 0.2, fill: rgb("E0F2F1"), stroke: 1pt + c-slate)
        }
        content((0, -1.8), text(size: 8.5pt, weight: "bold", fill: c-navy)[Đồ thị đối ngẫu Bánh Xe $W_6$])
      })
    ]
  ],
)

#pagebreak()

== Lớp Vỏ 8 💎 — Vòng Hoa và Chuỗi Hạt (Burnside)

#recognize-box("Đại Bác 8 — Burnside Quét Đối Xứng")[
  *Vỏ bọc hay gặp:* "xâu $n$ hạt thành vòng; hai vòng coi là giống nhau nếu xoay được",
  "thiết kế vòng cườm $n$ màu; không phân biệt các vòng quay bằng nhau",
  "xếp $n$ đồ vật trên bàn tròn; hai cách xếp giống nếu xoay được/lật được".

  *Cú bắn chuẩn:* không đếm trực tiếp số cấu hình nữa, mà lấy *trung bình số cấu hình bất biến* theo từng phép đối xứng.

  *Công thức:*
  $ "Số phân biệt" = frac(1, |G|) sum_(g in G) |X^g| $
  trong đó $|X^g| = k^(c(g))$, $c(g)$ = số chu trình của phép đối xứng $g$.

  *Biến thể phổ thông hay nấp:* vòng hoa, vòng khăn ăn, chuỗi hạt, họa tiết tròn, logo quay, mô hình quanh bàn tròn.

  *Bẫy cuối:* nếu vị trí là cố định thì quay lại Đại Bác 3. Burnside chỉ xuất hiện khi đề thật sự nói "coi như nhau nếu xoay/lật".

  *Phân loại:*
  #table(
    columns: (2fr, 1.5fr, 1.5fr),
    stroke: 0.5pt + rgb("80CBC4"),
    fill: (x, y) => if y == 0 { c-teal } else if calc.odd(y) { rgb("E0F2F1") } else { white },
    inset: (x: 9pt, y: 7pt),
    align: (left, center, center),
    table.header(
      text(fill: white, weight: "bold")[Điều kiện],
      text(fill: white, weight: "bold")[Nhóm],
      text(fill: white, weight: "bold")[$|G|$],
    ),
    [Giống nếu xoay], [Nhóm xoay $C_n$], [$n$],
    [Giống nếu xoay hoặc lật], [Nhóm dihedral $D_n$], [$2n$],
  )
]

#route-box(title: "🧭 Burnside Nên Làm Theo 3 Bước")[
  - *Bước 1:* Xác định nhóm đối xứng đang dùng: chỉ xoay ($C_n$) hay xoay và lật ($D_n$).
  - *Bước 2:* Với từng phép đối xứng $g$, đếm số cấu hình không đổi dưới $g$ bằng cách đếm số chu trình $c(g)$.
  - *Bước 3:* Cộng tất cả các số đó rồi chia cho $|G|$.

  Mấu chốt không phải là nhớ thuộc lòng ký hiệu, mà là hiểu câu:
  *"Muốn một cấu hình đứng yên sau phép đối xứng $g$, mọi vị trí nằm trong cùng một chu trình phải nhận cùng màu."*
]

#example-box(n: "8 — Vòng 4 Hạt, 2 Màu, Chỉ Xoay")[
  Nhóm $C_4$: $r^0, r^1, r^2, r^3$.
  #table(
    columns: (auto, auto, auto, auto),
    stroke: 0.4pt + c-slate,
    fill: (x, y) => if y == 0 { c-teal } else if calc.odd(y) { rgb("E0F2F1") } else { white },
    inset: (x: 8pt, y: 6pt),
    align: center,
    table.header(
      text(fill: white, weight: "bold")[Phép xoay],
      text(fill: white, weight: "bold")[Chu trình],
      text(fill: white, weight: "bold")[$c(g)$],
      text(fill: white, weight: "bold")[$|X^g| = 2^(c(g))$],
    ),
    [$r^0$], [$(1)(2)(3)(4)$], [$4$], [$16$],
    [$r^1$ ($90°$)], [$(1234)$], [$1$], [$2$],
    [$r^2$ ($180°$)], [$(13)(24)$], [$2$], [$4$],
    [$r^3$ ($270°$)], [$(1432)$], [$1$], [$2$],
  )
  $"Số phân biệt" = display((16+2+4+2)/4 = 24/4 = 6).$
]

#v(0.5em)

#tn(
  [Xâu $5$ hạt cườm gồm $3$ màu thành vòng (không ràng buộc kề).
    Hai vòng coi là giống nhau nếu *xoay* được cái này thành cái kia.
    Số vòng cườm phân biệt là:],
  (
    [$39$],
    [$45$],
    True([$51$]),
    [$57$],
  ),
  loigiai: [
    Ta dùng Burnside với nhóm xoay $C_5$ nên có $5$ phép đối xứng.

    - Phép đồng nhất $r^0$ giữ nguyên mọi cấu hình: $|X^{r^0}| = 3^5 = 243$.
    - Mỗi phép xoay khác đồng nhất gom cả $5$ vị trí vào cùng một chu trình,
      nên cấu hình đứng yên chỉ có dạng "cả 5 hạt cùng màu": $|X^{r^j}| = 3$.

    Vì có $4$ phép như vậy, số vòng phân biệt là
    $"Số phân biệt" = (243 + 4 dot 3)/5 = 255/5 = 51.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.3
        for i in range(5) {
          let a = i * 72deg + 90deg
          circle((calc.cos(a)*r, calc.sin(a)*r), radius: 0.25, fill: white, stroke: 1.5pt + rgb("6A1B9A"))
          let a_next = (i+1) * 72deg + 90deg
          line((calc.cos(a)*r, calc.sin(a)*r), (calc.cos(a_next)*r, calc.sin(a_next)*r), stroke: 1.2pt + c-slate)
        }
        arc((0,0), radius: 0.6, start: 45deg, stop: 315deg, mark: (end: "stealth"), stroke: 1.5pt + c-amber)
        content((0, 0), text(size: 8pt, weight: "bold")[Xoay $C_5$])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Xâu $6$ hạt cườm gồm $2$ màu thành vòng. Hai vòng coi là giống nhau nếu
    *xoay hoặc lật* được cái này thành cái kia (nhóm dihedral $D_6$, $|D_6| = 12$).
    Số vòng phân biệt là:],
  (
    [$9$],
    [$10$],
    True([$14$]),
    [$13$],
  ),
  loigiai: [
    Ta dùng Burnside với nhóm $D_6$, nên phải xét $12$ phép đối xứng.

    *Phần xoay:*
    $r^0$: $c=6$ → $64$;
    $r^1,r^5$: $c=1$ → $2$ mỗi cái;
    $r^2,r^4$: $c=2$ → $4$ mỗi cái;
    $r^3$: $c=3$ → $8$.

    *Phần lật:*
    - $3$ trục qua hai đỉnh đối diện: mỗi phép có $4$ chu trình → $2^4=16$ cách cố định.
    - $3$ trục qua trung điểm hai cạnh đối diện: mỗi phép có $3$ chu trình → $2^3=8$ cách cố định.

    Tổng số cấu hình cố định là
    $64+2+4+4+2+8 + 3 dot 16 + 3 dot 8 = 168$.
    Chia cho $|D_6| = 12$, ta được $168/12 = 14$.
    Vậy có $14$ vòng phân biệt.
  ],
)

#v(0.5em)

#tln(
  id: "CB-BURNSIDE",
  [Một xưởng gia công đá quý ký hợp đồng chế tác dây chuyền kỉ niệm. Khung kẹp vòng khép định sẵn $6$ khuôn chốt dập móng để đính ngọc theo hình lục giác đều. Khách hàng yêu cầu rải $3$ loại đá quý (mã não, hồng ngọc, tử thạch đan) khảm vào mặt chuyền. Lớp lót dưới đáy của khung kẹp là vật liệu trơn phẳng như nhau nên sau khi chốt xong, chiếc vòng lật sấp lật ngửa cởi đeo thoải mái, tức là các cấu hình trùng nhau qua phép xoay hoặc lật khối đều tính là một sản phẩm đồng nhất. Hỏi nghệ nhân vàng có thể trích xuất ra bao nhiêu sản phẩm dây chuyền mang phong cách hoàn toàn khác biệt tung ra hòm tủ? *(Điền số nguyên)*],
  [$92$],
  loigiai: [
    Hiện sinh "xoay và lật tự do" chính thức là phát súng hiệu vẫy gọi Đỉnh Điểm Đại Bác 8: Burnside. Với khung lục giác xoay/lật, ta gọi nhóm đối xứng Dihedral $D_6$ có tổng cộng $|D_6| = 12$ hướng thao tác (6 xoay, 6 lật).
    Đề yêu cầu đính ngọc độc lập, nghĩa là chỉ thả màu vào chứ *không ép buộc 2 hạt kề phải khác loại*. Thế nên $k=3$ giữ vai trò rải tự do chốt khối.

    Đếm hàm lượng bất biến ghim dưới từng phép:
    - *Nhóm $6$ mũi xoay:*
      $r^0$ (đứng im): chu trình $c = 6$, tóm giữ $3^6 = 729$ mẫu.
      $r^1, r^5$ (xoay $1$ viền): gom tất vào chu trình $c = 1$, đóng keo $3^1 dot 2 = 6$ mẫu.
      $r^2, r^4$ (xoay $2$ viền): tách chu trình $c = 2$, đóng keo $3^2 dot 2 = 18$ mẫu.
      $r^3$ (xoay nửa vòng): ngàm vào chu trình $c = 3$, khóa chốt $3^3 = 27$ mẫu.
      *Sum xoay* = $729 + 6 + 18 + 27 = 780$.

    - *Nhóm $6$ mũi lật:*
      3 đòn lật vắt qua $2$ cực đỉnh đối diện: mỗi cái nhặt $4$ chu trình (vì $2$ đầu chốt chặt, $2$ đôi hông đổi nhau), giữ vỏn vẹn $3 dot 3^4 = 3 dot 81 = 243$ mẫu.
      3 đòn lật vắt qua trung điểm $2$ bề cạnh đối xứng: mỗi điểm nhặt $3$ chu trình, ôm bọc $3 dot 3^3 = 3 dot 27 = 81$ mẫu.
      *Sum lật* = $243 + 81 = 324$.

    Dội nổ Burnside trung bình hóa:
    $"Tổng SP" = (780 + 324) / 12 = 1104 / 12 = 92.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.3
        for i in range(6) {
          let a = i * 60deg
          circle((calc.cos(a) * r, calc.sin(a) * r), radius: 0.25, fill: rgb("E1BEE7"), stroke: 1.2pt + c-slate)
        }
        line((-1.8, 0), (1.8, 0), stroke: (dash: "dashed", paint: c-amber, thickness: 1pt))
        line((0, -1.8), (0, 1.8), stroke: (dash: "dashed", paint: c-amber, thickness: 1pt))
        content((2.1, 1.2), text(size: 8.5pt, style: "italic", fill: c-slate)[Trục lật của $D_6$])
      })
    ]
  ],
)

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN IV
// ═══════════════════════════════════════════════
= Phần IV — Bài Tập Kiểm Tra Tổng Hợp

== Nhận Diện Nhanh — Gán Đúng Công Thức

#theory-box[
  #text(fill: c-teal, size: 11pt, weight: "bold")[
    🎯 Bài Tập Nhận Diện
  ]
  #v(0.5em)
  Với mỗi bài toán dưới đây, *trước tiên xác định dạng*, sau đó tính.
  Đây là kỹ năng quan trọng nhất khi thi.
]

#v(0.5em)

#tn(
  [Một chiếc vòng gồm $10$ hạt được xâu thành vòng tròn.
    Mỗi hạt sơn một trong $3$ màu; hai hạt liền kề phải khác màu.
    Vị trí các hạt là CỐ ĐỊNH (không xét phép xoay).
    Số cách sơn là:],
  (
    [$2^{10} = 1024$],
    True([$(3-1)^{10} + (3-1) = 1026$]),
    [$3 dot 2^9 = 1536$],
    [$2^{10} - 2 = 1022$],
  ),
  loigiai: [
    Đây là bài toán vòng tròn cố định với $n=10$ hạt và $k=3$ màu.

    Áp dụng công thức vòng tròn:
    $N = (3-1)^{10} + (-1)^{10}(3-1).$

    Suy ra
    $N = 2^{10} + 2 = 1024 + 2 = 1026.$

    Vậy số cách sơn là $1026$.
  ],
)

#v(0.5em)

#tn(
  [Bảng $2 times 5$ ô được tô bằng $3$ màu, hai ô kề cạnh phải khác màu.
    Số cách tô là:],
  (
    [$6 dot 3^3 = 162$],
    True([$6 dot 3^4 = 486$]),
    [$6 dot 9^4$],
    [$162$],
  ),
  loigiai: [
    Đây là bảng $2 times 5$, nên ta dùng công thức của dạng bảng $2 times n$.

    Với $k=3$ ta có
    $k^2-3k+3 = 9-9+3 = 3.$

    Vì $n=5$, nên
    $N = 3 dot 2 dot 3^4 = 6 dot 81 = 486.$

    Vậy số cách tô là $486$.
  ],
)

#v(0.5em)

#tn(
  [Sáu môn học $A,B,C,D,E,F$ cần xếp vào $3$ phòng thi.
    Đồ thị xung đột (cặp học sinh học chung) tạo thành vòng $C_6$.
    Số cách phân phòng là:],
  (
    [$3^6 + 3 = 732$],
    True([$2^6 + 2 = 66$]),
    [$6 dot 2^5 = 192$],
    [$3 dot 2^5 = 96$],
  ),
  loigiai: [
    Đồ thị xung đột là vòng $C_6$, còn $3$ phòng thi đóng vai trò như $3$ màu.

    Vì vậy ta cần tính
    $P(C_6, 3) = (3-1)^6 + (-1)^6(3-1).$

    Suy ra
    $P(C_6, 3) = 64 + 2 = 66.$

    Vậy số cách phân phòng là $66$.
  ],
)

#v(0.5em)

#tn(
  [Mã màu sản phẩm gồm $4$ ô màu thành vòng tròn, tô bằng $3$ màu.
    Mỗi cặp ô liền kề phải khác màu. Hai mã được coi là giống nhau nếu
    xoay vòng được cái này thành cái kia. Số mã phân biệt là:],
  (
    [$4$],
    True([$6$]),
    [$18$],
    [$3$],
  ),
  loigiai: [
    Vì hai mã chỉ khác nhau do xoay được coi là một, ta dùng Burnside cho nhóm xoay $C_4$.

    Trước hết, số cách tô hợp lệ trên vòng $C_4$ là
    $P(C_4, 3) = 18.$

    Xét từng phép xoay:
    - $r^0$: giữ nguyên mọi cấu hình hợp lệ, nên có $18$ cấu hình cố định.
    - $r^1$ và $r^3$: muốn đứng yên thì cả $4$ ô phải cùng màu, điều này mâu thuẫn với điều kiện kề khác màu, nên được $0$.
    - $r^2$: cấu hình phải có dạng $(a,b,a,b)$ với $a != b$, nên có $3 dot 2 = 6$ cách.

    Vì vậy
    $"Phân biệt" = (18 + 0 + 6 + 0)/4 = 24/4 = 6.$

    Vậy có $6$ mã phân biệt.
  ],
)

#v(1em)

== Bảng Tổng Kết

#align(center)[
  #block(
    fill: rgb("E0F2F1"),
    stroke: 1pt + c-teal,
    radius: 8pt,
    inset: (x: 1.5em, y: 1.2em),
    width: 100%,
  )[
    #text(fill: c-teal, size: 12pt, weight: "bold")[
      📊 Bảng Tra Công Thức Tô Màu
    ]
    #v(0.6em)
    #table(
      columns: (2fr, 2fr, 2fr),
      stroke: 0.5pt + rgb("80CBC4"),
      fill: (x, y) => if y == 0 { c-teal } else if calc.odd(y) { rgb("E0F2F1") } else { white },
      inset: (x: 9pt, y: 7pt),
      align: (left, center, left),
      table.header(
        text(fill: white, weight: "bold")[Cấu hình],
        text(fill: white, weight: "bold")[Công thức $P(G,k)$],
        text(fill: white, weight: "bold")[Ghi chú],
      ),
      [Đường $P_n$ ($n$ đỉnh)], [$k(k-1)^(n-1)$], [Hàng thẳng, cây],
      [Vòng $C_n$], [$(k-1)^n + (-1)^n (k-1)$], [Mọi $n >= 3$],
      [Đầy đủ $K_n$], [$k(k-1) dots (k-n+1)$], [$k >= n$],
      [Sao $K_{1,n}$], [$k(k-1)^n$], [$1$ trung tâm, $n$ lá],
      [Lưới $2 times n$], [$k(k-1)(k^2-3k+3)^(n-1)$], [Bảng 2 hàng],
      [Thành phần rời], [$product P(G_i, k)$], [Nhân độc lập],
      [Tổng quát], [$P(G',k) - P(G'',k)$], [Deletion-Contraction],
      [Đến đối xứng], [$frac(1, |G|) sum_g k^(c(g))$], [Burnside],
    )
    #v(0.5em)
    #text(fill: c-teal, size: 10pt, style: "italic")[
      *Quy tắc vàng:* Vẽ đồ thị → nhận cấu trúc → tra công thức.
    ]
  ]
]
#pagebreak()

= Phần III: Tư Duy Lắt Léo Trên "Lưới Lạ"

Khi đề bài không cho các hình dáng chuẩn (đường thẳng, vòng tròn, lưới chữ nhật trọn vẹn) mà lại "khoét" đi một số ô, học sinh thường hoảng loạn. Tuy nhiên, chỉ cần nắm vững bản chất đồ thị, mọi "Lưới Lạ" đều có thể giải quyết gọn gàng. Hãy cùng phân tích 10 "Trận Đánh" kinh điển sau:

== 1. Lưới Khuyết Góc (Chữ L)

#example-box(n: "3.1 — Lưới chữ L cơ bản")[
  *Đề bài:* Có $k$ màu để tô vào một lưới gồm 3 ô vuông xếp thành hình chữ L như hình vẽ. Hai ô kề nhau (chung cạnh) phải khác màu. Hỏi có bao nhiêu cách tô?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    rect((0, 1), (1, 2), fill: white, stroke: 1.5pt + c-teal)
    rect((0, 0), (1, 1), fill: rgb("FFCDD2"), stroke: 2pt + red) 
    rect((1, 0), (2, 1), fill: white, stroke: 1.5pt + c-teal)
    content((0.5, 1.5), text(size: 11pt, weight: "bold")[A])
    content((0.5, 0.5), text(size: 11pt, weight: "bold")[B])
    content((1.5, 0.5), text(size: 11pt, weight: "bold")[C])
  })
]
#v(0.5em)

#note-box(title: "Công thức sử dụng: Súng Lục (Đường thẳng)")[
  *Lý thuyết gốc:* Nếu các ô nối tiếp nhau thành một đường không khép kín (như con rắn), ta dùng Súng Lục:
  Số cách tô = $k times (k-1)^{n-1}$.
]

#theory-box[
  #reset-step()
  *Giải chi tiết:* 
  #step[Bóc lớp ngụy trang]
  Nhìn bằng mắt thường, hình dáng này là một góc vuông (chữ L). Tuy nhiên, về mặt toán học (lý thuyết đồ thị), ô A chỉ nối với ô B, và ô C cũng chỉ nối với ô B. Ô A và ô C hoàn toàn không kề nhau. Đồ thị tương đương chỉ là một sợi dây: $A - B - C$.
  
  #step[Ráp công thức]
  Đây chính là mô hình Súng Lục với $n=3$ đỉnh.
  - Ta chọn màu cho đỉnh đầu tiên (đỉnh A): Có $k$ cách tự do.
  - Chọn màu cho B (kề A): Bắt buộc né màu của A, nên B có $k-1$ cách.
  - Chọn màu cho C (kề B): Bắt buộc né màu của B, C có $k-1$ cách.
  
  #step[Chốt hạ]
  Số cách tô bằng: $k times (k-1) times (k-1) = k(k-1)^2$ cách.
]

== 2. Lưới Chữ Thập (Dấu Cộng)

#example-box(n: "3.2 — Cái rốn của vũ trụ")[
  *Đề bài:* Lưới gồm 5 ô xếp thành hình dấu cộng. Có 4 mã màu. Yêu cầu hai ô chung cạnh phải khác màu. Hỏi có bao nhiêu cách tô?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    rect((1, 2), (2, 3), fill: white, stroke: 1.5pt + c-navy) 
    rect((0, 1), (1, 2), fill: white, stroke: 1.5pt + c-navy) 
    rect((1, 1), (2, 2), fill: rgb("FFF9C4"), stroke: 2pt + rgb("F57F17")) 
    rect((2, 1), (3, 2), fill: white, stroke: 1.5pt + c-navy) 
    rect((1, 0), (2, 1), fill: white, stroke: 1.5pt + c-navy) 
    content((1.5, 1.5), text(size: 11pt, weight: "bold")[Tâm])
  })
]
#v(0.5em)

#note-box(title: "Chiến thuật: Khống chế con đầu đàn")[
  *Lý thuyết gốc:* Nếu có một đỉnh trung tâm (Tâm) nối với nhiều nhánh nhỏ, và các nhánh nhỏ *không kề nhau*, ta chỉ cần khóa chặt cái Tâm lại. Bọn nhánh con sẽ trở nên hoàn toàn tự do!
]

#theory-box[
  #reset-step()
  *Giải chi tiết:* 
  #step[Tìm điểm yếu của đồ thị]
  Lưới dấu cộng nhìn tỏa ra 4 hướng, nhưng "tử huyệt" duy nhất của nó là ô *Tâm (màu vàng)*. Bốn ô xung quanh (Trên, Dưới, Trái, Phải) đều phụ thuộc vào ô Tâm, nhưng chúng lại không hề chạm vào nhau.
  
  #step[Xử lý theo thứ tự khống chế]
  - *Đóng băng ô Tâm:* Vì có 4 màu nên ô Tâm có đúng $4$ cách chọn tự do.
  - *Giải phóng đàn em:* Khi ô Tâm đã chốt màu (ví dụ Đỏ), thì 4 ô xung quanh chỉ có một nhiệm vụ duy nhất: "Tránh màu Đỏ ra". 
  - Ô Trên có $4 - 1 = 3$ cách.
  - Ô Dưới có $4 - 1 = 3$ cách.
  - Ô Trái có 3 cách, Ô Phải có 3 cách.
  - Vì chúng không kề nhau nên không phụ thuộc nhau, ta cứ việc nhân thẳng!
  
  #step[Chốt hạ]
  Tổng số cách tô: $4 times 3 times 3 times 3 times 3 = 4 times 3^4 = 324$ cách.
]

== 3. Trùm Cuối: Lưới Ghép 11 Ô (Dự Đoán Đề Thi Thử)

#example-box(n: "3.3 — Lưới Khuyết Đa Khối (Đỉnh cao cắt lớp)")[
  *Đề bài:* Có 11 thí sinh ngồi vào phòng thi như hình vẽ. Giám thị có 4 mã đề. Yêu cầu 2 thí sinh ngồi kề nhau (chung cạnh) phải khác mã đề. Số cách phát đề là $p$. Hãy tính $p/49$.
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let yellow = rgb("FFF9C4")
    let blue = rgb("E3F2FD")
    
    // Khối Trái
    for r in range(1, 4) {
      for c in range(1, 3) {
        rect((c - 1, 4 - r), (c, 5 - r), fill: yellow, stroke: 1pt + black)
      }
    }
    rect((1, 0), (2, 1), fill: yellow, stroke: 1pt + black)
    
    // Khối Phải
    for r in range(3, 5) {
      for c in range(3, 5) {
        rect((c - 1, 4 - r), (c, 5 - r), fill: blue, stroke: 1pt + black)
      }
    }
    
    // Cut set
    rect((1, 1), (2, 2), stroke: (paint: red, thickness: 2.5pt, dash: "dashed"))
    rect((1, 0), (2, 1), stroke: (paint: red, thickness: 2.5pt, dash: "dashed"))
    
    content((0.5, 2.5), text(size: 9pt, weight: "bold")[Khối L'])
    content((3.5, 1.5), text(size: 9pt, weight: "bold")[Khối R])
  })
]
#v(0.5em)

#note-box(title: "Vũ khí: Hệ số chuyển đổi (Ma trận Cắt Lớp)")[
  *Lý thuyết gốc:* Đối với bảng $2 times n$, khi dịch chuyển từ cột này sang cột kế tiếp, số cách chọn màu sẽ luôn được nhân thêm một "Hệ số chuyển đổi" là: 
  $H = k^2 - 3k + 3$. *(Công thức này đã được chứng minh chi tiết ở Phần II - Cắt Lớp Bảng $2 times n$)*
  Với $k=4$ màu, hệ số $H = 4^2 - 12 + 3 = 7$.
]

#theory-box[
  #reset-step()
  *Giải chi tiết dễ hiểu nhất (Không dùng công thức trừu tượng):*

  Để giải quyết lưới 11 ô này, ta không dùng các công thức ma trận hay định lý khó hiểu. Ta sẽ dùng phương pháp *đếm trực tiếp từng cột từ trái sang phải* bằng bộ 4 màu: {*Đỏ, Xanh, Vàng, Tím*}.

  Đầu tiên, hãy vẽ lại sơ đồ liên kết của lưới để thấy rõ các ô chạm nhau:
  #align(center)[
    #block(fill: rgb("F5F5F5"), inset: 1em, radius: 4pt, stroke: 0.5pt + gray)[
      #set align(left)
      #set text(font: "Courier New", size: 9.5pt)
      Cột:          Cột 1       Cột 2       Cột 3       Cột 4\
      Dòng 3 (top)  [   ] ----- [   ]\
                      |           |\
      Dòng 2        [   ] ----- [   ]\
                      |           |\
      Dòng 1        [   ] ----- [   ] ----- [   ] ----- [   ]\
                                  |           |           |\
      Dòng 0 (bot)              [   ] ----- [   ] ----- [   ]
    ]
  ]

  #note-box(title: "💡 Khái niệm mấu chốt: Tại sao chuyển cột cao 2 ô luôn nhân hệ số 7?")[
    Giả sử cột trước đã tô xong, có ô trên màu *Đỏ*, ô dưới màu *Xanh*. Ta cần tô cột tiếp theo gồm ô trên $X$ và ô dưới $Y$.
    - $X$ kề ngang ô trên (Đỏ) $=>$ $X$ không được là Đỏ.
    - $Y$ kề ngang ô dưới (Xanh) $=>$ $Y$ không được là Xanh.
    - $X$ và $Y$ kề dọc nhau $=>$ $X$ phải khác $Y$.
    
    Hãy đếm xem có bao nhiêu cặp màu $(X, Y)$ hợp lệ bằng cách thử từng màu cho $X$:
    - *Khả năng 1:* Nếu $X$ chọn màu *Xanh*. Ô $Y$ phải khác Xanh (kề dọc) và khác Xanh (kề ngang) $=>$ $Y$ chỉ cần tránh màu Xanh $=>$ $Y$ có 3 cách chọn ({*Đỏ, Vàng, Tím*}). Ta có *3 cách*.
    - *Khả năng 2:* Nếu $X$ chọn màu *Vàng*. Ô $Y$ phải tránh Xanh (kề ngang) và tránh Vàng (kề dọc với $X$) $=>$ $Y$ có 2 cách chọn ({*Đỏ, Tím*}). Ta có *2 cách*.
    - *Khả năng 3:* Nếu $X$ chọn màu *Tím*. Ô $Y$ phải tránh Xanh (kề ngang) và tránh Tím (kề dọc với $X$) $=>$ $Y$ có 2 cách chọn ({*Đỏ, Vàng*}). Ta có *2 cách*.
    
    *Cộng lại:* $3 + 2 + 2 = 7$ cách. 
    Như vậy, mỗi lần chuyển từ một cột cao 2 ô sang cột cao 2 ô tiếp theo, ta chỉ việc *nhân thêm hệ số 7*!
  ]

  #step[Tô Khối Trái (gồm Cột 1 và Cột 2 - tổng cộng 7 ô)]
  - *Tô phần lõi 6 ô phía trên (gồm 6 ô thuộc các Dòng 1, 2, 3 của Cột 1 và Cột 2):*
    Hãy tạm thời xoay ngang khối $3 times 2$ này thành bảng $2 times 3$ (2 dòng, 3 cột):
    - Cột 1 (sau xoay) cao 2 ô: Ô trên có 4 cách, ô dưới có 3 cách $=>$ có $4 times 3 = 12$ cách.
    - Chuyển sang Cột 2 (sau xoay): Nhân thêm hệ số chuyển tiếp $H = 7$ cách.
    - Chuyển sang Cột 3 (sau xoay): Nhân thêm hệ số chuyển tiếp $H = 7$ cách.
    $=>$ Số cách tô phần lõi 6 ô là: $12 times 7 times 7 = 588$ cách.
  - *Tô ô đuôi dưới cùng ở Cột 2 Dòng 0:*
    Ô này chỉ kề dọc duy nhất với ô ở Cột 2 Dòng 1 nằm ngay trên nó (bên trái của ô Dòng 0 bị khuyết rỗng). Vì ô ở Dòng 1 đã được tô màu trước đó, nên ô đuôi chỉ cần chọn màu khác với ô ở Dòng 1 $=>$ có $4 - 1 = 3$ cách chọn.
  - *Kết quả Khối Trái (7 ô):*
    $N_"Trái" = 588 times 3 = 1764$ cách.
  *(Lưu ý: Vì hai ô Dòng 0 và Dòng 1 của Cột 2 kề dọc nhau, trong bất kỳ cách tô hợp lệ nào của Khối Trái, chúng cũng luôn mang hai màu khác nhau).*

  #step[Nối Khối Phải (gồm Cột 3 và Cột 4) vào Khối Trái]
  - *Tô Cột 3 (gồm 2 ô ở Dòng 0 và Dòng 1):*
    Cột 3 kề ngang trực tiếp với cặp ô móng ở Dòng 0 và Dòng 1 của Cột 2. Vì cặp ô móng đã được tô 2 màu khác nhau từ bước trước, bước chuyển sang Cột 3 này chính là bước chuyển tiếp cột cao 2 ô chuẩn $=>$ Nhân thêm hệ số $H = 7$.
  - *Tô Cột 4 (gồm 2 ô ở Dòng 0 và Dòng 1):*
    Cột 4 kề đầy đủ sang Cột 3 đã tô $=>$ Nhân tiếp hệ số chuyển tiếp cột đầy đủ $H = 7$.
  - Vậy Khối Phải đóng góp hệ số nhân là: $7 times 7 = 49$.

  #step[Tính tổng số cách và kết luận]
  - Tổng số cách tô màu cho toàn bộ lưới 11 ô là:
    $p = N_"Trái" times 49 = 1764 times 49$.
  - Giá trị cần tính:
    $p/49 = (1764 times 49)/49 = 1764$.
  Vậy đáp án cần tìm là $1764$.
]

== 3b. Lưới Bậc Thang Ngược (Rèn luyện tư duy chuyển cột)

#example-box(n: "3.3b — Lưới Bậc Thang giảm dần")[
  *Đề bài:* Có $k = 4$ màu để tô vào một lưới hình bậc thang ngược gồm 6 ô vuông: Cột 1 có 3 ô (độ cao 3), Cột 2 có 2 ô (độ cao 2), và Cột 3 có 1 ô (độ cao 1) xếp thẳng hàng đế dưới như hình vẽ. Hai ô kề cạnh nhau phải khác màu. Hỏi có bao nhiêu cách tô?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    let green = rgb("E8F5E9")
    let blue = rgb("E3F2FD")
    let orange = rgb("FFE0B2")
    
    // Cột 1 (3 ô)
    rect((0, 0), (1, 1), fill: green, stroke: 1.2pt + black)
    rect((0, 1), (1, 2), fill: green, stroke: 1.2pt + black)
    rect((0, 2), (1, 3), fill: green, stroke: 1.2pt + black)
    
    // Cột 2 (2 ô)
    rect((1, 0), (2, 1), fill: blue, stroke: 1.2pt + black)
    rect((1, 1), (2, 2), fill: blue, stroke: 1.2pt + black)
    
    // Cột 3 (1 ô)
    rect((2, 0), (3, 1), fill: orange, stroke: 1.2pt + black)
    
    content((0.5, 1.5), text(size: 8.5pt)[Cột 1])
    content((1.5, 1.0), text(size: 8.5pt)[Cột 2])
    content((2.5, 0.5), text(size: 8.5pt)[Cột 3])
  })
]
#v(0.5em)

#note-box(title: "Bản chất: Quét cột giảm chiều cao")[
  *Quy tắc:* Khi quét cột từ trái sang phải, nếu chiều cao cột tiếp theo giảm đi, ta chỉ cần chuyển tiếp cho những ô có liên kết ngang, các ô dư thừa ở trên sẽ không còn ảnh hưởng đến cột mới nữa!
]

#theory-box[
  #reset-step()
  *Giải chi tiết:*

  Ta thực hiện tô màu lần lượt từ cột có độ cao lớn sang cột có độ cao nhỏ (từ trái qua phải):

  #step[Tô màu cho Cột 1 (độ cao 3)]
  Cột 1 gồm 3 ô xếp thẳng hàng đứng:
  - Ô dưới cùng có 4 cách chọn màu.
  - Ô ở giữa kề dọc ô dưới nên phải khác màu ô dưới $=>$ có 3 cách chọn.
  - Ô trên cùng kề dọc ô ở giữa nên phải khác màu ô ở giữa $=>$ có 3 cách chọn.
  - Số cách tô Cột 1 là: $4 times 3 times 3 = 36$ cách.
  Hãy giả sử ba màu tô từ dưới lên trên lần lượt là *Đỏ, Xanh, Vàng*.

  #step[Chuyển tiếp sang Cột 2 (độ cao 2)]
  Cột 2 chỉ gồm 2 ô (ô dưới và ô trên):
  - Ô dưới Cột 2 kề ngang với ô dưới Cột 1 (đang màu *Đỏ*).
  - Ô trên Cột 2 kề ngang với ô ở giữa Cột 1 (đang màu *Xanh*).
  - Hai ô này tạo thành một cột cao 2 ô kề ngang trực tiếp với phần cao 2 ô của Cột 1 (đang mang hai màu khác nhau là *Đỏ* và *Xanh*).
  - Đây chính là phép chuyển tiếp cột chuẩn của bảng $2 times n$. Hệ số nhân chuyển tiếp là:
    $H = k^2 - 3k + 3 = 4^2 - 3(4) + 3 = 7$.
  - Ô trên cùng của Cột 1 (màu *Vàng*) hoàn toàn không kề ngang với ô nào của Cột 2 (do Cột 2 không có ô ở dòng 3), nên màu của nó không ảnh hưởng gì đến cách tô Cột 2.
  - Số cách tô Cột 1 và Cột 2 là: $36 times 7 = 252$ cách.
  Hãy giả sử hai màu tô cho Cột 2 là *Vàng* (ô dưới) và *Tím* (ô trên).

  #step[Chuyển tiếp sang Cột 3 (độ cao 1)]
  Cột 3 chỉ gồm duy nhất 1 ô dưới cùng:
  - Ô này kề ngang với ô dưới của Cột 2 (đang màu *Vàng*). Nó không kề dọc với ai và cũng không kề ngang với ô nào khác.
  - Do đó, ô này chỉ cần tránh màu *Vàng* của ô kề trái $=>$ có $k - 1 = 3$ cách chọn ({*Đỏ, Xanh, Tím*}).
  - Số cách tô Cột 3 là: 3 cách.

  #step[Tổng hợp số cách và kết luận]
  Áp dụng quy tắc nhân, tổng số cách tô màu cho lưới bậc thang ngược này là:
  $N = N_"Cột 1" times H_"Cột 2" times H_"Cột 3" = 36 times 7 times 3 = 756$ cách.
]

== 4. Lưới Tổ Ong (Mạng Lục Giác Khép Vòng)

#example-box(n: "3.4 — Tổ ong lục giác")[
  *Đề bài:* Có 6 phòng học hình lục giác đều xếp khép kín tạo thành một vòng "tổ ong" như hình vẽ. Giám thị có $k$ mã đề. Hai phòng sát vách nhau phải khác mã đề. Hỏi có bao nhiêu cách?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let r = 0.8
    for i in range(6) {
      let a = i * 60 * 1deg
      let cx = calc.cos(a) * r * 1.5
      let cy = calc.sin(a) * r * 1.5
      let pts = ()
      for j in range(6) {
        let ha = j * 60 * 1deg + 30deg
        pts.push((cx + calc.cos(ha) * r * 0.5, cy + calc.sin(ha) * r * 0.5))
      }
      line(..pts, close: true, fill: white, stroke: 1.5pt + c-teal)
      content((cx, cy), text(weight: "bold")[#(i+1)])
    }
    circle((0,0), radius: r * 1.5, stroke: (paint: red, thickness: 2pt, dash: "dashed"))
  })
]
#v(0.5em)

#note-box(title: "Chiến thuật: Đại Bác Truy Hồi Vòng Tròn")[
  *Lý thuyết gốc:* Bất cứ khi nào đồ thị là một tập hợp các ô xếp thành 1 vòng tròn khép kín. Ta cắt 1 cạnh để duỗi thẳng thành hàng $n$ ô, rồi trừ đi trường hợp chập 2 đầu làm một (vòng $n-1$ ô). Công thức truy hồi cốt lõi:
  $P_n = k(k-1)^(n-1) - P_(n-1)$
  Bắt đầu từ tam giác ($n=3$): $P_3 = k(k-1)(k-2)$.
]

#theory-box[
  #reset-step()
  *Giải chi tiết:* 
  #step[Bóc lớp ngụy trang]
  Vỏ bọc hình lục giác là để hù dọa học sinh. Thực chất, phòng 1 sát phòng 2, phòng 2 sát phòng 3... và phòng 6 lại sát vòng lại phòng 1. Đồ thị này hoàn toàn tương đương với một Vòng tròn có $n=6$ đỉnh.
  
  #step[Xây dựng biểu thức truy hồi]
  Theo công thức truy hồi Đại Bác: $P_n = k(k-1)^(n-1) - P_(n-1)$. Ta tính lần lượt các vòng nhỏ hơn:
  - Vòng 3 phòng: $P_3 = k(k-1)(k-2) = (k-1)^3 - (k-1)$.
  - Vòng 4 phòng: $P_4 = k(k-1)^3 - P_3 = (k-1)^4 + (k-1)$.
  - Vòng 5 phòng: $P_5 = k(k-1)^4 - P_4 = (k-1)^5 - (k-1)$.
  - Vòng 6 phòng: $P_6 = k(k-1)^5 - P_5 = (k-1)^6 + (k-1)$.
  
  #step[Chốt hạ]
  Số cách phát đề cho 6 phòng học là: $P_6 = (k-1)^6 + k - 1$.
]

== 5. Đồ Thị Nơ Bướm (Nút Thắt Cổ Chai)

#example-box(n: "3.5 — Đồ thị Nơ Bướm")[
  *Đề bài:* Có hai khu vực triển lãm hình tam giác. Hai khu này chung nhau đúng 1 đỉnh ở giữa (tạo thành hình nơ bướm). Có $k$ màu sơn, 2 đỉnh nối nhau phải khác màu. Hỏi có bao nhiêu cách sơn?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    line((-1, 1), (-1, -1), (0,0), close: true, fill: rgb("E3F2FD"), stroke: 1.5pt + c-navy)
    line((1, 1), (1, -1), (0,0), close: true, fill: rgb("E3F2FD"), stroke: 1.5pt + c-navy)
    circle((0,0), radius: 0.15, fill: rgb("FFF9C4"), stroke: 2pt + red)
    content((0, 0.4), text(weight: "bold", fill: red)[Tâm (Nút thắt)])
  })
]
#v(0.5em)

#note-box(title: "Chiến thuật: Bóp nghẹt Nút thắt cổ chai")[
  *Lý thuyết gốc:* Khi hai đồ thị (hay hai khối) khổng lồ chỉ dính nhau qua đúng MỘT ĐỈNH duy nhất, hãy gán màu cho đỉnh đó trước. Ngay lập tức, hai đồ thị sẽ bị "chặt đứt" và hoàn toàn không còn liên quan gì đến nhau nữa!
]

#theory-box[
  #reset-step()
  *Giải chi tiết:* 
  #step[Tìm điểm yếu]
  Điểm yếu chí mạng của đồ thị này là đỉnh ở giữa (Tâm màu vàng). Nó chính là nút thắt cổ chai giao tiếp duy nhất giữa tam giác Trái và tam giác Phải.
  
  #step[Khống chế nút thắt]
  Ta lấy $k$ màu, chọn ra 1 màu để cố định cho đỉnh Tâm. Lúc này, Tâm có $k$ lựa chọn.
  Khi Tâm đã bị đóng băng (có màu cố định), đồ thị nơ bướm bị bẻ làm đôi thành 2 nửa hoàn toàn độc lập (Trái và Phải). Nhiệm vụ của mỗi nửa bây giờ chỉ là: "Tô màu cho 2 đỉnh còn lại sao cho né cái màu của Tâm ra".
  
  #step[Xử lý nhánh tự do]
  - Tam giác Trái: Còn lại 2 đỉnh nối với nhau. Cả 2 đỉnh đều phải né màu của Tâm, nên tập màu bị giảm đi 1, chỉ còn $k' = k-1$ màu. Tô 2 đỉnh nối nhau bằng $k-1$ màu, ta có $(k-1) times (k-2)$ cách.
  - Tam giác Phải: Lập luận tương tự, có $(k-1) times (k-2)$ cách.
  
  #step[Chốt hạ]
  Nhân tất cả lại với nhau:
  Tổng số cách là $k times (k-1)(k-2) times (k-1)(k-2) = k (k-1)^2 (k-2)^2$.
]

== 6. Lưới Bảng 3x3 Bị Thủng Ở Giữa (Donut Grid)

#example-box(n: "3.6 — Donut Grid")[
  *Đề bài:* Một bảng $3 times 3$ bị khoét mất ô trung tâm (chỉ còn 8 ô viền xung quanh). Có 3 màu sơn. Kề nhau (chung cạnh) khác màu. Hỏi có bao nhiêu cách?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    for r in range(3) {
      for c in range(3) {
        if not (r == 1 and c == 1) {
          rect((c, r), (c+1, r+1), fill: white, stroke: 1.5pt + black)
        } else {
          content((c+0.5, r+0.5), text(weight: "bold", fill: red)[Thủng])
        }
      }
    }
    line((0.5, 2.5), (1.5, 2.5), (2.5, 2.5), (2.5, 1.5), (2.5, 0.5), (1.5, 0.5), (0.5, 0.5), (0.5, 1.5), (0.5, 2.5), stroke: (paint: red, thickness: 2pt, dash: "dashed"))
  })
]
#v(0.5em)

#note-box(title: "Công thức sử dụng: Đại Bác Vòng Tròn")[
  *Lý thuyết gốc:* $P_n = (k-1)^n + (-1)^n(k-1)$. 
  Áp dụng ngay khi đồ thị "trông có vẻ lằng nhằng" nhưng thực chất là một sợi xích khép kín.
]

#theory-box[
  #reset-step()
  *Giải chi tiết:* 
  #step[Phá vỡ ngụy trang]
  Bảng $3 times 3$ bình thường là một lưới cực kỳ phức tạp (phải dùng ma trận vuông góc). Tuy nhiên, khi bị "khoét" lỗ ở giữa, 8 ô viền hoàn toàn mất đi lõi trung tâm. 
  Hãy nhìn đường nét đứt màu đỏ trên hình: 8 ô này thực chất chỉ là một sợi xích khép kín vòng tròn, đỉnh đầu nối với đỉnh cuối.
  
  #step[Ráp công thức]
  Đây chính là mô hình Vòng Tròn với $n=8$ đỉnh, số màu $k=3$.
  Lắp vào công thức: $P_8 = (3-1)^8 + (-1)^8(3-1)$.
  
  #step[Tính toán chốt hạ]
  $P_8 = 2^8 + 1 times 2 = 256 + 2 = 258$ cách. Giải quyết một lưới phức tạp chỉ bằng một thao tác tính nhẩm!
]

== 7. Đồ Thị Kim Tự Tháp (Tam Giác Phân Tầng)

#example-box(n: "3.7 — Kim tự tháp")[
  *Đề bài:* Xếp 6 ô vuông thành hình kim tự tháp (tầng 1 có 1 ô, tầng 2 có 2 ô, tầng 3 có 3 ô). Có $k$ màu. Tô các ô sao cho 2 ô kề cạnh nhau khác màu. Tính số cách.
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    rect((0, 2), (1, 3), fill: rgb("FFCDD2"), stroke: 1.5pt + black)
    content((0.5, 2.5), [1])
    
    rect((-0.5, 1), (0.5, 2), fill: rgb("FFF9C4"), stroke: 1.5pt + black)
    rect((0.5, 1), (1.5, 2), fill: rgb("FFF9C4"), stroke: 1.5pt + black)
    content((0, 1.5), [2])
    content((1, 1.5), [3])
    
    rect((-1, 0), (0, 1), fill: rgb("E3F2FD"), stroke: 1.5pt + black)
    rect((0, 0), (1, 1), fill: rgb("E3F2FD"), stroke: 1.5pt + black)
    rect((1, 0), (2, 1), fill: rgb("E3F2FD"), stroke: 1.5pt + black)
    content((-0.5, 0.5), [4])
    content((0.5, 0.5), [5])
    content((1.5, 0.5), [6])
  })
]
#v(0.5em)

#note-box(title: "Chiến thuật: Cắt lớp Tam giác (Từ đỉnh xuống đáy)")[
  *Lý thuyết gốc:* Lưới tam giác là một tổ hợp các hình tam giác lồng vào nhau. Với 1 tam giác 3 ô, ô thứ 3 luôn kề với 2 ô trước. Cách tô tối ưu là tô xuôi chiều từ trên xuống dưới, gỡ dần từng lớp gạch.
]

#theory-box[
  #reset-step()
  *Giải chi tiết:* 
  #step[Chọn hướng tấn công]
  Khối gạch này được xếp lớp rất chuẩn xác. Cứ 1 ô ở trên đè lên 2 ô ở dưới. Ta sẽ giải quyết bài này theo luồng đi từ Đỉnh tháp (Tầng 1) xuống Đáy tháp (Tầng 3).
  
  #step[Phá vỡ Tầng 1 và Tầng 2]
  - Tầng 1 (Ô số 1) tự do, có $k$ cách chọn.
  - Tầng 2 (Ô 2, Ô 3): Ô 2 kề Ô 1 nên khác Ô 1. Ô 3 kề Ô 1 nên khác Ô 1. Đồng thời Ô 2 và Ô 3 kề nhau. Nói cách khác, 3 ô (1, 2, 3) tạo thành một khối tam giác trọn vẹn $K_3$.
  Số cách tô cho chóp tháp 3 ô này là: $k times (k-1) times (k-2)$.
  
  #step[Lan truyền xuống Tầng 3 (Quy luật cực vi diệu)]
  - Lúc này, Ô 2 và Ô 3 đã bị cố định màu (gọi là màu A và màu B). (Lưu ý A khác B vì chúng kề nhau).
  - Xuống tầng 3: Hãy xem *Ô số 5* (nằm ngay giữa). Ô 5 kề với ai? Nó kề với cả Ô 2(màu A) và Ô 3(màu B). Vậy Ô 5 phải né cả A và B. Nó có đúng $k-2$ cách chọn màu! Giả sử chọn màu C cho Ô 5.
  - Sang *Ô số 4*: Kề với Ô 2(màu A) và Ô 5(màu C). Nó phải né A và C. Cũng có đúng $k-2$ cách!
  - Sang *Ô số 6*: Kề với Ô 3(màu B) và Ô 5(màu C). Lại né 2 màu, có đúng $k-2$ cách!
  
  #step[Chốt hạ]
  Chóp tam giác đóng góp: $k(k-1)(k-2)$. 
  Tầng đáy 3 ô đóng góp: $(k-2) times (k-2) times (k-2) = (k-2)^3$.
  Tổng cộng: $k(k-1)(k-2)^4$.
]

== 8. Lưới Xương Cá (Cây Phân Nhánh)

#example-box(n: "3.8 — Bộ xương cá")[
  *Đề bài:* Cho một lưới gồm 1 trục dọc 4 ô, từ mỗi ô trên trục mọc ra 1 ô nhánh phụ (tổng 8 ô). Có 4 màu. Hỏi có bao nhiêu cách tô?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    for i in range(4) {
      rect((0, i), (1, i+1), fill: rgb("FFF9C4"), stroke: 2pt + red)
      rect((1, i), (2, i+1), fill: white, stroke: 1.5pt + black)
    }
  })
]
#v(0.5em)

#note-box(title: "Công thức sử dụng: Súng Lục (Cây không khép vòng)")[
  *Lý thuyết gốc:* Mọi đồ thị "Cây" (có nhánh đâm tủa ra nhưng không bao giờ khép lại thành hình vòng tròn) đều có thể giải bằng cách nhân liên tiếp hệ số tự do $(k-1)$.
]

#theory-box[
  #reset-step()
  *Giải chi tiết:* 
  #step[Nhận diện Đồ Thị Cây]
  Hãy quan sát đồ thị này. Nó không hề có bất kỳ một vòng khép kín nào. Nếu ta nhỏ một giọt nước từ gốc lên, nước sẽ chảy tủa ra các nhánh mà không bao giờ chảy ngược về chỗ cũ. Đây là đặc tính thuần túy của Đồ thị Cây.
  
  #step[Xử lý đoạn Xương Sống]
  Đầu tiên ta giải quyết cái trục đứng 4 ô (được viền đỏ). Nó là một Súng Lục thẳng băng 4 đỉnh.
  Số cách tô xương sống là: $k(k-1)^3$. 
  Với $k=4$, ta có: $4 times 3^3 = 4 times 27 = 108$ cách.
  
  #step[Xử lý các Nhánh vây cá]
  Sau khi xương sống đã tô xong. Hãy nhìn vào 4 ô nhánh lồi ra. 
  Mỗi cái nhánh đó chỉ kề với đúng 1 ô trên xương sống! Nó như một cái nụ chỉ dính đúng 1 cuống lá.
  Do đó, mỗi ô nhánh chỉ cần "né" đúng 1 màu của cái ô xương sống sinh ra nó. Mỗi ô sẽ có $4-1 = 3$ lựa chọn độc lập.
  Vì có 4 nhánh, số cách là: $3 times 3 times 3 times 3 = 3^4 = 81$ cách.
  
  #step[Chốt hạ]
  Tổng số cách = (Cách tô xương sống) $times$ (Cách tô nhánh) = $108 times 81 = 8748$ cách. (Quá nhẹ nhàng!)
]

== 9. Đồ Thị Bipartite $K_{3,3}$ (Chia Phe Chiến Tuyến)

#example-box(n: "3.9 — Ba Nam, Ba Nữ")[
  *Đề bài:* Có 6 đỉnh chia làm 2 phe: Trái (3 đỉnh) và Phải (3 đỉnh). Mọi đỉnh Trái đều nối với mọi đỉnh Phải. Nội bộ phe Trái KHÔNG nối nhau. Nội bộ phe Phải KHÔNG nối nhau. Có 4 màu. Hai đỉnh nối nhau phải khác màu. Hỏi có bao nhiêu cách?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    let lefts = ((0, 2), (0, 1), (0, 0))
    let rights = ((2, 2), (2, 1), (2, 0))
    for l in lefts {
      for r in rights {
        line(l, r, stroke: 0.5pt + gray)
      }
      circle(l, radius: 0.15, fill: rgb("E3F2FD"), stroke: 1.5pt + c-navy)
    }
    for r in rights {
      circle(r, radius: 0.15, fill: rgb("FFCDD2"), stroke: 1.5pt + red)
    }
  })
]
#v(0.5em)

#note-box(title: "Chiến thuật: Chia tổ hợp theo lượng màu (Phân mảnh)")[
  *Lý thuyết gốc:* Với đồ thị 2 phe (Bipartite), phe A hoàn toàn tự do chọn màu vì không kề nhau. Nhưng tập hợp các màu mà phe A đã lấy sẽ tạo thành một "Lệnh cấm tập thể" dội thẳng xuống phe B. 
  Giải pháp: Chia trường hợp dựa trên việc phe A dùng bao nhiêu màu.
]

#theory-box[
  #reset-step()
  *Giải chi tiết:* 
  #step[Phân tích chiến tuyến]
  Các đỉnh Phe Trái (Xanh) hoàn toàn không nối với nhau. Nghĩa là bạn có thể tô 3 đỉnh Trái này cùng 1 màu cũng được, hoặc mỗi đỉnh 1 màu cũng được. Tuy nhiên, nếu Phe Trái dùng nhiều màu, Phe Phải (Đỏ) sẽ bị cấm đi bấy nhiêu màu (vì Phe Phải kề với mọi đỉnh Trái). Ta phải phân 3 trường hợp.
  
  #step[Chia trường hợp (Theo số màu được dùng ở Phe Trái)]
  Có tổng 4 màu. Phe Trái có 3 đỉnh.
  - *TH1: Phe Trái dùng tiết kiệm đúng 1 màu.*
    - Chọn 1 màu cho Phe Trái: Có 4 cách. (Cả 3 đỉnh Xanh đều xài màu này).
    - Phe Phải bị cấm 1 màu này, nên mỗi đỉnh Đỏ đều có $4-1 = 3$ cách chọn. Vì Phe Phải cũng không kề nội bộ, ta nhân thẳng: $3^3 = 27$ cách.
    - $=>$ Kết quả TH1: $4 times 27 = 108$ cách.
  
  - *TH2: Phe Trái dùng đúng 2 màu.*
    - Cần chọn ra 2 màu từ 4 màu gốc: Tổ hợp $C_4^2 = 6$ cách.
    - Dùng 2 màu đó để tô cho 3 đỉnh Xanh (đảm bảo màu nào cũng xuất hiện). Có công thức: $2^3 - 2 = 6$ cách. Vậy Phe Trái có $6 times 6 = 36$ cách sắp xếp.
    - Phe Phải khóc thét vì bị cấm mất 2 màu. Nên mỗi đỉnh Đỏ chỉ còn $4-2 = 2$ cách chọn: $2^3 = 8$ cách.
    - $=>$ Kết quả TH2: $36 times 8 = 288$ cách.
    
  - *TH3: Phe Trái xài sang dùng đúng 3 màu.*
    - Chọn ra 3 màu và xếp cho 3 đỉnh Xanh: Chỉnh hợp $A_4^3 = 24$ cách.
    - Phe Phải bị cấm 3 màu, nên mỗi đỉnh Đỏ chỉ còn thoi thóp $4-3 = 1$ lựa chọn duy nhất. Số cách Phe Phải: $1^3 = 1$ cách.
    - $=>$ Kết quả TH3: $24 times 1 = 24$ cách.
  
  #step[Chốt hạ]
  Tổng hợp lại ta được đáp số cuối cùng: $108 + 288 + 24 = 420$ cách. Một tư duy sắc bén tuyệt đối!
]

== 10. Bảng 2x3 Bị Ràng Buộc Kẻ Chéo

#example-box(n: "3.10 — Lưới cấm chéo")[
  *Đề bài:* Cho bảng $2 times 3$ (6 ô). Yêu cầu: Hai ô chung cạnh phải khác màu. THÊM NỮA: Hai ô nằm trên đường chéo của bất kỳ hình vuông $2 times 2$ nào cũng phải khác màu. Có $k$ màu. Tính số cách.
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    for c in range(3) {
      rect((c, 0), (c+1, 1), fill: white, stroke: 1.5pt + black)
      rect((c, 1), (c+1, 2), fill: white, stroke: 1.5pt + black)
    }
    line((0,0), (1,1), stroke: (paint: red, thickness: 1.5pt))
    line((0,1), (1,0), stroke: (paint: red, thickness: 1.5pt))
    line((1,0), (2,1), stroke: (paint: red, thickness: 1.5pt))
    line((1,1), (2,0), stroke: (paint: red, thickness: 1.5pt))
    line((2,0), (3,1), stroke: (paint: red, thickness: 1.5pt))
    line((2,1), (3,0), stroke: (paint: red, thickness: 1.5pt))
  })
]
#v(0.5em)

#note-box(title: "Công thức sử dụng: Đồ thị Đầy Đủ (K_n)")[
  *Lý thuyết gốc:* Khi một khối n ô bị nối vằn vện TẤT CẢ các cặp đỉnh với nhau, khối đó được gọi là đồ thị đầy đủ $K_n$. Nó ép buộc n ô đó bắt buộc phải lấy n màu phân biệt khác nhau hoàn toàn.
]

#theory-box[
  #reset-step()
  *Giải chi tiết:* 
  #step[Hiểu bản chất ràng buộc chéo]
  Trong một khối vuông $2 times 2$ (gồm 4 ô). Yêu cầu cơ bản đã cấm 4 cạnh xung quanh. Bây giờ lại cấm thêm 2 đường chéo (vạch đỏ). Điều này biến 4 ô của khối vuông $2 times 2$ thành đồ thị Đầy Đủ $K_4$!
  Tính chất sống còn: 4 ô của một hình vuông $2 times 2$ bất kỳ phải xài 4 màu khác nhau hoàn toàn!
  
  #step[Cắt lớp theo từng cột]
  - *Xử lý Cột 1 (2 ô đứng trái cùng):* Chỉ kề nhau 1 cạnh, nên có $k times (k-1)$ cách tô. Gọi 2 màu này là Tập X.
  - *Xử lý Cột 2 (2 ô đứng ở giữa):* Vì Cột 2 dính liền với Cột 1 để tạo thành 1 hình vuông $2 times 2$. Mà khối này ép buộc phải có 4 màu phân biệt, nên Cột 2 *phải dùng 2 màu hoàn toàn mới*, né hoàn toàn cái Tập X của Cột 1.
    Nghĩa là Cột 2 chỉ được chọn từ $k-2$ màu còn lại. Số cách lấy ra và tô cho 2 ô của Cột 2 là: $(k-2) times (k-3)$. Gọi tập màu này là Tập Y.
  - *Xử lý Cột 3 (2 ô đứng phải cùng):* Lập luận tương tự, Cột 3 dính với Cột 2 tạo thành hình vuông thứ hai. Do đó, Cột 3 phải né hoàn toàn Tập Y của Cột 2. Vậy Cột 3 cũng chỉ còn dư $k-2$ màu. Số cách tô là $(k-2) times (k-3)$.
  
  *(Bất ngờ sư phạm: Bạn sẽ hỏi, Cột 3 có phải né Tập X của Cột 1 không? Câu trả lời là KHÔNG. Cột 3 và Cột 1 không chạm nhau, chúng bị ngăn bởi Cột 2. Cột 3 chỉ cần né Cột 2 là xong!)*
  
  #step[Chốt hạ]
  Nhân kết quả từng cột lại, ta có đáp án siêu đẹp: 
  Tổng số cách tô là: $k(k-1) times (k-2)^2 (k-3)^2$. Rất gọn gàng và đầy chất trí tuệ!
]

== 11. Các Bài Tập Rèn Luyện Thêm (Lưới Khuyết & Đa Khối)

#example-box(n: "3.11 — Lưới Khuyết Đuôi 8 ô (Khối Trái 3x2 ghép Đuôi)")[
  *Đề bài:* Cho một lưới gồm 8 ô vuông như hình vẽ dưới đây. Có 4 mã màu khác nhau. Yêu cầu hai ô chung cạnh (kề nhau) phải khác màu. Hỏi có bao nhiêu cách tô màu cho lưới?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    let yellow = rgb("FFF9C4")
    let blue = rgb("E3F2FD")
    
    // Khối 3x2 bên trái
    for r in range(3) {
      for c in range(2) {
        rect((c, r), (c+1, r+1), fill: yellow, stroke: 1.2pt + black)
      }
    }
    // Ô đuôi bên phải
    rect((2, 2), (3, 3), fill: blue, stroke: 1.2pt + black)
    
    content((0.5, 1.5), text(size: 8.5pt)[Cột 1])
    content((1.5, 1.5), text(size: 8.5pt)[Cột 2])
    content((2.5, 2.5), text(size: 8.5pt)[Cột 3])
  })
]
#v(0.5em)

#theory-box[
  #reset-step()
  *Giải chi tiết từng bước:*

  Để giải quyết lưới khuyết này một cách trực quan, ta hãy vẽ lại sơ đồ liên kết của lưới theo cấu trúc cột:
  #align(center)[
    #block(fill: rgb("F5F5F5"), inset: 1em, radius: 4pt, stroke: 0.5pt + gray)[
      #set align(left)
      #set text(font: "Courier New", size: 9.5pt)
      Cột:    Cột 1       Cột 2       Cột 3\
      Dòng 3  [   ] ----- [   ] ----- [   ]\
                |           |\
      Dòng 2  [   ] ----- [   ]\
                |           |\
      Dòng 1  [   ] ----- [   ]
    ]
  ]

  #step[Tô màu Khối Trái (gồm Cột 1 và Cột 2 - tổng cộng 6 ô)]
  - Lưới 6 ô này là một bảng $3 times 2$ (3 dòng, 2 cột) đầy đủ.
  - Ta xoay ngang khối này lại $=>$ nó trở thành bảng $2 times 3$ (2 dòng, 3 cột) chuẩn. Phép xoay bảo toàn các liên kết kề cạnh nên số cách tô giữ nguyên.
  - Số cách tô là: 
    $N_"Lõi" = k(k-1) times H^2 = 12 times 7 times 7 = 588$ cách.
  *(Giả sử sau khi tô xong, ô ở Cột 2 Dòng 3 mang màu Đỏ).*

  #step[Tô ô đuôi ở Cột 3 Dòng 3]
  - Hãy quan sát sơ đồ: Ô ở Cột 3 Dòng 3 chỉ kề ngang trực tiếp với ô ở Cột 2 Dòng 3. Phía dưới của ô này hoàn toàn bị khuyết, và nó không chạm ô nào khác.
  - Vì vậy, ô này chỉ cần chọn màu khác với ô ở Cột 2 Dòng 3 (khác Đỏ) $=>$ luôn có $k-1 = 3$ cách chọn màu ({Xanh, Vàng, Tím}).

  #step[Tổng hợp số cách tô]
  - Áp dụng quy tắc nhân, tổng số cách tô màu cho lưới 8 ô là:
    $N = N_"Lõi" times 3 = 588 times 3 = 1764$ cách.
]

#v(0.5em)

#example-box(n: "3.12 — Lưới Eo Thon 9 ô (Thử thách cầu nối thu nhỏ)")[
  *Đề bài:* Cho một lưới gồm 9 ô vuông xếp như hình dưới đây (hai khối $2 times 2$ hai bên dính nhau qua ô cầu nối ở giữa). Có 4 mã màu khác nhau. Yêu cầu hai ô chung cạnh phải khác màu. Hỏi có bao nhiêu cách tô màu?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let green = rgb("E8F5E9")
    let blue = rgb("E3F2FD")
    let orange = rgb("FFE0B2")
    
    // Khối Trái 2x2
    rect((0, 0), (1, 1), fill: green, stroke: 1.2pt + black)
    rect((0, 1), (1, 2), fill: green, stroke: 1.2pt + black)
    rect((1, 0), (2, 1), fill: green, stroke: 1.2pt + black)
    rect((1, 1), (2, 2), fill: green, stroke: 1.2pt + black)
    
    // Ô cầu nối
    rect((2, 1), (3, 2), fill: orange, stroke: 1.2pt + black)
    
    // Khối Phải 2x2
    rect((3, 0), (4, 1), fill: blue, stroke: 1.2pt + black)
    rect((3, 1), (4, 2), fill: blue, stroke: 1.2pt + black)
    rect((4, 0), (5, 1), fill: blue, stroke: 1.2pt + black)
    rect((4, 1), (5, 2), fill: blue, stroke: 1.2pt + black)
  })
]
#v(0.5em)

#theory-box[
  #reset-step()
  *Giải chi tiết từng bước:*

  Để giải quyết lưới này một cách đơn giản, ta hãy vẽ lại sơ đồ liên kết của lưới theo cấu trúc cột:
  #align(center)[
    #block(fill: rgb("F5F5F5"), inset: 1em, radius: 4pt, stroke: 0.5pt + gray)[
      #set align(left)
      #set text(font: "Courier New", size: 9.5pt)
      Cột:    Cột 1       Cột 2       Cột 3       Cột 4       Cột 5\
      Dòng 2  [   ] ----- [   ] ----- [   ] ----- [   ] ----- [   ]\
                |           |                       |           |\
      Dòng 1  [   ] ----- [   ]       [   ]       [   ] ----- [   ]
    ]
  ]

  #step[Tô Khối Trái (gồm Cột 1 và Cột 2 - bảng 2x2)]
  - Đây là một bảng $2 times 2$ đầy đủ chuẩn.
  - Số cách tô là: 
    $N_"Trái" = k(k-1) times H = 12 times 7 = 84$ cách.
  *(Giả sử sau khi tô xong, ô Cột 2 Dòng 2 mang màu Tím, ô Cột 2 Dòng 1 mang màu Đỏ. Hai ô này do kề dọc nên bắt buộc mang hai màu khác nhau).*

  #step[Tô Ô Cầu Nối ở Cột 3 Dòng 2]
  - Ô cầu này chỉ kề ngang duy nhất với ô ở Cột 2 Dòng 2 (phía dưới ô cầu bị khuyết rỗng).
  - Do đó, ô cầu chỉ cần tránh màu của ô bên trái (tránh màu Tím) $=>$ luôn có $k-1 = 3$ cách chọn màu.
  *(Giả sử ta chọn màu Xanh cho ô cầu).*

  #step[Tô Cột 4 (gồm 2 ô ở Dòng 1 và Dòng 2)]
  - Ô ở Dòng 2 kề ngang với ô cầu ở Cột 3 (màu Xanh) $=>$ tránh màu Xanh $=>$ có 3 cách chọn.
  - Ô ở Dòng 1 kề dọc với ô Dòng 2. Bên trái của Dòng 1 bị khuyết rỗng nên ô này không kề ngang với ai $=>$ tránh màu của ô Dòng 2 $=>$ có 3 cách chọn.
  - Vậy số cách tô cho Cột 4 là: 
    $N_"Cột 4" = 3 times 3 = 9$ cách.
  *(Giả sử ta tô được ô Dòng 2 màu Vàng, ô Dòng 1 màu Đỏ. Cặp ô này bắt buộc mang hai màu khác nhau).*

  #step[Tô Cột 5 (gồm 2 ô ở Dòng 1 và Dòng 2)]
  - Cột 5 kề đầy đủ với Cột 4 đã tô màu, đây là bước chuyển tiếp cột cao 2 ô chuẩn $=>$ Nhân thêm hệ số $H = 7$ cách.

  #step[Tổng hợp số cách tô]
  - Áp dụng quy tắc nhân, tổng số cách tô màu cho lưới 9 ô này là:
    $N = N_"Trái" times N_"Cầu" times N_"Cột 4" times H_"Cột 5" = 84 times 3 times 9 times 7 = 15.876$ cách.
]

= Phần IV: Dự Đoán Các Biến Thể Khó Tuyển Sinh 12

Trong kỳ thi Tuyển sinh 12 sắp tới, đề bài có thể không chỉ yêu cầu "kề nhau khác màu" đơn thuần, mà còn thêm các "Ràng buộc oan nghiệt". 

== Dự Đoán 1: Ràng buộc màu "Kẻ thù"

#example-box(n: "4.1 — Hai màu cấm kỵ")[
  *Đề bài:* Có 4 màu sơn (Đỏ, Xanh, Vàng, Tím). Cần sơn một dãy 5 ngôi nhà. Yêu cầu:
  1) Kề nhau khác màu.
  2) Nhà màu Đỏ tuyệt đối không được ở kề nhà màu Xanh.
]

#theory-box[
  #reset-step()
  *Phân tích bằng Đại Bác Truy Hồi:*
  Bài này phá vỡ tính đối xứng của Súng Lục $k(k-1)^{n-1}$. Ta không thể nhân đơn giản vì nếu ô trước là Đỏ, ô sau mất đi 2 lựa chọn (Đỏ, Xanh). Nhưng nếu ô trước là Vàng, ô sau chỉ mất 1 lựa chọn (Vàng).
  
  Ta chia tập màu làm 2 nhóm:
  - Nhóm rắc rối $A = {"Đỏ, Xanh"}$.
  - Nhóm an toàn $B = {"Vàng, Tím"}$.
  Gọi $x_n$ là số cách sơn $n$ nhà mà nhà cuối màu thuộc nhóm A.
  Gọi $y_n$ là số cách sơn $n$ nhà mà nhà cuối màu thuộc nhóm B.
  
  Với $n=1$: Có 2 màu thuộc A $=> x_1 = 2$. Có 2 màu thuộc B $=> y_1 = 2$.
  
  Khi chuyển sang nhà thứ $n+1$:
  - Nếu nhà $n+1$ muốn sơn màu A (Đỏ hoặc Xanh):
    + Từ nhóm A sang A: Nếu trước là Đỏ, chỉ có 0 cách chọn màu A (vì cấm Xanh và cấm Đỏ). Nếu trước là Xanh, cũng có 0 cách chọn A. Vậy không thể A nối A.
    + Từ nhóm B sang A: Nếu trước là Vàng/Tím, ta tự do chọn Đỏ hoặc Xanh (2 lựa chọn). Vậy: $x_{n+1} = 2 dot y_n$.
  - Nếu nhà $n+1$ muốn sơn màu B (Vàng hoặc Tím):
    + Từ nhóm A sang B: Vàng/Tím chơi với mọi màu, nên có 2 lựa chọn. $=> 2 dot x_n$.
    + Từ nhóm B sang B: Bắt buộc khác màu ngay trước (có 2 màu trong B, cấm 1 màu trùng, còn 1 lựa chọn). $=> 1 dot y_n$.
    Vậy: $y_{n+1} = 2x_n + y_n$.
    
  Bảng tính nhanh:
  - $n=1: x_1 = 2, y_1 = 2 => "Tổng " 4$.
  - $n=2: x_2 = 2(2) = 4, y_2 = 2(2) + 2 = 6 => "Tổng " 10$.
  - $n=3: x_3 = 2(6) = 12, y_3 = 2(4) + 6 = 14 => "Tổng " 26$.
  - $n=4: x_4 = 2(14) = 28, y_4 = 2(12) + 14 = 38 => "Tổng " 66$.
  - $n=5: x_5 = 2(38) = 76, y_5 = 2(28) + 38 = 94 => "Tổng " 170$.
  
  *Kết luận:* Có 170 cách sơn.
]

== Dự Đoán 2: Giới hạn số lần xuất hiện của một màu

#example-box(n: "4.2 — Sự độc quyền của một màu")[
  *Đề bài:* Sơn một dãy 4 cột đèn bằng 3 màu (Đỏ, Trắng, Vàng). Kề nhau khác màu. Biết rằng màu Đỏ là màu đắt tiền nên chỉ được sử dụng đúng 1 lần. Hỏi có bao nhiêu cách?
]

#theory-box[
  #reset-step()
  *Phân tích:*
  Màu Đỏ xuất hiện đúng 1 lần. Ta có thể chọn vị trí cho màu Đỏ trước, rồi tô các vị trí còn lại bằng 2 màu (Trắng, Vàng).
  Có 4 trường hợp đặt màu Đỏ (Đ):
  - *TH 1: Đ - X - X - X.* Ô số 1 là Đỏ. Ô số 2 phải khác Đỏ $=>$ chọn Trắng/Vàng (2 cách). Ô số 3 phải khác ô 2 (còn 1 cách). Ô số 4 khác ô 3 (còn 1 cách). $=> 1 times 2 times 1 times 1 = 2$ cách.
  - *TH 2: X - Đ - X - X.* Ô 2 là Đỏ. Ô 1 khác Đỏ (2 cách). Ô 3 khác Đỏ (2 cách). Ô 4 khác ô 3 (1 cách). $=> 2 times 1 times 2 times 1 = 4$ cách.
  - *TH 3: X - X - Đ - X.* Đối xứng với TH 2, có $4$ cách.
  - *TH 4: X - X - X - Đ.* Đối xứng với TH 1, có $2$ cách.
  
  *Tổng cộng:* $2 + 4 + 4 + 2 = 12$ cách. 
  *(Bài này dùng tư duy chia trường hợp kết hợp Súng Lục rút gọn cực nhanh!)*
]
