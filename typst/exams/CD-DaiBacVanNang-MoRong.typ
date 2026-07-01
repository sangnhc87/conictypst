// ══════════════════════════════════════════════════════════════════
//  NỘI DUNG CHUYÊN ĐỀ ĐẠI SỐ TỔ HỢP
//  Tác giả: GV Nguyễn Văn Sang · 0389.821.115
// ══════════════════════════════════════════════════════════════════

// ─── Bảng màu toàn cục ───────────────────────────────────────────
#let c-navy    = rgb("0D2137")
#let c-blue    = rgb("1565C0")
#let c-teal    = rgb("00695C")
#let c-amber   = rgb("BF360C")
#let c-violet  = rgb("4A148C")
#let c-green   = rgb("1B5E20")
#let c-slate   = rgb("37474F")
#let c-gold    = rgb("B7791F")
#let c-crimson = rgb("9B1C1C")
#let c-indigo  = rgb("3730A3")

#import "../math-sym.typ": *
#import "../sang-exam.typ": *
#import "../template.typ": *

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ─── Màu chủ đề nâng cấp ─────────────────────────────────────────────
#let col-purple = rgb("4A148C")
#import "@preview/cetz:0.5.2"
#let col-violet = rgb("6A1B9A")
#let default-color = rgb("0F172A")
#let col-blue = rgb("1565C0")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-red = rgb("C62828")
#let col-teal = rgb("006064")
#let col-pink = rgb("880E4F")

// ─── Hộp nâng cấp kiểu CD-HamSinh ─────────────────────────────
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

#let cach-box(title: "Hướng giải", color: col-blue, icon: "🔵", body) = block(
  fill: color.lighten(94%),
  stroke: (left: 4pt + color, rest: 0.5pt + color.lighten(70%)),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: color, weight: "bold", size: 10.5pt)[#icon #title]
  #v(0.3em)
  #body
]

#let eg-box(title: "🎯 Ví Dụ Trực Quan", body) = block(
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

#let note-box(title: "📌 Nhận Xét", body) = block(
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

#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[🔵 Cách 1 — Tổ Hợp Thuần Túy]
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
  #text(fill: col-violet, weight: "bold", size: 10.5pt)[🟣 Cách 2 — Hàm Sinh (Generating Function)]
  #v(0.3em)
  #body
]

#let method-box(body) = block(
  fill: rgb("E0F7FA"),
  stroke: (left: 4pt + col-teal, rest: 0.5pt + rgb("80DEEA")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-teal, weight: "bold", size: 10.5pt)[⚙️ Phương Pháp Giải Quyết]
  #v(0.3em)
  #body
]

// ─── Hộp thành phần ────────────────────────────────────────────
#let theory-box(body) = block(
  fill: rgb("EFF6FF"),
  stroke: (left: 4.5pt + c-blue, rest: 0.8pt + rgb("BFDBFE")),
  radius: (right: 8pt), inset: (x: 16pt, y: 14pt), width: 100%,
)[#body]

#let insight-box(title: "💡 Trực Giác Cốt Lõi", body) = block(
  fill: rgb("F0FDF4"),
  stroke: (left: 4pt + c-teal, rest: 0.6pt + rgb("A7F3D0")),
  radius: (right: 7pt), inset: (x: 14pt, y: 12pt), width: 100%,
)[
  #text(fill: c-teal, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FFF7ED"),
  stroke: (left: 4pt + c-amber, rest: 0.6pt + rgb("FED7AA")),
  radius: (right: 7pt), inset: (x: 14pt, y: 11pt), width: 100%,
)[
  #text(fill: c-amber, weight: "bold")[⚠️ Bẫy Thường Gặp]
  #v(0.3em)
  #body
]

#let key-box(body) = block(
  fill: rgb("F5F3FF"),
  stroke: (left: 4pt + c-violet, rest: 0.6pt + rgb("DDD6FE")),
  radius: (right: 7pt), inset: (x: 14pt, y: 12pt), width: 100%,
)[
  #text(fill: c-violet, weight: "bold")[🔑 Công Thức / Nguyên Lý Then Chốt]
  #v(0.3em)
  #body
]

#let example-box(n: "", body) = block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-slate, rest: 0.6pt + rgb("E2E8F0")),
  radius: (right: 7pt), inset: (x: 14pt, y: 12pt), width: 100%,
)[
  #text(fill: c-slate, weight: "bold")[📝 Ví Dụ #n]
  #v(0.3em)
  #body
]

#let skill-badge(code, title, color: c-blue) = block(
  fill: color.lighten(95%),
  stroke: (left: 5pt + color, rest: 0.8pt + color.lighten(70%)),
  radius: (right: 8pt), inset: (x: 14pt, y: 10pt), width: 100%,
  above: 1.6em, below: 0.8em,
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.8em,
    align: (center + horizon, left + horizon),
    box(fill: color, inset: (x: 7pt, y: 4pt), radius: 5pt)[
      #text(fill: white, weight: "bold", size: 9pt)[#code]
    ],
    text(fill: color, weight: "bold", size: 12pt)[#title],
  )
]

// ─── Đề bài + Lời giải inline ──────────────────────────────────
#let prob(n, de, ans, loigiai: []) = {
  block(
    above: 1.2em, below: 1em,
    stroke: 0.6pt + rgb("E2E8F0"),
    inset: (x: 13pt, y: 10pt),
    radius: 6pt,
    width: 100%,
    fill: white,
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.6em,
      align: (top, top),
      box(fill: c-indigo, inset: (x: 6pt, y: 4pt), radius: 4pt)[
        #text(fill: white, weight: "bold", size: 9pt)[Bài #n]
      ],
      de,
    )
    #if ans != [] [
      #v(0.4em)
      #box(fill: rgb("ECFDF5"), stroke: 0.6pt + c-teal, inset: (x: 9pt, y: 5pt), radius: 4pt)[
        #text(fill: c-teal, weight: "bold", size: 9.5pt)[🎯 Đáp số: #ans]
      ]
    ]
    #if loigiai != [] [
      #v(0.4em)
      #block(
        fill: rgb("FFFBEB"),
        stroke: (left: 3pt + c-gold, rest: 0.5pt + rgb("FDE68A")),
        inset: (x: 12pt, y: 10pt),
        radius: (right: 5pt),
        width: 100%,
      )[
        #text(fill: c-gold, weight: "bold", size: 9.5pt)[📖 Hướng dẫn giải]
        #v(0.3em)
        #loigiai
      ]
    ]
  ]
}

// ─── Separator ──────────────────────────────────────────────────
#let section-rule(color: c-blue) = {
  v(0.5em)
  line(length: 100%, stroke: 1.2pt + color)
  v(0.5em)
}



#set page(
  paper: "a4",
  margin: (x: 1.4cm, y: 1.8cm)
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)

#v(1em)
#align(center)[
  #block(
    fill: gradient.linear(rgb("4A148C"), rgb("1565C0"), angle: 135deg),
    width: 100%,
    inset: (x: 20pt, y: 24pt),
    radius: 12pt,
    // shadow: (color: rgb("00000033"), blur: 10pt, offset: (0pt, 5pt))
  )[
    #text(fill: white, size: 22pt, weight: "black", tracking: 0.05em)[
      CHUYÊN ĐỀ ĐẶC BIỆT: ĐẠI BÁC VẠN NĂNG
    ]
    #v(0.6em)
    #text(fill: rgb("90CAF9"), size: 16pt, weight: "bold")[
      QUY TẮC QUÉT CỘT TRẠNG THÁI (STATE TRANSITION)
    ]
    #v(1em)
    #text(fill: rgb("E3F2FD"), size: 11.5pt, style: "italic")[
      Giải quyết siêu tốc mọi bài toán tô màu lưới dị (khuyết góc, thủng giữa, zic-zắc) 
      \ với số màu $k$ bất kỳ và chiều cao cột bất kỳ, không phụ thuộc hình dáng.
    ]
  ]
]

#v(1em)
#block(
  fill: rgb("FAFAFA"), 
  stroke: 1pt + rgb("E0E0E0"), 
  radius: 8pt, 
  inset: 15pt,
  width: 100%
)[
  #text(size: 14pt, weight: "bold", fill: rgb("4A148C"))[📑 MỤC LỤC CHUYÊN ĐỀ]
  #v(0.5em)
  #outline(depth: 2, indent: auto)
]
#v(1em)

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

== 1. Tư Duy Tổng Quát: Đại Bác Quét Cột
Bất kỳ lưới dạng ô vuông nào, dù bị khuyết góc, khuyết giữa, thắt eo, hay lắp ghép phức tạp đều có chung một cách giải hệ thống duy nhất: *Quét từ trái sang phải theo từng cột đứng*.

*Tại sao lại quét theo cột?*
Thay vì bối rối chọn màu lộn xộn cho cả lưới, việc quét cột giúp cô lập sự ảnh hưởng. Khi tô một cột mới, ta chỉ cần nhìn vào cột ngay bên trái để né màu, những cột xa hơn đã tô xong sẽ không còn ràng buộc trực tiếp. Phương pháp này giúp chia nhỏ bài toán thành các bước chuyển tiếp đơn giản.



== 1.5. Kỹ Thuật Xây Dựng Bộ Quy Tắc Chuyển Trạng Thái Giữa Các Cột

Khi làm việc với lưới 2 chiều, nếu chỉ dùng cảm giác nhân hệ số, ta rất dễ đếm thiếu hoặc trùng lặp. Phương pháp chuyển trạng thái (State Transition) giúp "số hóa" quá trình chuyển màu từ Cột $i$ sang Cột $i+1$. 

#theory-box[
  *Bước 1: Phân loại trạng thái của một cột*
  Mỗi cột $h$ ô sẽ có nhiều cách tô màu. Ta gom các cách tô có đặc điểm giống nhau thành các *Nhóm Trạng Thái*. 
  Ví dụ, với cột 2 ô (trên, dưới):
  - Nhóm A: Hai ô có *cùng màu* (nếu đề cho phép).
  - Nhóm B: Hai ô có *khác màu*.
  
  *Bước 2: Phân tích sự sinh sản (Chuyển trạng thái)*
  Giả sử cột $i$ thuộc Nhóm A. Khi xây cột $i+1$, ta xem nó có thể tô được bao nhiêu cột Nhóm A mới, bao nhiêu cột Nhóm B mới mà không trùng màu ở cạnh kề. Ta gọi đây là *Sơ Đồ Đẻ Nhánh*.
  
  *Bước 3: Lập ma trận và nhân liên tiếp*
  Từ sơ đồ nhánh, ta có hệ phương trình truy hồi liên kết số lượng cột A, B của bước trước với bước sau. Cột 1 $\to$ Cột 2 $\to$ Cột 3...
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Group A box (Column i)
    rect((-1.5, 1), (1.5, 2.5), fill: gradient.linear(rgb("E8F5E9"), rgb("C8E6C9")), stroke: 1.5pt + rgb("2E7D32"), radius: 4pt, name: "col_i")
    content("col_i", text(weight: "bold", fill: rgb("1B5E20"))[CỘT $i$
Trạng thái gốc])
    
    // Branches
    bezier((-0.5, 1), (-2, -0.5), (-1, 0.5), (-1.5, 0), mark: (end: ">", fill: rgb("1565C0")), stroke: 1.5pt + rgb("1565C0"))
    bezier((0.5, 1), (2, -0.5), (1, 0.5), (1.5, 0), mark: (end: ">", fill: rgb("E65100")), stroke: 1.5pt + rgb("E65100"))
    
    // Group A (Column i+1)
    rect((-3.5, -2), (-0.5, -0.5), fill: gradient.linear(rgb("E3F2FD"), rgb("BBDEFB")), stroke: 1.5pt + rgb("1565C0"), radius: 4pt, name: "col_i1_A")
    content("col_i1_A", text(weight: "bold", fill: rgb("0D47A1"))[CỘT $i+1$
$x$ nhóm A])
    
    // Group B (Column i+1)
    rect((0.5, -2), (3.5, -0.5), fill: gradient.linear(rgb("FFF3E0"), rgb("FFE0B2")), stroke: 1.5pt + rgb("E65100"), radius: 4pt, name: "col_i1_B")
    content("col_i1_B", text(weight: "bold", fill: rgb("E65100"))[CỘT $i+1$
$y$ nhóm B])
    
    // Badges
    circle((-1.8, 0.2), radius: 0.3, fill: rgb("1565C0"), stroke: none)
    content((-1.8, 0.2), text(fill: white, size: 8pt, weight: "bold")[$x$])
    
    circle((1.8, 0.2), radius: 0.3, fill: rgb("E65100"), stroke: none)
    content((1.8, 0.2), text(fill: white, size: 8pt, weight: "bold")[$y$])
  })
]

#prob("101", 
  [Cho một lưới chữ nhật $2 times n$ ô. Bạn có $k$ màu để tô sao cho không có 2 ô nào chung cạnh (cả ngang và dọc) có cùng màu. Hãy xây dựng bộ quy tắc tính số cách tô bằng phương pháp chuyển trạng thái.],
  [$k(k-1)$ cách cho cột đầu, hệ số chuyển tự thiết lập],
  loigiai: [
    #cach-box(title: "Hướng dẫn xây dựng quy tắc chuyển cột")[
      Ta chia trạng thái của mỗi cột (2 ô) thành các nhóm:
      Do đề bài yêu cầu không chung cạnh dọc, nên 2 ô trên một cột *bắt buộc* phải khác màu.
      Vậy chỉ có đúng 1 nhóm hợp lệ là Nhóm B (khác màu). Cột 1 có số cách tô là: $k(k-1)$.

      *Lập quy tắc từ Cột $i$ sang Cột $i+1$:*
      Giả sử Cột $i$ tô 2 màu $(M_1, M_2)$. Cột $i+1$ cần tô 2 màu $(M_3, M_4)$ sao cho $M_3 != M_1, M_4 != M_2$ và $M_3 != M_4$.
      Ta chia các lựa chọn của Cột $i+1$ thành các trường hợp phụ thuộc vào Cột $i$:
      - *Trường hợp 1:* $(M_3, M_4) = (M_2, M_1)$ (Tô đảo màu chéo). Có đúng *1 cách*.
      - *Trường hợp 2:* $M_3 = M_2$ nhưng $M_4 != M_1$. Có $k-2$ cách.
      - *Trường hợp 3:* $M_4 = M_1$ nhưng $M_3 != M_2$. Có $k-2$ cách.
      - *Trường hợp 4:* $M_3 != M_2$ và $M_4 != M_1$. Có $(k-2)(k-3)$ cách (nếu $k >= 3$).
      
      Tổng cộng một cột bất kỳ sẽ sinh ra: 
      $1 + 2(k-2) + (k-2)(k-3) = k^2 - 3k + 3$ cột mới.
    ]
    #v(0.5em)
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        
        // Cột i
        rect((0, 3), (1.2, 5.4), fill: rgb("ECEFF1"), stroke: 1.5pt + rgb("78909C"), radius: 3pt)
        line((0, 4.2), (1.2, 4.2), stroke: 1.2pt + rgb("B0BEC5"))
        circle((0.6, 4.8), radius: 0.35, fill: rgb("EF5350"), stroke: none)
        content((0.6, 4.8), text(fill: white, weight: "bold", size: 8pt)[$M_1$])
        circle((0.6, 3.6), radius: 0.35, fill: rgb("42A5F5"), stroke: none)
        content((0.6, 3.6), text(fill: white, weight: "bold", size: 8pt)[$M_2$])
        content((0.6, 2.5), text(weight: "bold")[Cột $i$])
        
        // Mũi tên và kết quả 1
        bezier((1.2, 4.8), (3.8, 5.5), (2.5, 4.8), (2.5, 5.5), mark: (end: ">"), stroke: 1.5pt + rgb("AB47BC"))
        rect((4, 4.5), (5.2, 6.9), fill: rgb("F3E5F5"), stroke: 1.5pt + rgb("AB47BC"), radius: 3pt)
        line((4, 5.7), (5.2, 5.7), stroke: 1.2pt + rgb("CE93D8"))
        circle((4.6, 6.3), radius: 0.35, fill: rgb("42A5F5"), stroke: none)
        circle((4.6, 5.1), radius: 0.35, fill: rgb("EF5350"), stroke: none)
        content((6.2, 5.7), text(fill: rgb("8E24AA"), weight: "bold")[1 cách])
        
        // Mũi tên và kết quả 2
        bezier((1.2, 4.2), (3.8, 3.5), (2.5, 4.2), (2.5, 3.5), mark: (end: ">"), stroke: 1.5pt + rgb("00897B"))
        rect((4, 2), (5.2, 4.4), fill: rgb("E0F2F1"), stroke: 1.5pt + rgb("00897B"), radius: 3pt)
        line((4, 3.2), (5.2, 3.2), stroke: 1.2pt + rgb("80CBC4"))
        circle((4.6, 3.8), radius: 0.35, fill: rgb("42A5F5"), stroke: none)
        circle((4.6, 2.6), radius: 0.35, fill: rgb("FFA726"), stroke: none)
        content((4.6, 2.6), text(fill: white, size: 8pt, weight: "bold")[$M_4$])
        content((6.5, 3.2), text(fill: rgb("00695C"), weight: "bold")[$2(k-2)$ cách])
        
        // Mũi tên và kết quả 3
        bezier((1.2, 3.6), (3.8, 0.5), (2.5, 3.6), (2.5, 0.5), mark: (end: ">"), stroke: 1.5pt + rgb("F57C00"))
        rect((4, -0.5), (5.2, 1.9), fill: rgb("FFF3E0"), stroke: 1.5pt + rgb("F57C00"), radius: 3pt)
        line((4, 0.7), (5.2, 0.7), stroke: 1.2pt + rgb("FFCC80"))
        circle((4.6, 1.3), radius: 0.35, fill: rgb("66BB6A"), stroke: none)
        content((4.6, 1.3), text(fill: white, size: 8pt, weight: "bold")[$M_3$])
        circle((4.6, 0.1), radius: 0.35, fill: rgb("FFA726"), stroke: none)
        content((4.6, 0.1), text(fill: white, size: 8pt, weight: "bold")[$M_4$])
        content((7.2, 0.7), text(fill: rgb("E65100"), weight: "bold")[$(k-2)(k-3)$ cách])
      })
    ]
  ]
)

#v(0.5em)
#prob("102",
  [Lưới kích thước $3 times n$ nhưng ô ở góc dưới cùng bên phải của Cột 1 bị khoét (Cột 1 chỉ có 2 ô trên, các cột sau có 3 ô). Có $k=4$ màu. Hãy chỉ ra cách chuyển từ Cột 1 (khuyết) sang Cột 2 (đầy đủ).],
  [Tính qua trạng thái nhóm],
  loigiai: [
    Cột 1 (chỉ có ô trên và ô giữa). Số cách tô Cột 1 là: $4 times 3 = 12$ cách. Đều thuộc nhóm 2 ô khác màu.
    Khi chuyển sang Cột 2 (đầy đủ 3 ô), Cột 2 chịu ảnh hưởng từ Cột 1 ở *2 ô trên và giữa*, ô dưới cùng của Cột 2 *không bị* Cột 1 chặn màu ngang trực tiếp.
    
    #v(0.5em)
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Col 1 (missing bottom)
        rect((0, 1.2), (1.2, 3.6), fill: gradient.linear(rgb("E8F5E9"), rgb("C8E6C9")), stroke: 1.5pt + rgb("2E7D32"), radius: 3pt)
        line((0, 2.4), (1.2, 2.4), stroke: 1.2pt + rgb("81C784"))
        content((0.6, 3), text(fill: rgb("1B5E20"), weight: "bold")[$X$])
        content((0.6, 1.8), text(fill: rgb("1B5E20"), weight: "bold")[$Y$])
        content((0.6, 0.6), text(fill: rgb("9E9E9E"), style: "italic")[Khuyết])
        content((0.6, -0.2), text(weight: "bold")[Cột 1])
        
        // Col 2 (full)
        rect((3, 0), (4.2, 3.6), fill: gradient.linear(rgb("E3F2FD"), rgb("BBDEFB")), stroke: 1.5pt + rgb("1565C0"), radius: 3pt)
        line((3, 1.2), (4.2, 1.2), stroke: 1.2pt + rgb("90CAF9"))
        line((3, 2.4), (4.2, 2.4), stroke: 1.2pt + rgb("90CAF9"))
        content((3.6, 3), text(fill: rgb("0D47A1"), weight: "bold")[$!= X$])
        content((3.6, 1.8), text(fill: rgb("0D47A1"), weight: "bold")[$!= Y$])
        content((3.6, 0.6), text(fill: rgb("D84315"), weight: "bold")[Tự do])
        content((3.6, -0.2), text(weight: "bold")[Cột 2])
        
        // Arrows
        line((1.3, 3), (2.9, 3), mark: (end: ">"), stroke: 1.5pt + rgb("EF5350"))
        content((2.1, 3.3), text(fill: rgb("C62828"), size: 8pt)[Chặn])
        line((1.3, 1.8), (2.9, 1.8), mark: (end: ">"), stroke: 1.5pt + rgb("EF5350"))
        content((2.1, 2.1), text(fill: rgb("C62828"), size: 8pt)[Chặn])
        
        line((1.3, 0.6), (2.9, 0.6), mark: (end: ">"), stroke: 1.5pt + rgb("81C784"), style: "dashed")
        content((2.1, 0.9), text(fill: rgb("2E7D32"), size: 8pt)[Không chặn])
      })
    ]
    
    *Cách tính số cấu hình Cột 2 sinh ra từ 1 cấu hình Cột 1:*
    - Ô trên của Cột 2: $3$ lựa chọn (khác $X$).
    - Ô giữa của Cột 2: $3$ lựa chọn (khác $Y$).
    - Ô dưới của Cột 2: *KHÔNG* bị chặn ngang bởi Cột 1, chỉ cần khác ô giữa của Cột 2. Do đó có $3$ lựa chọn.
    Tuy nhiên, ô trên và ô giữa của Cột 2 phải khác màu nhau. Bài toán này quy về đếm số cách tô một cột 3 ô (Cột 2) sao cho ô 1 khác $X$, ô 2 khác $Y$, ô 3 chỉ cần khác ô 2.
  ]
)

#v(0.5em)
#prob("103",
  [Lưới kích thước $3 times n$. Tô bằng 3 màu sao cho 2 ô kề cạnh (ngang, dọc) khác màu. Xây dựng ma trận chuyển trạng thái.],
  [Nhóm A (đầu cuối cùng màu), Nhóm B (3 ô khác màu)],
  loigiai: [
    #cach-box(title: "Chìa khóa: Vòng đời của Nhóm A và Nhóm B")[
      Với lưới cao 3 ô và 3 màu, một cột bắt buộc phải thuộc 1 trong 2 nhóm:
      - *Nhóm A:* Ô trên cùng và ô dưới cùng *cùng màu* (VD: Đỏ - Xanh - Đỏ). Số lượng Cột 1 thuộc nhóm A là: $3 times 2 times 1 = 6$ cách.
      - *Nhóm B:* Cả 3 ô *khác màu nhau* (VD: Đỏ - Xanh - Vàng). Số lượng Cột 1 thuộc nhóm B là: $3 times 2 times 1 = 6$ cách.
      
      Bây giờ ta lập sơ đồ đẻ nhánh từ Cột $i$ sang Cột $i+1$:
      - Nếu Cột $i$ thuộc *Nhóm A* (Đỏ - Xanh - Đỏ): 
        - Nó có thể sinh ra bao nhiêu cột Nhóm A mới? (Bắt buộc phải là Xanh - Đỏ - Xanh, hoặc Vàng - Đỏ - Vàng $dots$). Đếm được *3 cách*.
        - Sinh ra bao nhiêu cột Nhóm B mới? (VD: Xanh - Đỏ - Vàng). Đếm được *2 cách*.
      - Nếu Cột $i$ thuộc *Nhóm B* (Đỏ - Xanh - Vàng):
        - Nó có thể sinh ra bao nhiêu cột Nhóm A mới? Đếm được *2 cách*.
        - Sinh ra bao nhiêu cột Nhóm B mới? Đếm được *2 cách*.
    ]
    
    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Vòng lặp tuần hoàn sinh sản (Markov Chain style)
        circle((-2, 0), radius: 1.2, fill: gradient.linear(rgb("E3F2FD"), rgb("BBDEFB")), stroke: 1.5pt + rgb("1565C0"), name: "A")
        content("A", text(fill: rgb("0D47A1"), weight: "bold")[NHÓM A])
        
        circle((2, 0), radius: 1.2, fill: gradient.linear(rgb("FFF3E0"), rgb("FFE0B2")), stroke: 1.5pt + rgb("E65100"), name: "B")
        content("B", text(fill: rgb("E65100"), weight: "bold")[NHÓM B])
        
        // A -> B
        bezier((-1.2, 0.6), (1.2, 0.6), (-0.5, 1.2), (0.5, 1.2), mark: (end: ">", fill: rgb("757575")), stroke: 1.5pt + rgb("757575"))
        circle((0, 0.9), radius: 0.2, fill: white, stroke: 1pt + rgb("757575"))
        content((0, 0.9), text(weight: "bold", size: 8pt)[$2$])
        
        // B -> A
        bezier((1.2, -0.6), (-1.2, -0.6), (0.5, -1.2), (-0.5, -1.2), mark: (end: ">", fill: rgb("757575")), stroke: 1.5pt + rgb("757575"))
        circle((0, -0.9), radius: 0.2, fill: white, stroke: 1pt + rgb("757575"))
        content((0, -0.9), text(weight: "bold", size: 8pt)[$2$])
        
        // A -> A (self loop)
        bezier((-3, 0.6), (-3, -0.6), (-5, 2.5), (-5, -2.5), mark: (end: ">", fill: rgb("1565C0")), stroke: 1.5pt + rgb("1565C0"))
        circle((-4, 0), radius: 0.2, fill: white, stroke: 1pt + rgb("1565C0"))
        content((-4, 0), text(weight: "bold", fill: rgb("1565C0"), size: 8pt)[$3$])
        
        // B -> B (self loop)
        bezier((3, 0.6), (3, -0.6), (5, 2.5), (5, -2.5), mark: (end: ">", fill: rgb("E65100")), stroke: 1.5pt + rgb("E65100"))
        circle((4, 0), radius: 0.2, fill: white, stroke: 1pt + rgb("E65100"))
        content((4, 0), text(weight: "bold", fill: rgb("E65100"), size: 8pt)[$2$])
      })
    ]
    Hệ phương trình lặp của 2 dãy $A_n, B_n$ (số cột A, B ở vị trí $n$) là:
    $ cases(A_(n+1) = 3A_n + 2B_n, B_(n+1) = 2A_n + 2B_n) $
  ]
)

#v(0.5em)
#prob("104",
  [Lưới $3 times 4$ nhưng bị khoét mất ô trung tâm (Hàng 2, Cột 2). Có 4 màu. Phân tích sự ảnh hưởng của ô bị khoét đến cột kế tiếp.],
  [Quy tắc lặp bị gián đoạn tại Cột 2],
  loigiai: [
    Khi lưới bị thủng, ta quét cột như bình thường, nhưng tại Cột bị thủng, *bộ quy tắc chuyển sẽ khác biệt hoàn toàn*.
    - *Cột 1 (đầy đủ 3 ô):* Có $4 times 3 times 3 = 36$ cách tô.
    - *Chuyển từ Cột 1 sang Cột 2 (bị thủng ô giữa):* 
      Cột 2 chỉ có ô trên và ô dưới. Ô trên Cột 2 phải khác ô trên Cột 1 (3 cách). Ô dưới Cột 2 phải khác ô dưới Cột 1 (3 cách).
      Cột 2 hoàn toàn không bị ràng buộc dọc (vì mất ô giữa). Số cách tô Cột 2 ứng với mỗi cấu hình Cột 1 là: $3 times 3 = 9$ cách.
    - *Chuyển từ Cột 2 sang Cột 3 (đầy đủ 3 ô):*
      Ô trên Cột 3 khác ô trên Cột 2 (3 cách). Ô dưới Cột 3 khác ô dưới Cột 2 (3 cách).
      Và ĐẶC BIỆT: *Ô giữa Cột 3 hoàn toàn không bị Cột 2 chặn màu ngang* (do Cột 2 không có ô giữa). Nó chỉ cần khác màu ô trên và ô dưới của Cột 3!
      
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Col 1 (Full)
        rect((0, 0), (1.2, 3.6), fill: rgb("ECEFF1"), stroke: 1.5pt + rgb("78909C"), radius: 3pt)
        line((0, 1.2), (1.2, 1.2), stroke: 1pt); line((0, 2.4), (1.2, 2.4), stroke: 1pt)
        content((0.6, 3), $x_1$); content((0.6, 1.8), $x_2$); content((0.6, 0.6), $x_3$)
        content((0.6, -0.5), text(weight: "bold")[Cột 1])
        
        // Col 2 (Hole)
        rect((2.5, 2.4), (3.7, 3.6), fill: rgb("E3F2FD"), stroke: 1.5pt + rgb("1565C0"), radius: 3pt)
        rect((2.5, 0), (3.7, 1.2), fill: rgb("E3F2FD"), stroke: 1.5pt + rgb("1565C0"), radius: 3pt)
        content((3.1, 3), $y_1$); content((3.1, 0.6), $y_3$)
        content((3.1, 1.8), text(fill: rgb("D32F2F"), weight: "bold")[LỖ HỔNG])
        content((3.1, -0.5), text(weight: "bold")[Cột 2])
        
        // Col 3 (Full)
        rect((5, 0), (6.2, 3.6), fill: rgb("FFF3E0"), stroke: 1.5pt + rgb("E65100"), radius: 3pt)
        line((5, 1.2), (6.2, 1.2), stroke: 1pt); line((5, 2.4), (6.2, 2.4), stroke: 1pt)
        content((5.6, 3), $z_1$); content((5.6, 1.8), $z_2$); content((5.6, 0.6), $z_3$)
        content((5.6, -0.5), text(weight: "bold")[Cột 3])
        
        // Arrows C1 -> C2
        line((1.3, 3), (2.4, 3), mark: (end: ">"), stroke: 1.5pt + rgb("90CAF9"))
        line((1.3, 0.6), (2.4, 0.6), mark: (end: ">"), stroke: 1.5pt + rgb("90CAF9"))
        
        // Arrows C2 -> C3
        line((3.8, 3), (4.9, 3), mark: (end: ">"), stroke: 1.5pt + rgb("FFCC80"))
        line((3.8, 0.6), (4.9, 0.6), mark: (end: ">"), stroke: 1.5pt + rgb("FFCC80"))
        
        // The freedom arrow
        bezier((3.1, 2.3), (5.5, 1.8), (4, 1.8), (4.5, 1.8), mark: (end: ">", fill: rgb("4CAF50")), stroke: 1.5pt + rgb("4CAF50"), style: "dashed")
        content((4.2, 2.1), text(fill: rgb("2E7D32"), size: 8pt)[$z_2$ Tự Do Màu Ngang!])
      })
    ]
  ]
)



#v(1em)
#warn-box()[
  *CẠM BẪY TRỰC GIÁC KINH ĐIỂN: Nghịch Lý Xoay Lưới $2 times 3$ và $3 times 2$*
  
  Nhiều học sinh thường thắc mắc: *"Lưới $2 times 3$ và lưới $3 times 2$ bản chất là một hình xoay 90 độ, vậy số cách tô phải bằng nhau. Nhưng tại sao quét cột 2 ô thì dễ, mà quét cột 3 ô lại khó?"*
  
  Đây là một nhầm lẫn tai hại về việc đếm hệ số chuyển tiếp. Giả sử có $k=4$ màu:
  
  *Góc nhìn 1: Lưới 3 cột, mỗi cột cao 2 ô ($2 times 3$)*
  - Rất nhiều bạn đếm nhầm: Cột 1 có $4 times 3 = 12$ cách. Chuyển sang Cột 2, ô trên né 1 màu (3 cách), ô dưới né 1 màu (3 cách) nên nhân $3 times 3 = 9$. *Sai!* 
  - Bạn quên mất 2 ô trên và dưới của Cột 2 *phải khác màu nhau*. Trong 9 cách đó, có 2 cách bị trùng màu trên dưới. Do đó, hệ số chuyển chỉ là $9 - 2 = 7$ (Khớp công thức $k^2 - 3k + 3 = 7$).
  - Số cách tô: $12 times 7 times 7 = 588$ cách.
  
  *Góc nhìn 2: Lưới 2 cột, mỗi cột cao 3 ô ($3 times 2$)*
  - Cột 1 cao 3 ô: Có $4 times 3 times 3 = 36$ cách. 
  - Chuyển sang Cột 2: Ta phải chia Cột 1 thành Nhóm A (đầu cuối cùng màu, 12 cách) và Nhóm B (3 ô khác màu, 24 cách). Bằng ma trận trạng thái cho $k=4$, ta tính được Nhóm A sinh ra tổng 17 cách, Nhóm B sinh ra tổng 16 cách.
  - Số cách tô: $12 times 17 + 24 times 16 = 204 + 384 = 588$ cách.
  
  *💡 BÀI HỌC CỐT LÕI:*
  Kết quả toán học luôn nhất quán ($588 = 588$). Tuy nhiên, hệ thống trạng thái của cột cao 3 ô phức tạp hơn cột cao 2 ô rất nhiều. Do đó, *Quy tắc tối thượng khi dùng Đại Bác Quét Cột là:* *Luôn xoay lưới để quét theo chiều ngắn hơn!* (VD: Gặp lưới $3 times 100$, hãy coi nó là 100 cột cao 3 ô, đừng coi là 3 cột cao 100 ô).
]



== 1.6. Chuyên Mục Đặc Biệt: Phân Tích Chuyên Sâu Lưới Dị Biệt

#prob("105",
  [Lưới $3 times 3$ bị "thắt eo" ở giữa (Đồng hồ cát). Cụ thể: Cột 1 có đủ 3 ô, Cột 2 chỉ có đúng 1 ô ở giữa (mất ô trên và dưới), Cột 3 có đủ 3 ô. Cho $k=4$ màu. Tính số cách tô màu.],
  [Trạng thái bị nén và giải phóng],
  loigiai: [
    #cach-box(title: "Hiện tượng Thắt Eo - Mở Rộng")[
      - *Cột 1 (3 ô):* Số cách tô là $4 times 3 times 3 = 36$ cách.
      - *Cột 2 (1 ô giữa):* Bị kìm kẹp bởi ô giữa của Cột 1. Do đó có 3 cách chọn (chỉ cần khác ô giữa Cột 1). Trạng thái của toàn lưới lúc này bị "nén" lại chỉ phụ thuộc vào duy nhất 1 ô của Cột 2.
      - *Cột 3 (3 ô):* Khi bung từ Cột 2 sang Cột 3, điều gì xảy ra?
        - Ô giữa Cột 3: Bị chặn bởi ô giữa Cột 2 $=>$ có 3 cách.
        - Ô trên Cột 3: Không bị Cột 2 chặn ngang (vì Cột 2 khuyết ô trên). Nó chỉ cần khác ô giữa Cột 3. $=>$ có 3 cách!
        - Ô dưới Cột 3: Tương tự, không bị Cột 2 chặn ngang. Chỉ cần khác ô giữa Cột 3. $=>$ có 3 cách!
      Sự vắng mặt của ô trên/dưới tại Cột 2 đã *giải phóng tự do* hoàn toàn cho ô trên/dưới của Cột 3!
    ]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Col 1
        rect((0, 0), (1, 3), fill: rgb("ECEFF1"), stroke: 1.5pt + rgb("78909C"), radius: 3pt)
        line((0, 1), (1, 1), stroke: 1pt); line((0, 2), (1, 2), stroke: 1pt)
        content((0.5, -0.5), text(weight: "bold")[Cột 1])
        
        // Col 2 (Eo)
        rect((2.5, 1), (3.5, 2), fill: gradient.linear(rgb("FFEBEE"), rgb("FFCDD2")), stroke: 1.5pt + rgb("D32F2F"), radius: 3pt)
        content((3, 1.5), text(fill: rgb("B71C1C"), weight: "bold")[Nén])
        content((3, -0.5), text(weight: "bold")[Cột 2])
        
        // Col 3
        rect((5, 0), (6, 3), fill: rgb("E8F5E9"), stroke: 1.5pt + rgb("2E7D32"), radius: 3pt)
        line((5, 1), (6, 1), stroke: 1pt); line((5, 2), (6, 2), stroke: 1pt)
        content((5.5, -0.5), text(weight: "bold")[Cột 3])
        
        // Arrows C1 -> C2
        line((1.1, 1.5), (2.4, 1.5), mark: (end: ">"), stroke: 1.5pt + rgb("D32F2F"))
        
        // Arrows C2 -> C3
        line((3.6, 1.5), (4.9, 1.5), mark: (end: ">"), stroke: 1.5pt + rgb("2E7D32"))
        
        // Free arrows C3
        bezier((5.5, 1.9), (5.5, 2.5), (5, 2.2), (6, 2.2), mark: (end: ">", fill: rgb("F57F17")), stroke: 1.5pt + rgb("FBC02D"))
        content((5.5, 3.4), text(fill: rgb("F57F17"), size: 8pt)[Tự do (3 cách)])
        bezier((5.5, 1.1), (5.5, 0.5), (5, 0.8), (6, 0.8), mark: (end: ">", fill: rgb("F57F17")), stroke: 1.5pt + rgb("FBC02D"))
        content((5.5, -0.4), text(fill: rgb("F57F17"), size: 8pt)[Tự do (3 cách)])
      })
    ]
    
    *Tổng kết số cách:* $36 times 3 times (3 times 3 times 3) = 2916$ cách.
  ]
)

#v(0.5em)
#prob("106",
  [Lưới $2 times n$ được uốn cong thành hình trụ (vòng tròn khép kín), tức là Cột cuối cùng ($C_n$) sẽ kề cạnh với Cột đầu tiên ($C_1$). Có $k$ màu. Tìm số cách tô.],
  [Dùng công thức truy hồi chặn 2 đầu],
  loigiai: [
    Đây là dạng toán kinh điển "Vòng khép kín". Ta không thể cứ nhân hệ số chuyển tiếp một mạch từ trái sang phải, vì Cột $n$ khi quét tới không được tự do, mà phải *né màu của chính Cột 1*.
    
    #cach-box(title: "Phương pháp Cố định phần tử đầu (Fixing First Column)")[
      Gọi dãy $S_n$ là số cách tô lưới $2 times n$ thẳng (không khép vòng).
      Từ Quy tắc 1 và 2: $S_n = k(k-1) \cdot H^(n-1)$ (với $H = k^2 - 3k + 3$).
      
      Nhưng khi cuộn tròn, ta có 2 trường hợp xảy ra tại Cột $n-1$:
      - *Trường hợp 1:* Cột $n-1$ vô tình tô *trùng màu hoàn toàn* với Cột 1. Lúc này, Cột $n$ bị kẹp giữa 2 cột *giống hệt nhau*. Số cách chọn cho Cột $n$ sẽ nhiều hơn bình thường (giống như rút gọn lại thành lưới chập đầu).
      - *Trường hợp 2:* Cột $n-1$ khác Cột 1. Lúc này Cột $n$ bị kẹp giữa 2 cột khác nhau, số cách chọn sẽ ít hơn.
      
      *Thuật giải bằng dãy số:* Gọi $V_n$ là số cách tô vòng khép kín chiều dài $n$.
      Ta luôn có hệ thức kinh điển: $ V_n = H \cdot V_{n-1} + dots $
      *(Phần chứng minh chi tiết xin xem ở Chuyên đề Đồ thị Vòng $C_n$)*.
    ]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Vẽ lưới cuộn cong (cylinder-like)
        bezier((0,0), (6,0), (2, -1), (4, -1), stroke: 1.5pt + rgb("9E9E9E"))
        bezier((0,2), (6,2), (2, 1), (4, 1), stroke: 1.5pt + rgb("9E9E9E"))
        
        // Cột 1
        rect((-0.4, 0), (0.4, 2), fill: gradient.linear(rgb("E3F2FD"), rgb("BBDEFB")), stroke: 1.5pt + rgb("1565C0"), radius: 2pt)
        line((-0.4, 1), (0.4, 1), stroke: 1pt + rgb("1565C0"))
        content((0, 2.4), text(weight: "bold", fill: rgb("0D47A1"))[$C_1$])
        
        // Cột 2, 3 (ở giữa)
        rect((1.6, -0.3), (2.4, 1.7), fill: rgb("F5F5F5"), stroke: 1.2pt + rgb("BDBDBD"))
        line((1.6, 0.7), (2.4, 0.7), stroke: 1pt + rgb("BDBDBD"))
        content((2, 0.7), $dots$)
        
        // Cột n-1
        rect((3.6, -0.3), (4.4, 1.7), fill: rgb("F5F5F5"), stroke: 1.2pt + rgb("BDBDBD"))
        line((3.6, 0.7), (4.4, 0.7), stroke: 1pt + rgb("BDBDBD"))
        content((4, -0.7), text(weight: "bold")[$C_{n-1}$])
        
        // Cột n
        rect((5.6, 0), (6.4, 2), fill: gradient.linear(rgb("FFF3E0"), rgb("FFE0B2")), stroke: 1.5pt + rgb("E65100"), radius: 2pt)
        line((5.6, 1), (6.4, 1), stroke: 1pt + rgb("E65100"))
        content((6, 2.4), text(weight: "bold", fill: rgb("E65100"))[$C_n$])
        
        // Mũi tên chập
        bezier((6, 1.5), (0, 1.5), (4, 3), (2, 3), mark: (end: ">", fill: rgb("D32F2F")), stroke: 1.5pt + rgb("D32F2F"), style: "dashed")
        content((3, 2.6), text(fill: rgb("C62828"), size: 8pt, weight: "bold")[Bị ràng buộc ngược lại!])
      })
    ]
  ]
)

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
    - *Xóa cạnh ($G backslash e$):* Cắt đứt liên kết $e$ $->$ biến vòng khép kín thành đường thẳng (dễ dàng áp dụng Quy tắc 2).
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
  - $P(G, k)$ = số cách tô thỏa mãn tất cả ràng buộc kể cả $u 
e v$.
  - $P(G backslash e, k)$ = số cách tô bỏ qua ràng buộc $u 
e v$ = đếm CẢ trường hợp $u = v$ lẫn $u 
e v$.
  - $P(G / e, k)$ = số cách tô với $u$ và $v$ bị BẮT BUỘC TRÙNG màu.
  - Hiệu = chỉ còn đúng các cách tô có $u 
e v$. ✓
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

  *Giải:*
  Đây là đồ thị đường thẳng $P_6$ gồm 6 đỉnh. Áp dụng công thức đường thẳng với $n=6, k=4$:
  1. Hạt thứ nhất: Có $k = 4$ cách chọn màu.
  2. Mỗi hạt trong 5 hạt tiếp theo chỉ kề với đúng 1 hạt đã tô màu ở trước nó, nên luôn có $k-1 = 3$ cách chọn màu.
  
  $$N = k(k-1)^(n-1) = 4 times 3^5 = 4 times 243 = bold{972} " cách."$$
])

#v(0.5em)

#cannon-box("Ví dụ 25 — Đồ thị cây gia phả phân nhánh 7 nút (k=5 màu)", [
  *Đề bài:* Cho một sơ đồ cây gồm 7 nút (1 nút gốc chia làm 2 nhánh, mỗi nhánh lại chia tiếp làm các nút con). Có 5 màu để tô các nút này sao cho hai nút nối với nhau luôn khác màu nhau. Tính số cách tô.

  *Giải:*
  Vì sơ đồ là đồ thị cây không chứa chu trình ($T_7$), ta áp dụng công thức cho cây với $n=7, k=5$:
  1. Nút gốc: Có $5$ cách chọn màu.
  2. Mỗi nút con trong 6 nút tiếp theo luôn chỉ liên kết trực tiếp với đúng 1 nút cha ở phía trên nó, do đó luôn có $k-1 = 4$ cách chọn màu cho mỗi nút con.
  
  $$N = k(k-1)^(n-1) = 5 times 4^6 = 5 times 4096 = bold{20.480} " cách."$$
])

#v(0.8em)
#pagebreak()

=== 11.2 — Nhóm 2: Đồ Thị Vòng Tròn Khép Kín ($C_n$)

*Đặc trưng:* Các đỉnh nối tiếp khép kín thành vòng tròn. Công thức cho vòng tròn $n$ đỉnh là: $P(C_n, k) = (k-1)^n + (-1)^n(k-1)$.

#cannon-box("Ví dụ 26 — Tô màu ngũ giác đều 5 đỉnh (k=3 màu)", [
  *Đề bài:* Người ta muốn tô màu 5 đỉnh của một ngũ giác đều bằng 3 màu sao cho hai đỉnh kề nhau luôn khác màu nhau. Tính số cách tô.

  *Giải:*
  Đây là đồ thị vòng tròn $C_5$ gồm 5 đỉnh. Áp dụng công thức vòng tròn với $n=5, k=3$:
  $$P(C_5, 3) = (3-1)^5 + (-1)^5 times (3-1)$$
  $$P(C_5, 3) = 2^5 - 2 = 32 - 2 = bold{30} " cách."$$
])

#v(0.5em)

#cannon-box("Ví dụ 27 — Tô màu lục giác đều 6 đỉnh (k=4 màu)", [
  *Đề bài:* Có bao nhiêu cách tô màu các đỉnh của một lục giác đều bằng 4 màu sao cho hai đỉnh chung cạnh luôn khác màu nhau?

  *Giải:*
  Đây là đồ thị vòng tròn $C_6$ gồm 6 đỉnh. Áp dụng công thức vòng tròn với $n=6, k=4$:
  $$P(C_6, 4) = (4-1)^6 + (-1)^6 times (4-1)$$
  $$P(C_6, 4) = 3^6 + 3 = 729 + 3 = bold{732} " cách."$$
])

#v(0.8em)
#pagebreak()

=== 11.3 — Nhóm 3: Đồ Thị Hình Sao ($K_{1,n}$)

*Đặc trưng:* Có 1 nút tâm nối với tất cả các nút cánh; các cánh độc lập không nối với nhau. Công thức: $P(K_{1,n}, k) = k(k-1)^n$.

#cannon-box("Ví dụ 28 — Bông hoa 5 cánh chạm nhị ở tâm (k=4 màu)", [
  *Đề bài:* Một bông hoa đồ họa gồm 1 nhị ở tâm và 5 cánh hoa xung quanh. Biết rằng các cánh hoa không chạm nhau mà chỉ chạm nhị ở tâm. Có 4 màu để tô các phần sao cho hai phần chạm nhau phải khác màu nhau. Tính số cách tô.

  *Giải:*
  Đây là đồ thị hình sao gồm 1 tâm và 5 cánh ($K_{1,5}$). Áp dụng công thức hình sao với $n=5, k=4$:
  1. Tô nhị hoa ở tâm: Có $k = 4$ cách chọn màu.
  2. Mỗi cánh hoa trong 5 cánh hoa xung quanh chỉ kề với duy nhất nhị hoa, nên luôn có $k-1 = 3$ cách chọn màu độc lập.
  
  $$N = k(k-1)^n = 4 times 3^5 = 4 times 243 = bold{972} " cách."$$
])

#v(0.5em)

#cannon-box("Ví dụ 29 — Hệ thống mạng sao 1 trạm chủ và 8 máy vệ tinh (k=5 màu)", [
  *Đề bài:* Một mạng máy tính gồm 1 máy chủ kết nối trực tiếp đến 8 máy vệ tinh xung quanh (các máy vệ tinh không kết nối với nhau). Người ta muốn phân bổ 5 kênh tần số cho các máy sao cho hai máy kết nối trực tiếp phải khác tần số. Tính số cách phân bổ.

  *Giải:*
  Đây là đồ thị hình sao $K_{1,8}$ với $k=5$.
  - Trạm chủ (tâm): Có 5 cách chọn tần số.
  - Mỗi trạm vệ tinh (cánh): Có $5-1=4$ cách chọn tần số (chỉ cần khác trạm chủ).
  Tổng số cách: $5 times 4^8 = 327.680$ cách.
])

#v(0.8em)
#pagebreak()

== 12. Bí Quyết Giải Gọn Lưới Cao Tầng ($3 times N$, $4 times N$) — Sơ Đồ Trạng Thái

Khi chiều cao cột $h >= 3$, bài toán đếm số cách tô màu bỗng trở nên phức tạp hơn rất nhiều. Các em không thể lấy số lượng cột đầu nhân liên tiếp với một "hệ số không đổi" như ở lưới 2 hàng nữa. Tại sao vậy? Hãy cùng xem "Bẫy Tư Duy" dưới đây!

=== 12.1. "Bẫy Tư Duy": Tại sao lưới cao lại nguy hiểm?

Tưởng tượng cột trước có 3 ô (Trên, Giữa, Dưới). Ô Trên và ô Dưới không hề chạm nhau, vì vậy chúng có thể vô tình *CÙNG MÀU*, hoặc *KHÁC MÀU*.
Điều này ảnh hưởng trực tiếp đến Cột tiếp theo:

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Trường hợp Dễ Thở
    rect((0, 2), (1, 3), fill: rgb("FFCDD2"), stroke: 1pt)
    rect((0, 1), (1, 2), fill: rgb("E3F2FD"), stroke: 1pt)
    rect((0, 0), (1, 1), fill: rgb("FFCDD2"), stroke: 1pt)
    content((0.5, 2.5), text(size: 8pt)[Đỏ])
    content((0.5, 1.5), text(size: 8pt)[Xanh])
    content((0.5, 0.5), text(size: 8pt)[Đỏ])
    
    rect((1.2, 0), (2.2, 3), fill: white, stroke: (dash: "dashed"))
    content((1.7, 1.5), text(size: 8pt)[?])
    
    content((1.1, -0.6), text(size: 9pt, weight: "bold", fill: rgb("1B5E20"))[Trường hợp "Dễ Thở"])
    content((1.1, -1.2), text(size: 8pt)[Ô trên và dưới cùng là Đỏ.])
    content((1.1, -1.7), text(size: 8pt)[$=>$ Cột sau chỉ phải né 1 "kẻ thù" Đỏ.])
    
    // Trường hợp Khó Thở
    rect((5, 2), (6, 3), fill: rgb("FFCDD2"), stroke: 1pt)
    rect((5, 1), (6, 2), fill: rgb("E3F2FD"), stroke: 1pt)
    rect((5, 0), (6, 1), fill: rgb("FFF9C4"), stroke: 1pt)
    content((5.5, 2.5), text(size: 8pt)[Đỏ])
    content((5.5, 1.5), text(size: 8pt)[Xanh])
    content((5.5, 0.5), text(size: 8pt)[Vàng])
    
    rect((6.2, 0), (7.2, 3), fill: white, stroke: (dash: "dashed"))
    content((6.7, 1.5), text(size: 8pt)[?])
    
    content((6.1, -0.6), text(size: 9pt, weight: "bold", fill: rgb("B71C1C"))[Trường hợp "Khó Thở"])
    content((6.1, -1.2), text(size: 8pt)[Ô trên và dưới khác màu (Đỏ và Vàng).])
    content((6.1, -1.7), text(size: 8pt)[$=>$ Cột sau phải né tới 2 "kẻ thù" (vừa Đỏ vừa Vàng).])
  })
]

Chính vì Cột sau lúc thì "Dễ Thở", lúc thì "Khó Thở" nên nó sẽ sinh ra số cách chọn màu khác nhau! Ta bắt buộc phải *chẻ đôi* bài toán thành 2 trạng thái.

=== 12.2. Tuyệt Chiêu "Chẻ Đôi Trạng Thái" (Cho lưới $3 times N$)

Thay vì đếm chung chung, ta sẽ chia mọi cột 3 ô thành 2 nhóm:
- *Nhóm A (Dễ Thở):* 2 ô ngoài cùng *GIỐNG NHAU*. 
- *Nhóm B (Khó Thở):* 2 ô ngoài cùng *KHÁC NHAU*.

*Số cách khởi tạo ở cột đầu tiên (Cột 1):*
- Để tạo ra một cột Dễ Thở (A), ta chọn ô Trên ($k$ cách), ô Giữa ($k-1$ cách), và ô Dưới bắt buộc phải giống ô Trên ($1$ cách). Vậy số lượng Cột 1 nhóm A là: $A_1 = k(k-1)$.
- Để tạo ra một cột Khó Thở (B), ta chọn ô Trên ($k$ cách), ô Giữa ($k-1$ cách), và ô Dưới phải khác cả ô Trên và ô Giữa ($k-2$ cách). Vậy số lượng Cột 1 nhóm B là: $B_1 = k(k-1)(k-2)$.

=== 12.3. Sơ Đồ Đẻ Nhánh (Hệ Số Chuyển Tiếp)

Khi xây sang Cột 2, mỗi cột nhóm A của Cột 1 sẽ "đẻ" ra một số lượng cột nhóm A và B mới. Mỗi cột nhóm B cũ cũng vậy. Ta gọi đây là *Sơ Đồ Đẻ Nhánh*:

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((-2, 1), radius: 0.5, fill: rgb("C8E6C9"), stroke: 1.5pt + rgb("2E7D32"))
    content((-2, 1), text(weight: "bold")[A cũ])
    
    circle((-2, -1), radius: 0.5, fill: rgb("FFCDD2"), stroke: 1.5pt + rgb("C62828"))
    content((-2, -1), text(weight: "bold")[B cũ])
    
    circle((2, 1), radius: 0.5, fill: rgb("C8E6C9"), stroke: 1.5pt + rgb("2E7D32"))
    content((2, 1), text(weight: "bold")[A mới])
    
    circle((2, -1), radius: 0.5, fill: rgb("FFCDD2"), stroke: 1.5pt + rgb("C62828"))
    content((2, -1), text(weight: "bold")[B mới])
    
    // Mũi tên từ A cũ
    line((-1.5, 1), (1.5, 1), mark: (end: ">"), stroke: 1.2pt)
    content((0, 1.3), text(size: 9pt)[$M_("AA")$])
    
    line((-1.6, 0.7), (1.6, -0.7), mark: (end: ">"), stroke: 1.2pt)
    content((-0.8, -0.2), text(size: 9pt)[$M_("AB")$])
    
    // Mũi tên từ B cũ
    line((-1.6, -0.7), (1.6, 0.7), mark: (end: ">"), stroke: 1.2pt)
    content((0.8, -0.2), text(size: 9pt)[$M_("BA")$])
    
    line((-1.5, -1), (1.5, -1), mark: (end: ">"), stroke: 1.2pt)
    content((0, -1.3), text(size: 9pt)[$M_("BB")$])
  })
]

*Phương trình tính số lượng cột mới:*
$ A_("mới") = M_("AA") times A_("cũ") + M_("BA") times B_("cũ") $
$ B_("mới") = M_("AB") times A_("cũ") + M_("BB") times B_("cũ") $

*Bảng Tra Cứu Thần Chú (Cho phòng thi THPT QG)*
Đề thi thường chỉ ra $k=3, 4$ hoặc $k=5$ màu. Các em chỉ cần thuộc (hoặc ghi ra nháp) bảng hệ số đẻ nhánh sau đây (được nội suy tự động từ công thức) để lắp vào bấm máy tính, KHÔNG CẦN phải chứng minh lại công thức cực nhọc:

#align(center)[
#table(
  columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
  inset: 7pt,
  align: (center + horizon),
  [*Số Màu*], [*Từ $A_("cũ")$ đến A*], [*Từ $B_("cũ")$ đến A*], [*Từ $A_("cũ")$ đến B*], [*Từ $B_("cũ")$ đến B*],
  ..for k in (2,3, 4, 5) {
    let M_AA = calc.pow(k, 2) - 3*k + 3
    let M_BA = calc.pow(k, 2) - 4*k + 5
    let M_AB = (k - 2) * (calc.pow(k, 2) - 4*k + 5)
    let M_BB = calc.pow(k, 3) - 6*calc.pow(k, 2) + 14*k - 13
    (
      [*$k = #k$ màu*],
      [$M_("AA") = #M_AA$],
      [$M_("BA") = #M_BA$],
      [$M_("AB") = #M_AB$],
      [$M_("BB") = #M_BB$],
    )
  }
)
]

#note-box(title: "📖 Dành Cho Học Sinh Lấy Điểm 10 (Nguồn gốc công thức)", [
  Nếu đề thi cho $k=6$ hoặc bắt chứng minh tổng quát bằng chữ, các em hãy dùng 4 công thức đa thức sau để tự bấm ra hệ số:
  - $M_("AA") = k^2 - 3k + 3$
  - $M_("BA") = k^2 - 4k + 5$
  - $M_("AB") = (k-2)(k^2 - 4k + 5)$
  - $M_("BB") = k^3 - 6k^2 + 14k - 13$
])

=== 12.4. Kỹ Thuật Lập Bảng Trạng Thái (Tính Toán Cột Liên Tiếp)

Để giải quyết bài toán đếm số cách tô màu trên lưới một cách có hệ thống và tránh nhầm lẫn, phương pháp hiệu quả nhất là *Lập Bảng Chuyển Trạng Thái*.
Ta xét 2 trạng thái phân loại của một cột (giả sử chiều cao $h=3$):
- *Trạng thái A (Đồng màu):* Ô trên cùng và ô dưới cùng cùng màu.
- *Trạng thái B (Khác màu):* Ô trên cùng và ô dưới cùng khác màu.

Quy trình tính toán gồm việc đếm số cách khởi tạo ở Cột 1, sau đó sử dụng ma trận hệ số để tịnh tiến dần sang các cột tiếp theo.

#note-box(title: "🚨 BẪY TƯ DUY: Tại sao không thể nhân phẳng $36 times X times Y times Z$?", [
  Rất nhiều học sinh thắc mắc: *"Cột 1 có 36 cách tô. Vậy Cột 2 có $X$ cách, Cột 3 có $Y$ cách. Đáp số cứ lấy $36 times X times Y times Z$ là xong, vẽ bảng A/B làm gì cho mệt?"*
  
  Sự thật phũ phàng của lưới 2D là: *Số cách tô Cột 2 không hề cố định, nó biến thiên tùy thuộc vào việc bạn vừa tô Cột 1 như thế nào!*
  - Nếu Cột 1 của bạn thuộc *Trạng thái A (Đồng màu)*, Cột 2 sẽ có $7+10 = 17$ cách tô.
  - Nếu Cột 1 của bạn thuộc *Trạng thái B (Khác màu)*, Cột 2 chỉ có $5+11 = 16$ cách tô!
  
  Vì $17 != 16$, không tồn tại một con số $X$ đại diện chung nào cả! Đó là lý do toán học ép buộc ta phải chia 36 cách của Cột 1 thành hai "phe": 12 cách loại A (để nhân với nhóm hệ số 17) và 24 cách loại B (để nhân với nhóm hệ số 16). Việc kẻ bảng Trạng thái A/B chính là chìa khóa duy nhất để quản lý sự "không đồng đều" này!
])

#v(0.5em)
#cannon-box("Ví dụ 30 — Lưới Nguyên Vẹn", [
  *Đề bài:* Cho lưới $3 times 4$, dùng 4 màu ($k=4$). Các ô chung cạnh khác màu. Tính tổng số cách tô.
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      for i in range(4) {
        rect((i*1.5, 0), (i*1.5 + 1, 3), stroke: 1.5pt, fill: rgb("E3F2FD"))
        line((i*1.5, 1), (i*1.5 + 1, 1), stroke: 1pt)
        line((i*1.5, 2), (i*1.5 + 1, 2), stroke: 1pt)
        content((i*1.5 + 0.5, -0.5), [Cột #(i+1)])
      }
      for i in range(3) {
        line((i*1.5 + 1, 1.5), (i*1.5 + 1.5, 1.5), mark: (end: ">"))
      }
    })
  ]
  
  *Giải:* 
  - *Bước 1: Khởi tạo Cột 1.* Tổng cộng có $4 times 3 times 3 = 36$ cách tô. Phân loại cấu hình:
    - Trạng thái A: Chọn ô Trên (4 cách), ô Dưới cùng màu (1 cách), ô Giữa né màu đó (3 cách) $=> A_1 = 4 times 1 times 3 = 12$ cách.
    - Trạng thái B: Chọn ô Trên (4 cách), ô Dưới khác màu (3 cách), ô Giữa né 2 màu (2 cách) $=> B_1 = 4 times 3 times 2 = 24$ cách.
  
  - *Bước 2: Lập bảng tịnh tiến trạng thái.* 
    Ma trận hệ số cho lưới nguyên vẹn là: $M_("AA")=7, M_("BA")=5, M_("AB")=10, M_("BB")=11$.
    Công thức truy hồi: $A_n = 7 A_{n-1} + 5 B_{n-1}$ và $B_n = 10 A_{n-1} + 11 B_{n-1}$.
  
  #align(center)[
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr, 1fr),
    inset: 8pt,
    align: (center + horizon),
    [*Trạng Thái*], [*Cột 1*], [*Cột 2*], [*Cột 3*], [*Cột 4*],
    [*Trạng thái A (Đồng màu)*], [*12*], [204], [3.348], [29.916],
    [*Trạng thái B (Khác màu)*], [*24*], [384], [6.264], [56.160],
  )
  ]
  _Giải thích ví dụ: $A_2 = 7(12) + 5(24) = 204$._
  
  *Kết quả:* Tổng số cách tô toàn lưới = $A_4 + B_4 = 29.916 + 56.160 = bold{86.076}$ cách.
])

#v(0.5em)
=== 12.5. Phân Tích Lưới Bất Quy Tắc

Đối với các lưới bị khuyết ô, ma trận hệ số tịnh tiến sẽ thay đổi tại chính cột bị khuyết.

#cannon-box("Ví dụ 31 — Lưới Khuyết Lỗ Giữa", [
  *Đề bài:* Lưới $3 times 4$, dùng 4 màu. Ô trung tâm ở Cột 2 bị khoét.
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Col 1
      rect((0, 0), (1, 3), stroke: 1.5pt, fill: rgb("E3F2FD"))
      line((0, 1), (1, 1), stroke: 1pt); line((0, 2), (1, 2), stroke: 1pt)
      // Col 2
      rect((1.5, 2), (2.5, 3), stroke: 1.5pt, fill: rgb("FFEBEE"))
      rect((1.5, 0), (2.5, 1), stroke: 1.5pt, fill: rgb("FFEBEE"))
      content((2, 1.5), text(fill: red, weight: "bold", size: 1.5em)[$times$])
      // Col 3
      rect((3, 0), (4, 3), stroke: 1.5pt, fill: rgb("E8F5E9"))
      line((3, 1), (4, 1), stroke: 1pt); line((3, 2), (4, 2), stroke: 1pt)
      // Col 4
      rect((4.5, 0), (5.5, 3), stroke: 1.5pt, fill: rgb("FFF8E1"))
      line((4.5, 1), (5.5, 1), stroke: 1pt); line((4.5, 2), (5.5, 2), stroke: 1pt)
      
      content((0.5, -0.5), [Cột 1]); content((2, -0.5), [Cột 2])
      content((3.5, -0.5), [Cột 3]); content((5.5, -0.5), [Cột 4])
      line((1, 1.5), (1.5, 1.5), mark: (end: ">"))
      line((2.5, 1.5), (3, 1.5), mark: (end: ">"))
      line((4, 1.5), (4.5, 1.5), mark: (end: ">"))
    })
  ]
  
  *Giải:* 
  Tại cột 2, do mất đi ô giữa, ô Trên và Dưới không còn ràng buộc nội bộ. Số cách chọn cho ô Trên và Dưới (đều phải né Cột 1) là $3 times 3 = 9$ cách.
  Ma trận hệ số chuyển từ Cột 1 sang Cột 2 thay đổi thành: $M_("AA")=3, M_("BA")=2, M_("AB")=6, M_("BB")=7$.
  Từ Cột 2 sang Cột 3, lưới trở lại nguyên vẹn nên dùng hệ số chuẩn.
  
  #align(center)[
  #table(
    columns: (1.5fr, 1fr, 1.2fr, 1.2fr, 1.2fr),
    inset: 8pt,
    align: (center + horizon),
    [*Trạng Thái*], [*Cột 1*], [*Cột 2 (Khuyết)*], [*Cột 3 (Chuẩn)*], [*Cột 4 (Chuẩn)*],
    [*Trạng thái A (Đồng màu)*], [*12*], [84], [1.788], [29.916],
    [*Trạng thái B (Khác màu)*], [*24*], [240], [3.480], [56.160],
  )
  ]
  _Giải thích Cột 2: $A_2 = 3(12) + 2(24) = 84$. $B_2 = 6(12) + 7(24) = 240$._
  
  *Kết quả:* Tổng số cách = $29.916 + 56.160 = bold{86.076}$ cách.
])

#v(0.5em)
#cannon-box("Ví dụ 32 — Lưới Khuyết Ở Cột Cuối", [
  *Đề bài:* Lưới $3 times 4$, dùng 4 màu. Ô trung tâm ở Cột 4 bị khoét.
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      for i in range(3) {
        rect((i*1.5, 0), (i*1.5 + 1, 3), stroke: 1.5pt, fill: rgb("E3F2FD"))
        line((i*1.5, 1), (i*1.5 + 1, 1), stroke: 1pt)
        line((i*1.5, 2), (i*1.5 + 1, 2), stroke: 1pt)
        content((i*1.5 + 0.5, -0.5), [Cột #(i+1)])
        line((i*1.5 + 1, 1.5), (i*1.5 + 1.5, 1.5), mark: (end: ">"))
      }
      // Col 4 (khuyết giữa)
      rect((4.5, 2), (5.5, 3), stroke: 1.5pt, fill: rgb("FFEBEE"))
      rect((4.5, 0), (5.5, 1), stroke: 1.5pt, fill: rgb("FFEBEE"))
      content((5, 1.5), text(fill: red, weight: "bold", size: 1.5em)[$times$])
      content((5, -0.5), [Cột 4])
    })
  ]
  
  *Giải:* 
  Vì sự khuyết thiếu xảy ra ở cột tận cùng, ta không cần phân tách trạng thái phân nhánh cho các cột sau. Bảng tính toán được thực hiện như lưới nguyên vẹn đến hết Cột 3.
  
  #align(center)[
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr),
    inset: 8pt,
    align: (center + horizon),
    [*Trạng Thái*], [*Cột 1*], [*Cột 2*], [*Cột 3*],
    [*Trạng thái A (Đồng màu)*], [*12*], [204], [*3.348*],
    [*Trạng thái B (Khác màu)*], [*24*], [384], [*6.264*],
  )
  ]
  Tổng số cách tô từ Cột 1 đến Cột 3 là: $3.348 + 6.264 = 9.612$ cách.
  Tại Cột 4, hai ô Trên và Dưới độc lập, mỗi ô có 3 cách chọn (né Cột 3). Số cách tô riêng Cột 4 là $3 times 3 = 9$.
  
  *Kết quả:* Tổng số cách toàn lưới = $9.612 times 9 = bold{86.508}$ cách.
])

#v(0.5em)
#cannon-box("Ví dụ 33 — Lưới Hình Chữ U", [
  *Đề bài:* Lưới $3 times 3$, dùng 4 màu. Hai ô ở vị trí Trên và Giữa của Cột 2 bị khoét thủng.
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Col 1
      rect((0, 0), (1, 3), stroke: 1.5pt, fill: rgb("E3F2FD"))
      line((0, 1), (1, 1), stroke: 1pt); line((0, 2), (1, 2), stroke: 1pt)
      // Col 2 (only bottom)
      rect((1.5, 0), (2.5, 1), stroke: 1.5pt, fill: rgb("FFEBEE"))
      content((2, 1.5), text(fill: red, weight: "bold", size: 1.5em)[$times$])
      content((2, 2.5), text(fill: red, weight: "bold", size: 1.5em)[$times$])
      // Col 3
      rect((3, 0), (4, 3), stroke: 1.5pt, fill: rgb("E8F5E9"))
      line((3, 1), (4, 1), stroke: 1pt); line((3, 2), (4, 2), stroke: 1pt)
      
      content((0.5, -0.5), [Cột 1]); content((2, -0.5), [Cột 2]); content((3.5, -0.5), [Cột 3])
      line((1, 0.5), (1.5, 0.5), mark: (end: ">"))
      line((2.5, 0.5), (3, 0.5), mark: (end: ">"))
      
      // Khung đứt nét chỉ sự độc lập
      line((2.5, 1.5), (3, 1.5), stroke: (dash: "dashed", paint: gray), mark: (end: ">", paint: gray))
      line((2.5, 2.5), (3, 2.5), stroke: (dash: "dashed", paint: gray), mark: (end: ">", paint: gray))
      content((1.2, 3.5), text(fill: gray, size: 0.9em)[Tự do (Không có ràng buộc ngang)])
      bezier((2.8, 3.5), (2.8, 2.5), (2, 3.5), mark: (end: ">", paint: gray), stroke: gray)
    })
  ]
  
  *Giải:* 
  Lưới hình chữ U minh hoạ sự thoái hóa của ma trận trạng thái:
  - Cột 1 nguyên vẹn: Có $4 times 3 times 3 = 36$ cách tô.
  - Cột 2 chỉ còn ô Dưới: Ràng buộc duy nhất là né ô Dưới của Cột 1 $=>$ Cột 2 có 3 cách tô độc lập. Vì không có ô Trên, khái niệm "Trạng thái A/B" bị triệt tiêu hoàn toàn.
  - Cột 3 nguyên vẹn: Do Cột 2 khuyết hai ô trên, Cột 3 chỉ bị ràng buộc ở vị trí ô Dưới. Số cách tô ô Dưới là 3. Các ô Giữa và Trên của Cột 3 chỉ phải thoả mãn nội bộ (mỗi ô 3 cách). Tổng số cách của Cột 3 là $3 times 3 times 3 = 27$ cách.
  
  *Kết luận:* Tính độc lập giữa các khối được thiết lập. Số cách tô được tính bằng tích đơn giản:
  Tổng số cách = Cột 1 $times$ Cột 2 $times$ Cột 3 = $36 times 3 times 27 = bold{2.916}$ cách.
])

#pagebreak()
= Đề Luyện Tổng Hợp

#align(center)[
  #block(
    fill: rgb("F8FAFC"),
    stroke: 1pt + c-navy,
    radius: 8pt,
    inset: (x: 20pt, y: 15pt),
    width: 100%,
  )[
    #text(fill: c-navy, weight: "bold", size: 12pt)[
      📋 Bảng Phân Loại Đề Thực Chiến 15 Bài Tập Điển Hình
    ]
    #v(0.8em)
    #grid(
      columns: (auto, 1fr, auto),
      column-gutter: 12pt,
      row-gutter: 8pt,
      align: (center, left, center),
      box(fill: rgb("DCFCE7"), stroke: 1pt + c-teal, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-teal, weight: "bold")[★ Cơ Bản]
      ],
      [Nguyên lý cộng nhân, hoán vị chỉnh hợp cơ bản, vách ngăn đơn giản],
      [Bài 1–5],

      box(fill: rgb("FEF9C3"), stroke: 1pt + c-gold, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-gold, weight: "bold")[★★ Khá]
      ],
      [Gộp khối khoảng trống, hoán vị lặp, đếm hình học, chữ số chia hết],
      [Bài 6–10],

      box(fill: rgb("FEE2E2"), stroke: 1pt + c-crimson, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-crimson, weight: "bold")[★★★ Khó]
      ],
      [Hàm sinh Euler, phân hoạch Stirling, song ánh Catalan, truy hồi bậc cao, Newton],
      [Bài 11–15],
    )
  ]
]

#v(1em)

#tln(
  tags: ("Dễ",),
  [
    Có bao nhiêu số tự nhiên có 5 chữ số đôi một khác nhau được lập từ các chữ số của tập hợp $\{1, 2, 3, 4, 5, 6, 7\}$ sao cho số đó chia hết cho 5?
  ],
  [360],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi số cần lập là $overline(a_1 a_2 a_3 a_4 a_5)$ với các chữ số khác nhau thuộc tập $\{1, ..., 7\}$.
      - Chữ số cuối $a_5$ bắt buộc phải bằng 5 (có đúng 1 cách chọn).
      - Bốn chữ số còn lại $a_1, a_2, a_3, a_4$ được chọn và xếp thứ tự từ tập 6 chữ số còn lại $\{1, 2, 3, 4, 6, 7\}$: có $A_6^4 = 360$ cách.
      Số lượng số thỏa mãn là: $1 dot 360 = 360$ số.
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Cố định chữ số cuối $a_5 = 5$ (1 cách chọn).
      - Đối với 4 vị trí còn lại, ta cần chọn và sắp xếp 4 chữ số từ tập hợp 6 chữ số $\{1, 2, 3, 4, 6, 7\}$.
      - Hàm sinh lũy thừa (EGF) cho việc chọn và sắp xếp $k$ chữ số từ tập 6 phần tử là:
        $ G(x) = (1 + x)^6 = sum_(k=0)^6 C_6^k k! frac(x^k, k!) = sum_(k=0)^6 A_6^k frac(x^k, k!) $
      - Số cách chọn và sắp xếp 4 chữ số là hệ số của $frac(x^4, 4!)$ trong $G(x)$, tức là:
        $ 4! [x^4] G(x) = A_6^4 = 360 " cách". $
      - Tổng số cách lập là $360 dot 1 = 360$ số.
    ]
  ]
)

#tln(
  tags: ("Dễ",),
  [
    Tìm số nghiệm nguyên không âm của phương trình $x + y + z + w = 17$ thỏa mãn điều kiện $x >= 1$, $y >= 2$, $z >= 3$, $w >= 0$.
  ],
  [364],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Thực hiện đổi biến đưa về dạng không âm tự do:
      - Đặt $x' = x - 1 >= 0$
      - Đặt $y' = y - 2 >= 0$
      - Đặt $z' = z - 3 >= 0$
      - Đặt $w' = w >= 0$
      Thay vào phương trình ta được:
      $
        (x' + 1) + (y' + 2) + (z' + 3) + w' = 17 \
        rightarrow x' + y' + z' + w' = 11
      $
      Áp dụng công thức vách ngăn cơ bản với $n=11$ và $k=4$:
      $ N = C_(11+4-1)^(4-1) = C_(14)^3 = frac(14 dot 13 dot 12, 3 dot 2 dot 1) = 364 " nghiệm". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Mỗi biến đóng góp một hàm sinh đại diện cho tập giá trị hợp lệ của nó:
        - Với $x >= 1$: $f_x(t) = t + t^2 + t^3 + dots = frac(t, 1-t)$
        - Với $y >= 2$: $f_y(t) = t^2 + t^3 + t^4 + dots = frac(t^2, 1-t)$
        - Với $z >= 3$: $f_z(t) = t^3 + t^4 + t^5 + dots = frac(t^3, 1-t)$
        - Với $w >= 0$: $f_w(t) = 1 + t + t^2 + dots = frac(1, 1-t)$
      - Hàm sinh tổng quát cho phương trình là:
        $ G(t) = f_x(t) f_y(t) f_z(t) f_w(t) = frac(t^6, (1-t)^4) $
      - Số nghiệm nguyên không âm của phương trình là hệ số của $t^(17)$ trong $G(t)$, tức là hệ số của $t^(11)$ trong $(1-t)^(-4)$:
        $ [t^(17)] G(t) = [t^(11)] (1-t)^(-4) = C_(11+4-1)^(11) = C_(14)^3 = 364 " nghiệm". $
    ]
  ]
)

#tln(
  tags: ("Dễ",),
  [
    Từ 12 học sinh ưu tú, người ta muốn chia thành 4 nhóm học tập không tên gọi (không phân biệt), mỗi nhóm gồm đúng 3 học sinh. Hỏi có bao nhiêu cách chia?
  ],
  [15400],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Bước 1: Chia 12 học sinh vào 4 nhóm phân biệt (nhóm 1, nhóm 2, nhóm 3, nhóm 4) mỗi nhóm 3 học sinh:
        - Nhóm 1: Chọn 3 học sinh từ 12 học sinh: $C_(12)^3$ cách.
        - Nhóm 2: Chọn 3 học sinh từ 9 học sinh còn lại: $C_9^3$ cách.
        - Nhóm 3: Chọn 3 học sinh từ 6 học sinh còn lại: $C_6^3$ cách.
        - Nhóm 4: Chọn 3 học sinh từ 3 học sinh còn lại: $C_3^3$ cách.
        Số cách chia vào nhóm phân biệt là: $C_(12)^3 dot C_9^3 dot C_6^3 dot C_3^3 = 220 dot 84 dot 20 dot 1 = 369600$.
      - Bước 2: Vì 4 nhóm có vai trò hoàn toàn như nhau và không phân biệt tên gọi, ta phải khử lặp thứ tự bằng cách chia cho hoán vị của 4 nhóm là $4! = 24$.
      Số cách chia nhóm không phân biệt là:
      $ N = frac(369600, 24) = 15400 " cách". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Đây là bài toán phân hoạch tập hợp 12 phần tử phân biệt thành 4 khối có kích thước bằng 3, không phân biệt thứ tự giữa các khối.
      - Hàm sinh lũy thừa (EGF) cho mỗi khối gồm đúng 3 học sinh là $g(x) = frac(x^3, 3!)$.
      - Do 4 khối là giống nhau (không phân biệt tên gọi), ta dùng hàm sinh cấu trúc phân hoạch với $k=4$ khối:
        $ G(x) = frac(1, 4!) [g(x)]^4 = frac(1, 24) (frac(x^3, 3!))^4 = frac(x^(12), 24 dot 6^4) $
      - Số cách chia là hệ số của $frac(x^(12), 12!)$ trong EGF $G(x)$:
        $ 12! [x^(12)] G(x) = 12! dot frac(1, 24 dot 6^4) = 15400 " cách". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Có bao nhiêu cách xếp 4 học sinh nam và 4 học sinh nữ thành một hàng ngang sao cho không có hai học sinh cùng giới tính đứng kề nhau (xen kẽ)?
  ],
  [1152],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Để nam và nữ đứng xen kẽ nhau hoàn toàn trong hàng gồm 8 người, chỉ có hai cấu trúc hàng dọc khả dĩ:
      - *Cấu trúc 1:* `Nam - Nữ - Nam - Nữ - Nam - Nữ - Nam - Nữ`
        - Sắp xếp vị trí 4 nam vào các vị trí nam: $4! = 24$ cách.
        - Sắp xếp vị trí 4 nữ vào các vị trí nữ: $4! = 24$ cách.
        Số cách xếp là: $24 dot 24 = 576$ cách.
      - *Cấu trúc 2:* `Nữ - Nam - Nữ - Nam - Nữ - Nam - Nữ - Nam`
        - Tương tự như trên, số cách xếp là: $24 dot 24 = 576$ cách.
      Tổng số cách xếp thỏa mãn là: $576 + 576 = 1152$ cách.
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Sử dụng hàm sinh lũy thừa hai biến (bivariate EGF) với biến $x$ cho nam và $y$ cho nữ.
      - Mỗi hoán vị của 4 nam đóng góp $4!$ và 4 nữ đóng góp $4!$.
      - Cấu trúc xen kẽ được mô tả bởi đa thức hình thức biểu thị 2 kịch bản sắp xếp: $P(x, y) = (x y)^4 + (y x)^4 = 2 x^4 y^4$.
      - Số cách sắp xếp các học sinh phân biệt vào cấu trúc này là hệ số liên đới của EGF:
        $ N = 4! dot 4! [x^4 y^4] (2 x^4 y^4) = 2 dot 4! dot 4! = 1152 " cách". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Có bao nhiêu số tự nhiên gồm 3 chữ số đôi một khác nhau sao cho tích của 3 chữ số đó là một số chẵn?
  ],
  [588],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Tích của 3 chữ số là số chẵn khi và chỉ khi trong 3 chữ số đó có ít nhất một chữ số chẵn.
      Ta sử dụng phương pháp phần bù:
      - Tổng số các số tự nhiên có 3 chữ số đôi một khác nhau lập từ $\{0, 1, ..., 9\}$:
        - Chọn chữ số hàng trăm $a ne 0$: 9 cách chọn.
        - Chọn chữ số thứ hai $b$ (khác $a$): 9 cách chọn.
        - Chọn chữ số thứ ba $c$ (khác $a, b$): 8 cách chọn.
        Tổng số là: $9 dot 9 dot 8 = 648$ số.
      - Trường hợp vi phạm: Số có 3 chữ số đôi một khác nhau mà tích là số lẻ (tức là cả 3 chữ số đều là số lẻ lấy từ $\{1, 3, 5, 7, 9\}$):
        - Số cách chọn là chỉnh hợp chập 3 của 5 số lẻ: $A_5^3 = 5 dot 4 dot 3 = 60$ số.
      - Số các số thỏa mãn đề bài là:
        $ N = 648 - 60 = 588 " số". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Chia các chữ số thành nhóm Chẵn $E = \{0, 2, 4, 6, 8\}$ (5 chữ số) và nhóm Lẻ $O = \{1, 3, 5, 7, 9\}$ (5 chữ số).
      - Hàm sinh chọn 3 chữ số khác nhau từ 10 chữ số (với $u$ đại diện cho chẵn, $v$ đại diện cho lẻ):
        $ P(u, v) = [z^3] (1 + u z)^5 (1 + v z)^5 = 10 u^3 + 50 u^2 v + 50 u v^2 + 10 v^3 $
      - Mỗi bộ 3 chữ số phân biệt có $3! = 6$ cách sắp xếp thành số tự nhiên.
      - Để loại bỏ số có chữ số 0 đứng đầu, ta xét hàm sinh cho 2 chữ số còn lại khi 0 ở vị trí đầu tiên:
        $ P_0(u, v) = [z^2] (1 + u z)^4 (1 + v z)^5 = 6 u^2 + 20 u v + 10 v^2 $
      - Mỗi bộ chứa 0 (đứng đầu) có $2! = 2$ cách xếp 2 chữ số còn lại.
      - Số lượng số tự nhiên thỏa mãn yêu cầu (chứa ít nhất một chữ số chẵn) là tổng số cách xếp trừ đi số cách xếp các số toàn lẻ:
        $ N = (6 P(1, 1) - 2 P_0(1, 1)) - 6 dot 10 = (6 dot 120 - 2 dot 36) - 60 = 588 " số". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Trong mặt phẳng cho 10 điểm phân biệt, trong đó không có 3 điểm nào thẳng hàng ngoại trừ đúng 4 điểm thẳng hàng với nhau trên một đường thẳng $d$. Hỏi có thể lập được bao nhiêu tam giác nhận các điểm đã cho làm đỉnh?
  ],
  [116],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi tập hợp 10 điểm là $S$. Có 4 điểm thẳng hàng trên đường thẳng $d$, và 6 điểm còn lại không có 3 điểm nào thẳng hàng.
      - Số cách chọn 3 điểm bất kỳ từ 10 điểm là: $C_(10)^3 = 120$.
      - Trường hợp chọn phải 3 điểm cùng nằm trên đường thẳng $d$ (không tạo thành tam giác): chọn 3 điểm từ 4 điểm thẳng hàng này: $C_4^3 = 4$ cách.
      Số tam giác lập được là:
      $ N = 120 - 4 = 116 " tam giác". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Chia 10 điểm thành 2 nhóm: nhóm A (4 điểm thẳng hàng trên $d$) và nhóm B (6 điểm còn lại).
      - Hàm sinh chọn điểm với biến $x$ cho nhóm A và $y$ cho nhóm B là:
        $ G(x, y) = (1 + x)^4 (1 + y)^6 $
      - Trích xuất các số hạng bậc 3 (chọn 3 đỉnh):
        $ G_3(x, y) = 4 x^3 + 36 x^2 y + 60 x y^2 + 20 y^3 $
      - Tam giác được hình thành khi không chọn cả 3 đỉnh thuộc nhóm A (tương ứng loại bỏ số hạng $4 x^3$):
        $ N = 36 + 60 + 20 = 116 " tam giác". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Tính tổng tất cả các hệ số trong khai triển nhị thức Newton của $(3x - 2y)^(10)$.
  ],
  [1],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Khai triển nhị thức Newton của $(3x - 2y)^(10)$ có dạng:
      $ (3x - 2y)^(10) = sum_(k=0)^(10) C_(10)^k (3x)^(10-k) (-2y)^k = sum_(k=0)^(10) C_(10)^k 3^(10-k) (-2)^k x^(10-k) y^k $
      Tổng các hệ số của khai triển này thu được bằng cách thế tất cả các biến số bằng 1, tức là đặt $x = 1$ và $y = 1$.
      Thế vào biểu thức ban đầu ta được:
      $ S = (3 dot 1 - 2 dot 1)^(10) = (3 - 2)^(10) = 1^(10) = 1. $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Xem $(3x - 2y)^(10)$ là hàm sinh hai biến $F(x, y) = sum c_(a,b) x^a y^b$ biểu diễn các hệ số của khai triển.
      - Tổng các hệ số của khai triển chính là giá trị thu được khi đánh giá hàm sinh tại các biến bằng 1:
        $ S = F(1, 1) = (3 dot 1 - 2 dot 1)^(10) = 1. $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Có bao nhiêu dãy nhị phân độ dài 8 không chứa hai chữ số 0 đứng cạnh nhau và không chứa hai chữ số 1 đứng cạnh nhau (xen kẽ)?
  ],
  [2],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Một dãy nhị phân độ dài 8 xen kẽ hoàn toàn chỉ có thể có hai cấu trúc duy nhất:
      - Cấu trúc 1: $01010101$
      - Cấu trúc 2: $10101010$
      Do đó, chỉ có đúng 2 dãy nhị phân thỏa mãn đề bài.
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Dãy xen kẽ bắt đầu bằng 0 chỉ có duy nhất 1 dãy cho mỗi độ dài $n$, với hàm sinh là $F_0(z) = frac(z, 1-z)$.
      - Dãy xen kẽ bắt đầu bằng 1 cũng chỉ có duy nhất 1 dãy cho mỗi độ dài $n$, với hàm sinh là $F_1(z) = frac(z, 1-z)$.
      - Hàm sinh tổng quát cho các dãy nhị phân xen kẽ là:
        $ G(z) = F_0(z) + F_1(z) = frac(2z, 1-z) = 2z + 2z^2 + 2z^3 + dots $
      - Số lượng dãy xen kẽ độ dài 8 là hệ số của $z^8$ trong $G(z)$:
        $ [z^8] G(z) = 2 " dãy". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Một lưới ô vuông kích thước $5 times 5$ được tạo bởi 6 đường thẳng dọc và 6 đường thẳng ngang. Hỏi có bao nhiêu hình chữ nhật (kể cả hình vuông) xuất hiện trong lưới này?
  ],
  [225],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Một hình chữ nhật được tạo ra bằng cách chọn 2 đường thẳng dọc từ 6 đường dọc và 2 đường thẳng ngang từ 6 đường ngang.
      Số cách chọn là:
      $ N = C_6^2 dot C_6^2 = 15 dot 15 = 225 " hình chữ nhật". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Gọi kích thước lưới ô vuông là $5 times 5$. Trên mỗi chiều có 6 đường thẳng tạo ra các đoạn thẳng độ dài $k$ ($1 <= k <= 5$).
      - Số lượng đoạn thẳng có độ dài $k$ trên một chiều là $6 - k$.
      - Hàm sinh biểu thị sự phân bố các đoạn thẳng theo chiều dài là:
        $ H(t) = sum_(k=1)^5 (6 - k) t^k = 5 t + 4 t^2 + 3 t^3 + 2 t^4 + t^5 $
      - Tổng số hình chữ nhật bằng tích tổng số đoạn thẳng trên hai chiều (ngang và dọc), thu được bằng cách đánh giá hàm sinh tại $t=1$:
        $ N = H(1) dot H(1) = (5 + 4 + 3 + 2 + 1)^2 = 15^2 = 225 " hình chữ nhật". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Có bao nhiêu cách phân hoạch tập hợp $S = \{1, 2, 3, 4, 5\}$ thành đúng 2 tập con khác rỗng không phân biệt?
  ],
  [15],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Số cách phân hoạch một tập hợp gồm 5 phần tử thành 2 nhóm không rỗng, không phân biệt là số Stirling loại 2 chập 2 của 5 phần tử: $S(5,2)$.
      Ta tính trực tiếp:
      $ S(5,2) = frac(1, 2!) (2^5 - 2 dot 1^5) = frac(1, 2) (32 - 2) = 15 " cách". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Hàm sinh lũy thừa (EGF) của số Stirling loại hai chập $k=2$ là:
        $ G_2(x) = frac((e^x - 1)^2, 2!) = frac(e^(2x) - 2e^x + 1, 2) $
      - Khai triển Taylor của $G_2(x)$:
        $ G_2(x) = frac(1, 2) (sum_(n=0)^(infty) frac(2^n x^n, n!) - 2 sum_(n=0)^(infty) frac(x^n, n!) + 1) = sum_(n=1)^(infty) frac(2^(n-1) - 1, n!) x^n $
      - Số cách phân hoạch tập 5 phần tử là hệ số của $frac(x^5, 5!)$ trong EGF $G_2(x)$:
        $ N = 5! [x^5] G_2(x) = 2^(5-1) - 1 = 15 " cách". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình", "Khó",),
  [
    Lát một hành lang kích thước $1 times 10$ bằng các viên gạch kích thước $1 times 1$ và $1 times 2$. Hỏi có bao nhiêu cách lát khác nhau?
  ],
  [89],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi $a_n$ là số cách lát hành lang kích thước $1 times n$.
      Xét viên gạch cuối cùng được đặt ở vị trí kết thúc:
      - Nếu viên gạch cuối là $1 times 1$: Phần hành lang phía trước dài $1 times (n-1)$ có $a_(n-1)$ cách lát.
      - Nếu viên gạch cuối là $1 times 2$: Phần hành lang phía trước dài $1 times (n-2)$ có $a_(n-2)$ cách lát.
      Ta có hệ thức truy hồi Fibonacci: $a_n = a_(n-1) + a_(n-2)$ với mọi $n >= 3$.
      Khởi tạo giá trị:
      - Hành lang $1 times 1$ ($n=1$): Chỉ có 1 cách dùng gạch $1 times 1 arrow a_1 = 1$.
      - Hành lang $1 times 2$ ($n=2$): Có 2 cách (dùng hai viên $1 times 1$ hoặc một viên $1 times 2$) $arrow a_2 = 2$.
      Tính các số hạng tiếp theo của dãy:
      $
        a_3 = 3, a_4 = 5, a_5 = 8, a_6 = 13, a_7 = 21, a_8 = 34, a_9 = 55, a_(10) = 89
      $
      Vậy có tất cả 89 cách lát hành lang.
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Viên gạch $1 times 1$ đóng góp độ dài 1 (đa thức $t$), viên gạch $1 times 2$ đóng góp độ dài 2 (đa thức $t^2$).
      - Hàm sinh cho việc lát hành lang bằng hai loại gạch này là:
        $ G(t) = frac(1, 1 - t - t^2) = sum_(n=0)^(infty) F_(n+1) t^n $
      - Số cách lát hành lang độ dài 10 là hệ số của $t^(10)$ trong $G(t)$, tương ứng với số Fibonacci $F_(11) = 89$ cách.
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình", "Khó",),
  [
    Tìm số đường đi trên lưới tọa độ từ điểm $(0,0)$ đến điểm $(5,5)$ bằng các bước đi sang phải $(+1,0)$ hoặc đi lên trên $(0,+1)$ sao cho đường đi không bao giờ đi lên phía trên đường thẳng $y = x$.
  ],
  [42],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Đây là bài toán tính số đường đi Dyck dưới đường phân giác, kết quả chính là số Catalan thứ 5 ($C_5$):
      $ C_5 = frac(1, 5+1) C_(10)^5 = frac(1, 6) dot 252 = 42 " đường đi". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Một đường đi Dyck bắt đầu từ $(0,0)$ chạm đường phân giác lần đầu tại điểm $(k+1, k+1)$ với $0 <= k <= n-1$, phân hoạch đường đi thành hai phần độc lập. Từ đó ta có hệ thức Catalan: $C_n = sum_(k=0)^(n-1) C_k C_(n-1-k)$.
      - Hệ thức tự tương tự này tương ứng với phương trình hàm sinh: $C(x) = 1 + x C^2(x)$. Giải phương trình thu được:
        $ C(x) = frac(1 - sqrt(1 - 4x), 2x) = sum_(n=0)^(infty) frac(1, n+1) C_(2n)^n x^n $
      - Số đường đi đến điểm $(5,5)$ là hệ số của $x^5$ trong $C(x)$, tức là số Catalan thứ 5:
        $ C_5 = frac(1, 6) C_(10)^5 = 42 " đường". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình", "Khó",),
  [
    Tính tổng sau theo $n$:
  $ S = (C_n^0)^2 + (C_n^1)^2 + (C_n^2)^2 + ... + (C_n^n)^2 $
  ],
  [$C_(2n)^n$],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Sử dụng đồng nhất thức nhị thức Vandermonde hoặc so sánh hệ số đa thức:
      Xét tích hai đa thức khai triển:
      $ (1 + x)^n dot (x + 1)^n = (1 + x)^(2n) $
      - Hệ số của $x^n$ trong vế phải $(1 + x)^(2n)$ là: $C_(2n)^n$.
      - Hệ số của $x^n$ trong vế trái thu được bằng cách nhân chéo các số hạng:
        $ (sum_(i=0)^n C_n^i x^i) dot (sum_(j=0)^n C_n^j x^(n-j)) $
        Số hạng chứa $x^n$ xuất hiện khi chọn $i = j$, hệ số tương ứng là:
        $ sum_(i=0)^n C_n^i dot C_n^i = sum_(i=0)^n (C_n^i)^2 $
      Đồng nhất hệ số hai vế, ta được: $S = C_(2n)^n$.
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Xét hàm sinh $f(x) = (1+x)^n = sum_(k=0)^n C_n^k x^k$ và $g(x) = (1+x^(-1))^n = sum_(j=0)^n C_n^j x^(-j)$.
      - Tích của hai hàm sinh là:
        $ f(x)g(x) = (1+x)^n (1+1/x)^n = frac((1+x)^(2n), x^n) $
      - Hệ số tự do (hệ số của $x^0$) trong tích $f(x)g(x)$ là:
        $ [x^0] f(x)g(x) = [x^0] frac((1+x)^(2n), x^n) = [x^n] (1+x)^(2n) = C_(2n)^n $
      - Mặt khác, nhân trực tiếp hai chuỗi cho ta hệ số tự do khi $k=j$:
        $ [x^0] f(x)g(x) = sum_(k=0)^n C_n^k dot C_n^k = sum_(k=0)^n (C_n^k)^2 $
      - Đồng nhất hai cách tính hệ số tự do ta được: $S = C_(2n)^n$.
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình", "Khó",),
  [
    Hai người chơi A và B chơi một trò chơi tung đồng xu. Người A thắng nếu tung được mặt ngửa, người B thắng nếu tung được mặt sấp. Biết đồng xu không cân đối, xác suất xuất hiện mặt ngửa là $p = 0.6$ và sấp là $1-p = 0.4$. Trò chơi kết thúc khi có người đạt được 2 lượt thắng. Tính xác suất để người A giành chiến thắng chung cuộc.
  ],
  [0.648],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Trò chơi kết thúc sau tối đa 3 lượt chơi. A giành chiến thắng chung cuộc trong các trường hợp sau:
      - *TH1 (A thắng sau 2 lượt):* A thắng cả 2 lượt đầu. Xác suất là:
        $ P_2 = (0.6)^2 = 0.36 $
      - *TH2 (A thắng sau 3 lượt):* A thắng lượt thứ 3 và thắng đúng 1 trong 2 lượt đầu. Xác suất là:
        $ P_3 = C_2^1 dot (0.6) dot (0.4) dot 0.6 = 2 dot 0.24 dot 0.6 = 0.288 $
      Tổng xác suất A giành chiến thắng chung cuộc là:
      $ P = P_2 + P_3 = 0.36 + 0.288 = 0.648 $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Sử dụng hàm sinh xác suất hai biến với biến $x$ đại diện cho lượt thắng của A, $y$ đại diện cho lượt thắng của B. Mỗi lượt tung đồng xu có hàm sinh xác suất: $f(x, y) = 0.6 x + 0.4 y$.
      - Trò chơi dừng ngay khi số mũ của $x$ hoặc $y$ đạt đến 2. Các nhánh thắng của A tương ứng với việc đạt trạng thái có dạng $x^2 y^k$ ($k < 2$).
      - Sau 2 lượt, hàm sinh xác suất là: $(0.6x + 0.4y)^2 = 0.36 x^2 + 0.48 x y + 0.16 y^2$.
        - Số hạng $0.36 x^2$ đạt đích (A thắng và trò chơi dừng).
        - Số hạng $0.16 y^2$ đạt đích (B thắng và trò chơi dừng).
        - Số hạng $0.48 x y$ chưa kết thúc, tiếp tục đi đến lượt 3.
      - Tại lượt 3, từ trạng thái $0.48 x y$, ta nhân tiếp với $f(x, y)$:
        $ 0.48 x y (0.6x + 0.4y) = 0.288 x^2 y + 0.192 x y^2 $
        - Số hạng $0.288 x^2 y$ tương ứng A thắng chung cuộc ở lượt 3.
      - Tổng xác suất A thắng chung cuộc là: $P = 0.36 + 0.288 = 0.648$.
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình", "Khó",),
  [
    Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 10$ thỏa mãn điều kiện $0 <= x_i <= 3$ với mọi $i = 1, 2, 3, 4$.
  ],
  [10],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Sử dụng phương pháp bù trừ (PIE):
      - Tổng số nghiệm nguyên không âm không giới hạn trên: $N_Omega = C_(10+4-1)^(4-1) = C_(13)^3 = 286$.
      - Gọi $P_i$ là điều kiện vi phạm của biến $x_i$, tức là $x_i >= 4$.
      - Số nghiệm vi phạm ít nhất 1 điều kiện (ví dụ $x_1 >= 4$, đặt $x_1' = x_1 - 4 >= 0 Rightarrow x_1' + x_2 + x_3 + x_4 = 6$):
        $ S_1 = C_4^1 dot C_(6+4-1)^(4-1) = 4 dot C_9^3 = 4 dot 84 = 336. $
      - Số nghiệm vi phạm ít nhất 2 điều kiện (ví dụ $x_1, x_2 >= 4$, đặt $x_1' = x_1 - 4, x_2' = x_2 - 4 Rightarrow x_1' + x_2' + x_3 + x_4 = 2$):
        $ S_2 = C_4^2 dot C_(2+4-1)^(4-1) = 6 dot C_5^3 = 6 dot 10 = 60. $
      - Không thể có >= 3 điều kiện vi phạm cùng lúc vì $4 + 4 + 4 = 12 > 10$.
      - Số nghiệm thỏa mãn là:
        $ N = N_Omega - S_1 + S_2 = 286 - 336 + 60 = 10. $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Mỗi biến $x_i$ có điều kiện $0 <= x_i <= 3$, tương ứng với đa thức lựa chọn $1 + t + t^2 + t^3 = frac(1-t^4, 1-t)$.
      - Hàm sinh tổng quát cho số nghiệm của phương trình là:
        $ G(t) = (frac(1 - t^4, 1 - t))^4 = (1 - t^4)^4 (1 - t)^(-4) $
      - Khai triển các nhân tử:
        - $(1 - t^4)^4 = 1 - 4t^4 + 6t^8 - 4t^(12) + t^(16)$
        - $(1 - t)^(-4) = sum_(k=0)^(infty) C_(k+3)^3 t^k$
      - Hệ số của $t^(10)$ trong $G(t)$ tương ứng với số nghiệm của phương trình:
        $ [t^(10)] G(t) = 1 dot C_(10+3)^3 - 4 dot C_(6+3)^3 + 6 dot C_(2+3)^3 = C_(13)^3 - 4 C_9^3 + 6 C_5^3 = 286 - 336 + 60 = 10 " nghiệm". $
    ]
  ]
)

#pagebreak()

// ══════════════════════════════════════════════════════════════
// PHẦN III: BẢNG TỔNG HỢP CÔNG THỨC
// ══════════════════════════════════════════════════════════════
= Bảng Tổng Hợp Công Thức Cốt Lõi

#align(center)[
  #block(width: 100%)[
    #table(
      columns: (1.2fr, 2fr, 1.2fr, 2fr),
      align: (center, left, center, left),
      stroke: 0.6pt + rgb("E2E8F0"),
      inset: (x: 8pt, y: 7pt),
      fill: (x,y) => if y==0 { c-navy } else if calc.rem(y,2)==0 { rgb("F8FAFC") } else { white },

      text(fill:white,weight:"bold", size:9.5pt)[Tên gọi],
      text(fill:white,weight:"bold", size:9.5pt)[Công thức toán học],
      text(fill:white,weight:"bold", size:9.5pt)[Tên gọi],
      text(fill:white,weight:"bold", size:9.5pt)[Công thức toán học],

      [Hoán vị], $P_n = n!$, [Tổ hợp], $C_n^k = frac(n!, k!(n-k)!)$,
      [Chỉnh hợp], $A_n^k = frac(n!, (n-k)!)$, [Hoán vị lặp], $frac(n!, n_1!n_2!dots.c n_k!)$,
      [Vách ngăn ($>= 0$)], $C_(n+k-1)^(k-1)$, [Vách ngăn ($>= 1$)], $C_(n-1)^(k-1)$,
      [Stirling loại 2], $S(n,k) = frac(1, k!) sum (-1)^j C_k^j (k-j)^n$, [Số Bell], $B(n) = sum_(k=1)^n S(n,k)$,
      [Số Catalan], $C_n = frac(1, n+1) C_(2n)^n$, [Đa thức sắc vòng], $(k-1)^n + (k-1)(-1)^n$,
      [Dãy Fibonacci], $F_n = F_(n-1)+F_(n-2)$, [Hàm phi Euler], $phi(n) = n prod_(p|n) (1 - 1/p)$,
      [Khai triển], $(a+b)^n = sum C_n^k a^(n-k) b^k$, [Vandermonde], $C_(2n)^n = sum_(k=0)^n (C_n^k)^2$,
    )
  ]
]

#v(1em)
#key-box[
  *Phương châm giải toán Đại số Tổ hợp:*
  - *Xem xét tính phân biệt:* Vật phân biệt hay giống nhau? Hộp/Nhóm phân biệt hay giống nhau?
  - *Xem xét tính thứ tự:* Lựa chọn có quan tâm đến thứ tự sắp xếp hay chỉ lấy ra tập hợp?
  - *Đơn giản hóa mô hình:* Nếu đếm xuôi có quá nhiều điều kiện chặn, hãy lập tức nghĩ đến việc đếm gián tiếp qua phần bù hoặc thiết lập hệ thức truy hồi.
]
