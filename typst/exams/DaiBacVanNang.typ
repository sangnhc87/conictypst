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

// BẢNG MÀU CHỦ ĐỀ
#let c-teal = rgb("00695C")
#let c-amber = rgb("BF360C")
#let c-green = rgb("1B5E20")
#let c-slate = rgb("37474F")
#let c-navy = rgb("0D47A1")

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

= Cẩm Nang Đại Bác Vạn Năng: Quy Tắc Quét Cột Từng Bước
_Giải quyết mọi bài toán tô màu lưới khuyết, lưới biến dạng với số màu $k$ bất kỳ và chiều cao cột bất kỳ._

== 1. Tư Duy Tổng Quát: Đại Bác Quét Cột
Bất kỳ lưới dạng ô vuông nào, dù bị khuyết góc, khuyết giữa, thắt eo, hay lắp ghép phức tạp đều có chung một cách giải hệ thống duy nhất: *Quét từ trái sang phải theo từng cột đứng*.

*Tại sao lại quét theo cột?*
Thay vì bối rối chọn màu lộn xộn cho cả lưới, việc quét cột giúp cô lập sự ảnh hưởng. Khi tô một cột mới, ta chỉ cần nhìn vào cột ngay bên trái để né màu, những cột xa hơn đã tô xong sẽ không còn ràng buộc trực tiếp. Phương pháp này giúp chia nhỏ bài toán thành các bước chuyển tiếp đơn giản.

== 2. Bộ 3 Quy Tắc Vạn Năng (Tổng quát cho $k$ màu)

Học sinh chỉ cần nắm vững đúng 3 quy tắc sau để tự suy luận hệ số nhân cho từng cột mà không cần học thuộc lòng từng mô hình:

#theory-box[
  *Quy tắc 1: Cột khởi đầu (Cột 1)*
  - Số cách tô một cột đứng độc lập gồm $h$ ô liên tiếp là:
    $N_("Cột 1") = k(k-1)^(h-1)$
  - _Ví dụ:_ Cột 1 cao 1 ô $=> k$ cách; Cột 1 cao 2 ô $=> k(k-1)$ cách; Cột 1 cao 3 ô $=> k(k-1)^2$ cách.

  *Quy tắc 2: Chuyển tiếp Cột đầy đủ (Tiêu chuẩn)*
  - Khi cột mới cao $h$ ô kề đầy đủ sang cột trước cũng cao $h$ ô:
    - Nếu $h=1$: Nhân thêm hệ số $(k-1)$.
    - Nếu $h=2$: Nhân thêm hệ số chuyển tiếp đầy đủ $H = k^2 - 3k + 3$ (với $k=4 => H=7$).

  *Quy tắc 3: Chuyển tiếp Cột Khuyết / Biến dạng (Tô từng ô)*
  - Ta tô lần lượt từng ô của cột mới từ trên xuống dưới (hoặc dưới lên trên). Số cách chọn màu của mỗi ô chỉ phụ thuộc vào số ô kề sát đã tô màu lân cận nó:
    - *Ô chỉ kề sát với 1 ô đã tô màu* (dù kề ngang hay kề dọc): Luôn có $(k-1)$ cách chọn. _(Hệ quả: Khuyết giảm)_.
    - *Ô kề sát với 2 ô đã tô màu* (mà 2 ô đó kề nhau nên khác màu nhau): Luôn có $(k-2)$ cách chọn.
]

#v(0.5em)
#v(0.5em)
*Bảng Tóm Tắt Bộ Quy Tắc Quét Cột Vạn Năng (Kèm hình minh họa):*
#table(
  columns: (1.3fr, 1.2fr, 1.4fr, 2.3fr, 1.2fr),
  inset: 6pt,
  align: (left, center, left, left, left),
  [*Quy tắc*], [*Minh họa*], [*Đối tượng áp dụng*], [*Công thức tổng quát*], [*Ví dụ ($k=4, h=2$)*],
  
  [*Quy tắc 1: Khởi đầu*],
  [
    #cetz.canvas(length: 0.35cm, {
      import cetz.draw: *
      rect((0,0), (1,1), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      rect((0,1), (1,2), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      content((0.5, 1.5), text(size: 6pt, weight: "bold")[Cột 1])
      content((0.5, 0.5), text(size: 6pt)[($h$ ô)])
    })
  ],
  [Cột đầu tiên bên trái cùng của lưới],
  [$N = k(k-1)^(h-1)$],
  [Cột 2 ô $=> 12$ cách],
  
  [*Quy tắc 2: Kề đủ*],
  [
    #cetz.canvas(length: 0.35cm, {
      import cetz.draw: *
      rect((0,0), (1,1), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      rect((0,1), (1,2), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      rect((2,0), (3,1), fill: white, stroke: 0.8pt + black)
      rect((2,1), (3,2), fill: white, stroke: 0.8pt + black)
      line((1.1, 1), (1.9, 1), mark: (end: "stealth", size: 0.08), stroke: 0.8pt + c-teal)
      content((1.5, 1.4), text(size: 6.5pt, fill: c-teal)[$H$])
    })
  ],
  [Cột mới kề đầy đủ cột cũ cùng chiều cao $h$],
  [- Với $h=1 => k-1$ \ 
  - Với $h=2 => H = k^2-3k+3$],
  [Cột 2 ô $=> H = 7$ cách],
  
  [*Quy tắc 3: Khuyết / Dị*],
  [
    #cetz.canvas(length: 0.35cm, {
      import cetz.draw: *
      rect((0,0), (1,1), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      rect((0,1), (1,2), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      rect((2,0), (3,1), fill: white, stroke: 0.8pt + black)
      content((2.5, 0.5), text(size: 7pt, weight: "bold")[?])
      line((1.1, 0.5), (1.9, 0.5), mark: (end: "stealth", size: 0.08), stroke: 0.8pt + red)
    })
  ],
  [Cột khuyết, thắt eo, chiều cao cột thay đổi],
  [Tô từng ô của cột mới: \ 
  - Kề 1 ô đã tô $=> k-1$ \ 
  - Kề 2 ô đã tô $=> k-2$],
  [Khuyết giảm $=> 3$ cách \ 
  Khuyết tăng $=> 9$ cách]
)
#v(0.5em)
== 3. Chứng Minh & Bản Chất Toán Học
Để không học vẹt, hãy cùng khám phá nguồn gốc thực tế của các con số này dưới góc nhìn của học sinh khi tự tay tô màu (với bộ $k=4$ màu: Đỏ, Xanh, Vàng, Tím):

#grid(
  columns: (1fr, 1.2fr),
  gutter: 1cm,
  align(center)[
    #cetz.canvas(length: 0.9cm, {
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
      content((1.4, -0.4), text(size: 8.5pt, weight: "bold")[$k-1 = 3$ cách])
    })
    #v(0.3em)
    _Né 1 ô đã tô lân cận_
  ],
  align(center)[
    #cetz.canvas(length: 0.9cm, {
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
      content((1.9, -0.4), text(size: 8.5pt, weight: "bold")[$k-2 = 2$ cách])
    })
    #v(0.3em)
    _Né 2 ô khác màu (Trường hợp 2 của H)_
  ]
)

#v(0.5em)
#note-box(title: "Giải thích chi tiết từng quy tắc")[
  - *Tại sao ô kề sát 1 ô đã tô lại có $k-1 = 3$ cách?*
    Khi ô mới chỉ chạm cạnh đúng 1 ô đã sơn xong (ví dụ ô đó màu Đỏ). Để tránh trùng màu kề cạnh, ô mới chỉ cần tránh duy nhất màu Đỏ. Vậy ta còn lại $4 - 1 = 3$ màu để tự do chọn lựa (Xanh, Vàng, Tím).
    
  - *Tại sao ô kề sát 2 ô đã tô lại có $k-2 = 2$ cách?*
    Khi ô mới kẹt giữa và chạm cạnh 2 ô đã sơn xong (ví dụ ô bên trái màu Đỏ, ô bên dưới màu Xanh). Vì hai ô kề đó chạm cạnh nhau nên chúng bắt buộc mang 2 màu khác nhau. Do đó, ô mới phải né cả Đỏ và Xanh $=>$ còn $4 - 2 = 2$ màu để chọn (Vàng, Tím).
    
  - *Tại sao chuyển tiếp cột 2 ô lại nhân thêm $H = k^2 - 3k + 3 = 7$ cách?*
    Giả sử cột cũ có ô trên màu Đỏ, ô dưới màu Xanh. Khi tô cột mới (gồm ô trên mới và ô dưới mới), ta chia làm 2 trường hợp:
    - _Trường hợp 1:_ Tô ô trên mới trùng màu ô dưới cũ (tô màu *Xanh* - có 1 cách). Lúc này, ô dưới mới kề ngang ô màu Xanh và kề dọc ô trên mới cũng màu Xanh $=>$ Chỉ cần tránh màu Xanh $=>$ có $k-1 = 3$ cách chọn. Số cách: $1 times 3 = 3$ cách.
    - _Trường hợp 2:_ Tô ô trên mới khác màu ô dưới cũ (né Đỏ của ô trên cũ và né Xanh của ô dưới cũ $=>$ có $k-2 = 2$ cách chọn). Khi đó, ô dưới mới kề với hai ô mang hai màu khác nhau $=>$ phải né cả 2 màu này $=>$ có $k-2 = 2$ cách chọn. Số cách: $2 times 2 = 4$ cách.
    - _Cộng lại:_ Ta có $3 + 4 = 7$ cách chuyển tiếp (với $k$ màu, tổng quát là $(1 times (k-1)) + ((k-2) times (k-2)) = k^2 - 3k + 3$).
]

== 4. Mở Rộng Khi Số Màu Khác 4 ($k != 4$)
Khi số màu $k$ thay đổi, bộ quy tắc vạn năng vẫn không đổi, ta chỉ việc thay giá trị $k$ vào công thức:

*1. Với $k=3$ màu (ví dụ {Đỏ, Xanh, Vàng}):*
- Né 1 ô lân cận: $k-1 = 2$ cách.
- Né 2 ô khác màu lân cận: $k-2 = 1$ cách.
- Hệ số chuyển tiếp cột đầy đủ $H$: $k^2 - 3k + 3 = 3^2 - 3(3) + 3 = 3$ cách.
- _Áp dụng:_ Lưới $2 times 2$ tô bằng 3 màu có số cách tô là:
  $N = N_("Cột 1") times H = [k(k-1)] times 3 = (3 times 2) times 3 = 18$ cách.

*2. Với $k=5$ màu (ví dụ {Đỏ, Xanh, Vàng, Tím, Cam}):*
- Né 1 ô lân cận: $k-1 = 4$ cách.
- Né 2 ô khác màu lân cận: $k-2 = 3$ cách.
- Hệ số chuyển tiếp cột đầy đủ $H$: $k^2 - 3k + 3 = 5^2 - 3(5) + 3 = 13$ cách.
- _Áp dụng:_ Lưới $2 times 2$ tô bằng 5 màu có số cách tô là:
  $N = N_("Cột 1") times H = (5 times 4) times 13 = 260$ cách.

== 5. Mở Rộng Khi Chiều Cao Cột Lớn Hơn 2 ($h > 2$)

Quy tắc quét cột và quy tắc tô từng ô vẫn hoạt động hoàn toàn chính xác cho mọi chiều cao cột. Khi tô một cột mới cao $h$ ô kề sát cột cũ, ta luôn tô lần lượt các ô của cột mới từ trên xuống dưới. Mỗi ô khi tô chỉ cần nhìn về các ô lân cận đã được tô màu trước đó để né màu.

#cannon-box("Bài toán áp dụng nâng cao: Lưới bậc thang 3×3 với k=3 màu", [
  Cho một lưới gồm 6 ô được xếp thành dạng bậc thang như hình dưới đây. Có 3 màu sơn khác nhau ($k=3$). Yêu cầu hai ô chung cạnh phải khác màu. Hỏi có bao nhiêu cách tô màu cho lưới?

  #v(0.3em)
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let yellow = rgb("FFF9C4")
      
      // Dòng 1
      rect((0, 0), (1, 1), fill: yellow, stroke: 1.2pt + black)
      rect((1, 0), (2, 1), fill: yellow, stroke: 1.2pt + black)
      rect((2, 0), (3, 1), fill: yellow, stroke: 1.2pt + black)
      
      // Dòng 2
      rect((0, 1), (1, 2), fill: yellow, stroke: 1.2pt + black)
      rect((1, 1), (2, 2), fill: yellow, stroke: 1.2pt + black)
      
      // Dòng 3
      rect((0, 2), (1, 3), fill: yellow, stroke: 1.2pt + black)
      
      content((0.5, 2.5), text(size: 8.5pt)[Cột 1])
      content((1.5, 1.5), text(size: 8.5pt)[Cột 2])
      content((2.5, 0.5), text(size: 8.5pt)[Cột 3])
    })
  ]
  
  #v(0.3em)
  *Lời giải chi tiết bằng cách áp dụng Bộ Quy Tắc Vạn Năng:*

  *Bước 1: Tô Cột 1 (Quy tắc 1 - Cột khởi đầu cao 3 ô)*
  - Số cách tô Cột 1 gồm 3 ô dọc độc lập là:
    $N_("Cột 1") = k(k-1)^2 = 3 times 2^2 = 12$ cách.

  *Bước 2: Tô Cột 2 (Quy tắc 2 - Cột kề đầy đủ cao 2 ô)*
  - Hãy quan sát: Cột 2 gồm 2 ô (Dòng 1 và Dòng 2). Nó nằm kề đầy đủ bên phải của 2 ô thuộc Cột 1 (cụ thể là ô Dòng 1 và Dòng 2 của Cột 1).
  - Ô ở Dòng 3 của Cột 1 là ô khuyết ở trên, hoàn toàn không kề với bất kỳ ô nào của Cột 2, nên ta bỏ qua sự ảnh hưởng của nó.
  - Do đó, bước chuyển tiếp từ Cột 1 sang Cột 2 thực chất là sự chuyển tiếp của một cột cao 2 ô tiêu chuẩn.
  - Áp dụng *Quy tắc 2 (Chuyển tiếp cột đầy đủ cao 2 ô)*: Hệ số nhân thêm cho Cột 2 là:
    $H = k^2 - 3k + 3 = 3^2 - 3(3) + 3 = 3$ cách.
    $=> N_("Cột 2") = 3$ cách.

  *Bước 3: Tô Cột 3 (Quy tắc 3 - Chuyển tiếp khuyết giảm)*
  - Cột 3 chỉ có duy nhất 1 ô ở Dòng 1. Ô này kề ngang với ô Dòng 1 của Cột 2 (phía trên nó khuyết rỗng).
  - Áp dụng *Quy tắc 3 (Khuyết giảm - kề sát đúng 1 ô đã tô)*: Hệ số nhân thêm cho Cột 3 là:
    $k - 1 = 3 - 1 = 2$ cách.
    $=> N_("Cột 3") = 2$ cách.

  *Bước 4: Tổng kết số cách tô cho toàn lưới*
  - Theo quy tắc nhân, tổng số cách tô màu là:
    $N = N_("Cột 1") times N_("Cột 2") times N_("Cột 3") = 12 times 3 times 2 = 72$ cách.
])

== 6. Bảng Tra Nhanh Các Mô Hình Lưới Khuyết ($k=4$)

Dưới đây là bảng tổng hợp công thức quét cột và đáp án cho các mô hình lưới khuyết thông dụng sử dụng bộ $k=4$ màu ($H=7$, $k-1=3$, $k-2=2$):

#table(
  columns: (1.5fr, 1fr, 2fr, 1.2fr),
  inset: 8pt,
  align: (left, center, left, center),
  [*Mô hình lưới*], [*Cấu trúc cột*], [*Phép tính theo Quy tắc Quét Cột*], [*Đáp án ($k=4$)*],
  [*Mô hình A (Khuyết góc)*], [2 $->$ 2 $->$ 1], [Cột 1 ($12$) $times$ Cột 2 ($H=7$) $times$ Cột 3 ($3$)], [*252 cách*],
  [*Mô hình B (Khuyết giữa)*], [2 $->$ 1 $->$ 2], [Cột 1 ($12$) $times$ Cột 2 ($3$) $times$ Cột 3 ($3 times 3 = 9$)], [*324 cách*],
  [*Mô hình D (Bậc thang)*], [1 $->$ 2 $->$ 1], [Cột 1 ($4$) $times$ Cột 2 ($3 times 3 = 9$) $times$ Cột 3 ($3$)], [*108 cách*],
  [*Bài 3.3 (Lưới 11 ô)*], [Ghép Khối], [Khối Trái ($12 times 7 times 7 times 3 = 1764$) $times$ Khối Phải ($7 times 7 = 49$)], [*86.436 cách*],
  [*Bài 3.11 (Lưới 8 ô)*], [3 $times$ 2 + Đuôi], [Khối lõi $3 times 2$ ($588$) $times$ Ô đuôi ($3$)], [*1764 cách*],
  [*Bài 3.12 (Lưới 9 ô thắt eo)*], [Khối-Cầu-Khối], [Khối Trái ($84$) $times$ Cầu ($3$) $times$ Cột 4 ($9$) $times$ Cột 5 ($7$)], [*15.876 cách*],
)

== 7. Ví Dụ Áp Dụng Từng Bước (Luyện Tập Thực Chiến)

Với mỗi ví dụ dưới đây, ta sẽ *không tính nhẩm tắt* mà trình bày đầy đủ 4 bước: Nhận dạng lưới → Gọi tên quy tắc → Tính hệ số từng cột → Nhân kết quả. Đây chính là thói quen tư duy đúng đắn giúp không bao giờ bị nhầm lẫn.

#v(0.5em)

#cannon-box("Ví dụ 1 — Mô hình A: Lưới khuyết góc (k = 4 màu)", [
  *Đề bài:* Cho lưới 5 ô hình chữ L như hình. Có 4 màu sơn khác nhau. Hai ô chung cạnh phải khác màu. Tính số cách tô màu.

  #v(0.3em)
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9")
      let b = rgb("E3F2FD")
      let o = rgb("FFE0B2")
      // Cột 1 — xanh lá
      rect((0,0),(1,1), fill: g, stroke: 1.3pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.3pt + black)
      // Cột 2 — xanh dương
      rect((1,0),(2,1), fill: b, stroke: 1.3pt + black)
      rect((1,1),(2,2), fill: b, stroke: 1.3pt + black)
      // Cột 3 — cam (chỉ ô trên)
      rect((2,1),(3,2), fill: o, stroke: 1.3pt + black)
      // Ô trống (gạch chéo)
      rect((2,0),(3,1), fill: rgb("F5F5F5"), stroke: 0.7pt + rgb("BBBBBB"))
      line((2,0),(3,1), stroke: 0.6pt + rgb("BBBBBB"))
      line((3,0),(2,1), stroke: 0.6pt + rgb("BBBBBB"))
      // Nhãn cột
      content((0.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[Cột 1])
      content((1.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("0D47A1"))[Cột 2])
      content((2.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[Cột 3])
      content((0.5,1.0), text(size: 7.5pt)[2 ô])
      content((1.5,1.0), text(size: 7.5pt)[2 ô])
      content((2.5,1.5), text(size: 7.5pt)[1 ô])
    })
  ]
  #v(0.4em)

  *Bước 1 — Cột 1 (Quy tắc 1, cao 2 ô):*
  Cột đầu tiên, độc lập hoàn toàn. Ô trên tự do chọn $k=4$ màu; ô dưới kề dọc nên chỉ cần né 1 màu.
  $ N_1 = k(k-1) = 4 times 3 = 12 "cách" $

  *Bước 2 — Cột 2 (Quy tắc 2, chuyển tiếp đầy đủ cao 2 ô):*
  Cột 2 kề toàn bộ sang Cột 1 với cùng chiều cao 2 ô — chuyển tiếp chuẩn, áp dụng hệ số $H$.
  $ N_2 = H = k^2 - 3k + 3 = 16 - 12 + 3 = 7 "cách" $

  *Bước 3 — Cột 3 (Quy tắc 3, khuyết giảm):*
  Cột 3 chỉ còn 1 ô ở hàng trên. Ô này chỉ chạm cạnh ngang với đúng 1 ô của Cột 2. Né 1 màu, tự do chọn phần còn lại.
  $ N_3 = k - 1 = 3 "cách" $

  *Bước 4 — Kết quả:*
  #align(center)[
    $ N = N_1 times N_2 times N_3 = 12 times 7 times 3 = bold(252) "cách" $
  ]
])

#v(0.8em)

#cannon-box("Ví dụ 2 — Mô hình B: Lưới khuyết giữa (k = 4 màu)", [
  *Đề bài:* Cho lưới 5 ô dạng "đứt ruột" như hình — Cột giữa bị mất đi 1 ô, lưới bị thắt lại rồi lại nở ra. Có 4 màu sơn. Tính số cách tô màu.

  #v(0.3em)
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9")
      let b = rgb("E3F2FD")
      let o = rgb("FFE0B2")
      // Cột 1 — xanh lá (2 ô)
      rect((0,0),(1,1), fill: g, stroke: 1.3pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.3pt + black)
      // Cột 2 — cam (chỉ ô trên, ô dưới trống)
      rect((1,1),(2,2), fill: o, stroke: 1.3pt + black)
      rect((1,0),(2,1), fill: rgb("F5F5F5"), stroke: 0.7pt + rgb("BBBBBB"))
      line((1,0),(2,1), stroke: 0.6pt + rgb("BBBBBB"))
      line((2,0),(1,1), stroke: 0.6pt + rgb("BBBBBB"))
      // Cột 3 — xanh dương (2 ô)
      rect((2,0),(3,1), fill: b, stroke: 1.3pt + black)
      rect((2,1),(3,2), fill: b, stroke: 1.3pt + black)
      // Nhãn
      content((0.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[Cột 1])
      content((1.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[Cột 2])
      content((2.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("0D47A1"))[Cột 3])
      content((0.5,1.0), text(size: 7.5pt)[2 ô])
      content((1.5,1.5), text(size: 7.5pt)[1 ô])
      content((2.5,1.0), text(size: 7.5pt)[2 ô])
    })
  ]
  #v(0.4em)

  *Bước 1 — Cột 1 (Quy tắc 1, cao 2 ô):*
  $ N_1 = k(k-1) = 4 times 3 = 12 "cách" $

  *Bước 2 — Cột 2 (Quy tắc 3, khuyết giảm):*
  Cột 2 chỉ có 1 ô ở hàng trên, chỉ chạm cạnh ngang đúng 1 ô của Cột 1. Né 1 màu.
  $ N_2 = k - 1 = 3 "cách" $

  *Bước 3 — Cột 3 (Quy tắc 3, khuyết tăng — tô từng ô từ trên xuống):*
  Cột 3 "phình" ra thành 2 ô sau Cột 2 chỉ có 1 ô. Ta tô lần lượt:
  - _Ô trên Cột 3:_ kề ngang Cột 2 (1 ô đã tô) $=>$ né 1 màu $=>$ $k-1 = 3$ cách.
  - _Ô dưới Cột 3:_ chỉ kề dọc ô trên vừa tô (phía trái không có ô nào kề) $=>$ né 1 màu $=>$ $k-1 = 3$ cách.
  $ N_3 = (k-1) times (k-1) = 3 times 3 = 9 "cách" $

  *Bước 4 — Kết quả:*
  #align(center)[
    $ N = 12 times 3 times 9 = bold(324) "cách" $
  ]
])

#v(0.8em)

#cannon-box("Ví dụ 3 — Mô hình D: Lưới bậc thang (k = 4 màu)", [
  *Đề bài:* Cho lưới 4 ô xếp dạng bậc thang đi xuống — 1 ô hàng trên, 2 ô cột giữa, 1 ô hàng dưới. Có 4 màu sơn. Tính số cách tô màu.

  #v(0.3em)
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9")
      let b = rgb("E3F2FD")
      let o = rgb("FFE0B2")
      // Cột 1 — xanh lá (chỉ ô trên)
      rect((0,1),(1,2), fill: g, stroke: 1.3pt + black)
      rect((0,0),(1,1), fill: rgb("F5F5F5"), stroke: 0.7pt + rgb("BBBBBB"))
      line((0,0),(1,1), stroke: 0.6pt + rgb("BBBBBB"))
      line((1,0),(0,1), stroke: 0.6pt + rgb("BBBBBB"))
      // Cột 2 — xanh dương (2 ô)
      rect((1,0),(2,1), fill: b, stroke: 1.3pt + black)
      rect((1,1),(2,2), fill: b, stroke: 1.3pt + black)
      // Cột 3 — cam (chỉ ô dưới)
      rect((2,0),(3,1), fill: o, stroke: 1.3pt + black)
      rect((2,1),(3,2), fill: rgb("F5F5F5"), stroke: 0.7pt + rgb("BBBBBB"))
      line((2,1),(3,2), stroke: 0.6pt + rgb("BBBBBB"))
      line((3,1),(2,2), stroke: 0.6pt + rgb("BBBBBB"))
      // Nhãn
      content((0.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[Cột 1])
      content((1.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("0D47A1"))[Cột 2])
      content((2.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[Cột 3])
      content((0.5,1.5), text(size: 7.5pt)[1 ô])
      content((1.5,1.0), text(size: 7.5pt)[2 ô])
      content((2.5,0.5), text(size: 7.5pt)[1 ô])
    })
  ]
  #v(0.4em)

  *Bước 1 — Cột 1 (Quy tắc 1, cao 1 ô):*
  Ô đơn độc, hoàn toàn tự do chọn màu.
  $ N_1 = k = 4 "cách" $

  *Bước 2 — Cột 2 (Quy tắc 3, khuyết tăng — tô từng ô từ trên xuống):*
  Từ 1 ô nở ra 2 ô. Ô trên Cột 2 kề ngang Cột 1; ô dưới Cột 2 chỉ kề dọc ô trên (vì phía trái ô dưới không có ô nào của Cột 1).
  - _Ô trên Cột 2:_ $k - 1 = 3$ cách.
  - _Ô dưới Cột 2:_ $k - 1 = 3$ cách.
  $ N_2 = (k-1)^2 = 3 times 3 = 9 "cách" $

  *Bước 3 — Cột 3 (Quy tắc 3, khuyết giảm):*
  Cột 3 chỉ có 1 ô ở hàng dưới, chỉ kề ngang với ô dưới của Cột 2. Né 1 màu.
  $ N_3 = k - 1 = 3 "cách" $

  *Bước 4 — Kết quả:*
  #align(center)[
    $ N = 4 times 9 times 3 = bold(108) "cách" $
  ]
])

#v(0.8em)

#cannon-box("Ví dụ 4 — Mô hình C: Lưới thắt eo / Cầu nối (k = 4 màu)", [
  *Đề bài:* Cho lưới 9 ô gồm hai khối $2 times 2$ nối với nhau qua 1 ô cầu nối ở hàng trên. Có 4 màu sơn. Hai ô chung cạnh phải khác màu. Tính số cách tô màu.

  #v(0.3em)
  #align(center)[
    #cetz.canvas(length: 0.95cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9")
      let b = rgb("E3F2FD")
      let o = rgb("FFE0B2")
      // Khối Trái (Cột 1 & 2)
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((1,0),(2,1), fill: g, stroke: 1.2pt + black)
      rect((1,1),(2,2), fill: g, stroke: 1.2pt + black)
      // Cầu nối (Cột 3, chỉ ô trên)
      rect((2,1),(3,2), fill: o, stroke: 1.5pt + black)
      rect((2,0),(3,1), fill: rgb("F5F5F5"), stroke: 0.7pt + rgb("BBBBBB"))
      line((2,0),(3,1), stroke: 0.6pt + rgb("BBBBBB"))
      line((3,0),(2,1), stroke: 0.6pt + rgb("BBBBBB"))
      // Khối Phải (Cột 4 & 5)
      rect((3,0),(4,1), fill: b, stroke: 1.2pt + black)
      rect((3,1),(4,2), fill: b, stroke: 1.2pt + black)
      rect((4,0),(5,1), fill: b, stroke: 1.2pt + black)
      rect((4,1),(5,2), fill: b, stroke: 1.2pt + black)
      // Nhãn phía trên
      content((0.5,2.4), text(size: 7pt, weight: "bold", fill: rgb("1B5E20"))[Khối Trái])
      content((2.5,2.4), text(size: 7pt, weight: "bold", fill: rgb("BF360C"))[Cầu])
      content((3.5,2.4), text(size: 7pt, weight: "bold", fill: rgb("0D47A1"))[Khối Phải])
      // Nhãn phía dưới
      content((0.5,-0.35), text(size: 7.5pt, fill: rgb("1B5E20"))[C.1])
      content((1.5,-0.35), text(size: 7.5pt, fill: rgb("1B5E20"))[C.2])
      content((2.5,-0.35), text(size: 7.5pt, fill: rgb("BF360C"))[C.3])
      content((3.5,-0.35), text(size: 7.5pt, fill: rgb("0D47A1"))[C.4])
      content((4.5,-0.35), text(size: 7.5pt, fill: rgb("0D47A1"))[C.5])
    })
  ]
  #v(0.4em)

  *Khối Trái — Cột 1 & Cột 2:*

  - _Cột 1 (Quy tắc 1, cao 2 ô):_ $N_1 = k(k-1) = 12$ cách.
  - _Cột 2 (Quy tắc 2, chuyển tiếp đầy đủ):_ $N_2 = H = 7$ cách.
  $ N_"trái" = 12 times 7 = 84 "cách" $

  *Cột 3 — Cầu nối (Quy tắc 3, khuyết giảm):*

  Ô cầu nối chỉ chạm cạnh ngang đúng 1 ô hàng trên của Cột 2. Phía dưới trống.
  $ N_3 = k - 1 = 3 "cách" $

  *Khối Phải — Cột 4 & Cột 5:*

  - _Cột 4 (Quy tắc 3, khuyết tăng):_ Lưới nở ra 2 ô sau cầu nối 1 ô. Tô từng ô từ trên xuống: ô trên kề ngang cầu nối ($k-1=3$), ô dưới chỉ kề dọc ô trên ($k-1=3$).
    $ N_4 = (k-1)^2 = 3 times 3 = 9 "cách" $
  - _Cột 5 (Quy tắc 2, chuyển tiếp đầy đủ):_ Cột 5 kề toàn bộ Cột 4, cao 2 ô.
    $ N_5 = H = 7 "cách" $
  $ N_"phải" = 9 times 7 = 63 "cách" $

  *Kết quả toàn lưới:*
  #align(center)[
    $ N = N_"trái" times N_3 times N_"phải" = 84 times 3 times 63 = bold(15.876) "cách" $
  ]
])

#pagebreak()

== 8. Vườn Ví Dụ Toàn Diện — Đổi k, Đổi Chiều Rộng, Đổi Chiều Cao

Phần này luyện tập bộ quy tắc trên *nhiều tình huống khác nhau*. Mỗi lần đổi một yếu tố (số màu / số cột / chiều cao cột), đáp số thay đổi ra sao? Hãy theo dõi và so sánh!

// ══════════════════════════════════════════════════════════════════
#note-box(title: "🎨 Nhóm I — Cùng Hình Lưới, Đổi Số Màu k")[
  Đây là bài tập tư duy số một: giữ nguyên hình lưới, chỉ tăng/giảm số màu $k$ và xem hệ số nào thay đổi theo.
  Với $k=3$: $H=3$, $k-1=2$, $k-2=1$. Với $k=5$: $H=13$, $k-1=4$, $k-2=3$.
]

#v(0.5em)

#cannon-box("Ví dụ 5 — Lưới khuyết góc, k = 3 màu (Mô hình A nhưng ít màu hơn)", [
  *Đề bài:* Lưới chữ L (2→2→1) giống Ví dụ 1, nhưng chỉ có *3 màu*. Hai ô kề cạnh khác màu. Tính số cách tô.

  #grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        rect((0,0),(1,1), fill: g, stroke: 1.2pt + black); rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
        rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
        rect((2,1),(3,2), fill: o, stroke: 1.2pt + black)
        rect((2,0),(3,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((2,0),(3,1), stroke: 0.6pt + rgb("BBBBBB")); line((3,0),(2,1), stroke: 0.6pt + rgb("BBBBBB"))
        content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
        content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2])
        content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3])
      })
    ]
  ], [
    *Thay $k=3$ vào Bộ Quy Tắc:*
    - C.1 (QT1, h=2): $k(k-1) = 3 times 2 = 6$
    - C.2 (QT2, đầy đủ): $H = k^2-3k+3 = 9-9+3 = 3$
    - C.3 (QT3, khuyết giảm): $k-1 = 2$
    #align(center)[$ N = 6 times 3 times 2 = bold(36) "cách" $]
  ])
])

#v(0.6em)

#cannon-box("Ví dụ 6 — Lưới khuyết góc, k = 5 màu (Mô hình A nhưng nhiều màu hơn)", [
  *Đề bài:* Cùng lưới chữ L trên, nhưng bây giờ có *5 màu*.

  #grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        rect((0,0),(1,1), fill: g, stroke: 1.2pt + black); rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
        rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
        rect((2,1),(3,2), fill: o, stroke: 1.2pt + black)
        rect((2,0),(3,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((2,0),(3,1), stroke: 0.6pt + rgb("BBBBBB")); line((3,0),(2,1), stroke: 0.6pt + rgb("BBBBBB"))
        content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
        content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2])
        content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3])
      })
    ]
  ], [
    *Thay $k=5$ vào Bộ Quy Tắc:*
    - C.1 (QT1, h=2): $k(k-1) = 5 times 4 = 20$
    - C.2 (QT2, đầy đủ): $H = k^2-3k+3 = 25-15+3 = 13$
    - C.3 (QT3, khuyết giảm): $k-1 = 4$
    #align(center)[$ N = 20 times 13 times 4 = bold(1040) "cách" $]
  ])
])

#v(0.6em)

#cannon-box("Ví dụ 7 — Bậc thang, k = 3 màu", [
  *Đề bài:* Lưới bậc thang (1→2→1) giống Ví dụ 3, nhưng chỉ *3 màu*.

  #grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
        rect((0,0),(1,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((0,0),(1,1), stroke: 0.6pt + rgb("BBBBBB")); line((1,0),(0,1), stroke: 0.6pt + rgb("BBBBBB"))
        rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
        rect((2,0),(3,1), fill: o, stroke: 1.2pt + black)
        rect((2,1),(3,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((2,1),(3,2), stroke: 0.6pt + rgb("BBBBBB")); line((3,1),(2,2), stroke: 0.6pt + rgb("BBBBBB"))
        content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
        content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2])
        content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3])
      })
    ]
  ], [
    *Thay $k=3$:*
    - C.1 (QT1, h=1): $k = 3$
    - C.2 (QT3, tăng 1→2): $(k-1)^2 = 2^2 = 4$
    - C.3 (QT3, giảm 2→1): $k-1 = 2$
    #align(center)[$ N = 3 times 4 times 2 = bold(24) "cách" $]
  ])
])

#v(0.6em)

#cannon-box("Ví dụ 8 — Bậc thang, k = 5 màu", [
  *Đề bài:* Cùng lưới bậc thang (1→2→1), nhưng *5 màu*.

  #grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
        rect((0,0),(1,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((0,0),(1,1), stroke: 0.6pt + rgb("BBBBBB")); line((1,0),(0,1), stroke: 0.6pt + rgb("BBBBBB"))
        rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
        rect((2,0),(3,1), fill: o, stroke: 1.2pt + black)
        rect((2,1),(3,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((2,1),(3,2), stroke: 0.6pt + rgb("BBBBBB")); line((3,1),(2,2), stroke: 0.6pt + rgb("BBBBBB"))
        content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
        content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2])
        content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3])
      })
    ]
  ], [
    *Thay $k=5$:*
    - C.1 (QT1, h=1): $k = 5$
    - C.2 (QT3, tăng 1→2): $(k-1)^2 = 4^2 = 16$
    - C.3 (QT3, giảm 2→1): $k-1 = 4$
    #align(center)[$ N = 5 times 16 times 4 = bold(320) "cách" $]
  ])
])

#v(0.5em)

// ══════════════════════════════════════════════════════════════════
#note-box(title: "📐 Nhóm II — Lưới 4 Cột và 5 Cột (Rộng Hơn)")[
  Khi lưới có nhiều cột hơn, ta chỉ việc *lặp lại* bước chuyển tiếp. Quy tắc không thay đổi — số cột tăng lên thì số lần nhân hệ số tăng theo.
]

#v(0.5em)

#cannon-box("Ví dụ 9 — Lưới 4 cột (2→2→2→1), k = 4 màu", [
  *Đề bài:* Lưới 7 ô: 3 cột đầy đủ 2 ô rồi 1 ô đơn ở cuối. Có 4 màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD")
      let p = rgb("EDE7F6"); let o = rgb("FFE0B2")
      // C1
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black); rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      // C2
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      // C3
      rect((2,0),(3,1), fill: p, stroke: 1.2pt + black); rect((2,1),(3,2), fill: p, stroke: 1.2pt + black)
      // C4 (1 ô trên)
      rect((3,1),(4,2), fill: o, stroke: 1.2pt + black)
      rect((3,0),(4,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((3,0),(4,1), stroke: 0.6pt + rgb("BBBBBB")); line((4,0),(3,1), stroke: 0.6pt + rgb("BBBBBB"))
      // Nhãn
      for (i, c) in ((0, rgb("1B5E20")), (1, rgb("0D47A1")), (2, rgb("4A148C")), (3, rgb("BF360C"))) {
        content((i + 0.5, -0.35), text(size: 7.5pt, weight: "bold", fill: c)[C.#(i+1)])
      }
    })
  ]
  #v(0.3em)

  *Phân tích từng cột:*
  - *C.1 (QT1, h=2):* $N_1 = k(k-1) = 4 times 3 = 12$
  - *C.2 (QT2, đầy đủ):* $N_2 = H = 7$
  - *C.3 (QT2, đầy đủ):* $N_3 = H = 7$ — cũng là cột đầy đủ h=2 kề C.2!
  - *C.4 (QT3, giảm 2→1):* $N_4 = k-1 = 3$

  #align(center)[$ N = 12 times 7 times 7 times 3 = bold(1764) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 10 — Lưới 4 cột (2→2→2→1), k = 3 màu", [
  *Đề bài:* Cùng hình lưới Ví dụ 9 nhưng chỉ *3 màu*. Lưu ý H = 3, không phải 7!

  *Phân tích nhanh:*
  - *C.1 (QT1):* $k(k-1) = 3 times 2 = 6$
  - *C.2 (QT2):* $H = 3^2 - 3(3) + 3 = 3$
  - *C.3 (QT2):* $H = 3$
  - *C.4 (QT3, giảm):* $k-1 = 2$

  #align(center)[$ N = 6 times 3 times 3 times 2 = bold(108) "cách" $]

  #note-box(title: "💡 So sánh thú vị")[ Cùng hình lưới, 3 màu cho *108 cách*, còn 4 màu (VD9) cho *1764 cách*. Chênh lệch gần 16 lần — minh chứng rõ ràng nhất cho sức mạnh của biến số $k$! ]
])

#v(0.6em)

#cannon-box("Ví dụ 11 — Lưới 5 cột (1→2→2→2→1), k = 4 màu", [
  *Đề bài:* Lưới 8 ô dạng thoi — bắt đầu bằng 1 ô, phình ra 3 cột đôi, thu lại 1 ô. Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD")
      let p = rgb("EDE7F6"); let o = rgb("FFE0B2"); let r = rgb("FCE4EC")
      // C1 (1 ô trên)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((0,0),(1,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((0,0),(1,1), stroke: 0.6pt + rgb("BBBBBB")); line((1,0),(0,1), stroke: 0.6pt + rgb("BBBBBB"))
      // C2
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      // C3
      rect((2,0),(3,1), fill: p, stroke: 1.2pt + black); rect((2,1),(3,2), fill: p, stroke: 1.2pt + black)
      // C4
      rect((3,0),(4,1), fill: o, stroke: 1.2pt + black); rect((3,1),(4,2), fill: o, stroke: 1.2pt + black)
      // C5 (1 ô dưới)
      rect((4,0),(5,1), fill: r, stroke: 1.2pt + black)
      rect((4,1),(5,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((4,1),(5,2), stroke: 0.6pt + rgb("BBBBBB")); line((5,1),(4,2), stroke: 0.6pt + rgb("BBBBBB"))
      for (i, c) in ((0, rgb("1B5E20")), (1, rgb("0D47A1")), (2, rgb("4A148C")), (3, rgb("BF360C")), (4, rgb("880E4F"))) {
        content((i + 0.5, -0.35), text(size: 7pt, weight: "bold", fill: c)[C.#(i+1)])
      }
    })
  ]
  #v(0.3em)

  *Phân tích từng cột:*
  - *C.1 (QT1, h=1):* $N_1 = k = 4$
  - *C.2 (QT3, tăng 1→2):* $N_2 = (k-1)^2 = 9$
  - *C.3 (QT2, đầy đủ):* $N_3 = H = 7$
  - *C.4 (QT2, đầy đủ):* $N_4 = H = 7$
  - *C.5 (QT3, giảm 2→1):* $N_5 = k-1 = 3$

  #align(center)[$ N = 4 times 9 times 7 times 7 times 3 = bold(5292) "cách" $]
])

#v(0.5em)

// ══════════════════════════════════════════════════════════════════
#note-box(title: "🏗️ Nhóm III — Cột Cao 3 Tầng")[
  Khi cột cao đến 3 ô, Quy tắc 1 & 3 mở rộng tự nhiên.
  
  *Quy tắc 1 với h=3:* $N_1 = k(k-1)^2$ (ô đầu: $k$; ô giữa: $k-1$; ô cuối: $k-1$).
  
  *Chuyển tiếp h=2 → h=3 (khuyết tăng lên 3):* Tô từng ô mới từ trên xuống:
  - Hai ô đầu: hệ số tổng = $H$ (tính như chuyển tiếp đầy đủ giữa 2 ô).
  - Ô thứ ba: chỉ kề dọc ô trên (cột cũ không có ô thứ 3) $=> k-1$ cách.
  - *Hệ số tổng: $H times (k-1)$.*
  
  *Chuyển tiếp h=3 → h=2 (khuyết giảm xuống 2):* Ô thứ 3 của cột cũ không kề cột mới, chỉ xét 2 ô đầu $=> H$, giống chuyển tiếp đầy đủ.
]

#v(0.5em)

#cannon-box("Ví dụ 12 — Bậc thang giảm 3→2→1, k = 4 màu", [
  *Đề bài:* Lưới 6 ô dạng bậc thang đi xuống: Cột 1 cao 3 ô, Cột 2 cao 2 ô, Cột 3 cao 1 ô. Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
      // C1 — 3 ô (cao nhất)
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((0,2),(1,3), fill: g, stroke: 1.2pt + black)
      // C2 — 2 ô (kề hàng 1 và 2 của C1)
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black)
      rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      rect((1,2),(2,3), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((1,2),(2,3), stroke: 0.6pt + rgb("BBBBBB")); line((2,2),(1,3), stroke: 0.6pt + rgb("BBBBBB"))
      // C3 — 1 ô (kề hàng 1 của C2)
      rect((2,0),(3,1), fill: o, stroke: 1.2pt + black)
      rect((2,1),(3,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((2,1),(3,2), stroke: 0.6pt + rgb("BBBBBB")); line((3,1),(2,2), stroke: 0.6pt + rgb("BBBBBB"))
      rect((2,2),(3,3), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((2,2),(3,3), stroke: 0.6pt + rgb("BBBBBB")); line((3,2),(2,3), stroke: 0.6pt + rgb("BBBBBB"))
      content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1 (3ô)])
      content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2 (2ô)])
      content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3 (1ô)])
    })
  ]
  #v(0.3em)

  - *C.1 (QT1, h=3):* $N_1 = k(k-1)^2 = 4 times 3^2 = 36$ cách.
  - *C.2 (QT — chuyển tiếp h=3→h=2):*
    C.2 chỉ có 2 ô, kề với đúng 2 ô _dưới_ của C.1. Ô thứ 3 của C.1 (hàng trên cùng) không có ô nào của C.2 kề → bỏ qua. Ta chỉ nhìn vào 2 ô kề nhau của C.1, tức là chuyển tiếp đầy đủ 2 ô: $N_2 = H = 7$ cách.
  - *C.3 (QT3, giảm 2→1):* $N_3 = k-1 = 3$ cách.

  #align(center)[$ N = 36 times 7 times 3 = bold(756) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 13 — Bậc thang tăng 1→2→3, k = 4 màu", [
  *Đề bài:* Lưới 6 ô bậc thang đi lên: Cột 1 cao 1 ô, Cột 2 cao 2 ô, Cột 3 cao 3 ô. Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
      // C1 — 1 ô dưới
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      rect((0,1),(1,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((0,1),(1,2), stroke: 0.6pt + rgb("BBBBBB")); line((1,1),(0,2), stroke: 0.6pt + rgb("BBBBBB"))
      rect((0,2),(1,3), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((0,2),(1,3), stroke: 0.6pt + rgb("BBBBBB")); line((1,2),(0,3), stroke: 0.6pt + rgb("BBBBBB"))
      // C2 — 2 ô
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      rect((1,2),(2,3), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((1,2),(2,3), stroke: 0.6pt + rgb("BBBBBB")); line((2,2),(1,3), stroke: 0.6pt + rgb("BBBBBB"))
      // C3 — 3 ô
      rect((2,0),(3,1), fill: o, stroke: 1.2pt + black)
      rect((2,1),(3,2), fill: o, stroke: 1.2pt + black)
      rect((2,2),(3,3), fill: o, stroke: 1.2pt + black)
      content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1 (1ô)])
      content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2 (2ô)])
      content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3 (3ô)])
    })
  ]
  #v(0.3em)

  - *C.1 (QT1, h=1):* $N_1 = k = 4$ cách.
  - *C.2 (QT3, tăng 1→2):* $(k-1)^2 = 9$ cách.
  - *C.3 (QT — chuyển tiếp h=2→h=3):*
    C.3 có 3 ô. Ta tô từng ô từ dưới lên (hoặc trên xuống đều được):
    - _Ô 1 & ô 2 của C.3_ kề ngang với 2 ô của C.2 → hệ số cho cặp này bằng $H = 7$.
    - _Ô 3 của C.3_: không kề ngang với ô nào (C.2 chỉ cao 2), chỉ kề dọc ô 2 → $k-1 = 3$ cách.
    - $N_3 = H times (k-1) = 7 times 3 = 21$ cách.

  #align(center)[$ N = 4 times 9 times 21 = bold(756) "cách" $]

  #note-box(title: "🔄 Bất ngờ đối xứng")[Bậc thang giảm 3→2→1 (VD12) và bậc thang tăng 1→2→3 (VD13) cùng cho *756 cách*! Đây không phải trùng hợp — lưới có tính đối xứng gương, số cách tô phải bằng nhau.]
])

#v(0.6em)

#cannon-box("Ví dụ 14 — Kim cương 1→2→3→2→1, k = 4 màu", [
  *Đề bài:* Lưới 9 ô hình thoi cân: bắt đầu 1 ô, tăng dần lên 3 ô, rồi giảm về 1 ô. Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD")
      let p = rgb("EDE7F6"); let o = rgb("FFE0B2"); let r = rgb("FCE4EC")
      let X = rgb("F5F5F5"); let xs = 0.6pt + rgb("BBBBBB")
      // C1 (h=1)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((0,0),(1,1), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((0,0),(1,1), stroke: xs); line((1,0),(0,1), stroke: xs)
      rect((0,2),(1,3), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((0,2),(1,3), stroke: xs); line((1,2),(0,3), stroke: xs)
      // C2 (h=2)
      rect((1,1),(2,2), fill: b, stroke: 1.2pt + black); rect((1,0),(2,1), fill: b, stroke: 1.2pt + black)
      rect((1,2),(2,3), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((1,2),(2,3), stroke: xs); line((2,2),(1,3), stroke: xs)
      // C3 (h=3)
      rect((2,0),(3,1), fill: p, stroke: 1.2pt + black)
      rect((2,1),(3,2), fill: p, stroke: 1.2pt + black)
      rect((2,2),(3,3), fill: p, stroke: 1.2pt + black)
      // C4 (h=2)
      rect((3,1),(4,2), fill: o, stroke: 1.2pt + black); rect((3,0),(4,1), fill: o, stroke: 1.2pt + black)
      rect((3,2),(4,3), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((3,2),(4,3), stroke: xs); line((4,2),(3,3), stroke: xs)
      // C5 (h=1)
      rect((4,1),(5,2), fill: r, stroke: 1.2pt + black)
      rect((4,0),(5,1), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((4,0),(5,1), stroke: xs); line((5,0),(4,1), stroke: xs)
      rect((4,2),(5,3), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((4,2),(5,3), stroke: xs); line((5,2),(4,3), stroke: xs)
      // Nhãn
      for (i, c, l) in ((0, rgb("1B5E20"), "1ô"), (1, rgb("0D47A1"), "2ô"), (2, rgb("4A148C"), "3ô"), (3, rgb("BF360C"), "2ô"), (4, rgb("880E4F"), "1ô")) {
        content((i + 0.5, -0.4), text(size: 7pt, weight: "bold", fill: c)[C.#(i+1) (#l)])
      }
    })
  ]
  #v(0.4em)

  - *C.1 (QT1, h=1):* $N_1 = k = 4$ cách.
  - *C.2 (QT3, tăng 1→2):* $N_2 = (k-1)^2 = 9$ cách.
  - *C.3 (QT: tăng 2→3):* Hai ô đầu kề C.2 cho hệ số $H=7$; ô thứ 3 chỉ kề dọc → $k-1=3$. Vậy $N_3 = H times (k-1) = 7 times 3 = 21$ cách.
  - *C.4 (QT: giảm 3→2):* C.4 có 2 ô, chỉ kề với 2 ô _dưới_ của C.3. Chuyển tiếp đầy đủ: $N_4 = H = 7$ cách.
  - *C.5 (QT3, giảm 2→1):* $N_5 = k-1 = 3$ cách.

  #align(center)[$ N = 4 times 9 times 21 times 7 times 3 = bold(15.876) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 15 — Kim cương 1→2→3→2→1, k = 3 màu", [
  *Đề bài:* Cùng lưới kim cương VD14, nhưng chỉ *3 màu*. Lưu ý $H=3$ và $k-1=2$.

  *Phân tích nhanh (cùng cấu trúc, thay $k=3$):*

  #table(
    columns: (1fr, 1fr, 1.5fr, 1fr),
    inset: 6pt,
    align: (left, center, left, center),
    [*Cột*], [*Chuyển tiếp*], [*Công thức*], [*Hệ số*],
    [C.1 (1ô)], [QT1], [$k = 3$], [*3*],
    [C.2 (2ô)], [Tăng 1→2], [$(k-1)^2 = 2^2$], [*4*],
    [C.3 (3ô)], [Tăng 2→3], [$H times (k-1) = 3 times 2$], [*6*],
    [C.4 (2ô)], [Giảm 3→2], [$H = k^2-3k+3$], [*3*],
    [C.5 (1ô)], [Giảm 2→1], [$k-1 = 2$], [*2*],
  )
  #v(0.3em)
  #align(center)[$ N = 3 times 4 times 6 times 3 times 2 = bold(432) "cách" $]

  #note-box(title: "📊 Bảng so sánh Kim Cương theo k")[
    #table(
      columns: (1fr, 1fr, 1fr, 1fr),
      inset: 5pt,
      align: center,
      [*k màu*], [*H*], [*Hệ số C.3*], [*Tổng N*],
      [$k=3$], [$3$], [$3 times 2 = 6$], [*432*],
      [$k=4$], [$7$], [$7 times 3 = 21$], [*15.876*],
      [$k=5$], [$13$], [$13 times 4 = 52$], [*5 × 16 × 52 × 13 × 4 = 216.320*],
    )
  ]
])

#pagebreak()

== 9. Tình Huống Đặc Biệt — Né 2 Ô Chéo & Ô Cô Lập

#note-box(title: "⚠️ Bổ sung Quy tắc 3: Né 2 ô chéo (chưa biết cùng màu hay khác màu)")[
  Khi một ô mới kề _chéo_ với 2 ô đã tô (ví dụ: ô kề ngang với một ô, đồng thời kề dọc với một ô khác — hai ô đó không chạm nhau), ta _không biết trước_ chúng cùng màu hay khác màu. Cách xử lý:
  
  1. *Tính trên tổng:* Lấy $k$ tổng màu của 2 ô đã tô: nếu cùng màu, ô mới có $k-1$ cách; nếu khác màu, ô mới có $k-2$ cách.
  2. *Đếm theo xác suất:* Trong tất cả cách tô 2 ô kề nhau (kề ngang/dọc), xác suất cùng màu là $1/k$, khác màu là $(k-1)/k$.
  3. *Hệ số kỳ vọng:* $1/k dot (k-1) + (k-1)/k dot (k-2) = ((k-1)^2 + (k-1)(k-2))/k = (k-1)(2k-3)/k$.
]

#v(0.5em)

#cannon-box("Ví dụ 16 — Lưới có ô kề chéo 2 ô đã tô, k = 4 màu", [
  *Đề bài:* Lưới 3 ô dạng chữ "L" ngược: Cột 1 cao 2 ô, Cột 2 chỉ có 1 ô ở _hàng dưới_ (kề chéo với cả 2 ô của Cột 1). Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let o = rgb("FFE0B2")
      // C1 — 2 ô (hàng 2 và 1)
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      // C2 — 1 ô ở hàng dưới (kề ngang C1 hàng 0 VÀ kề chéo C1 hàng 1)
      rect((1,0),(2,1), fill: o, stroke: 1.5pt + black)
      rect((1,1),(2,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((1,1),(2,2), stroke: 0.6pt + rgb("BBBBBB")); line((2,1),(1,2), stroke: 0.6pt + rgb("BBBBBB"))
      // Nhãn
      content((0.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
      content((1.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[C.2])
      // Mũi tên chỉ kề chéo
      line((1.0, 0.5), (1.5, 1.0), stroke: (dash: "dashed", paint: rgb("BF360C"), thickness: 0.8pt))
      content((1.6, 0.9), text(size: 7pt, fill: rgb("BF360C"), weight: "bold")[chéo])
    })
  ]
  #v(0.3em)

  *Phân tích:*

  - *C.1 (QT1, h=2):* $N_1 = k(k-1) = 4 times 3 = 12$ cách.
  - *C.2 (QT — kề chéo với 2 ô đã tô):*
    Ô C.2 kề ngang ô C.1 hàng dưới (gọi màu $A$) và kề chéo ô C.1 hàng trên (gọi màu $B$).
    
    *Trường hợp 1:* Hai ô của C.1 _cùng màu_ ($A = B$): xảy ra ở $1/k = 1/4$ tổng số cách tô C.1. Khi đó ô C.2 chỉ cần né 1 màu $=> k-1 = 3$ cách.
    
    *Trường hợp 2:* Hai ô của C.1 _khác màu_ ($A eq.not B$): xảy ra ở $(k-1)/k = 3/4$. Khi đó ô C.2 phải né cả $A$ và $B$ (2 màu khác nhau) $=> k-2 = 2$ cách.
    
    *Hệ số kỳ vọng cho C.2 (tính trung bình):*
    $ N_2 = frac(1, k) dot (k-1) + frac(k-1, k) dot (k-2) = frac(1, 4) dot 3 + frac(3, 4) dot 2 = 0.75 + 1.5 = 2.25 $
    
    Nhưng _phải tính đúng_ bằng cách liệt kê:
    - Với 2 ô C.1 cùng màu: có $1 times 4 = 4$ cách (chọn 1 màu cho cả 2 ô) $->$ mỗi cách cho $k-1=3$ cách tô C.2 $=> 4 times 3 = 12$.
    - Với 2 ô C.1 khác màu: có $4 times 3 = 12$ cách (ô trên tự do, ô dưới né 1) $->$ mỗi cách cho $k-2=2$ cách tô C.2 $=> 12 times 2 = 24$.
    - Tổng số cách (C.1, C.2): $12 + 24 = 36$.
    - Số cách trung bình cho C.2: $36 / 12 = 3$ cách.
  
  #align(center)[$ N = 12 times 3 = bold(36) "cách" $]

  #note-box(title: "💡 Mẹo nhớ nhanh")[Với k=4, hệ số trung bình cho ô kề chéo 2 ô khác màu _(tính theo công thức)_ là $frac((k-1)(2k-3), k) = frac(3 times 5, 4) = 3.75$... Nhưng khi 2 ô kia _thuộc cùng cột_ (đã kề dọc, chắc chắn khác màu), ta dùng đúng $k-2$ nếu khác màu, $k-1$ nếu cùng màu. _Tính trung bình_ cho ra $frac((k-1)^2 + (k-1)(k-2), k) = 3$ khi $k=4$.]
])

#v(0.6em)

#cannon-box("Ví dụ 17 — Lưới 2 đảo tách rời (ô cô lập), k = 4 màu", [
  *Đề bài:* Lưới 5 ô gồm: Một khối vuông 2×2 (4 ô kề nhau) và 1 ô _cô lập_ tách rời ở xa (không kề cạnh với bất kỳ ô nào). Có 4 màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let o = rgb("FFE0B2")
      // Khối 2x2
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      rect((1,0),(2,1), fill: g, stroke: 1.2pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((1,1),(2,2), fill: g, stroke: 1.2pt + black)
      // Ô cô lập (cách xa 1 đơn vị)
      rect((4,0.5),(5,1.5), fill: o, stroke: 1.5pt + black)
      // Dấu ... thể hiện khoảng cách
      for x in (2.2, 2.6, 3.0, 3.4) {
        line((x, 1.0), (x + 0.1, 1.0), stroke: 1.2pt + black)
      }
      // Nhãn
      content((1.0, -0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[Khối 2x2])
      content((4.5, -0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[Ô lẻ])
    })
  ]
  #v(0.3em)

  *Phân tích bằng Bộ Quy Tắc:*

  - *Khối 2×2 (áp dụng Quét Cột 4 cột 1 ô? Không — phải dùng 2 cột cao 2 ô):*
    - *C.1 (QT1, h=2):* $N_1 = k(k-1) = 12$ cách.
    - *C.2 (QT2, đầy đủ h=2):* $N_2 = H = 7$ cách.
    $ => N_"khối" = 12 times 7 = 84 $ cách.

  - *Ô cô lập:* Hoàn toàn tự do, không bị ràng buộc với khối 2×2. Chỉ cần chọn 1 trong $k$ màu:
    $ => N_"lẻ" = k = 4 $ cách.

  *Kết quả toàn lưới (Quy tắc nhân vì 2 phần độc lập):*
  #align(center)[
    $ N = N_"khối" times N_"lẻ" = 84 times 4 = bold(336) "cách" $
  ]

  #note-box(title: "🎯 Tư duy quan trọng")[Khi lưới _tách thành nhiều phần độc lập_ (không có ô kề cạnh giữa các phần), ta tính số cách tô _từng phần_ rồi _nhân với nhau_. Phần nào cũng có thể tô màu _trước_, thứ tự không quan trọng — bản chất là tích Cartesian của tập cách tô.]
])

#v(0.6em)

#cannon-box("Ví dụ 18 — Lưới 2 đảo tách rời nhưng có đảo lớn 3×2, k = 4 màu", [
  *Đề bài:* Khối chữ nhật 3 cột × 2 hàng (6 ô) và 1 ô cô lập. Có 4 màu.

  #grid(columns: (1fr, 1.4fr), gutter: 0.6cm, [
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let o = rgb("FFE0B2")
        // Khối 3x2
        rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
        rect((1,0),(2,1), fill: g, stroke: 1.2pt + black)
        rect((2,0),(3,1), fill: g, stroke: 1.2pt + black)
        rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
        rect((1,1),(2,2), fill: g, stroke: 1.2pt + black)
        rect((2,1),(3,2), fill: g, stroke: 1.2pt + black)
        // Ô lẻ (xa)
        rect((5,0.5),(6,1.5), fill: o, stroke: 1.5pt + black)
        for x in (3.3, 3.7, 4.1, 4.5) {
          line((x, 1.0), (x + 0.1, 1.0), stroke: 1.2pt + black)
        }
        content((1.5, -0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[Khối 3×2])
        content((5.5, -0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[Ô lẻ])
      })
    ]
  ], [
    *Phân tích:*
    - *Khối 3×2:* Quét cột:
      - C.1: $k(k-1) = 12$
      - C.2: $H = 7$
      - C.3: $H = 7$
      $=> N_"khối" = 12 times 7 times 7 = 588$
    - *Ô lẻ:* $k = 4$ cách.
    - *Tổng:* $N = 588 times 4 = 2352$
    
    #align(center)[
      $ N = 588 times 4 = bold(2352) "cách" $
    ]
  ])
])

#v(0.6em)

#cannon-box("Ví dụ 19 — Bậc thang 4 tầng 1→2→3→4, k = 4 màu (Stress-test Bộ Quy Tắc)", [
  *Đề bài:* Lưới 10 ô bậc thang đi lên đến 4 ô mỗi cột. Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.7cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD")
      let p = rgb("EDE7F6"); let o = rgb("FFE0B2")
      // C1 (1 ô)
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      // C2 (2 ô)
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black)
      rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      // C3 (3 ô)
      rect((2,0),(3,1), fill: p, stroke: 1.2pt + black)
      rect((2,1),(3,2), fill: p, stroke: 1.2pt + black)
      rect((2,2),(3,3), fill: p, stroke: 1.2pt + black)
      // C4 (4 ô)
      rect((3,0),(4,1), fill: o, stroke: 1.2pt + black)
      rect((3,1),(4,2), fill: o, stroke: 1.2pt + black)
      rect((3,2),(4,3), fill: o, stroke: 1.2pt + black)
      rect((3,3),(4,4), fill: o, stroke: 1.2pt + black)
      // Nhãn
      content((0.5,-0.3), text(size: 7pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
      content((1.5,-0.3), text(size: 7pt, weight: "bold", fill: rgb("0D47A1"))[C.2])
      content((2.5,-0.3), text(size: 7pt, weight: "bold", fill: rgb("4A148C"))[C.3])
      content((3.5,-0.3), text(size: 7pt, weight: "bold", fill: rgb("BF360C"))[C.4])
    })
  ]
  #v(0.3em)

  *Phân tích từng cột (vẫn dùng Bộ Quy Tắc mở rộng):*

  - *C.1 (QT1, h=1):* $N_1 = k = 4$.
  - *C.2 (QT3, tăng 1→2):* $N_2 = (k-1)^2 = 9$.
  - *C.3 (tăng 2→3):* Tô từng ô từ dưới lên:
    - 2 ô đầu (ô 1, ô 2) kề ngang C.2 -> hệ số cặp = $H = 7$.
    - Ô 3 (trên cùng) chỉ kề dọc ô 2 -> $k-1 = 3$.
    $ N_3 = H times (k-1) = 7 times 3 = 21 $.
  - *C.4 (tăng 3→4):* Tô từ dưới lên:
    - 3 ô đầu kề ngang C.3 -> _tương tự_ hệ số cặp giữa 3 ô đầu = $H = 7$, ô 3 kề dọc ô 2 = $k-1 = 3$. Tổng 3 ô đầu: $7 times 3 = 21$.
    - Ô 4 (trên cùng) chỉ kề dọc ô 3 -> $k-1 = 3$.
    $ N_4 = 21 times (k-1) = 21 times 3 = 63 $.

  *Kết quả:*
  #align(center)[
    $ N = 4 times 9 times 21 times 63 = bold(47.628) "cách" $
  ]

  #note-box(title: "🔁 Quy luật tổng quát")[Với bậc thang tăng $1 -> 2 -> 3 -> ... -> m$ và $k$ màu:
    - Cột $j$ (ở giữa hoặc cuối) có hệ số tăng theo _tích lũy_: $H, H(k-1), H(k-1)^2, ..., H(k-1)^(m-2)$.
    - Tổng: $N = k dot (k-1)^2 dot H^(m-2) times (k-1)^(((m-2)(m-1))/2)$ với công thức tổng quát của bậc thang tăng... Công thức chính xác phụ thuộc cấu trúc, nhưng tư duy _tô từng ô_ luôn đúng.]
])

#v(0.6em)

#cannon-box("Ví dụ 20 — Tổng hợp: Lưới 11 ô 2 đảo (Bài 3.3 chuẩn), k = 4 màu", [
  *Đề bài:* Lưới 11 ô gồm 2 phần tách rời:
  - _Phần A (bên trái):_ Khối 4 cột × 2 hàng (8 ô) kề đầy đủ.
  - _Phần B (bên phải):_ Khối 2 cột × 1 hàng + 1 ô đơn (3 ô) theo mô hình khuyết giảm.
  Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD")
      let p = rgb("EDE7F6"); let o = rgb("FFE0B2"); let r = rgb("FCE4EC")
      // Phần A — 4 cột × 2 hàng
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black); rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      rect((2,0),(3,1), fill: p, stroke: 1.2pt + black); rect((2,1),(3,2), fill: p, stroke: 1.2pt + black)
      rect((3,0),(4,1), fill: o, stroke: 1.2pt + black); rect((3,1),(4,2), fill: o, stroke: 1.2pt + black)
      // Khoảng cách
      for x in (4.2, 4.5, 4.8) {
        line((x, 1.0), (x + 0.1, 1.0), stroke: 1.2pt + black)
      }
      // Phần B — 2 cột cao 1 ô + 1 ô lẻ
      rect((5.0, 0.5),(6.0, 1.5), fill: r, stroke: 1.5pt + black)
      rect((5.0, 1.5),(6.0, 2.5), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((5.0, 1.5),(6.0, 2.5), stroke: 0.6pt + rgb("BBBBBB")); line((6.0, 1.5),(5.0, 2.5), stroke: 0.6pt + rgb("BBBBBB"))
      rect((6.0, 0.5),(7.0, 1.5), fill: rgb("FFE0B2"), stroke: 1.2pt + black)
      rect((6.0, 1.5),(7.0, 2.5), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((6.0, 1.5),(7.0, 2.5), stroke: 0.6pt + rgb("BBBBBB")); line((7.0, 1.5),(6.0, 2.5), stroke: 0.6pt + rgb("BBBBBB"))
      rect((7.0, 0.5),(8.0, 1.5), fill: rgb("B2DFDB"), stroke: 1.2pt + black)
      rect((7.0, 1.5),(8.0, 2.5), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((7.0, 1.5),(8.0, 2.5), stroke: 0.6pt + rgb("BBBBBB")); line((8.0, 1.5),(7.0, 2.5), stroke: 0.6pt + rgb("BBBBBB"))
      // Nhãn phần
      content((2.0, 2.4), text(size: 7pt, weight: "bold", fill: rgb("1B5E20"))[Phần A — 4 cột đầy đủ])
      content((6.5, 2.4), text(size: 7pt, weight: "bold", fill: rgb("BF360C"))[Phần B — 1 hàng])
    })
  ]
  #v(0.3em)

  *Phân tích tách 2 phần độc lập:*

  *_Phần A (4 cột × 2 hàng = 8 ô):_*
  - C.1 (QT1, h=2): $12$
  - C.2 (QT2): $H = 7$
  - C.3 (QT2): $H = 7$
  - C.4 (QT2): $H = 7$
  $ => N_A = 12 times 7^3 = 12 times 343 = 4.116 $ cách.

  *_Phần B (3 ô theo hàng ngang):_*
  Cả 3 ô cùng hàng (h=1). Quét cột:
  - C.1 (QT1, h=1): $k = 4$
  - C.2 (QT2, h=1): $k-1 = 3$
  - C.3 (QT2, h=1): $k-1 = 3$
  $ => N_B = 4 times 3 times 3 = 36 $ cách.

  *_Kết quả (2 phần độc lập -> nhân):_*
  #align(center)[
    $ N = N_A times N_B = 4.116 times 36 = bold(148.176) "cách" $
  ]

  #note-box(title: "🧠 Bài học rút ra")[Khi gặp lưới phức tạp, _đừng hoảng_:
    1. _Quan sát kỹ_: Lưới có tách thành nhiều phần _rời nhau_ không?
    2. _Chia để trị_: Tính số cách tô _từng phần_ độc lập.
    3. _Quét cột_ trong mỗi phần: Dùng Bộ 3 Quy Tắc Vạn Năng.
    4. _Nhân kết quả_ các phần với nhau.
    
    Bộ Quy Tắc Vạn Năng đã _chinh phục_ mọi mô hình lưới từ đơn giản đến cực phức tạp!]
])

#pagebreak()

== 9. Chiến Dịch 5 Màu — Mọi Chiều Cao Từ 1 Đến 5 Hàng

Với $k=5$ màu: *$k-1=4$, $k-2=3$, $H = k^2-3k+3 = 13$*.
Phần này khám phá điều xảy ra khi cột ngày càng cao — từ 1 ô lên tới 5 ô — và cách Bộ Quy Tắc Vạn Năng vẫn vận hành hoàn hảo mà không cần thêm bất kỳ công thức mới nào.

#v(0.5em)

*Bảng hệ số tham chiếu nhanh ($k = 5$ màu):*

#grid(columns: (1fr, 1fr), gutter: 0.8cm, [
  #table(
    columns: (1.5fr, 1.3fr, 1fr),
    inset: 6pt,
    align: (left, left, center),
    table.header([*Cột khởi đầu (QT1)*], [*Công thức*], [*Hệ số*]),
    [h = 1 ô], [$k$], [*5*],
    [h = 2 ô], [$k(k-1)$], [*20*],
    [h = 3 ô], [$k(k-1)^2$], [*80*],
    [h = 4 ô], [$k(k-1)^3$], [*320*],
    [h = 5 ô], [$k(k-1)^4$], [*1280*],
  )
], [
  #table(
    columns: (1.8fr, 1fr, 1fr),
    inset: 6pt,
    align: (left, left, center),
    table.header([*Chuyển tiếp (QT2/QT3)*], [*Công thức*], [*Hệ số*]),
    [h=1 → h=1], [$k-1$], [*4*],
    [h=2 → h=2 (đầy đủ)], [$H$], [*13*],
    [h=1 → h=n bất kỳ], [$(k-1)^n$], [*4ⁿ*],
    [h≥2 → h=1], [$k-1$], [*4*],
    [h≥3 → h=2], [$H$], [*13*],
    [h=2 → h=n (n≥3)], [$H(k-1)^(n-2)$], [*13·4ⁿ⁻²*],
  )
])

#note-box(title: "📐 Quy luật tổng quát về chuyển tiếp")[
  *Khi cột mới THẤP hơn cột cũ (khuyết giảm):* chỉ có $m$ ô của cột cũ tương tác với $m$ ô của cột mới (tính từ dưới lên). Các ô phía trên của cột cũ bị bỏ qua hoàn toàn. Kết quả: $m=1 → k-1$; $m=2 → H$.

  *Khi cột mới CAO hơn cột cũ (khuyết tăng):* $n$ ô đầu của cột mới tương tác với cột cũ cao $n$ ô, sau đó mỗi ô dư thêm chỉ kề dọc với ô liền trên → nhân thêm $k-1$ cho mỗi ô dư.
]

#v(0.5em)

// ────────────────────────────────────────────
#cannon-box("Ví dụ 16 — Bậc thang giảm 3→2→1, k=5 màu", [
  *Đề bài:* Lưới 6 ô: Cột 1 cao *3 ô*, Cột 2 cao *2 ô*, Cột 3 cao *1 ô*. Có 5 màu.

  #align(center)[
    #cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
      let X = rgb("F5F5F5"); let xs = 0.6pt + rgb("BBBBBB")
      // C1: 3 ô
      for i in range(3) { rect((0, i),(1, i+1), fill: g, stroke: 1.2pt+black) }
      // C2: 2 ô + ô trống trên
      for i in range(2) { rect((1, i),(2, i+1), fill: b, stroke: 1.2pt+black) }
      rect((1,2),(2,3), fill: X, stroke: 0.6pt+rgb("CCCCCC"))
      line((1,2),(2,3), stroke: xs); line((2,2),(1,3), stroke: xs)
      // C3: 1 ô + ô trống
      rect((2,0),(3,1), fill: o, stroke: 1.2pt+black)
      for i in range(1,3) {
        rect((2,i),(3,i+1), fill: X, stroke: 0.6pt+rgb("CCCCCC"))
        line((2,i),(3,i+1), stroke: xs); line((3,i),(2,i+1), stroke: xs)
      }
      content((0.5,-0.4), text(size: 7.5pt, weight:"bold", fill:rgb("1B5E20"))[C.1 (h=3)])
      content((1.5,-0.4), text(size: 7.5pt, weight:"bold", fill:rgb("0D47A1"))[C.2 (h=2)])
      content((2.5,-0.4), text(size: 7.5pt, weight:"bold", fill:rgb("BF360C"))[C.3 (h=1)])
    })
  ]
  #v(0.3em)
  - *C.1 (QT1, h=3):* $N_1 = k(k-1)^2 = 5 times 4^2 = 80$ cách.
  - *C.2 (giảm 3→2, chỉ 2 ô dưới của C.1 tương tác):* $N_2 = H = 13$ cách.
  - *C.3 (giảm 2→1):* $N_3 = k-1 = 4$ cách.
  #align(center)[$ N = 80 times 13 times 4 = bold(4160) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 17 — Bậc thang giảm 4→2→1, k=5 màu", [
  *Đề bài:* Lưới 7 ô: Cột 1 cao *4 ô*, Cột 2 cao *2 ô*, Cột 3 cao *1 ô*. Có 5 màu.

  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
      let X = rgb("F5F5F5"); let xs = 0.6pt + rgb("BBBBBB")
      // C1: 4 ô
      for i in range(4) { rect((0,i),(1,i+1), fill: g, stroke: 1.2pt+black) }
      // C2: 2 ô + 2 ô trống
      for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1.2pt+black) }
      for i in range(2,4) {
        rect((1,i),(2,i+1), fill: X, stroke: 0.6pt+rgb("CCCCCC"))
        line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
      }
      // C3: 1 ô + 3 ô trống
      rect((2,0),(3,1), fill: o, stroke: 1.2pt+black)
      for i in range(1,4) {
        rect((2,i),(3,i+1), fill: X, stroke: 0.6pt+rgb("CCCCCC"))
        line((2,i),(3,i+1), stroke: xs); line((3,i),(2,i+1), stroke: xs)
      }
      content((0.5,-0.4), text(size: 7pt, weight:"bold", fill:rgb("1B5E20"))[C.1 (h=4)])
      content((1.5,-0.4), text(size: 7pt, weight:"bold", fill:rgb("0D47A1"))[C.2 (h=2)])
      content((2.5,-0.4), text(size: 7pt, weight:"bold", fill:rgb("BF360C"))[C.3 (h=1)])
    })
  ]
  #v(0.3em)
  - *C.1 (QT1, h=4):* $N_1 = k(k-1)^3 = 5 times 4^3 = 5 times 64 = 320$ cách.
  - *C.2 (giảm 4→2):* 2 ô dưới của C.1 tương tác với C.2 cao 2 ô. 2 ô trên của C.1 bị bỏ qua. $N_2 = H = 13$ cách.
  - *C.3 (giảm 2→1):* $N_3 = k-1 = 4$ cách.
  #align(center)[$ N = 320 times 13 times 4 = bold(16.640) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 18 — Bậc thang giảm 5→2→1, k=5 màu", [
  *Đề bài:* Lưới 8 ô: Cột 1 cao *5 ô*, Cột 2 cao *2 ô*, Cột 3 cao *1 ô*. Có 5 màu.

  #grid(columns: (1fr, 1.5fr), gutter: 0.6cm, [
    #align(center)[
      #cetz.canvas(length: 0.72cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        let X = rgb("F5F5F5"); let xs = 0.55pt + rgb("BBBBBB")
        // C1: 5 ô
        for i in range(5) { rect((0,i),(1,i+1), fill: g, stroke: 1.1pt+black) }
        // C2: 2 ô + 3 trống
        for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1.1pt+black) }
        for i in range(2,5) {
          rect((1,i),(2,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
        }
        // C3: 1 ô + 4 trống
        rect((2,0),(3,1), fill: o, stroke: 1.1pt+black)
        for i in range(1,5) {
          rect((2,i),(3,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((2,i),(3,i+1), stroke: xs); line((3,i),(2,i+1), stroke: xs)
        }
        content((0.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("1B5E20"))[C.1])
        content((1.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("0D47A1"))[C.2])
        content((2.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("BF360C"))[C.3])
      })
    ]
  ], [
    - *C.1 (QT1, h=5):*
      $N_1 = k(k-1)^4 = 5 times 4^4 = 5 times 256 = 1280$

    - *C.2 (giảm 5→2):*
      Chỉ 2 ô _dưới_ của C.1 tương tác với C.2 (3 ô trên bỏ qua).
      $N_2 = H = 13$

    - *C.3 (giảm 2→1):*
      $N_3 = k-1 = 4$

    #align(center)[$ N = 1280 times 13 times 4 = bold(66.560) "cách" $]
  ])
])

#v(0.6em)

#note-box(title: "🔍 Nhận xét quy luật bậc thang giảm")[
  Với bậc thang giảm $h -> 2 -> 1$ cùng $k=5$:

  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    inset: 5pt,
    align: center,
    [*h ban đầu*], [*$N_1 = 5 times 4^(h-1)$*], [*$N_2 = H = 13$*], [*Tổng*],
    [h=2], [$20$], [$13 times 4$], [*1.040*],
    [h=3], [$80$], [$13 times 4$], [*4.160*],
    [h=4], [$320$], [$13 times 4$], [*16.640*],
    [h=5], [$1280$], [$13 times 4$], [*66.560*],
  )

  Mỗi lần tăng thêm 1 tầng chiều cao, số cách nhân thêm đúng $k-1=4$ lần — vì ô thêm vào chỉ kề dọc 1 ô bên trong cột, không tạo thêm ràng buộc ngoài.
]

#v(0.5em)

#cannon-box("Ví dụ 19 — Bậc thang tăng 1→2→4, k=5 màu", [
  *Đề bài:* Lưới 7 ô bậc thang đi lên: Cột 1 cao *1 ô*, Cột 2 cao *2 ô*, Cột 3 cao *4 ô*. Có 5 màu.

  #align(center)[
    #cetz.canvas(length: 0.78cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
      let X = rgb("F5F5F5"); let xs = 0.55pt + rgb("BBBBBB")
      // C1: 1 ô dưới, 3 ô trống trên
      rect((0,0),(1,1), fill: g, stroke: 1.1pt+black)
      for i in range(1,4) {
        rect((0,i),(1,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((0,i),(1,i+1), stroke: xs); line((1,i),(0,i+1), stroke: xs)
      }
      // C2: 2 ô dưới, 2 ô trống trên
      for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1.1pt+black) }
      for i in range(2,4) {
        rect((1,i),(2,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
      }
      // C3: 4 ô
      for i in range(4) { rect((2,i),(3,i+1), fill: o, stroke: 1.1pt+black) }
      content((0.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("1B5E20"))[C.1])
      content((1.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("0D47A1"))[C.2])
      content((2.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("BF360C"))[C.3])
    })
  ]
  #v(0.3em)
  - *C.1 (QT1, h=1):* $N_1 = k = 5$ cách.
  - *C.2 (tăng 1→2):* $(k-1)^2 = 4^2 = 16$ cách.
  - *C.3 (tăng 2→4 — từ 2 ô phình lên 4 ô):*
    Ta tô C.3 từ dưới lên (hoặc trên xuống):
    - _Ô 1 & ô 2 của C.3_: kề ngang với 2 ô của C.2 → hệ số $H = 13$.
    - _Ô 3 của C.3_: chỉ kề dọc ô 2 (C.2 chỉ cao 2, không có ô hàng 3) → $k-1=4$.
    - _Ô 4 của C.3_: chỉ kề dọc ô 3 → $k-1=4$.
    $ N_3 = H times (k-1)^2 = 13 times 4^2 = 13 times 16 = 208 "cách" $
  #align(center)[$ N = 5 times 16 times 208 = bold(16.640) "cách" $]

  #note-box(title: "🪞 Đối xứng bất ngờ")[Bậc thang *giảm* 4→2→1 (VD17) và bậc thang *tăng* 1→2→4 (VD19) đều cho *16.640 cách*! Đây là tính đối xứng gương — lật ngang hình lưới không thay đổi số cách tô.]
])

#v(0.6em)

#cannon-box("Ví dụ 20 — Bậc thang tăng 1→2→5, k=5 màu", [
  *Đề bài:* Lưới: Cột 1 cao *1 ô*, Cột 2 cao *2 ô*, Cột 3 cao *5 ô*. Có 5 màu.

  #grid(columns: (1fr, 1.5fr), gutter: 0.5cm, [
    #align(center)[
      #cetz.canvas(length: 0.7cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        let X = rgb("F5F5F5"); let xs = 0.5pt + rgb("BBBBBB")
        // C1: 1 ô
        rect((0,0),(1,1), fill: g, stroke: 1.1pt+black)
        for i in range(1,5) {
          rect((0,i),(1,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((0,i),(1,i+1), stroke: xs); line((1,i),(0,i+1), stroke: xs)
        }
        // C2: 2 ô
        for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1.1pt+black) }
        for i in range(2,5) {
          rect((1,i),(2,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
        }
        // C3: 5 ô
        for i in range(5) { rect((2,i),(3,i+1), fill: o, stroke: 1.1pt+black) }
        content((0.5,-0.4), text(size: 6pt, weight:"bold", fill:rgb("1B5E20"))[C.1])
        content((1.5,-0.4), text(size: 6pt, weight:"bold", fill:rgb("0D47A1"))[C.2])
        content((2.5,-0.4), text(size: 6pt, weight:"bold", fill:rgb("BF360C"))[C.3])
      })
    ]
  ], [
    - *C.1 (QT1, h=1):* $N_1 = k = 5$
    - *C.2 (tăng 1→2):* $(k-1)^2 = 16$
    - *C.3 (tăng 2→5):*
      - Ô 1&2: kề C.2 → $H = 13$
      - Ô 3: kề dọc ô 2 → $k-1=4$
      - Ô 4: kề dọc ô 3 → $k-1=4$
      - Ô 5: kề dọc ô 4 → $k-1=4$
      $ N_3 = H times (k-1)^3 = 13 times 64 = 832 $

    #align(center)[$ N = 5 times 16 times 832 = bold(66.560) "cách" $]
  ])

  #note-box(title: "📊 Đối xứng với VD18")[Bậc thang giảm 5→2→1 (VD18 = 66.560) khớp đúng với bậc thang tăng 1→2→5 (VD20 = 66.560). Tính đối xứng là nhất quán!]
])

#v(0.6em)

#cannon-box("Ví dụ 21 — Kim cương 1→2→4→2→1, k=5 màu", [
  *Đề bài:* Lưới 10 ô hình thoi: khởi đầu 1 ô, phình lên 4 ô, thu về 1 ô. Có 5 màu.

  #align(center)[
    #cetz.canvas(length: 0.72cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let p = rgb("EDE7F6")
      let o = rgb("FFE0B2"); let r = rgb("FCE4EC")
      let X = rgb("F5F5F5"); let xs = 0.5pt + rgb("BBBBBB")
      let hmax = 4
      // C1: h=1
      rect((0,0),(1,1), fill: g, stroke: 1.1pt+black)
      for i in range(1,hmax) {
        rect((0,i),(1,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((0,i),(1,i+1), stroke: xs); line((1,i),(0,i+1), stroke: xs)
      }
      // C2: h=2
      for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1.1pt+black) }
      for i in range(2,hmax) {
        rect((1,i),(2,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
      }
      // C3: h=4 (full)
      for i in range(hmax) { rect((2,i),(3,i+1), fill: p, stroke: 1.1pt+black) }
      // C4: h=2
      for i in range(2) { rect((3,i),(4,i+1), fill: o, stroke: 1.1pt+black) }
      for i in range(2,hmax) {
        rect((3,i),(4,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((3,i),(4,i+1), stroke: xs); line((4,i),(3,i+1), stroke: xs)
      }
      // C5: h=1
      rect((4,0),(5,1), fill: r, stroke: 1.1pt+black)
      for i in range(1,hmax) {
        rect((4,i),(5,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((4,i),(5,i+1), stroke: xs); line((5,i),(4,i+1), stroke: xs)
      }
      let labels2 = ("C.1 (1ô)", "C.2 (2ô)", "C.3 (4ô)", "C.4 (2ô)", "C.5 (1ô)")
      let fcolors2 = (rgb("1B5E20"), rgb("0D47A1"), rgb("4A148C"), rgb("BF360C"), rgb("880E4F"))
      for i in range(5) {
        content((i+0.5,-0.4), text(size: 6pt, weight:"bold", fill:fcolors2.at(i))[#labels2.at(i)])
      }
    })
  ]
  #v(0.3em)

  - *C.1 (QT1, h=1):* $N_1 = k = 5$
  - *C.2 (tăng 1→2):* $N_2 = (k-1)^2 = 16$
  - *C.3 (tăng 2→4):* $N_3 = H times (k-1)^2 = 13 times 16 = 208$
  - *C.4 (giảm 4→2):* Chỉ 2 ô dưới của C.3 tương tác. $N_4 = H = 13$
  - *C.5 (giảm 2→1):* $N_5 = k-1 = 4$

  #align(center)[$ N = 5 times 16 times 208 times 13 times 4 = bold(865.280) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 22 — Kim cương lớn 1→2→5→2→1, k=5 màu", [
  *Đề bài:* Lưới 11 ô hình thoi cao nhất: 1→2→5→2→1. Có 5 màu.

  #grid(columns: (1fr, 1.5fr), gutter: 0.5cm, [
    #align(center)[
      #cetz.canvas(length: 0.65cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let p = rgb("EDE7F6")
        let o = rgb("FFE0B2"); let r = rgb("FCE4EC")
        let X = rgb("F5F5F5"); let xs = 0.5pt + rgb("BBBBBB")
        let hmax = 5
        // C1: h=1
        rect((0,0),(1,1), fill: g, stroke: 1pt+black)
        for i in range(1,hmax) {
          rect((0,i),(1,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((0,i),(1,i+1), stroke: xs); line((1,i),(0,i+1), stroke: xs)
        }
        // C2: h=2
        for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1pt+black) }
        for i in range(2,hmax) {
          rect((1,i),(2,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
        }
        // C3: h=5
        for i in range(hmax) { rect((2,i),(3,i+1), fill: p, stroke: 1pt+black) }
        // C4: h=2
        for i in range(2) { rect((3,i),(4,i+1), fill: o, stroke: 1pt+black) }
        for i in range(2,hmax) {
          rect((3,i),(4,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((3,i),(4,i+1), stroke: xs); line((4,i),(3,i+1), stroke: xs)
        }
        // C5: h=1
        rect((4,0),(5,1), fill: r, stroke: 1pt+black)
        for i in range(1,hmax) {
          rect((4,i),(5,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((4,i),(5,i+1), stroke: xs); line((5,i),(4,i+1), stroke: xs)
        }
        for (i, c) in ((0,rgb("1B5E20")),(1,rgb("0D47A1")),(2,rgb("4A148C")),(3,rgb("BF360C")),(4,rgb("880E4F"))) {
          content((i+0.5,-0.4), text(size: 6pt, weight:"bold", fill:c)[C.#(i+1)])
        }
      })
    ]
  ], [
    - *C.1 (QT1, h=1):* $N_1 = 5$
    - *C.2 (tăng 1→2):* $N_2 = (k-1)^2 = 16$
    - *C.3 (tăng 2→5):*
      $N_3 = H times (k-1)^3 = 13 times 64 = 832$
    - *C.4 (giảm 5→2):*
      2 ô dưới của C.3 tương tác (3 ô trên bỏ qua).
      $N_4 = H = 13$
    - *C.5 (giảm 2→1):* $N_5 = k-1 = 4$

    #align(center)[$ N = 5 times 16 times 832 times 13 times 4 $
    $ = bold(3.461.120) "cách" $]
  ])
])

#v(0.6em)

#cannon-box("Ví dụ 23 — Lưới 5 cột 2 hàng (2×5), k=5 màu", [
  *Đề bài:* Lưới 10 ô hoàn chỉnh dạng 2 hàng × 5 cột. Có 5 màu. Hai ô chung cạnh phải khác màu.

  #align(center)[
    #cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      let cols = (rgb("E8F5E9"), rgb("E3F2FD"), rgb("EDE7F6"), rgb("FFE0B2"), rgb("FCE4EC"))
      for (ci, c) in cols.enumerate() {
        rect((ci, 0),(ci+1, 1), fill: c, stroke: 1.1pt+black)
        rect((ci, 1),(ci+1, 2), fill: c, stroke: 1.1pt+black)
        content((ci+0.5,-0.35), text(size: 7pt, weight:"bold")[C.#(ci+1)])
      }
    })
  ]
  #v(0.3em)
  - *C.1 (QT1, h=2):* $N_1 = k(k-1) = 5 times 4 = 20$ cách.
  - *C.2 đến C.5 (QT2, chuyển tiếp đầy đủ):* Mỗi cột đều kề đầy đủ cột trước, nhân thêm $H=13$.
  #align(center)[
    $ N = k(k-1) times H^4 = 20 times 13^4 = 20 times 28561 = bold(571.220) "cách" $
  ]
])

#v(0.5em)

*Bảng tổng kết: Kim cương (1→2→h_max→2→1) theo k và h_max*

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  inset: 6pt,
  align: center,
  table.header([*Hình thoi*], [*Hệ số C.3*], [*k=3*], [*k=4*], [*k=5*]),
  [1→2→2→2→1], [$H$], [$3$], [$7$], [$13$],
  [1→2→3→2→1], [$H(k-1)$], [$3 times 2$], [$7 times 3$], [$13 times 4$],
  [1→2→4→2→1], [$H(k-1)^2$], [$3 times 4$], [$7 times 9$], [$13 times 16$],
  [1→2→5→2→1], [$H(k-1)^3$], [$3 times 8$], [$7 times 27$], [$13 times 64$],
  [*Tổng N (k=3)*], [], [*432*], [*—*], [*—*],
  [*Tổng N (k=4)*], [], [*—*], [*15.876*], [*—*],
  [*Tổng N (k=5)*], [], [*—*], [*—*], [*3.461.120*],
)

#pagebreak()

== 10. Bên Ngoài Lưới — Tô Màu Đồ Thị Tổng Quát

Cho đến nay, Bộ Quy Tắc Quét Cột chỉ hoạt động với *lưới ô vuông*. Nhưng khi bài toán có hình tròn, có tâm, có các nút nối bằng dây tuỳ ý thì sao? Thay vì mỗi loại đồ thị dùng một công thức riêng biệt khiến việc ghi nhớ gặp khó khăn, ta có thể quy tất cả về *Một Bộ Quy Tắc Thống Nhất Duy Nhất* hoạt động trên mọi loại mô hình.

=== 10.1 — Hệ Quy Tắc Thống Nhất Vạn Năng (Quy Tắc Quét Đỉnh & Co-Xóa)

Mọi cấu trúc đồ thị thực chất đều là một tập hợp các nút (đỉnh) được nối với nhau bởi các sợi dây liên kết (cạnh). Chúng ta có thể tính số cách tô màu bằng cách quét lần lượt từng nút với đúng *3 quy tắc cốt lõi* sau:

#theory-box[
  *Quy tắc 1: Chọn đỉnh khởi đầu (Đỉnh 1)*
  - Ta chọn một đỉnh bất kỳ làm điểm xuất phát (nên ưu tiên chọn đỉnh có liên kết nhiều nhất như đỉnh tâm).
  - Số cách tô màu cho đỉnh đầu tiên này là: $k$ cách.

  *Quy tắc 2: Chuyển tiếp đỉnh (Né màu các đỉnh kề trước đó)*
  - Ta lần lượt chọn đỉnh tiếp theo kề với phần đã tô màu. Tại đỉnh mới $v$:
    - Nếu $v$ chỉ kề với *1 đỉnh đã tô màu* (hoặc kề nhiều đỉnh nhưng các đỉnh đó cùng màu): Nhân thêm $(k-1)$ vào kết quả.
    - Nếu $v$ kề với *2 đỉnh đã tô màu và 2 đỉnh này khác màu nhau*: Nhân thêm $(k-2)$ vào kết quả.

  *Quy tắc 3: Quy tắc phá vòng khép kín (Co - Xóa cạnh)*
  - Khi gặp vòng khép kín (khiến nút cuối cùng kề ngược lại nút đầu tiên), ta chọn một cạnh liên kết $e = (u,v)$ của vòng để "phá" theo công thức:
    $ P(G, k) = P(G backslash e, k) - P(G \/ e, k) $
    - *Xóa cạnh ($G backslash e$):* Cắt đứt liên kết $e$ $\to$ biến vòng khép kín thành đường thẳng (dễ dàng áp dụng Quy tắc 2).
    - *Co cạnh ($G \/ e$):* Chập hai đỉnh $u$ và $v$ thành một đỉnh duy nhất (rút gọn số đỉnh để tiếp tục áp dụng Quy tắc 2).
]

#v(0.5em)


// ─────────────────────────────────────
*Bản đồ vũ khí theo hình dạng đồ thị:*

#table(
  columns: (1.8fr, 1fr, 1.4fr, 1.2fr),
  inset: 7pt,
  align: (left, center, left, center),
  table.header([*Loại đồ thị*], [*Ký hiệu*], [*Công thức $P(G,k)$*], [*VD $k=4$*]),
  [Đường thẳng / Cây bất kỳ ($n$ đỉnh)], [$P_n$ / $T_n$], [$k(k-1)^(n-1)$], [$4 dot 3^(n-1)$],
  [Vòng tròn ($n$ đỉnh)], [$C_n$], [$(k-1)^n + (-1)^n (k-1)$], [xem bảng],
  [Sao ($1$ tâm, $n$ cánh)], [$K_(1,n)$], [$k(k-1)^n$], [$4 dot 3^n$],
  [Bánh xe ($1$ tâm + vòng $n$)], [$W_n$], [$k dot [(k-2)^n + (-1)^n (k-2)]$], [xem VD],
  [Đầy đủ ($n$ đỉnh, mọi cặp nối)], [$K_n$], [$k(k-1)(k-2) dots.c (k-n+1)$], [$4 dot 3 dot 2 dot 1$],
  [Bất kỳ (dùng Xoá-Chập)], [$G$], [$P(G backslash e, k) - P(G \/ e, k)$], [xem VD],
)

#v(0.8em)

// ─────────────────────────────────────
=== 10.1 — Đồ Thị Vòng $C_n$ (Hình Tròn)

#grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      for i in range(5) {
        let a = i * 72deg + 90deg
        let an = (i + 1) * 72deg + 90deg
        let p = (calc.cos(a)*1.2, calc.sin(a)*1.2)
        let pn = (calc.cos(an)*1.2, calc.sin(an)*1.2)
        line(p, pn, stroke: 1.5pt + rgb("00695C"))
        circle(p, radius: 0.22, fill: white, stroke: 1.5pt + rgb("00695C"))
        content(p, text(size: 8pt, weight: "bold")[$v_#(i+1)$])
      }
      content((0,-1.8), text(size: 8pt, fill: rgb("00695C"), weight: "bold")[$C_5$ — vòng 5 đỉnh])
    })
  ]
], [
  Mỗi đỉnh nối với *đúng 2 đỉnh kề*, không có tâm. Công thức:
  $ P(C_n, k) = (k-1)^n + (-1)^n (k-1) $

  *Ví dụ:* $C_5$ với $k=4$ màu:
  $ P(C_5, 4) = 3^5 + (-1)^5 dot 3 = 243 - 3 = 240 $

  *Đây chính là Đại Bác số 3 trong phần I!* Công thức vòng tròn và đa thức màu của $C_n$ là một.
])

#v(0.5em)

// ─────────────────────────────────────
=== 10.2 — Đồ Thị Sao $K_{1,n}$ (Một Tâm, Nhiều Cánh)

#grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.0cm, {
      import cetz.draw: *
      // Tâm
      circle((0,0), radius: 0.28, fill: rgb("FFCDD2"), stroke: 1.5pt + rgb("BF360C"))
      content((0,0), text(size: 8pt, weight: "bold")[C])
      // 4 cánh
      let pts = ((0,1.3), (1.3,0), (0,-1.3), (-1.3,0))
      let lbs = ("v₁","v₂","v₃","v₄")
      for (i, p) in pts.enumerate() {
        line((0,0), p, stroke: 1.5pt + rgb("BF360C"))
        circle(p, radius: 0.22, fill: white, stroke: 1.5pt + rgb("BF360C"))
        content(p, text(size: 7.5pt, weight: "bold")[#lbs.at(i)])
      }
      content((0,-2.0), text(size: 8pt, fill: rgb("BF360C"), weight: "bold")[$K_(1,4)$ — sao 4 cánh])
    })
  ]
], [
  Tâm nối với *tất cả* các cánh; các cánh *không nối nhau*.

  *Lý luận:*
  - Tâm chọn tự do: $k$ cách.
  - Mỗi cánh chỉ cần khác tâm (các cánh không kề nhau): $k-1$ cách *mỗi cánh*.

  $ P(K_(1,n), k) = k(k-1)^n $

  *Ví dụ:* $K_(1,4)$ ($4$ cánh) với $k=4$:
  $ P(K_(1,4), 4) = 4 times 3^4 = 4 times 81 = 324 $

  _Chú ý:_ đây chính xác là công thức Súng Lục nhưng ô đầu (tâm) có $k$ cách và $n$ ô kề tâm có $k-1$ cách mỗi cái độc lập.
])

#v(0.5em)

// ─────────────────────────────────────
=== 10.3 — Đồ Thị Bánh Xe $W_n$ (Tâm + Vòng Tròn)

#grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.0cm, {
      import cetz.draw: *
      // Vành
      for i in range(5) {
        let a = i * 72deg + 90deg
        let an = (i + 1) * 72deg + 90deg
        let p = (calc.cos(a)*1.2, calc.sin(a)*1.2)
        let pn = (calc.cos(an)*1.2, calc.sin(an)*1.2)
        line(p, pn, stroke: 1.3pt + rgb("0D47A1"))
        // Nan hoa nối về tâm
        line((0,0), p, stroke: (dash: "dashed", paint: rgb("1B5E20"), thickness: 1pt))
        circle(p, radius: 0.22, fill: white, stroke: 1.3pt + rgb("0D47A1"))
        content(p, text(size: 7.5pt, weight: "bold")[$v_#(i+1)$])
      }
      // Tâm
      circle((0,0), radius: 0.28, fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("1B5E20"))
      content((0,0), text(size: 8pt, weight: "bold")[C])
      content((0,-2.0), text(size: 7.5pt, fill: rgb("0D47A1"), weight: "bold")[$W_5$ — bánh xe 5 vành])
    })
  ]
], [
  Bánh xe = vòng $C_n$ + 1 tâm nối tất cả vành. *Tâm và vành đều ràng buộc nhau.*

  *Lý luận (2 bước):*
  - *Bước 1:* Chọn màu cho tâm: $k$ cách.
  - *Bước 2:* Tô $n$ đỉnh vành tạo thành $C_n$, nhưng mỗi đỉnh vành phải khác tâm. Thực chất là tô $C_n$ với $k-1$ màu còn lại.
  $ P(W_n, k) = k dot P(C_n, k-1) $
  $ = k dot [(k-2)^n + (-1)^n (k-2)] $

  *Ví dụ:* $W_5$ với $k=4$:
  $ P(W_5, 4) = 4 dot [(4-2)^5 + (-1)^5(4-2)] $
  $ = 4 dot [32 - 2] = 4 times 30 = *120* $
])

#cannon-box("Ví dụ thực chiến — Bánh xe W₄ với k=4", [
  *Đề bài:* 5 đỉnh: 1 tâm C nối với 4 đỉnh $v_1, v_2, v_3, v_4$ xếp thành vòng tròn. Có 4 màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      for i in range(4) {
        let a = i * 90deg + 45deg
        let an = (i+1) * 90deg + 45deg
        let p = (calc.cos(a)*1.1, calc.sin(a)*1.1)
        let pn = (calc.cos(an)*1.1, calc.sin(an)*1.1)
        line(p, pn, stroke: 1.3pt + rgb("0D47A1"))
        line((0,0), p, stroke: (dash: "dashed", paint: rgb("1B5E20"), thickness: 1.1pt))
        circle(p, radius: 0.25, fill: white, stroke: 1.3pt + rgb("0D47A1"))
        let lbs = ("v₁","v₂","v₃","v₄")
        content(p, text(size: 7.5pt, weight: "bold")[#lbs.at(i)])
      }
      circle((0,0), radius: 0.28, fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("1B5E20"))
      content((0,0), text(size: 8pt, weight: "bold")[C])
    })
  ]

  - *Bước 1 — Chọn màu tâm C:* $k = 4$ cách.
  - *Bước 2 — Tô vành $C_4$ với $k-1=3$ màu còn lại:*
    $ P(C_4, 3) = (3-1)^4 + (-1)^4(3-1) = 16 + 2 = 18 "cách" $
  - *Kết quả:*
    $ P(W_4, 4) = 4 times 18 = bold(72) "cách" $
])

#v(0.5em)

// ─────────────────────────────────────
=== 10.4 — Đồ Thị Đầy Đủ $K_n$ (Mọi Cặp Đều Nối)

#grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.0cm, {
      import cetz.draw: *
      let pts = ((0,1.2), (1.1,-0.4), (-1.1,-0.4))
      // K3: mọi cặp nối
      for i in range(3) {
        for j in range(i+1, 3) {
          line(pts.at(i), pts.at(j), stroke: 1.3pt + rgb("4A148C"))
        }
      }
      for (i, p) in pts.enumerate() {
        circle(p, radius: 0.25, fill: white, stroke: 1.3pt + rgb("4A148C"))
        content(p, text(size: 8pt, weight: "bold")[$v_#(i+1)$])
      }
      content((0,-1.5), text(size: 8pt, fill: rgb("4A148C"), weight: "bold")[$K_3$ — tam giác])
    })
  ]
], [
  Mỗi cặp đỉnh đều nối trực tiếp. Đây là đồ thị "chặt chẽ nhất" — mọi đỉnh đều ràng buộc lẫn nhau.

  *Lý luận:*
  Đỉnh 1: $k$ cách. Đỉnh 2: phải khác đỉnh 1 → $k-1$. Đỉnh 3: khác cả đỉnh 1 lẫn 2 → $k-2$. Tiếp tục...

  $ P(K_n, k) = k(k-1)(k-2) dots.c (k-n+1) $

  *Điều kiện tô được:* $k >= n$ (cần ít nhất $n$ màu).

  *Ví dụ:* $K_4$ với $k=4$:
  $ P(K_4, 4) = 4 times 3 times 2 times 1 = *24* $
  
  $K_4$ với $k=5$: $5 times 4 times 3 times 2 = *120*$
])

#v(0.5em)

// ─────────────────────────────────────
=== 10.5 — Đồ Thị Bất Kỳ: Thuật Toán Xoá-Chập

Khi đồ thị không thuộc loại nào quen thuộc, ta dùng *Thuật toán Xoá-Chập* — công cụ vạn năng tính $P(G, k)$ cho *bất kỳ* đồ thị nào.

#cannon-box("⚙️ Thuật Toán Xoá-Chập (Deletion-Contraction)", [
  Chọn bất kỳ 1 cạnh $e = (u, v)$ của đồ thị $G$. Khi đó:
  $ P(G, k) = P(G backslash e, k) - P(G \/ e, k) $
  
  Trong đó:
  - $G backslash e$: *Xoá cạnh $e$* — đồ thị sau khi bỏ cạnh nối $u$-$v$ (hai đỉnh vẫn còn, chỉ mất ràng buộc).
  - $G \/ e$: *Chập đỉnh $u$ và $v$ làm 1* — hai đỉnh hợp nhất thành 1 đỉnh mới (ràng buộc chập vào).

  *Tại sao đúng?*
  - $P(G, k)$ = số cách tô thỏa mãn tất cả ràng buộc kể cả $u \ne v$.
  - $P(G backslash e, k)$ = số cách tô bỏ qua ràng buộc $u \ne v$ = đếm CẢ trường hợp $u = v$ lẫn $u \ne v$.
  - $P(G / e, k)$ = số cách tô với $u$ và $v$ bị BẮT BUỘC TRÙNG màu.
  - Hiệu = chỉ còn đúng các cách tô có $u \ne v$. ✓
])

#v(0.5em)

#cannon-box("Ví dụ — Đồ thị hình thoi (4 đỉnh, 5 cạnh)", [
  *Đề bài:* Đồ thị $G$ gồm 4 đỉnh $A, B, C, D$ với 5 cạnh: $A$-$B$, $B$-$C$, $C$-$D$, $D$-$A$, $A$-$C$ (thêm đường chéo). Có $k=3$ màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let pA = (-1.0, 0.0); let pB = (0.0, 1.0)
      let pC = (1.0, 0.0); let pD = (0.0, -1.0)
      // Viền ngoài
      for (p, q) in ((pA, pB), (pB, pC), (pC, pD), (pD, pA)) {
        line(p, q, stroke: 1.4pt + rgb("0D47A1"))
      }
      // Đường chéo A-C
      line(pA, pC, stroke: (dash: "dashed", paint: rgb("BF360C"), thickness: 1.4pt))
      content((0, 0.2), text(size: 7pt, fill: rgb("BF360C"), style: "italic")[chéo])
      // Đỉnh
      for (p, l) in ((pA,"A"),(pB,"B"),(pC,"C"),(pD,"D")) {
        circle(p, radius: 0.25, fill: white, stroke: 1.4pt + rgb("0D47A1"))
        content(p, text(size: 9pt, weight: "bold")[#l])
      }
      content((0,-1.8), text(size: 8pt, weight: "bold", fill: rgb("0D47A1"))[Đồ thị G])
    })
  ]
  #v(0.3em)

  *Chọn cạnh $A$-$C$ để xoá-chập:*

  - *$G backslash (A$-$C)$:* Bỏ đường chéo → còn lại vòng $C_4$ (A-B-C-D-A).
    $ P(C_4, 3) = (3-1)^4 + (-1)^4(3-1) = 16 + 2 = 18 $

  - *$G \/ (A$-$C)$:* Chập A và C thành đỉnh AC → đồ thị mới có 3 đỉnh {AC, B, D}. AC nối với B (từ cạnh A-B và B-C), AC nối D (từ A-D và C-D), B và D không nối nhau → đây là đường thẳng B-AC-D tức là $P_3$.
    $ P(P_3, 3) = 3 times 2^2 = 12 $

  *Kết quả:*
  $ P(G, 3) = P(G backslash e, 3) - P(G \/ e, 3) = 18 - 12 = bold(6) "cách" $
])

#v(0.5em)

// ─────────────────────────────────────
=== 10.6 — Bản Đồ Và Đồ Thị Đối Ngẫu (Planar Map → Dual Graph)

Khi bài toán cho hình vẽ vùng (bản đồ, các miếng ghép), *không cần ép về lưới*. Thay vào đó, dùng *đồ thị đối ngẫu*:

#grid(columns: (1.2fr, 1fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      // Hình chữ nhật chia 4 vùng
      rect((-1.8,-1.2),(1.8,1.2), stroke: 1.3pt + rgb("37474F"))
      line((0,-1.2),(0,1.2), stroke: 1.3pt + rgb("37474F"))
      line((-1.8,0),(1.8,0), stroke: 1.3pt + rgb("37474F"))
      // Nhãn vùng
      content((-0.9,0.6), text(size: 9pt, weight:"bold")[A])
      content((0.9,0.6), text(size: 9pt, weight:"bold")[B])
      content((-0.9,-0.6), text(size: 9pt, weight:"bold")[C])
      content((0.9,-0.6), text(size: 9pt, weight:"bold")[D])
      // Đồ thị đối ngẫu
      let dA = (-0.9,0.6); let dB = (0.9,0.6)
      let dC = (-0.9,-0.6); let dD = (0.9,-0.6)
      for (p,q) in ((dA,dB),(dB,dD),(dD,dC),(dC,dA),(dA,dD),(dB,dC)) {
        line(p, q, stroke: (dash: "dashed", paint: rgb("BF360C"), thickness: 1.1pt))
      }
      for (p, l) in ((dA,"A"),(dB,"B"),(dC,"C"),(dD,"D")) {
        circle(p, radius: 0.2, fill: rgb("FFF9C4"), stroke: 1.2pt + rgb("BF360C"))
      }
      content((0,-1.8), text(size: 8pt, fill: rgb("BF360C"), weight: "bold")[Đối ngẫu (nét đứt)])
    })
  ]
], [
  *Quy trình:*
  1. Mỗi *vùng* → 1 đỉnh đồ thị đối ngẫu.
  2. Hai vùng có *chung biên* → nối cạnh.
  3. Tính $P(G_"dual", k)$ bằng công thức phù hợp.

  *Ví dụ:* Hình chữ nhật chia 4 ô (2×2) — đồ thị đối ngẫu là $K_4$ (4 đỉnh, mọi cặp nối).

  $P(K_4, 4) = 4 times 3 times 2 times 1 = 24$

  *Điều này giải thích:* Bảng 2×2 có 84 cách tô (bằng Bộ QT Lưới), nhưng nếu xét "4 góc đều khác nhau" thì chỉ còn 24!
])

#v(0.5em)

// ─────────────────────────────────────
*Bảng tóm tắt — Chọn vũ khí nào cho hình dạng nào:*

#table(
  columns: (1.6fr, 1fr, 1.5fr, 1.5fr),
  inset: 7pt,
  align: (left, center, left, left),
  table.header([*Nhận dạng đồ thị*], [*Loại*], [*Vũ khí dùng*], [*Ghi chú*]),
  [Hàng thẳng, nhánh cây, không vòng], [$P_n$/$T_n$], [Súng Lục: $k(k-1)^{n-1}$], [Mọi cây đều dùng được],
  [Khép kín thành vòng], [$C_n$], [Vòng: $(k-1)^n + (-1)^n(k-1)$], [Đại Bác 3],
  [1 tâm + $n$ cánh tự do], [$K_{1,n}$], [Sao: $k(k-1)^n$], [Cánh không nối nhau],
  [1 tâm + vòng $n$ đỉnh], [$W_n$], [Bánh xe: $k dot P(C_n, k-1)$], [2 bước: tâm + vành],
  [Mọi cặp đỉnh đều nối], [$K_n$], [Đầy đủ: $k(k-1) dots.c (k-n+1)$], [Cần $k >= n$ màu],
  [Lưới ô vuông khuyết], [Grid], [Đại Bác Vạn Năng (Quét Cột)], [Chương 1–9 của tài liệu này],
  [Hình vẽ vùng/bản đồ], [Planar], [Đồ thị đối ngẫu → áp công thức], [Vùng = đỉnh],
  [Đồ thị tuỳ ý bất kỳ], [$G$], [Xoá-Chập: $P(G \\ e) - P(G/e)$], [Vạn năng, đệ quy],
)

#v(0.8em)
#pagebreak()

== 11. Tuyển Tập 12 Ví Dụ Thực Chiến Cho 6 Loại Đồ Thị Phi Lưới

Để giúp học sinh làm chủ hoàn toàn các bài toán tô màu đồ thị phi lưới mà không cảm thấy nặng nề lý thuyết, dưới đây là tuyển tập 12 ví dụ thực chiến được giải chi tiết, chia đều cho 6 loại mô hình đồ thị phi lưới phổ biến nhất.

=== 11.1 — Nhóm 1: Đường Thẳng & Đồ Thị Cây ($P_n$ / $T_n$)

*Đặc trưng:* Đồ thị không có vòng khép kín. Công thức chung cho đồ thị cây $n$ đỉnh là: $P(G, k) = k(k-1)^(n-1)$.

#cannon-box("Ví dụ 24 — Chuỗi 6 hạt ngọc xếp hàng thẳng (k=4 màu)", [
  *Đề bài:* Có 6 hạt ngọc được xếp thành một hàng thẳng. Người ta muốn tô màu các hạt ngọc bằng 4 màu sao cho hai hạt cạnh nhau luôn khác màu nhau. Tính số cách tô màu.

  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      for i in range(5) {
        line((i,0), (i+1,0), stroke: 1.3pt + rgb("4A148C"))
      }
      for i in range(6) {
        circle((i,0), radius: 0.22, fill: white, stroke: 1.3pt + rgb("4A148C"))
        content((i,0), text(size: 8pt, weight: "bold")[#str(i+1)])
      }
    })
  ]
  #v(0.3em)

  *Giải:*
  Đây là đồ thị đường thẳng $P_6$ gồm 6 đỉnh. Áp dụng công thức đường thẳng với $n=6, k=4$:
  1. Hạt thứ nhất: Có $k = 4$ cách chọn màu.
  2. Mỗi hạt trong 5 hạt tiếp theo chỉ kề với đúng 1 hạt đã tô màu ở trước nó, nên luôn có $k-1 = 3$ cách chọn màu.
  
  $ N = k(k-1)^(n-1) = 4 times 3^5 = 4 times 243 = bold(972) " cách." $
])

#v(0.5em)

#cannon-box("Ví dụ 25 — Đồ thị cây gia phả phân nhánh 7 nút (k=5 màu)", [
  *Đề bài:* Cho một sơ đồ cây gồm 7 nút (1 nút gốc chia làm 2 nhánh, mỗi nhánh lại chia tiếp làm các nút con). Có 5 màu để tô các nút này sao cho hai nút nối với nhau luôn khác màu nhau. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      let p0 = (0, 0)
      let p1 = (-1.5, -1); let p2 = (1.5, -1)
      let p3 = (-2.2, -2); let p4 = (-0.8, -2)
      let p5 = (0.8, -2); let p6 = (2.2, -2)
      
      line(p0, p1, stroke: 1.3pt + rgb("E65100"))
      line(p0, p2, stroke: 1.3pt + rgb("E65100"))
      line(p1, p3, stroke: 1.3pt + rgb("E65100"))
      line(p1, p4, stroke: 1.3pt + rgb("E65100"))
      line(p2, p5, stroke: 1.3pt + rgb("E65100"))
      line(p2, p6, stroke: 1.3pt + rgb("E65100"))
      
      let pts = (p0, p1, p2, p3, p4, p5, p6)
      for (i, p) in pts.enumerate() {
        circle(p, radius: 0.25, fill: white, stroke: 1.3pt + rgb("E65100"))
        content(p, text(size: 8pt, weight: "bold")[#str(i+1)])
      }
    })
  ]
  #v(0.3em)

  *Giải:*
  Vì sơ đồ là đồ thị cây không chứa chu trình ($T_7$), ta áp dụng công thức cho cây với $n=7, k=5$:
  1. Nút gốc: Có $5$ cách chọn màu.
  2. Mỗi nút con trong 6 nút tiếp theo luôn chỉ liên kết trực tiếp với đúng 1 nút cha ở phía trên nó, do đó luôn có $k-1 = 4$ cách chọn màu cho mỗi nút con.
  
  $ N = k(k-1)^(n-1) = 5 times 4^6 = 5 times 4096 = bold(20.480) " cách." $
])

#v(0.8em)
#pagebreak()

=== 11.2 — Nhóm 2: Đồ Thị Vòng Tròn Khép Kín ($C_n$)

*Đặc trưng:* Các đỉnh nối tiếp khép kín thành vòng tròn. Công thức cho vòng tròn $n$ đỉnh là: $P(C_n, k) = (k-1)^n + (-1)^n(k-1)$.

#cannon-box("Ví dụ 26 — Tô màu ngũ giác đều 5 đỉnh (k=3 màu)", [
  *Đề bài:* Người ta muốn tô màu 5 đỉnh của một ngũ giác đều bằng 3 màu sao cho hai đỉnh kề nhau luôn khác màu nhau. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      for i in range(5) {
        let a = i * 72deg + 90deg
        let an = (i + 1) * 72deg + 90deg
        let p = (calc.cos(a)*1.1, calc.sin(a)*1.1)
        let pn = (calc.cos(an)*1.1, calc.sin(an)*1.1)
        line(p, pn, stroke: 1.3pt + rgb("00695C"))
        circle(p, radius: 0.22, fill: white, stroke: 1.3pt + rgb("00695C"))
        content(p, text(size: 8pt, weight: "bold")[#str(i+1)])
      }
    })
  ]
  #v(0.3em)

  *Giải:*
  Đây là đồ thị vòng tròn $C_5$ gồm 5 đỉnh. Áp dụng công thức vòng tròn với $n=5, k=3$:
  $ P(C_5, 3) = (3-1)^5 + (-1)^5 times (3-1) $
  $ P(C_5, 3) = 2^5 - 2 = 32 - 2 = bold(30) " cách." $
])

#v(0.5em)

#cannon-box("Ví dụ 27 — Tô màu lục giác đều 6 đỉnh (k=4 màu)", [
  *Đề bài:* Có bao nhiêu cách tô màu các đỉnh của một lục giác đều bằng 4 màu sao cho hai đỉnh chung cạnh luôn khác màu nhau?

  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      for i in range(6) {
        let a = i * 60deg + 90deg
        let an = (i + 1) * 60deg + 90deg
        let p = (calc.cos(a)*1.1, calc.sin(a)*1.1)
        let pn = (calc.cos(an)*1.1, calc.sin(an)*1.1)
        line(p, pn, stroke: 1.3pt + rgb("00695C"))
        circle(p, radius: 0.22, fill: white, stroke: 1.3pt + rgb("00695C"))
        content(p, text(size: 8pt, weight: "bold")[#str(i+1)])
      }
    })
  ]
  #v(0.3em)

  *Giải:*
  Đây là đồ thị vòng tròn $C_6$ gồm 6 đỉnh. Áp dụng công thức vòng tròn với $n=6, k=4$:
  $ P(C_6, 4) = (4-1)^6 + (-1)^6 times (4-1) $
  $ P(C_6, 4) = 3^6 + 3 = 729 + 3 = bold(732) " cách." $
])

#v(0.8em)
#pagebreak()

=== 11.3 — Nhóm 3: Đồ Thị Hình Sao ($K_{1,n}$)

*Đặc trưng:* Có 1 nút tâm nối với tất cả các nút cánh; các cánh độc lập không nối với nhau. Công thức: $P(K_{1,n}, k) = k(k-1)^n$.

#cannon-box("Ví dụ 28 — Bông hoa 5 cánh chạm nhị ở tâm (k=4 màu)", [
  *Đề bài:* Một bông hoa đồ họa gồm 1 nhị ở tâm và 5 cánh hoa xung quanh. Biết rằng các cánh hoa không chạm nhau mà chỉ chạm nhị ở tâm. Có 4 màu để tô các phần sao cho hai phần chạm nhau phải khác màu nhau. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      for i in range(5) {
        let a = i * 72deg + 90deg
        let p = (calc.cos(a)*1.2, calc.sin(a)*1.2)
        line((0,0), p, stroke: 1.3pt + rgb("C2185B"))
        circle(p, radius: 0.22, fill: white, stroke: 1.3pt + rgb("C2185B"))
        content(p, text(size: 8pt, weight: "bold")[#str(i+1)])
      }
      circle((0,0), radius: 0.28, fill: rgb("F8BBD0"), stroke: 1.5pt + rgb("C2185B"))
      content((0,0), text(size: 8pt, weight: "bold")[T])
    })
  ]
  #v(0.3em)

  *Giải:*
  Đây là đồ thị hình sao gồm 1 tâm và 5 cánh ($K_{1,5}$). Áp dụng công thức hình sao với $n=5, k=4$:
  1. Tô nhị hoa ở tâm: Có $k = 4$ cách chọn màu.
  2. Mỗi cánh hoa trong 5 cánh hoa xung quanh chỉ kề với duy nhất nhị hoa, nên luôn có $k-1 = 3$ cách chọn màu độc lập.
  
  $ N = k(k-1)^n = 4 times 3^5 = 4 times 243 = bold(972) " cách." $
])

#v(0.5em)

#cannon-box("Ví dụ 29 — Hệ thống mạng sao 1 trạm chủ và 8 máy vệ tinh (k=5 màu)", [
  *Đề bài:* Một mạng máy tính gồm 1 máy chủ kết nối trực tiếp đến 8 máy vệ tinh xung quanh (các máy vệ tinh không kết nối với nhau). Người ta muốn phân bổ 5 kênh tần số cho các máy sao cho hai máy kết nối trực tiếp thì khác tần số. Tính số cách phân bổ.

  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      for i in range(8) {
        let a = i * 45deg + 90deg
        let p = (calc.cos(a)*1.4, calc.sin(a)*1.4)
        line((0,0), p, stroke: 1.3pt + rgb("00796B"))
        circle(p, radius: 0.18, fill: white, stroke: 1.3pt + rgb("00796B"))
      }
      circle((0,0), radius: 0.35, fill: rgb("B2DFDB"), stroke: 1.5pt + rgb("00796B"))
      content((0,0), text(size: 7.5pt, weight: "bold")[Chủ])
    })
  ]
  #v(0.3em)

  *Giải:*
  Đây là mô hình đồ thị sao $K_{1,8}$ gồm 1 tâm và 8 cánh với $k=5$ màu:
  1. Máy chủ ở tâm: Có $5$ cách phân tần số.
  2. Mỗi máy vệ tinh chỉ cần khác tần số của máy chủ: Có $k-1 = 4$ cách chọn cho mỗi máy vệ tinh.
  
  $ N = k(k-1)^n = 5 times 4^8 = 5 times 65.536 = bold(327.680) " cách." $
])

#v(0.8em)
#pagebreak()

=== 11.4 — Nhóm 4: Đồ Thị Bánh Xe ($W_n$)

*Đặc trưng:* Có 1 nút tâm nối với vòng tròn gồm $n$ nút bên ngoài. Công thức: $P(W_n, k) = k times P(C_n, k-1) = k times [(k-2)^n + (-1)^n(k-2)]$.

#cannon-box("Ví dụ 30 — Đồ thị bánh xe W₄ gồm 1 tâm và vòng 4 nút vành (k=4 màu)", [
  *Đề bài:* Cho bánh xe gồm 1 đỉnh tâm C nối với 4 đỉnh vành $v_1, v_2, v_3, v_4$ tạo thành một vòng tròn. Có 4 màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      for i in range(4) {
        let a = i * 90deg + 45deg
        let an = (i+1) * 90deg + 45deg
        let p = (calc.cos(a)*1.2, calc.sin(a)*1.2)
        let pn = (calc.cos(an)*1.2, calc.sin(an)*1.2)
        line(p, pn, stroke: 1.3pt + rgb("0D47A1"))
        line((0,0), p, stroke: (dash: "dashed", paint: rgb("1B5E20"), thickness: 1.1pt))
        circle(p, radius: 0.25, fill: white, stroke: 1.3pt + rgb("0D47A1"))
        content(p, text(size: 7.5pt, weight: "bold")[v#str(i+1)])
      }
      circle((0,0), radius: 0.28, fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("1B5E20"))
      content((0,0), text(size: 8pt, weight: "bold")[C])
    })
  ]
  #v(0.3em)

  *Giải:*
  Áp dụng công thức bánh xe $W_4$ với $n=4, k=4$:
  1. Chọn màu cho đỉnh tâm C: Có $k = 4$ cách.
  2. Tô 4 đỉnh vành bằng $k-1 = 3$ màu còn lại (vòng tròn $C_4$):
     $ P(C_4, 3) = (3-1)^4 + (-1)^4 times (3-1) = 2^4 + 2 = 16 + 2 = 18 " cách." $
  
  $ N = k times P(C_4, k-1) = 4 times 18 = bold(72) " cách." $
])

#v(0.5em)

#cannon-box("Ví dụ 31 — Đồ thị bánh xe W₅ gồm 1 tâm và vòng 5 nút vành (k=5 màu)", [
  *Đề bài:* Có bao nhiêu cách tô màu các đỉnh của đồ thị bánh xe $W_5$ (gồm 1 tâm và 5 vành) bằng 5 màu sao cho các đỉnh kề nhau khác màu?

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      for i in range(5) {
        let a = i * 72deg + 90deg
        let an = (i+1) * 72deg + 90deg
        let p = (calc.cos(a)*1.2, calc.sin(a)*1.2)
        let pn = (calc.cos(an)*1.2, calc.sin(an)*1.2)
        line(p, pn, stroke: 1.3pt + rgb("0D47A1"))
        line((0,0), p, stroke: (dash: "dashed", paint: rgb("1B5E20"), thickness: 1.1pt))
        circle(p, radius: 0.25, fill: white, stroke: 1.3pt + rgb("0D47A1"))
        content(p, text(size: 7.5pt, weight: "bold")[v#str(i+1)])
      }
      circle((0,0), radius: 0.28, fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("1B5E20"))
      content((0,0), text(size: 8pt, weight: "bold")[C])
    })
  ]
  #v(0.3em)

  *Giải:*
  Áp dụng công thức bánh xe $W_5$ với $n=5, k=5$:
  1. Chọn màu cho đỉnh tâm: Có $k = 5$ cách.
  2. Tô 5 đỉnh vành bằng $k-1 = 4$ màu còn lại (vòng tròn $C_5$):
     $ P(C_5, 4) = (4-1)^5 + (-1)^5 times (4-1) = 3^5 - 3 = 243 - 3 = 240 " cách." $
  
  $ N = k times P(C_5, k-1) = 5 times 240 = bold(1200) " cách." $
])

#v(0.8em)
#pagebreak()

=== 11.5 — Nhóm 5: Đồ Thị Đầy Đủ ($K_n$)

*Đặc trưng:* Tất cả các cặp đỉnh đều nối cạnh với nhau. Công thức: $P(K_n, k) = k(k-1)(k-2)dots(k-n+1)$.

#cannon-box("Ví dụ 32 — Nhóm 4 kỳ thủ đấu cờ chéo và chọn mũ (k=5 màu)", [
  *Đề bài:* Có 4 kỳ thủ tham gia thi đấu cờ. Mỗi người đều phải đấu với tất cả những người còn lại. Ban tổ chức chuẩn bị sẵn các mũ thuộc 5 màu khác nhau để phát cho họ. Tính số cách phát mũ sao cho không có hai kỳ thủ nào đấu với nhau đội mũ trùng màu.

  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let p1 = (-0.8, 0.8); let p2 = (0.8, 0.8)
      let p3 = (-0.8, -0.8); let p4 = (0.8, -0.8)
      let pts = (p1, p2, p3, p4)
      for i in range(4) {
        for j in range(i+1, 4) {
          line(pts.at(i), pts.at(j), stroke: 1.3pt + rgb("4A148C"))
        }
      }
      for (i, p) in pts.enumerate() {
        circle(p, radius: 0.25, fill: white, stroke: 1.3pt + rgb("4A148C"))
        content(p, text(size: 8pt, weight: "bold")[#str(i+1)])
      }
    })
  ]
  #v(0.3em)

  *Giải:*
  Vì mọi cặp kỳ thủ đều đấu với nhau, mô hình liên kết này tạo thành đồ thị đầy đủ $K_4$ gồm 4 đỉnh. Có $k=5$ màu:
  1. Người thứ 1: Có 5 cách chọn màu mũ.
  2. Người thứ 2: Phải khác màu người 1 $->$ 4 cách.
  3. Người thứ 3: Phải khác màu người 1 và người 2 $->$ 3 cách.
  4. Người thứ 4: Phải khác màu cả 3 người trước $->$ 2 cách.
  
  $ N = 5 times 4 times 3 times 2 = bold(120) " cách." $
])

#v(0.5em)

#cannon-box("Ví dụ 33 — Khung chóp tam giác đều tứ diện (k=4 màu)", [
  *Đề bài:* Cho một hình chóp tam giác đều S.ABC. Người ta muốn tô màu 4 đỉnh của hình chóp bằng 4 màu sao cho hai đỉnh thuộc cùng một cạnh luôn khác màu nhau. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 1.2cm, {
      import cetz.draw: *
      let pS = (0, 1)
      let pA = (-0.9, -0.4); let pB = (0.9, -0.4)
      let pC = (0, -0.9)
      
      line(pS, pA, stroke: 1.3pt + rgb("4A148C"))
      line(pS, pB, stroke: 1.3pt + rgb("4A148C"))
      line(pS, pC, stroke: 1.3pt + rgb("4A148C"))
      line(pA, pC, stroke: 1.3pt + rgb("4A148C"))
      line(pB, pC, stroke: 1.3pt + rgb("4A148C"))
      line(pA, pB, stroke: (dash: "dashed", paint: rgb("4A148C"), thickness: 1.3pt))
      
      let lbls = ("S", "A", "B", "C")
      let pts = (pS, pA, pB, pC)
      for (i, p) in pts.enumerate() {
        circle(p, radius: 0.22, fill: white, stroke: 1.3pt + rgb("4A148C"))
        content(p, text(size: 8pt, weight: "bold")[#lbls.at(i)])
      }
    })
  ]
  #v(0.3em)

  *Giải:*
  Hình chóp tam giác đều có 4 đỉnh và 6 cạnh nối tất cả các cặp đỉnh với nhau, tạo thành đồ thị đầy đủ $K_4$ với $k=4$ màu:
  $ N = P(K_4, 4) = 4 times 3 times 2 times 1 = bold(24) " cách." $
])

#v(0.8em)
#pagebreak()

=== 11.6 — Nhóm 6: Đồ Thị Bất Kỳ Dùng Thuật Toán Co - Xóa

*Đặc trưng:* Sử dụng công thức đệ quy $P(G, k) = P(G backslash e, k) - P(G \/ e, k)$ bằng cách xóa-chập một cạnh bất kỳ.

#cannon-box("Ví dụ 34 — Đồ thị hình thoi thêm đường chéo (k=4 màu)", [
  *Đề bài:* Đồ thị $G$ gồm 4 đỉnh $A, B, C, D$ tạo thành hình thoi kèm đường chéo $A-C$ (tổng cộng 5 cạnh). Có 4 màu để tô các đỉnh sao cho các đỉnh kề nhau khác màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let pA = (-0.9, 0.0); let pB = (0.0, 0.9)
      let pC = (0.9, 0.0); let pD = (0.0, -0.9)
      for (p, q) in ((pA, pB), (pB, pC), (pC, pD), (pD, pA)) {
        line(p, q, stroke: 1.3pt + rgb("0D47A1"))
      }
      line(pA, pC, stroke: (dash: "dashed", paint: rgb("BF360C"), thickness: 1.3pt))
      
      for (p, l) in ((pA,"A"),(pB,"B"),(pC,"C"),(pD,"D")) {
        circle(p, radius: 0.22, fill: white, stroke: 1.3pt + rgb("0D47A1"))
        content(p, text(size: 8pt, weight: "bold")[#l])
      }
    })
  ]
  #v(0.3em)

  *Giải:*
  Ta chọn cạnh đường chéo $e = A-C$ để thực hiện phép co-xóa:
  1. *Xóa cạnh $e$ ($G backslash e$):* Đồ thị trở thành vòng tròn 4 đỉnh $C_4$. Số cách tô bằng 4 màu là:
     $ P(C_4, 4) = (4-1)^4 + (-1)^4 times (4-1) = 3^4 + 3 = 81 + 3 = 84 " cách." $
  2. *Co cạnh $e$ ($G / e$):* Chập hai đỉnh $A$ và $C$ thành một đỉnh duy nhất. Đồ thị còn lại 3 đỉnh tạo thành đường thẳng $P_3$. Số cách tô bằng 4 màu là:
     $ P(P_3, 4) = 4 times 3^2 = 36 " cách." $
  
  $ N = P(G backslash e, 4) - P(G / e, 4) = 84 - 36 = bold(48) " cách." $
])

#v(0.5em)

#cannon-box("Ví dụ 35 — Hai tam giác ghép chung nhau 1 cạnh (k=3 màu)", [
  *Đề bài:* Một đồ thị gồm 4 đỉnh tạo thành hai tam giác ghép chung cạnh đáy BC. Có 3 màu để tô các đỉnh sao cho các đỉnh chung cạnh khác màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let pA = (-0.9, 0.5); let pB = (0.0, -0.4)
      let pC = (0.0, 0.8); let pD = (0.9, 0.5)
      
      for (p, q) in ((pA, pB), (pA, pC), (pD, pB), (pD, pC)) {
        line(p, q, stroke: 1.3pt + rgb("0D47A1"))
      }
      line(pB, pC, stroke: (dash: "dashed", paint: rgb("BF360C"), thickness: 1.3pt))
      
      for (p, l) in ((pA,"A"),(pB,"B"),(pC,"C"),(pD,"D")) {
        circle(p, radius: 0.22, fill: white, stroke: 1.3pt + rgb("0D47A1"))
        content(p, text(size: 8pt, weight: "bold")[#l])
      }
    })
  ]
  #v(0.3em)

  *Giải:*
  Gọi cạnh chung là $e = B C$. Ta chọn cạnh này để thực hiện phép co-xóa:
  1. *Xóa cạnh $e$ ($G backslash e$):* Bỏ cạnh BC, đồ thị trở thành một vòng tròn 4 đỉnh $C_4$ ($A-B-D-C-A$). Số cách tô bằng 3 màu là:
     $ P(C_4, 3) = (3-1)^4 + (-1)^4 times (3-1) = 2^4 + 2 = 16 + 2 = 18 " cách." $
  2. *Co cạnh $e$ ($G / e$):* Chập hai đỉnh $B$ và $C$ thành một đỉnh chung BC. Đồ thị còn lại 3 đỉnh tạo thành đường thẳng A-BC-D ($P_3$). Số cách tô bằng 3 màu là:
     $ P(P_3, 3) = 3 times 2^2 = 12 " cách." $
  
  $ N = P(G backslash e, 3) - P(G / e, 3) = 18 - 12 = bold(6) " cách." $
])


// ─────────────────────────────────────
=== 10.6 — Bản Đồ Và Đồ Thị Đối Ngẫu (Planar Map → Dual Graph)

Khi bài toán cho hình vẽ vùng (bản đồ, các miếng ghép), *không cần ép về lưới*. Thay vào đó, dùng *đồ thị đối ngẫu*:

#grid(columns: (1.2fr, 1fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      // Hình chữ nhật chia 4 vùng
      rect((-1.8,-1.2),(1.8,1.2), stroke: 1.3pt + rgb("37474F"))
      line((0,-1.2),(0,1.2), stroke: 1.3pt + rgb("37474F"))
      line((-1.8,0),(1.8,0), stroke: 1.3pt + rgb("37474F"))
      // Nhãn vùng
      content((-0.9,0.6), text(size: 9pt, weight:"bold")[A])
      content((0.9,0.6), text(size: 9pt, weight:"bold")[B])
      content((-0.9,-0.6), text(size: 9pt, weight:"bold")[C])
      content((0.9,-0.6), text(size: 9pt, weight:"bold")[D])
      // Đồ thị đối ngẫu
      let dA = (-0.9,0.6); let dB = (0.9,0.6)
      let dC = (-0.9,-0.6); let dD = (0.9,-0.6)
      for (p,q) in ((dA,dB),(dB,dD),(dD,dC),(dC,dA),(dA,dD),(dB,dC)) {
        line(p, q, stroke: (dash: "dashed", paint: rgb("BF360C"), thickness: 1.1pt))
      }
      for (p, l) in ((dA,"A"),(dB,"B"),(dC,"C"),(dD,"D")) {
        circle(p, radius: 0.2, fill: rgb("FFF9C4"), stroke: 1.2pt + rgb("BF360C"))
      }
      content((0,-1.8), text(size: 8pt, fill: rgb("BF360C"), weight: "bold")[Đối ngẫu (nét đứt)])
    })
  ]
], [
  *Quy trình:*
  1. Mỗi *vùng* → 1 đỉnh đồ thị đối ngẫu.
  2. Hai vùng có *chung biên* → nối cạnh.
  3. Tính $P(G_"dual", k)$ bằng công thức phù hợp.

  *Ví dụ:* Hình chữ nhật chia 4 ô (2×2) — đồ thị đối ngẫu là $K_4$ (4 đỉnh, mọi cặp nối).

  $P(K_4, 4) = 4 times 3 times 2 times 1 = 24$

  *Điều này giải thích:* Bảng 2×2 có 84 cách tô (bằng Bộ QT Lưới), nhưng nếu xét "4 góc đều khác nhau" thì chỉ còn 24!
])

#v(0.5em)

// ─────────────────────────────────────
*Bảng tóm tắt — Chọn vũ khí nào cho hình dạng nào:*

#table(
  columns: (1.6fr, 1fr, 1.5fr, 1.5fr),
  inset: 7pt,
  align: (left, center, left, left),
  table.header([*Nhận dạng đồ thị*], [*Loại*], [*Vũ khí dùng*], [*Ghi chú*]),
  [Hàng thẳng, nhánh cây, không vòng], [$P_n$/$T_n$], [Súng Lục: $k(k-1)^{n-1}$], [Mọi cây đều dùng được],
  [Khép kín thành vòng], [$C_n$], [Vòng: $(k-1)^n + (-1)^n(k-1)$], [Đại Bác 3],
  [1 tâm + $n$ cánh tự do], [$K_{1,n}$], [Sao: $k(k-1)^n$], [Cánh không nối nhau],
  [1 tâm + vòng $n$ đỉnh], [$W_n$], [Bánh xe: $k dot P(C_n, k-1)$], [2 bước: tâm + vành],
  [Mọi cặp đỉnh đều nối], [$K_n$], [Đầy đủ: $k(k-1) dots.c (k-n+1)$], [Cần $k >= n$ màu],
  [Lưới ô vuông khuyết], [Grid], [Đại Bác Vạn Năng (Quét Cột)], [Chương 1–9 của tài liệu này],
  [Hình vẽ vùng/bản đồ], [Planar], [Đồ thị đối ngẫu → áp công thức], [Vùng = đỉnh],
  [Đồ thị tuỳ ý bất kỳ], [$G$], [Xoá-Chập: $P(G \\ e) - P(G/e)$], [Vạn năng, đệ quy],
)


