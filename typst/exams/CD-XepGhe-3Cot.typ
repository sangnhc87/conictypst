#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.2cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("4A148C"), rgb("6A1B9A"), rgb("880E4F"), angle: 135deg),
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
  stroke: (left: 4pt + rgb("6A1B9A")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("6A1B9A"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu chủ đề ─────────────────────────────────────────────
#let col-purple = rgb("4A148C")
#let col-violet = rgb("6A1B9A")
#let col-blue = rgb("1565C0")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-red = rgb("C62828")
#let col-pink = rgb("880E4F")

// ─── Hộp Lý Thuyết ─────────────────────────────
#let rev-box(title: none, body) = block(
  fill: rgb("EDE7F6"),
  stroke: (left: 4pt + col-purple, rest: 0.8pt + rgb("CE93D8")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-purple, size: 11pt, weight: "bold")[#title]
    #v(0.4em)
  ]
  #body
]

// ─── Hộp Nhận Xét ───────────────────────────────
#let note-box(title: [📌 Nhận Xét], body) = block(
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

// ─── Hộp Kết Luận ───────────────────────────────
#let ans-box(body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-green, weight: "bold")[✅ Kết Luận]
  #v(0.3em)
  #body
]

// ─── Hộp Cách Giải ────────────────────
#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[🔵 Phương pháp: Lập hệ phương trình đếm cấu trúc hàng]
  #v(0.3em)
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D0030"), rgb("4A148C"), rgb("7B1FA2"), rgb("880E4F"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("CE93D8"), size: 12pt, weight: "bold", tracking: 2pt)[
      TÀI LIỆU TOÁN CHUYÊN ĐỀ PHỔ THÔNG
    ]
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "black")[💥 KỸ THUẬT LẬP HỆ ĐẾM CẤU TRÚC HÀNG (LƯỚI 3 CỘT)]
    #v(0.4em)
    #text(
      fill: rgb("E1BEE7"),
      size: 13pt,
    )[🎯 Phá tan sự trừu tượng bằng Tư duy Hệ phương trình Cases]
    #v(0.5em)
    #text(fill: rgb("CE93D8"), size: 10pt, style: "italic")[
      "Viết lại theo phong cách siêu dễ hiểu: Bóc tách tường minh từng điều kiện biện luận"
    ]
  ]
]

#v(1.5em)
= Chương 1 — Nền tảng tư duy Đếm Cấu Trúc Hàng

#note-box(title: [📌 Lời ngỏ: Sự khác biệt so với Xếp 2 hàng đối diện hay 1 hàng ngang])[
  Ở chuyên đề trước, ta học cách dùng PIE đếm dấu `+,-` rất thành công trên không gian 1 hàng ngang. 
  
  Tuy nhiên, trên lưới $R$ hàng $times 3$ cột, ranh giới hàng là tuyệt đối. Nếu một hàng đã chứa bạn E và bạn G, nó chỉ còn đúng 1 ghế trống. Ta không thể "ghép khối" các bạn E rồi trượt tự do đi khắp phòng được. PIE sẽ vô cùng phức tạp vì phải bù trừ cả cặp và bộ ba đan thiết.
  
  Do đó, tư duy "chân ái" và nguyên thủy nhất ở đây là *Đếm xem có bao nhiêu hàng chứa cấu trúc gì*. Phương pháp lập bảng Hệ phương trình dưới đây sẽ rất mượt mà và dễ hiểu nếu bạn nắm vững ý nghĩa thực tế của nó.
]

Bài toán xếp ghế lưới chữ nhật ($R$ hàng $times 3$ cột) yêu cầu điều kiện: *mỗi hàng không chứa quá 1 đối tượng thuộc mỗi nhóm đặc biệt E, G, F*. Vì mỗi hàng chỉ có đúng 3 ghế, nên tổng số đối tượng đặc biệt tối đa trong một hàng là $1+1+1=3$. Nhờ vậy, ta có thể tư duy theo *cấu trúc của từng hàng*.

Để giữ vững tư duy hoán vị siêu tốc, ta vẫn chia bài toán làm hai bước độc lập:
1. *Bước Khung xương:* Lập bảng đếm số cách phân bổ các cấu trúc hàng (chỉ xếp chỗ, chưa xếp người cụ thể).
2. *Bước Nhân hoán vị:* Tính xong bảng, ta lấy tổng số cấu trúc nhân với $E! dot G! dot F! dot "Còn lại"!$ để xếp người vào.

== 1. Thiết lập hệ phương trình các loại hàng (Cases)
Vì mỗi hàng có tối đa 1 ghế E, 1 ghế G, 1 ghế F, ta gọi số lượng các loại hàng bằng các ẩn số.
Đồng thời, ta nhẩm luôn *Số cách xếp vị trí ghế nội bộ* trong từng loại hàng đó:

- *Nhóm Hàng có Hệ số 6 (Chứa 3 hoặc 2 người):*
  - $x$: Số hàng chứa cả $E, G, F$. Xếp 3 người vào 3 ghế: $3! = 6$ cách.
  - $y$: Số hàng chứa $E, G$. Chọn 2 ghế từ 3 ghế để xếp E, G: $A_3^2 = 6$ cách.
  - $z$: Số hàng chứa $E, F$. Tương tự: $A_3^2 = 6$ cách.
  - $t$: Số hàng chứa $G, F$. Tương tự: $A_3^2 = 6$ cách.
- *Nhóm Hàng có Hệ số 3 (Chứa đúng 1 người):*
  - $u$: Số hàng chỉ chứa $E$. Chọn 1 ghế từ 3 ghế để xếp E: $C_3^1 = 3$ cách.
  - $v$: Số hàng chỉ chứa $G$. Tương tự: $C_3^1 = 3$ cách.
  - $w$: Số hàng chỉ chứa $F$. Tương tự: $C_3^1 = 3$ cách.
- *Nhóm Hàng Trống:*
  - $o$: Số hàng không chứa $E, G, F$ nào. Có đúng $1$ cách để trống.

Tổng số chỗ ngồi của $E, G, F$ và tổng số hàng $R$ cho ta hệ phương trình:
$
cases(
  x + y + z + u = E quad &(1) " (Tổng số chỗ E)",
  x + y + t + v = G quad &(2) " (Tổng số chỗ G)",
  x + z + t + w = F quad &(3) " (Tổng số chỗ F)",
  x + y + z + t + u + v + w + o = R quad &(4) " (Tổng số hàng)"
)
$

== 2. Cách biện luận "siêu dễ hiểu" không dùng công thức Max/Min
Từ hệ trên, ta rút các biến lẻ $u, v, w, o$ theo $x, y, z, t$:
$
u = E - x - y - z ; quad v = G - x - y - t ; quad w = F - x - z - t ; quad o = R - E - G - F + 2x + y + z + t
$

*Làm sao để tìm các trường hợp nghiệm (Cases) mà không bị rối?*
Ta luôn duyệt bộ $(x, z, t)$ trước vì $F$ thường nhỏ nhất ($x+z+t \le F$).
Sau đó, với mỗi bộ $(x, z, t)$ cố định, ta tìm biến $y$ bằng tư duy logic thực tế:
- *Giới hạn trên của $y$:* $y$ là số hàng chứa $E$ và $G$. Vậy $y$ không thể vượt quá số lượng E còn dư (là $E-x-z$) và cũng không thể vượt quá số lượng G còn dư (là $G-x-t$). Vậy:
  $y \le E - x - z$ và $y \le G - x - t$.
- *Giới hạn dưới của $y$:* $y$ ít nhất phải bằng 0 ($y \ge 0$). Đồng thời, số hàng trống $o$ không được âm ($o \ge 0$), nên từ công thức của $o$, ta chuyển vế: 
  $y \ge (E + G + F - R) - 2x - z - t$.
  *(Chỉ cần nhẩm đơn giản điều kiện này là xong!)*

#rev-box(title: "⚙️ Thuật toán tóm tắt")[
  - *Bước 1:* Lập bảng biện luận tìm $(x, y, z, t)$, sau đó tính $u, v, w, o$.
  - *Bước 2:* Với mỗi dòng, tính số lượng cấu trúc bằng:
    $ C = underbrace(frac(R!, x! y! z! t! u! v! w! o!), "Công thức Phân bổ Hàng") times underbrace(6^(x+y+z+t), "Xếp ghế (Hệ số 6)") times underbrace(3^(u+v+w), "Xếp ghế (Hệ số 3)") $
  - *Bước 3:* Tính $N_("thỏa mãn") = (sum C) times E! times G! times F! times "Số người còn lại"!$
]

#pagebreak()
= Chương 2 — Hệ thống 12 Bài tập Thực chiến (Cấp độ từ Cơ bản đến Khó)

== Bài toán 1 (Khởi động — Cabin cáp treo: Lưới 3 cột 2 hàng)
*Đề bài:* Một cabin cáp treo có 6 ghế được xếp thành 3 cột 2 hàng. Có 6 hành khách gồm 2 Hướng dẫn viên (cấp E), 1 Khách nước ngoài (cấp G), 1 Khách VIP (cấp F) và 2 khách thường. Tính xác suất $p$ để không có hàng nào chứa quá 1 người cùng cấp E, hoặc cùng cấp G, hoặc cùng cấp F. Tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=2$. Đối tượng: $E=2, G=1, F=1$. Còn lại: $2$ (khách thường).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 2 quad &(E),
      x + y + t + v = 1 quad &(G),
      x + z + t + w = 1 quad &(F),
      x + y + z + t + u + v + w + o = 2 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 2 - x - y - z,
      v = 1 - x - y - t,
      w = 1 - x - z - t,
      o = -2 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 1$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 2 - x - z$ và $y <= 1 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 2 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [1], [1], [0], [0], [0], [0], [0], [$frac(2!, 1! dot 1!) = 2$], [$6^2 = 36$], [*72*],
        [1], [0], [0], [0], [1], [0], [0], [0], [$frac(2!, 1! dot 1!) = 2$], [$6^1 dot 3^1 = 18$], [*36*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 108$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (2! dot 1! dot 1!) dot 2! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(108 dot 2! dot 1! dot 1! dot 2!, 6!)$
    - Rút gọn: $ p = frac(108, P_6^4) dot 2! dot 1! dot 1! approx 0.60000000 $
    - Giá trị $10000p approx 6000.0000 arrow.r$ làm tròn: *6000*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *6000*.
]

#pagebreak()

== Bài toán 2 (Khởi động — Xe Limousine: Lưới 3 cột 3 hàng)
*Đề bài:* Một xe Limousine cao cấp có 9 ghế xếp thành 3 cột 3 hàng. Có 9 hành khách gồm 2 người lớn tuổi (cấp E), 1 phụ nữ có thai (cấp G), 1 trẻ em (cấp F) và 5 thanh niên. Tính xác suất $p$ để mỗi hàng có không quá 1 khách cùng nhóm ưu tiên (cùng E, cùng G, hoặc cùng F). Tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=3$. Đối tượng: $E=2, G=1, F=1$. Còn lại: $5$ (thanh niên).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 2 quad &(E),
      x + y + t + v = 1 quad &(G),
      x + z + t + w = 1 quad &(F),
      x + y + z + t + u + v + w + o = 3 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 2 - x - y - z,
      v = 1 - x - y - t,
      w = 1 - x - z - t,
      o = -1 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 1$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 2 - x - z$ và $y <= 1 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 1 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [1], [0], [0], [1], [0], [1], [0], [$frac(3!, 1! dot 1! dot 1!) = 6$], [$6^1 dot 3^2 = 54$], [*324*],
        [0], [0], [0], [1], [2], [0], [0], [0], [$frac(3!, 1! dot 2!) = 3$], [$6^1 dot 3^2 = 54$], [*162*],
        [0], [0], [1], [0], [1], [1], [0], [0], [$frac(3!, 1! dot 1! dot 1!) = 6$], [$6^1 dot 3^2 = 54$], [*324*],
        [0], [1], [1], [0], [0], [0], [0], [1], [$frac(3!, 1! dot 1! dot 1!) = 6$], [$6^2 = 36$], [*216*],
        [1], [0], [0], [0], [1], [0], [0], [1], [$frac(3!, 1! dot 1! dot 1!) = 6$], [$6^1 dot 3^1 = 18$], [*108*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 1134$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (2! dot 1! dot 1!) dot 5! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(1134 dot 2! dot 1! dot 1! dot 5!, 9!)$
    - Rút gọn: $ p = frac(1134, P_9^4) dot 2! dot 1! dot 1! approx 0.75000000 $
    - Giá trị $10000p approx 7500.0000 arrow.r$ làm tròn: *7500*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *7500*.
]

#pagebreak()

== Bài toán 3 (Dễ — Phòng họp Hội đồng Quản trị: Lưới 3 cột 4 hàng)
*Đề bài:* Một phòng họp có 12 chiếc ghế được xếp thành 3 cột 4 hàng. Có 12 đại biểu tham dự gồm 2 thành viên HĐQT (cấp E), 1 Giám đốc (cấp G), 1 Phó giám đốc (cấp F) và 8 nhân viên thường. Tính xác suất $p$ để không có hàng nào chứa quá 1 người cùng cấp E, hoặc cùng cấp G, hoặc cùng cấp F. Tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=4$. Đối tượng: $E=2, G=1, F=1$. Còn lại: $8$ (nhân viên thường).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 2 quad &(E),
      x + y + t + v = 1 quad &(G),
      x + z + t + w = 1 quad &(F),
      x + y + z + t + u + v + w + o = 4 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 2 - x - y - z,
      v = 1 - x - y - t,
      w = 1 - x - z - t,
      o = 0 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 1$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 2 - x - z$ và $y <= 1 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 0 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [0], [0], [0], [2], [1], [1], [0], [$frac(4!, 2! dot 1! dot 1!) = 12$], [$3^4 = 81$], [*972*],
        [0], [1], [0], [0], [1], [0], [1], [1], [$frac(4!, 1! dot 1! dot 1! dot 1!) = 24$], [$6^1 dot 3^2 = 54$], [*1,296*],
        [0], [0], [0], [1], [2], [0], [0], [1], [$frac(4!, 1! dot 2! dot 1!) = 12$], [$6^1 dot 3^2 = 54$], [*648*],
        [0], [0], [1], [0], [1], [1], [0], [1], [$frac(4!, 1! dot 1! dot 1! dot 1!) = 24$], [$6^1 dot 3^2 = 54$], [*1,296*],
        [0], [1], [1], [0], [0], [0], [0], [2], [$frac(4!, 1! dot 1! dot 2!) = 12$], [$6^2 = 36$], [*432*],
        [1], [0], [0], [0], [1], [0], [0], [2], [$frac(4!, 1! dot 1! dot 2!) = 12$], [$6^1 dot 3^1 = 18$], [*216*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 4860$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (2! dot 1! dot 1!) dot 8! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(4860 dot 2! dot 1! dot 1! dot 8!, 12!)$
    - Rút gọn: $ p = frac(4860, P_12^4) dot 2! dot 1! dot 1! approx 0.81818182 $
    - Giá trị $10000p approx 8181.8182 arrow.r$ làm tròn: *8182*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *8182*.
]

#pagebreak()

== Bài toán 4 (Dễ — Phân bổ Rạp chiếu phim: Lưới 3 cột 4 hàng)
*Đề bài:* Một rạp chiếu phim mini có 12 ghế xếp thành 3 cột 4 hàng. Có 12 khách hàng gồm 3 khách VIP, 2 khách Hạng A, 1 khách Hạng B và 6 khách thường. Tính xác suất $p$ để mỗi hàng có không quá 1 khách cùng hạng (cùng VIP, cùng A, hoặc cùng B). Tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=4$. Đối tượng: $E=3, G=2, F=1$. Còn lại: $6$ (khách thường).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 3 quad &(E),
      x + y + t + v = 2 quad &(G),
      x + z + t + w = 1 quad &(F),
      x + y + z + t + u + v + w + o = 4 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 3 - x - y - z,
      v = 2 - x - y - t,
      w = 1 - x - z - t,
      o = -2 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 1$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 3 - x - z$ và $y <= 2 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 2 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [2], [0], [0], [1], [0], [1], [0], [$frac(4!, 2! dot 1! dot 1!) = 12$], [$6^2 dot 3^2 = 324$], [*3,888*],
        [0], [1], [0], [1], [2], [0], [0], [0], [$frac(4!, 1! dot 1! dot 2!) = 12$], [$6^2 dot 3^2 = 324$], [*3,888*],
        [0], [1], [1], [0], [1], [1], [0], [0], [$frac(4!, 1! dot 1! dot 1! dot 1!) = 24$], [$6^2 dot 3^2 = 324$], [*7,776*],
        [0], [2], [1], [0], [0], [0], [0], [1], [$frac(4!, 2! dot 1! dot 1!) = 12$], [$6^3 = 216$], [*2,592*],
        [1], [0], [0], [0], [2], [1], [0], [0], [$frac(4!, 1! dot 2! dot 1!) = 12$], [$6^1 dot 3^3 = 162$], [*1,944*],
        [1], [1], [0], [0], [1], [0], [0], [1], [$frac(4!, 1! dot 1! dot 1! dot 1!) = 24$], [$6^2 dot 3^1 = 108$], [*2,592*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 22680$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (3! dot 2! dot 1!) dot 6! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(22680 dot 3! dot 2! dot 1! dot 6!, 12!)$
    - Rút gọn: $ p = frac(22680, P_12^6) dot 3! dot 2! dot 1! approx 0.40909091 $
    - Giá trị $10000p approx 4090.9091 arrow.r$ làm tròn: *4091*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *4091*.
]

#pagebreak()

== Bài toán 5 (Trung bình — Khoang hành khách Máy bay: Lưới 3 cột 5 hàng)
*Đề bài:* Khoang hạng nhất của một máy bay có 15 ghế xếp thành 3 cột 5 hàng. Có 3 khách Thương gia, 2 khách Đặc biệt, 1 khách Thẻ vàng và 9 khách Thẻ bạc. Xếp ngẫu nhiên 15 hành khách này vào ghế. Tính xác suất $p$ để không có hàng nào chứa quá 1 khách cùng hạng Thương gia, hoặc cùng Đặc biệt, hoặc cùng Thẻ vàng. Tính $10000p$ (làm tròn kết quả đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=5$. Đối tượng: $E=3, G=2, F=1$. Còn lại: $9$ (khách Thẻ bạc).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 3 quad &(E),
      x + y + t + v = 2 quad &(G),
      x + z + t + w = 1 quad &(F),
      x + y + z + t + u + v + w + o = 5 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 3 - x - y - z,
      v = 2 - x - y - t,
      w = 1 - x - z - t,
      o = -1 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 1$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 3 - x - z$ và $y <= 2 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 1 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [1], [0], [0], [2], [1], [1], [0], [$frac(5!, 1! dot 2! dot 1! dot 1!) = 60$], [$6^1 dot 3^4 = 486$], [*29,160*],
        [0], [2], [0], [0], [1], [0], [1], [1], [$frac(5!, 2! dot 1! dot 1! dot 1!) = 60$], [$6^2 dot 3^2 = 324$], [*19,440*],
        [0], [0], [0], [1], [3], [1], [0], [0], [$frac(5!, 1! dot 3! dot 1!) = 20$], [$6^1 dot 3^4 = 486$], [*9,720*],
        [0], [1], [0], [1], [2], [0], [0], [1], [$frac(5!, 1! dot 1! dot 2! dot 1!) = 60$], [$6^2 dot 3^2 = 324$], [*19,440*],
        [0], [0], [1], [0], [2], [2], [0], [0], [$frac(5!, 1! dot 2! dot 2!) = 30$], [$6^1 dot 3^4 = 486$], [*14,580*],
        [0], [1], [1], [0], [1], [1], [0], [1], [$frac(5!, 1! dot 1! dot 1! dot 1! dot 1!) = 120$], [$6^2 dot 3^2 = 324$], [*38,880*],
        [0], [2], [1], [0], [0], [0], [0], [2], [$frac(5!, 2! dot 1! dot 2!) = 30$], [$6^3 = 216$], [*6,480*],
        [1], [0], [0], [0], [2], [1], [0], [1], [$frac(5!, 1! dot 2! dot 1! dot 1!) = 60$], [$6^1 dot 3^3 = 162$], [*9,720*],
        [1], [1], [0], [0], [1], [0], [0], [2], [$frac(5!, 1! dot 1! dot 1! dot 2!) = 60$], [$6^2 dot 3^1 = 108$], [*6,480*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 153900$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (3! dot 2! dot 1!) dot 9! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(153900 dot 3! dot 2! dot 1! dot 9!, 15!)$
    - Rút gọn: $ p = frac(153900, P_15^6) dot 3! dot 2! dot 1! approx 0.51248751 $
    - Giá trị $10000p approx 5124.8751 arrow.r$ làm tròn: *5125*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *5125*.
]

#pagebreak()

== Bài toán 6 (Trung bình — Bố trí phòng thi chuẩn: Lưới 3 cột 5 hàng)
*Đề bài:* Một phòng thi có 15 bàn xếp thành 3 cột 5 hàng. Có 15 thí sinh gồm 3 học sinh xuất sắc, 2 học sinh giỏi, 2 học sinh khá và 8 học sinh trung bình. Để đảm bảo phân loại, giám thị xếp chỗ ngẫu nhiên sao cho xác suất $p$ là khả năng không có hàng nào chứa quá 1 thí sinh cùng nhóm (xuất sắc, giỏi, khá). Tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=5$. Đối tượng: $E=3, G=2, F=2$. Còn lại: $8$ (học sinh trung bình).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 3 quad &(E),
      x + y + t + v = 2 quad &(G),
      x + z + t + w = 2 quad &(F),
      x + y + z + t + u + v + w + o = 5 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 3 - x - y - z,
      v = 2 - x - y - t,
      w = 2 - x - z - t,
      o = -2 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 2$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 3 - x - z$ và $y <= 2 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 2 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [2], [0], [0], [1], [0], [2], [0], [$frac(5!, 2! dot 1! dot 2!) = 30$], [$6^2 dot 3^3 = 972$], [*29,160*],
        [0], [1], [0], [1], [2], [0], [1], [0], [$frac(5!, 1! dot 1! dot 2! dot 1!) = 60$], [$6^2 dot 3^3 = 972$], [*58,320*],
        [0], [0], [0], [2], [3], [0], [0], [0], [$frac(5!, 2! dot 3!) = 10$], [$6^2 dot 3^3 = 972$], [*9,720*],
        [0], [1], [1], [0], [1], [1], [1], [0], [$frac(5!, 1! dot 1! dot 1! dot 1! dot 1!) = 120$], [$6^2 dot 3^3 = 972$], [*116,640*],
        [0], [2], [1], [0], [0], [0], [1], [1], [$frac(5!, 2! dot 1! dot 1! dot 1!) = 60$], [$6^3 dot 3^1 = 648$], [*38,880*],
        [0], [0], [1], [1], [2], [1], [0], [0], [$frac(5!, 1! dot 1! dot 2! dot 1!) = 60$], [$6^2 dot 3^3 = 972$], [*58,320*],
        [0], [1], [1], [1], [1], [0], [0], [1], [$frac(5!, 1! dot 1! dot 1! dot 1! dot 1!) = 120$], [$6^3 dot 3^1 = 648$], [*77,760*],
        [0], [0], [2], [0], [1], [2], [0], [0], [$frac(5!, 2! dot 1! dot 2!) = 30$], [$6^2 dot 3^3 = 972$], [*29,160*],
        [0], [1], [2], [0], [0], [1], [0], [1], [$frac(5!, 1! dot 2! dot 1! dot 1!) = 60$], [$6^3 dot 3^1 = 648$], [*38,880*],
        [1], [0], [0], [0], [2], [1], [1], [0], [$frac(5!, 1! dot 2! dot 1! dot 1!) = 60$], [$6^1 dot 3^4 = 486$], [*29,160*],
        [1], [1], [0], [0], [1], [0], [1], [1], [$frac(5!, 1! dot 1! dot 1! dot 1! dot 1!) = 120$], [$6^2 dot 3^2 = 324$], [*38,880*],
        [1], [0], [0], [1], [2], [0], [0], [1], [$frac(5!, 1! dot 1! dot 2! dot 1!) = 60$], [$6^2 dot 3^2 = 324$], [*19,440*],
        [1], [0], [1], [0], [1], [1], [0], [1], [$frac(5!, 1! dot 1! dot 1! dot 1! dot 1!) = 120$], [$6^2 dot 3^2 = 324$], [*38,880*],
        [1], [1], [1], [0], [0], [0], [0], [2], [$frac(5!, 1! dot 1! dot 1! dot 2!) = 60$], [$6^3 = 216$], [*12,960*],
        [2], [0], [0], [0], [1], [0], [0], [2], [$frac(5!, 2! dot 1! dot 2!) = 30$], [$6^2 dot 3^1 = 108$], [*3,240*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 599400$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (3! dot 2! dot 2!) dot 8! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(599400 dot 3! dot 2! dot 2! dot 8!, 15!)$
    - Rút gọn: $ p = frac(599400, P_15^7) dot 3! dot 2! dot 2! approx 0.44355644 $
    - Giá trị $10000p approx 4435.5644 arrow.r$ làm tròn: *4436*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *4436*.
]

#pagebreak()

== Bài toán 7 (Khá — Xếp chỗ sự kiện Nhà hàng: Lưới 3 cột 6 hàng)
*Đề bài:* Nhà hàng chuẩn bị 18 ghế (3 cột 6 hàng) cho một sự kiện kín. Danh sách khách mời gồm 3 khách hạng Kim cương, 3 khách hạng Vàng, 2 khách hạng Bạc và 10 khách hạng Tiêu chuẩn. Xếp chỗ ngẫu nhiên cho toàn bộ khách. Tính xác suất $p$ để không có hàng nào có từ 2 khách trở lên cùng hạng Kim cương, cùng Vàng, hoặc cùng Bạc. Tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=6$. Đối tượng: $E=3, G=3, F=2$. Còn lại: $10$ (khách hạng Tiêu chuẩn).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 3 quad &(E),
      x + y + t + v = 3 quad &(G),
      x + z + t + w = 2 quad &(F),
      x + y + z + t + u + v + w + o = 6 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 3 - x - y - z,
      v = 3 - x - y - t,
      w = 2 - x - z - t,
      o = -2 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 2$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 3 - x - z$ và $y <= 3 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 2 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [2], [0], [0], [1], [1], [2], [0], [$frac(6!, 2! dot 1! dot 1! dot 2!) = 180$], [$6^2 dot 3^4 = 2916$], [*524,880*],
        [0], [3], [0], [0], [0], [0], [2], [1], [$frac(6!, 3! dot 2! dot 1!) = 60$], [$6^3 dot 3^2 = 1944$], [*116,640*],
        [0], [1], [0], [1], [2], [1], [1], [0], [$frac(6!, 1! dot 1! dot 2! dot 1! dot 1!) = 360$], [$6^2 dot 3^4 = 2916$], [*1,049,760*],
        [0], [2], [0], [1], [1], [0], [1], [1], [$frac(6!, 2! dot 1! dot 1! dot 1! dot 1!) = 360$], [$6^3 dot 3^2 = 1944$], [*699,840*],
        [0], [0], [0], [2], [3], [1], [0], [0], [$frac(6!, 2! dot 3! dot 1!) = 60$], [$6^2 dot 3^4 = 2916$], [*174,960*],
        [0], [1], [0], [2], [2], [0], [0], [1], [$frac(6!, 1! dot 2! dot 2! dot 1!) = 180$], [$6^3 dot 3^2 = 1944$], [*349,920*],
        [0], [1], [1], [0], [1], [2], [1], [0], [$frac(6!, 1! dot 1! dot 1! dot 2! dot 1!) = 360$], [$6^2 dot 3^4 = 2916$], [*1,049,760*],
        [0], [2], [1], [0], [0], [1], [1], [1], [$frac(6!, 2! dot 1! dot 1! dot 1! dot 1!) = 360$], [$6^3 dot 3^2 = 1944$], [*699,840*],
        [0], [0], [1], [1], [2], [2], [0], [0], [$frac(6!, 1! dot 1! dot 2! dot 2!) = 180$], [$6^2 dot 3^4 = 2916$], [*524,880*],
        [0], [1], [1], [1], [1], [1], [0], [1], [$frac(6!, 1! dot 1! dot 1! dot 1! dot 1! dot 1!) = 720$], [$6^3 dot 3^2 = 1944$], [*1,399,680*],
        [0], [2], [1], [1], [0], [0], [0], [2], [$frac(6!, 2! dot 1! dot 1! dot 2!) = 180$], [$6^4 = 1296$], [*233,280*],
        [0], [0], [2], [0], [1], [3], [0], [0], [$frac(6!, 2! dot 1! dot 3!) = 60$], [$6^2 dot 3^4 = 2916$], [*174,960*],
        [0], [1], [2], [0], [0], [2], [0], [1], [$frac(6!, 1! dot 2! dot 2! dot 1!) = 180$], [$6^3 dot 3^2 = 1944$], [*349,920*],
        [1], [0], [0], [0], [2], [2], [1], [0], [$frac(6!, 1! dot 2! dot 2! dot 1!) = 180$], [$6^1 dot 3^5 = 1458$], [*262,440*],
        [1], [1], [0], [0], [1], [1], [1], [1], [$frac(6!, 1! dot 1! dot 1! dot 1! dot 1! dot 1!) = 720$], [$6^2 dot 3^3 = 972$], [*699,840*],
        [1], [2], [0], [0], [0], [0], [1], [2], [$frac(6!, 1! dot 2! dot 1! dot 2!) = 180$], [$6^3 dot 3^1 = 648$], [*116,640*],
        [1], [0], [0], [1], [2], [1], [0], [1], [$frac(6!, 1! dot 1! dot 2! dot 1! dot 1!) = 360$], [$6^2 dot 3^3 = 972$], [*349,920*],
        [1], [1], [0], [1], [1], [0], [0], [2], [$frac(6!, 1! dot 1! dot 1! dot 1! dot 2!) = 360$], [$6^3 dot 3^1 = 648$], [*233,280*],
        [1], [0], [1], [0], [1], [2], [0], [1], [$frac(6!, 1! dot 1! dot 1! dot 2! dot 1!) = 360$], [$6^2 dot 3^3 = 972$], [*349,920*],
        [1], [1], [1], [0], [0], [1], [0], [2], [$frac(6!, 1! dot 1! dot 1! dot 1! dot 2!) = 360$], [$6^3 dot 3^1 = 648$], [*233,280*],
        [2], [0], [0], [0], [1], [1], [0], [2], [$frac(6!, 2! dot 1! dot 1! dot 2!) = 180$], [$6^2 dot 3^2 = 324$], [*58,320*],
        [2], [1], [0], [0], [0], [0], [0], [3], [$frac(6!, 2! dot 1! dot 3!) = 60$], [$6^3 = 216$], [*12,960*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 9664920$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (3! dot 3! dot 2!) dot 10! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(9664920 dot 3! dot 3! dot 2! dot 10!, 18!)$
    - Rút gọn: $ p = frac(9664920, P_18^8) dot 3! dot 3! dot 2! approx 0.39441441 $
    - Giá trị $10000p approx 3944.1441 arrow.r$ làm tròn: *3944*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *3944*.
]

#pagebreak()

== Bài toán 8 (Khá — Cuộc họp Đại hội đồng: Lưới 3 cột 6 hàng)
*Đề bài:* Một hội trường có 18 ghế xếp thành 3 cột 6 hàng. Trong cuộc họp có 4 Bộ trưởng, 3 Thứ trưởng, 2 Cục trưởng và 9 chuyên viên. Ban tổ chức xếp chỗ ngẫu nhiên 18 người. Tính xác suất $p$ để mỗi hàng có không quá 1 người cùng chức vụ (Bộ trưởng, Thứ trưởng, Cục trưởng). Tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=6$. Đối tượng: $E=4, G=3, F=2$. Còn lại: $9$ (chuyên viên).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 4 quad &(E),
      x + y + t + v = 3 quad &(G),
      x + z + t + w = 2 quad &(F),
      x + y + z + t + u + v + w + o = 6 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 4 - x - y - z,
      v = 3 - x - y - t,
      w = 2 - x - z - t,
      o = -3 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 2$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 4 - x - z$ và $y <= 3 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 3 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [3], [0], [0], [1], [0], [2], [0], [$frac(6!, 3! dot 1! dot 2!) = 60$], [$6^3 dot 3^3 = 5832$], [*349,920*],
        [0], [2], [0], [1], [2], [0], [1], [0], [$frac(6!, 2! dot 1! dot 2! dot 1!) = 180$], [$6^3 dot 3^3 = 5832$], [*1,049,760*],
        [0], [1], [0], [2], [3], [0], [0], [0], [$frac(6!, 1! dot 2! dot 3!) = 60$], [$6^3 dot 3^3 = 5832$], [*349,920*],
        [0], [2], [1], [0], [1], [1], [1], [0], [$frac(6!, 2! dot 1! dot 1! dot 1! dot 1!) = 360$], [$6^3 dot 3^3 = 5832$], [*2,099,520*],
        [0], [3], [1], [0], [0], [0], [1], [1], [$frac(6!, 3! dot 1! dot 1! dot 1!) = 120$], [$6^4 dot 3^1 = 3888$], [*466,560*],
        [0], [1], [1], [1], [2], [1], [0], [0], [$frac(6!, 1! dot 1! dot 1! dot 2! dot 1!) = 360$], [$6^3 dot 3^3 = 5832$], [*2,099,520*],
        [0], [2], [1], [1], [1], [0], [0], [1], [$frac(6!, 2! dot 1! dot 1! dot 1! dot 1!) = 360$], [$6^4 dot 3^1 = 3888$], [*1,399,680*],
        [0], [1], [2], [0], [1], [2], [0], [0], [$frac(6!, 1! dot 2! dot 1! dot 2!) = 180$], [$6^3 dot 3^3 = 5832$], [*1,049,760*],
        [0], [2], [2], [0], [0], [1], [0], [1], [$frac(6!, 2! dot 2! dot 1! dot 1!) = 180$], [$6^4 dot 3^1 = 3888$], [*699,840*],
        [1], [1], [0], [0], [2], [1], [1], [0], [$frac(6!, 1! dot 1! dot 2! dot 1! dot 1!) = 360$], [$6^2 dot 3^4 = 2916$], [*1,049,760*],
        [1], [2], [0], [0], [1], [0], [1], [1], [$frac(6!, 1! dot 2! dot 1! dot 1! dot 1!) = 360$], [$6^3 dot 3^2 = 1944$], [*699,840*],
        [1], [0], [0], [1], [3], [1], [0], [0], [$frac(6!, 1! dot 1! dot 3! dot 1!) = 120$], [$6^2 dot 3^4 = 2916$], [*349,920*],
        [1], [1], [0], [1], [2], [0], [0], [1], [$frac(6!, 1! dot 1! dot 1! dot 2! dot 1!) = 360$], [$6^3 dot 3^2 = 1944$], [*699,840*],
        [1], [0], [1], [0], [2], [2], [0], [0], [$frac(6!, 1! dot 1! dot 2! dot 2!) = 180$], [$6^2 dot 3^4 = 2916$], [*524,880*],
        [1], [1], [1], [0], [1], [1], [0], [1], [$frac(6!, 1! dot 1! dot 1! dot 1! dot 1! dot 1!) = 720$], [$6^3 dot 3^2 = 1944$], [*1,399,680*],
        [1], [2], [1], [0], [0], [0], [0], [2], [$frac(6!, 1! dot 2! dot 1! dot 2!) = 180$], [$6^4 = 1296$], [*233,280*],
        [2], [0], [0], [0], [2], [1], [0], [1], [$frac(6!, 2! dot 2! dot 1! dot 1!) = 180$], [$6^2 dot 3^3 = 972$], [*174,960*],
        [2], [1], [0], [0], [1], [0], [0], [2], [$frac(6!, 2! dot 1! dot 1! dot 2!) = 180$], [$6^3 dot 3^1 = 648$], [*116,640*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 14813280$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (4! dot 3! dot 2!) dot 9! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(14813280 dot 4! dot 3! dot 2! dot 9!, 18!)$
    - Rút gọn: $ p = frac(14813280, P_18^9) dot 4! dot 3! dot 2! approx 0.24180525 $
    - Giá trị $10000p approx 2418.0525 arrow.r$ làm tròn: *2418*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *2418*.
]

#pagebreak()

== Bài toán 9 (Khó — Tuyển sinh Học bổng: Lưới 3 cột 7 hàng)
*Đề bài:* Vòng phỏng vấn học bổng có 21 thí sinh gồm 4 sinh viên Y khoa, 3 sinh viên Bách khoa, 2 sinh viên Sư phạm và 12 sinh viên Kinh tế. Phòng chờ có 21 ghế xếp 3 cột 7 hàng. Xếp chỗ ngẫu nhiên. Tính xác suất $p$ để không có hàng nào có từ 2 sinh viên trở lên học cùng trường Y khoa, hoặc cùng Bách khoa, hoặc cùng Sư phạm. Tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=7$. Đối tượng: $E=4, G=3, F=2$. Còn lại: $12$ (sinh viên Kinh tế).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 4 quad &(E),
      x + y + t + v = 3 quad &(G),
      x + z + t + w = 2 quad &(F),
      x + y + z + t + u + v + w + o = 7 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 4 - x - y - z,
      v = 3 - x - y - t,
      w = 2 - x - z - t,
      o = -2 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 2$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 4 - x - z$ và $y <= 3 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 2 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [2], [0], [0], [2], [1], [2], [0], [$frac(7!, 2! dot 2! dot 1! dot 2!) = 630$], [$6^2 dot 3^5 = 8748$], [*5,511,240*],
        [0], [3], [0], [0], [1], [0], [2], [1], [$frac(7!, 3! dot 1! dot 2! dot 1!) = 420$], [$6^3 dot 3^3 = 5832$], [*2,449,440*],
        [0], [1], [0], [1], [3], [1], [1], [0], [$frac(7!, 1! dot 1! dot 3! dot 1! dot 1!) = 840$], [$6^2 dot 3^5 = 8748$], [*7,348,320*],
        [0], [2], [0], [1], [2], [0], [1], [1], [$frac(7!, 2! dot 1! dot 2! dot 1! dot 1!) = 1260$], [$6^3 dot 3^3 = 5832$], [*7,348,320*],
        [0], [0], [0], [2], [4], [1], [0], [0], [$frac(7!, 2! dot 4! dot 1!) = 105$], [$6^2 dot 3^5 = 8748$], [*918,540*],
        [0], [1], [0], [2], [3], [0], [0], [1], [$frac(7!, 1! dot 2! dot 3! dot 1!) = 420$], [$6^3 dot 3^3 = 5832$], [*2,449,440*],
        [0], [1], [1], [0], [2], [2], [1], [0], [$frac(7!, 1! dot 1! dot 2! dot 2! dot 1!) = 1260$], [$6^2 dot 3^5 = 8748$], [*11,022,480*],
        [0], [2], [1], [0], [1], [1], [1], [1], [$frac(7!, 2! dot 1! dot 1! dot 1! dot 1! dot 1!) = 2520$], [$6^3 dot 3^3 = 5832$], [*14,696,640*],
        [0], [3], [1], [0], [0], [0], [1], [2], [$frac(7!, 3! dot 1! dot 1! dot 2!) = 420$], [$6^4 dot 3^1 = 3888$], [*1,632,960*],
        [0], [0], [1], [1], [3], [2], [0], [0], [$frac(7!, 1! dot 1! dot 3! dot 2!) = 420$], [$6^2 dot 3^5 = 8748$], [*3,674,160*],
        [0], [1], [1], [1], [2], [1], [0], [1], [$frac(7!, 1! dot 1! dot 1! dot 2! dot 1! dot 1!) = 2520$], [$6^3 dot 3^3 = 5832$], [*14,696,640*],
        [0], [2], [1], [1], [1], [0], [0], [2], [$frac(7!, 2! dot 1! dot 1! dot 1! dot 2!) = 1260$], [$6^4 dot 3^1 = 3888$], [*4,898,880*],
        [0], [0], [2], [0], [2], [3], [0], [0], [$frac(7!, 2! dot 2! dot 3!) = 210$], [$6^2 dot 3^5 = 8748$], [*1,837,080*],
        [0], [1], [2], [0], [1], [2], [0], [1], [$frac(7!, 1! dot 2! dot 1! dot 2! dot 1!) = 1260$], [$6^3 dot 3^3 = 5832$], [*7,348,320*],
        [0], [2], [2], [0], [0], [1], [0], [2], [$frac(7!, 2! dot 2! dot 1! dot 2!) = 630$], [$6^4 dot 3^1 = 3888$], [*2,449,440*],
        [1], [0], [0], [0], [3], [2], [1], [0], [$frac(7!, 1! dot 3! dot 2! dot 1!) = 420$], [$6^1 dot 3^6 = 4374$], [*1,837,080*],
        [1], [1], [0], [0], [2], [1], [1], [1], [$frac(7!, 1! dot 1! dot 2! dot 1! dot 1! dot 1!) = 2520$], [$6^2 dot 3^4 = 2916$], [*7,348,320*],
        [1], [2], [0], [0], [1], [0], [1], [2], [$frac(7!, 1! dot 2! dot 1! dot 1! dot 2!) = 1260$], [$6^3 dot 3^2 = 1944$], [*2,449,440*],
        [1], [0], [0], [1], [3], [1], [0], [1], [$frac(7!, 1! dot 1! dot 3! dot 1! dot 1!) = 840$], [$6^2 dot 3^4 = 2916$], [*2,449,440*],
        [1], [1], [0], [1], [2], [0], [0], [2], [$frac(7!, 1! dot 1! dot 1! dot 2! dot 2!) = 1260$], [$6^3 dot 3^2 = 1944$], [*2,449,440*],
        [1], [0], [1], [0], [2], [2], [0], [1], [$frac(7!, 1! dot 1! dot 2! dot 2! dot 1!) = 1260$], [$6^2 dot 3^4 = 2916$], [*3,674,160*],
        [1], [1], [1], [0], [1], [1], [0], [2], [$frac(7!, 1! dot 1! dot 1! dot 1! dot 1! dot 2!) = 2520$], [$6^3 dot 3^2 = 1944$], [*4,898,880*],
        [1], [2], [1], [0], [0], [0], [0], [3], [$frac(7!, 1! dot 2! dot 1! dot 3!) = 420$], [$6^4 = 1296$], [*544,320*],
        [2], [0], [0], [0], [2], [1], [0], [2], [$frac(7!, 2! dot 2! dot 1! dot 2!) = 630$], [$6^2 dot 3^3 = 972$], [*612,360*],
        [2], [1], [0], [0], [1], [0], [0], [3], [$frac(7!, 2! dot 1! dot 1! dot 3!) = 420$], [$6^3 dot 3^1 = 648$], [*272,160*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 114817500$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (4! dot 3! dot 2!) dot 12! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(114817500 dot 4! dot 3! dot 2! dot 12!, 21!)$
    - Rút gọn: $ p = frac(114817500, P_21^9) dot 4! dot 3! dot 2! approx 0.31002279 $
    - Giá trị $10000p approx 3100.2279 arrow.r$ làm tròn: *3100*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *3100*.
]

#pagebreak()

== Bài toán 10 (Khó — Phân bổ đội hình Diễn tập: Lưới 3 cột 7 hàng)
*Đề bài:* Một phân đội có 21 binh sĩ, trong đó có 5 đội trưởng, 4 lính bắn tỉa, 2 lính quân y và 10 lính bộ binh. Họ được xếp đội hình ngẫu nhiên vào 21 vị trí tạo thành 3 cột 7 hàng. Tính xác suất $p$ để không có hàng nào chứa quá 1 đội trưởng, hoặc quá 1 lính bắn tỉa, hoặc quá 1 lính quân y. Tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=7$. Đối tượng: $E=5, G=4, F=2$. Còn lại: $10$ (lính bộ binh).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 5 quad &(E),
      x + y + t + v = 4 quad &(G),
      x + z + t + w = 2 quad &(F),
      x + y + z + t + u + v + w + o = 7 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 5 - x - y - z,
      v = 4 - x - y - t,
      w = 2 - x - z - t,
      o = -4 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 2$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 5 - x - z$ và $y <= 4 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 4 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [4], [0], [0], [1], [0], [2], [0], [$frac(7!, 4! dot 1! dot 2!) = 105$], [$6^4 dot 3^3 = 34992$], [*3,674,160*],
        [0], [3], [0], [1], [2], [0], [1], [0], [$frac(7!, 3! dot 1! dot 2! dot 1!) = 420$], [$6^4 dot 3^3 = 34992$], [*14,696,640*],
        [0], [2], [0], [2], [3], [0], [0], [0], [$frac(7!, 2! dot 2! dot 3!) = 210$], [$6^4 dot 3^3 = 34992$], [*7,348,320*],
        [0], [3], [1], [0], [1], [1], [1], [0], [$frac(7!, 3! dot 1! dot 1! dot 1! dot 1!) = 840$], [$6^4 dot 3^3 = 34992$], [*29,393,280*],
        [0], [4], [1], [0], [0], [0], [1], [1], [$frac(7!, 4! dot 1! dot 1! dot 1!) = 210$], [$6^5 dot 3^1 = 23328$], [*4,898,880*],
        [0], [2], [1], [1], [2], [1], [0], [0], [$frac(7!, 2! dot 1! dot 1! dot 2! dot 1!) = 1260$], [$6^4 dot 3^3 = 34992$], [*44,089,920*],
        [0], [3], [1], [1], [1], [0], [0], [1], [$frac(7!, 3! dot 1! dot 1! dot 1! dot 1!) = 840$], [$6^5 dot 3^1 = 23328$], [*19,595,520*],
        [0], [2], [2], [0], [1], [2], [0], [0], [$frac(7!, 2! dot 2! dot 1! dot 2!) = 630$], [$6^4 dot 3^3 = 34992$], [*22,044,960*],
        [0], [3], [2], [0], [0], [1], [0], [1], [$frac(7!, 3! dot 2! dot 1! dot 1!) = 420$], [$6^5 dot 3^1 = 23328$], [*9,797,760*],
        [1], [2], [0], [0], [2], [1], [1], [0], [$frac(7!, 1! dot 2! dot 2! dot 1! dot 1!) = 1260$], [$6^3 dot 3^4 = 17496$], [*22,044,960*],
        [1], [3], [0], [0], [1], [0], [1], [1], [$frac(7!, 1! dot 3! dot 1! dot 1! dot 1!) = 840$], [$6^4 dot 3^2 = 11664$], [*9,797,760*],
        [1], [1], [0], [1], [3], [1], [0], [0], [$frac(7!, 1! dot 1! dot 1! dot 3! dot 1!) = 840$], [$6^3 dot 3^4 = 17496$], [*14,696,640*],
        [1], [2], [0], [1], [2], [0], [0], [1], [$frac(7!, 1! dot 2! dot 1! dot 2! dot 1!) = 1260$], [$6^4 dot 3^2 = 11664$], [*14,696,640*],
        [1], [1], [1], [0], [2], [2], [0], [0], [$frac(7!, 1! dot 1! dot 1! dot 2! dot 2!) = 1260$], [$6^3 dot 3^4 = 17496$], [*22,044,960*],
        [1], [2], [1], [0], [1], [1], [0], [1], [$frac(7!, 1! dot 2! dot 1! dot 1! dot 1! dot 1!) = 2520$], [$6^4 dot 3^2 = 11664$], [*29,393,280*],
        [1], [3], [1], [0], [0], [0], [0], [2], [$frac(7!, 1! dot 3! dot 1! dot 2!) = 420$], [$6^5 = 7776$], [*3,265,920*],
        [2], [0], [0], [0], [3], [2], [0], [0], [$frac(7!, 2! dot 3! dot 2!) = 210$], [$6^2 dot 3^5 = 8748$], [*1,837,080*],
        [2], [1], [0], [0], [2], [1], [0], [1], [$frac(7!, 2! dot 1! dot 2! dot 1! dot 1!) = 1260$], [$6^3 dot 3^3 = 5832$], [*7,348,320*],
        [2], [2], [0], [0], [1], [0], [0], [2], [$frac(7!, 2! dot 2! dot 1! dot 2!) = 630$], [$6^4 dot 3^1 = 3888$], [*2,449,440*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 283114440$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (5! dot 4! dot 2!) dot 10! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(283114440 dot 5! dot 4! dot 2! dot 10!, 21!)$
    - Rút gọn: $ p = frac(283114440, P_21^11) dot 5! dot 4! dot 2! approx 0.11582535 $
    - Giá trị $10000p approx 1158.2535 arrow.r$ làm tròn: *1158*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *1158*.
]

#pagebreak()

== Bài toán 11 (Thách thức — Buổi hoà nhạc Giao hưởng: Lưới 3 cột 8 hàng)
*Đề bài:* Trên khán đài VIP của một buổi hoà nhạc có 24 ghế xếp thành 3 cột 8 hàng. Có 5 Nhạc trưởng, 3 Ca sĩ opera, 2 Nghệ sĩ vĩ cầm và 14 khán giả. Xếp chỗ ngẫu nhiên 24 người. Tính xác suất $p$ để mỗi hàng ghế không có quá một người cùng chức danh (Nhạc trưởng, Ca sĩ opera, Nghệ sĩ vĩ cầm). Tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=8$. Đối tượng: $E=5, G=3, F=2$. Còn lại: $14$ (khán giả).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 5 quad &(E),
      x + y + t + v = 3 quad &(G),
      x + z + t + w = 2 quad &(F),
      x + y + z + t + u + v + w + o = 8 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 5 - x - y - z,
      v = 3 - x - y - t,
      w = 2 - x - z - t,
      o = -2 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 2$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 5 - x - z$ và $y <= 3 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 2 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [2], [0], [0], [3], [1], [2], [0], [$frac(8!, 2! dot 3! dot 1! dot 2!) = 1680$], [$6^2 dot 3^6 = 26244$], [*44,089,920*],
        [0], [3], [0], [0], [2], [0], [2], [1], [$frac(8!, 3! dot 2! dot 2! dot 1!) = 1680$], [$6^3 dot 3^4 = 17496$], [*29,393,280*],
        [0], [1], [0], [1], [4], [1], [1], [0], [$frac(8!, 1! dot 1! dot 4! dot 1! dot 1!) = 1680$], [$6^2 dot 3^6 = 26244$], [*44,089,920*],
        [0], [2], [0], [1], [3], [0], [1], [1], [$frac(8!, 2! dot 1! dot 3! dot 1! dot 1!) = 3360$], [$6^3 dot 3^4 = 17496$], [*58,786,560*],
        [0], [0], [0], [2], [5], [1], [0], [0], [$frac(8!, 2! dot 5! dot 1!) = 168$], [$6^2 dot 3^6 = 26244$], [*4,408,992*],
        [0], [1], [0], [2], [4], [0], [0], [1], [$frac(8!, 1! dot 2! dot 4! dot 1!) = 840$], [$6^3 dot 3^4 = 17496$], [*14,696,640*],
        [0], [1], [1], [0], [3], [2], [1], [0], [$frac(8!, 1! dot 1! dot 3! dot 2! dot 1!) = 3360$], [$6^2 dot 3^6 = 26244$], [*88,179,840*],
        [0], [2], [1], [0], [2], [1], [1], [1], [$frac(8!, 2! dot 1! dot 2! dot 1! dot 1! dot 1!) = 10080$], [$6^3 dot 3^4 = 17496$], [*176,359,680*],
        [0], [3], [1], [0], [1], [0], [1], [2], [$frac(8!, 3! dot 1! dot 1! dot 1! dot 2!) = 3360$], [$6^4 dot 3^2 = 11664$], [*39,191,040*],
        [0], [0], [1], [1], [4], [2], [0], [0], [$frac(8!, 1! dot 1! dot 4! dot 2!) = 840$], [$6^2 dot 3^6 = 26244$], [*22,044,960*],
        [0], [1], [1], [1], [3], [1], [0], [1], [$frac(8!, 1! dot 1! dot 1! dot 3! dot 1! dot 1!) = 6720$], [$6^3 dot 3^4 = 17496$], [*117,573,120*],
        [0], [2], [1], [1], [2], [0], [0], [2], [$frac(8!, 2! dot 1! dot 1! dot 2! dot 2!) = 5040$], [$6^4 dot 3^2 = 11664$], [*58,786,560*],
        [0], [0], [2], [0], [3], [3], [0], [0], [$frac(8!, 2! dot 3! dot 3!) = 560$], [$6^2 dot 3^6 = 26244$], [*14,696,640*],
        [0], [1], [2], [0], [2], [2], [0], [1], [$frac(8!, 1! dot 2! dot 2! dot 2! dot 1!) = 5040$], [$6^3 dot 3^4 = 17496$], [*88,179,840*],
        [0], [2], [2], [0], [1], [1], [0], [2], [$frac(8!, 2! dot 2! dot 1! dot 1! dot 2!) = 5040$], [$6^4 dot 3^2 = 11664$], [*58,786,560*],
        [0], [3], [2], [0], [0], [0], [0], [3], [$frac(8!, 3! dot 2! dot 3!) = 560$], [$6^5 = 7776$], [*4,354,560*],
        [1], [0], [0], [0], [4], [2], [1], [0], [$frac(8!, 1! dot 4! dot 2! dot 1!) = 840$], [$6^1 dot 3^7 = 13122$], [*11,022,480*],
        [1], [1], [0], [0], [3], [1], [1], [1], [$frac(8!, 1! dot 1! dot 3! dot 1! dot 1! dot 1!) = 6720$], [$6^2 dot 3^5 = 8748$], [*58,786,560*],
        [1], [2], [0], [0], [2], [0], [1], [2], [$frac(8!, 1! dot 2! dot 2! dot 1! dot 2!) = 5040$], [$6^3 dot 3^3 = 5832$], [*29,393,280*],
        [1], [0], [0], [1], [4], [1], [0], [1], [$frac(8!, 1! dot 1! dot 4! dot 1! dot 1!) = 1680$], [$6^2 dot 3^5 = 8748$], [*14,696,640*],
        [1], [1], [0], [1], [3], [0], [0], [2], [$frac(8!, 1! dot 1! dot 1! dot 3! dot 2!) = 3360$], [$6^3 dot 3^3 = 5832$], [*19,595,520*],
        [1], [0], [1], [0], [3], [2], [0], [1], [$frac(8!, 1! dot 1! dot 3! dot 2! dot 1!) = 3360$], [$6^2 dot 3^5 = 8748$], [*29,393,280*],
        [1], [1], [1], [0], [2], [1], [0], [2], [$frac(8!, 1! dot 1! dot 1! dot 2! dot 1! dot 2!) = 10080$], [$6^3 dot 3^3 = 5832$], [*58,786,560*],
        [1], [2], [1], [0], [1], [0], [0], [3], [$frac(8!, 1! dot 2! dot 1! dot 1! dot 3!) = 3360$], [$6^4 dot 3^1 = 3888$], [*13,063,680*],
        [2], [0], [0], [0], [3], [1], [0], [2], [$frac(8!, 2! dot 3! dot 1! dot 2!) = 1680$], [$6^2 dot 3^4 = 2916$], [*4,898,880*],
        [2], [1], [0], [0], [2], [0], [0], [3], [$frac(8!, 2! dot 1! dot 2! dot 3!) = 1680$], [$6^3 dot 3^2 = 1944$], [*3,265,920*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 1106520912$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (5! dot 3! dot 2!) dot 14! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(1106520912 dot 5! dot 3! dot 2! dot 14!, 24!)$
    - Rút gọn: $ p = frac(1106520912, P_24^10) dot 5! dot 3! dot 2! approx 0.22388490 $
    - Giá trị $10000p approx 2238.8490 arrow.r$ làm tròn: *2239*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *2239*.
]

#pagebreak()

== Bài toán 12 (Chặn 10 Đỉnh cao — Kì thi chọn Đội tuyển: Lưới 3 cột 8 hàng)
*Đề bài:* Kì thi chọn đội tuyển Olympic tổ chức tại phòng thi có 24 bàn (3 cột 8 hàng). Có 6 học sinh chuyên Toán, 4 chuyên Lý, 3 chuyên Hóa và 11 chuyên Sinh. Đánh số báo danh ngẫu nhiên và xếp chỗ. Tính xác suất $p$ để không có hàng nào chứa từ 2 học sinh trở lên cùng chuyên Toán, hoặc cùng chuyên Lý, hoặc cùng chuyên Hóa. Hãy tính $10000p$ (làm tròn đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=8$. Đối tượng: $E=6, G=4, F=3$. Còn lại: $11$ (học sinh chuyên Sinh).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = 6 quad &(E),
      x + y + t + v = 4 quad &(G),
      x + z + t + w = 3 quad &(F),
      x + y + z + t + u + v + w + o = 8 quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = 6 - x - y - z,
      v = 4 - x - y - t,
      w = 3 - x - z - t,
      o = -5 + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = 3$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= 6 - x - z$ và $y <= 4 - x - t$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= 5 - 2x - z - t$).
    ]
    
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [4], [1], [0], [1], [0], [2], [0], [$frac(8!, 4! dot 1! dot 1! dot 2!) = 840$], [$6^5 dot 3^3 = 209952$], [*176,359,680*],
        [0], [3], [1], [1], [2], [0], [1], [0], [$frac(8!, 3! dot 1! dot 1! dot 2! dot 1!) = 3360$], [$6^5 dot 3^3 = 209952$], [*705,438,720*],
        [0], [2], [1], [2], [3], [0], [0], [0], [$frac(8!, 2! dot 1! dot 2! dot 3!) = 1680$], [$6^5 dot 3^3 = 209952$], [*352,719,360*],
        [0], [3], [2], [0], [1], [1], [1], [0], [$frac(8!, 3! dot 2! dot 1! dot 1! dot 1!) = 3360$], [$6^5 dot 3^3 = 209952$], [*705,438,720*],
        [0], [4], [2], [0], [0], [0], [1], [1], [$frac(8!, 4! dot 2! dot 1! dot 1!) = 840$], [$6^6 dot 3^1 = 139968$], [*117,573,120*],
        [0], [2], [2], [1], [2], [1], [0], [0], [$frac(8!, 2! dot 2! dot 1! dot 2! dot 1!) = 5040$], [$6^5 dot 3^3 = 209952$], [*1,058,158,080*],
        [0], [3], [2], [1], [1], [0], [0], [1], [$frac(8!, 3! dot 2! dot 1! dot 1! dot 1!) = 3360$], [$6^6 dot 3^1 = 139968$], [*470,292,480*],
        [0], [2], [3], [0], [1], [2], [0], [0], [$frac(8!, 2! dot 3! dot 1! dot 2!) = 1680$], [$6^5 dot 3^3 = 209952$], [*352,719,360*],
        [0], [3], [3], [0], [0], [1], [0], [1], [$frac(8!, 3! dot 3! dot 1! dot 1!) = 1120$], [$6^6 dot 3^1 = 139968$], [*156,764,160*],
        [1], [3], [0], [0], [2], [0], [2], [0], [$frac(8!, 1! dot 3! dot 2! dot 2!) = 1680$], [$6^4 dot 3^4 = 104976$], [*176,359,680*],
        [1], [2], [0], [1], [3], [0], [1], [0], [$frac(8!, 1! dot 2! dot 1! dot 3! dot 1!) = 3360$], [$6^4 dot 3^4 = 104976$], [*352,719,360*],
        [1], [1], [0], [2], [4], [0], [0], [0], [$frac(8!, 1! dot 1! dot 2! dot 4!) = 840$], [$6^4 dot 3^4 = 104976$], [*88,179,840*],
        [1], [2], [1], [0], [2], [1], [1], [0], [$frac(8!, 1! dot 2! dot 1! dot 2! dot 1! dot 1!) = 10080$], [$6^4 dot 3^4 = 104976$], [*1,058,158,080*],
        [1], [3], [1], [0], [1], [0], [1], [1], [$frac(8!, 1! dot 3! dot 1! dot 1! dot 1! dot 1!) = 6720$], [$6^5 dot 3^2 = 69984$], [*470,292,480*],
        [1], [1], [1], [1], [3], [1], [0], [0], [$frac(8!, 1! dot 1! dot 1! dot 1! dot 3! dot 1!) = 6720$], [$6^4 dot 3^4 = 104976$], [*705,438,720*],
        [1], [2], [1], [1], [2], [0], [0], [1], [$frac(8!, 1! dot 2! dot 1! dot 1! dot 2! dot 1!) = 10080$], [$6^5 dot 3^2 = 69984$], [*705,438,720*],
        [1], [1], [2], [0], [2], [2], [0], [0], [$frac(8!, 1! dot 1! dot 2! dot 2! dot 2!) = 5040$], [$6^4 dot 3^4 = 104976$], [*529,079,040*],
        [1], [2], [2], [0], [1], [1], [0], [1], [$frac(8!, 1! dot 2! dot 2! dot 1! dot 1! dot 1!) = 10080$], [$6^5 dot 3^2 = 69984$], [*705,438,720*],
        [1], [3], [2], [0], [0], [0], [0], [2], [$frac(8!, 1! dot 3! dot 2! dot 2!) = 1680$], [$6^6 = 46656$], [*78,382,080*],
        [2], [1], [0], [0], [3], [1], [1], [0], [$frac(8!, 2! dot 1! dot 3! dot 1! dot 1!) = 3360$], [$6^3 dot 3^5 = 52488$], [*176,359,680*],
        [2], [2], [0], [0], [2], [0], [1], [1], [$frac(8!, 2! dot 2! dot 2! dot 1! dot 1!) = 5040$], [$6^4 dot 3^3 = 34992$], [*176,359,680*],
        [2], [0], [0], [1], [4], [1], [0], [0], [$frac(8!, 2! dot 1! dot 4! dot 1!) = 840$], [$6^3 dot 3^5 = 52488$], [*44,089,920*],
        [2], [1], [0], [1], [3], [0], [0], [1], [$frac(8!, 2! dot 1! dot 1! dot 3! dot 1!) = 3360$], [$6^4 dot 3^3 = 34992$], [*117,573,120*],
        [2], [0], [1], [0], [3], [2], [0], [0], [$frac(8!, 2! dot 1! dot 3! dot 2!) = 1680$], [$6^3 dot 3^5 = 52488$], [*88,179,840*],
        [2], [1], [1], [0], [2], [1], [0], [1], [$frac(8!, 2! dot 1! dot 1! dot 2! dot 1! dot 1!) = 10080$], [$6^4 dot 3^3 = 34992$], [*352,719,360*],
        [2], [2], [1], [0], [1], [0], [0], [2], [$frac(8!, 2! dot 2! dot 1! dot 1! dot 2!) = 5040$], [$6^5 dot 3^1 = 23328$], [*117,573,120*],
        [3], [0], [0], [0], [3], [1], [0], [1], [$frac(8!, 3! dot 3! dot 1! dot 1!) = 1120$], [$6^3 dot 3^4 = 17496$], [*19,595,520*],
        [3], [1], [0], [0], [2], [0], [0], [2], [$frac(8!, 3! dot 1! dot 2! dot 2!) = 1680$], [$6^4 dot 3^2 = 11664$], [*19,595,520*],
      )
    ]

    
  - *Bước 3: Nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = 10076996160$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (6! dot 4! dot 3!) dot 11! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(10076996160 dot 6! dot 4! dot 3! dot 11!, 24!)$
    - Rút gọn: $ p = frac(10076996160, P_24^13) dot 6! dot 4! dot 3! approx 0.06721654 $
    - Giá trị $10000p approx 672.1654 arrow.r$ làm tròn: *672*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *672*.
]

#pagebreak()
= Chương 3 — Phát triển và Mở rộng lên Lưới 4 cột (Cấu hình 4 cột)

== 1. Sự tương đồng và khác biệt về mặt Toán học
Khi không gian phòng được mở rộng lên cấu hình 4 cột (mỗi hàng có đúng 4 ghế), các tính chất đếm cấu trúc thay đổi như thế nào?

- *Ràng buộc trạng thái hàng:* Đề bài yêu cầu mỗi hàng không chứa quá 1 đối tượng thuộc mỗi nhóm đặc biệt $E, G, F$ (Lý, Hoá, Sử). Vì số lượng ghế trong một hàng tăng lên 4, điều kiện này vẫn hoàn toàn tương thích và không bị phá vỡ.
- *Hệ phương trình trạng thái:* Vì các nhóm đối tượng đặc biệt vẫn chỉ xuất hiện tối đa 1 người trên mỗi hàng, số lượng các loại hàng bằng các ẩn số $x, y, z, t, u, v, w, o$ và hệ phương trình gốc vẫn giữ nguyên dạng:
  $
  cases(
    x + y + z + u = E quad &(1) " (Tổng số chỗ E)",
    x + y + t + v = G quad &(2) " (Tổng số chỗ G)",
    x + z + t + w = F quad &(3) " (Tổng số chỗ F)",
    x + y + z + t + u + v + w + o = R quad &(4) " (Tổng số hàng)"
  )
  $
  Rút các biến lẻ $u, v, w, o$ theo $x, y, z, t$ tương tự:
  $
  u = E - x - y - z ; quad v = G - x - y - t ; quad w = F - x - z - t ; quad o = R - E - G - F + 2x + y + z + t
  $

- *Sự thay đổi về số cách xếp ghế nội bộ trong từng hàng:*
  Do số ghế mỗi hàng tăng lên thành 4, số cách chọn và sắp xếp các đối tượng đặc biệt vào ghế trong từng loại hàng sẽ thay đổi:
  - *Hàng chứa cả 3 đối tượng đặc biệt ($x$):* Chọn 3 ghế từ 4 ghế và sắp xếp thứ tự cho $E, G, F$:
    $ A_4^3 = 4 times 3 times 2 = 24 " cách" $
  - *Hàng chứa đúng 2 đối tượng đặc biệt ($y, z, t$):* Chọn 2 ghế từ 4 ghế và sắp xếp thứ tự cho 2 đối tượng:
    $ A_4^2 = 4 times 3 = 12 " cách" $
  - *Hàng chứa đúng 1 đối tượng đặc biệt ($u, v, w$):* Chọn 1 ghế từ 4 ghế để xếp đối tượng:
    $ C_4^1 = 4 " cách" $
  - *Hàng trống ($o$):* Có đúng $1$ cách để trống.

- *Công thức số lượng cấu trúc lưới:*
  Với mỗi bộ nghiệm nguyên không âm $(x, y, z, t, u, v, w, o)$ thỏa mãn hệ, số lượng cấu trúc phân bổ ghế là:
  $ C = frac(R!, x! y! z! t! u! v! w! o!) times 24^x times 12^(y+z+t) times 4^(u+v+w) $

== 2. Bài tập Thực chiến Lưới 4 cột

=== Bài toán 13 (Phòng thi chia 4 cột: Lưới 4 cột 6 hàng)
*Đề bài:* Cho một phòng gồm có 24 bàn được chia thành 4 cột và 6 hàng như hình vẽ. Đang có 24 em học sinh, trong đó có 5 em thi môn Lý (cấp E), 3 em thi môn Hoá (cấp G), 2 em thi môn Sử (cấp F), còn lại là thi môn Toán. Gọi $T$ là số cách xếp 24 em học sinh này vào 24 bàn sao cho mỗi hàng có không quá một em học sinh cùng thi Lý hoặc cùng thi Hoá hoặc cùng thi Sử. Hãy tính $10^(-8) T$ (không làm tròn ở các phép tính trung gian và làm tròn kết quả cuối cùng đến hàng đơn vị)?

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R=6$. Đối tượng đặc biệt: $E=5, G=3, F=2$. Còn lại: $14$ (học sinh thi Toán).
    Từ số lượng chỗ ngồi, ta có hệ phương trình:
    $
    cases(
      x + y + z + u = 5 quad &(E),
      x + y + t + v = 3 quad &(G),
      x + z + t + w = 2 quad &(F),
      x + y + z + t + u + v + w + o = 6 quad &("Hàng")
    )
    $
    Rút gọn các biến phụ thuộc:
    $
    cases(
      u = 5 - x - y - z,
      v = 3 - x - y - t,
      w = 2 - x - z - t,
      o = -4 + 2x + y + z + t
    )
    $
    Điều kiện biện luận:
    - Duyệt $x + z + t <= F = 2$.
    - Điều kiện $o >= 0 arrow.r y >= 4 - 2x - z - t$.
    - Giới hạn trên của $y$: $y <= 5 - x - z$ và $y <= 3 - x - t$.

  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #align(center)[
      #table(
        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.6fr, 2.5fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],
        [0], [2], [1], [1], [2], [0], [0], [0], [$frac(6!, 2! dot 1! dot 1! dot 2!) = 180$], [$12^4 dot 4^2 = 331,776$], [*59,719,680*],
        [0], [2], [2], [0], [1], [1], [0], [0], [$frac(6!, 2! dot 2! dot 1! dot 1!) = 180$], [$12^4 dot 4^2 = 331,776$], [*59,719,680*],
        [0], [3], [1], [0], [1], [0], [1], [0], [$frac(6!, 3! dot 1! dot 1! dot 1!) = 120$], [$12^4 dot 4^2 = 331,776$], [*39,813,120*],
        [0], [3], [2], [0], [0], [0], [0], [1], [$frac(6!, 3! dot 2! dot 1!) = 60$], [$12^5 = 248,832$], [*14,929,920*],
        [1], [1], [0], [1], [3], [0], [0], [0], [$frac(6!, 1! dot 1! dot 1! dot 3!) = 120$], [$24^1 dot 12^2 dot 4^3 = 221,184$], [*26,542,080*],
        [1], [1], [1], [0], [2], [1], [0], [0], [$frac(6!, 1! dot 1! dot 1! dot 2! dot 1!) = 360$], [$24^1 dot 12^2 dot 4^3 = 221,184$], [*79,626,240*],
        [1], [2], [0], [0], [2], [0], [1], [0], [$frac(6!, 1! dot 2! dot 2! dot 1!) = 180$], [$24^1 dot 12^2 dot 4^3 = 221,184$], [*39,813,120*],
        [1], [2], [1], [0], [1], [0], [0], [1], [$frac(6!, 1! dot 2! dot 1! dot 1! dot 1!) = 360$], [$24^1 dot 12^3 dot 4^1 = 165,888$], [*59,719,680*],
        [2], [0], [0], [0], [3], [1], [0], [0], [$frac(6!, 2! dot 3! dot 1!) = 60$], [$24^2 dot 4^4 = 147,456$], [*8,847,360*],
        [2], [1], [0], [0], [2], [0], [0], [1], [$frac(6!, 2! dot 1! dot 2! dot 1!) = 180$], [$24^2 dot 12^1 dot 4^2 = 110,592$], [*19,906,560*],
      )
    ]

  - *Bước 3: Nhân hoán vị*
    - Tổng số cấu trúc phân bổ ghế hợp lệ (chưa xếp người cụ thể):
      $ N_("cấu trúc") = 408,637,440 $
    - Xếp cụ thể từng học sinh vào các vị trí ghế tương ứng:
      $ T = N_("cấu trúc") dot E! dot G! dot F! dot (24 - E - G - F)! $
      $ T = 408,637,440 dot 5! dot 3! dot 2! dot 14! $
      $ T = 408,637,440 dot 120 dot 6 dot 2 dot 87,178,291,200 $
      $ T = 51,299,011,784,941,240,320,000 $

  - *Bước 4: Tính kết quả yêu cầu*
    - Ta có: $10^(-8) T = 512,990,117,849,412.4$
    - Làm tròn kết quả cuối cùng đến hàng đơn vị: *512,990,117,849,412*.
]

#ans-box[
  Giá trị của $10^(-8) T$ làm tròn đến hàng đơn vị là *512,990,117,849,412*.
]

