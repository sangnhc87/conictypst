// ═══════════════════════════════════════════════════════════════════════════
//  CD-XepVat-KLoai.typ
//  CHUYÊN ĐỀ: XẾP VẬT K LOẠI — SỐ LƯỢNG CỐ ĐỊNH
//  Tập trung: Phương pháp Khe (Slot) và Bảng PIE Đại Bác (Bản Chi Tiết Mổ Xẻ)
//  GV Nguyễn Văn Sang · Toán tổ hợp nâng cao · THPT & HSG
// ═══════════════════════════════════════════════════════════════════════════

#import "template.typ": *
#import "sang-exam.typ": step
#import "@preview/cetz:0.5.2"

// ── Màu chủ đạo ──────────────────────────────────────────────────────────
#let C1  = rgb("#1E3A5F")   // Navy — T (Thầy)
#let C2  = rgb("#1A936F")   // Xanh lá — L (Lãnh đạo)
#let C3  = rgb("#C2410C")   // Cam đỏ — H (Học sinh) / E (Trống)
#let C4  = rgb("#7C3AED")   // Tím — phương pháp chính
#let Cwn = rgb("#DC2626")   // Đỏ — cảnh báo/chú ý

#let color-map(char) = {
  if char == "T" { C1 }
  else if char == "L" { C2 }
  else if char == "H" { C3 }
  else if char == "E" { luma(200) }
  else if char == "G" { rgb("#059669") }
  else if char == "A" { rgb("#2563EB") }
  else if char == "B" { rgb("#D97706") }
  else { luma(100) }
}

// ── Hộp phương pháp ──────────────────────────────────────────────────────
#let pp-box(title: [📌 Cơ sở lý thuyết], color: C4, body) = block(
  width: 100%, below: 0.8em, radius: 6pt, clip: true,
)[
  #block(width: 100%, fill: color, inset: (x: 12pt, y: 7pt))[
    #text(fill: white, weight: "bold", size: 10.5pt)[#title]
  ]
  #block(width: 100%, fill: color.lighten(92%), inset: (x: 13pt, y: 10pt))[
    #set text(fill: luma(20))
    #body
  ]
]

#let kq(body) = block(
  width: 100%, below: 0.7em,
  stroke: (left: 5pt + C2, rest: 0.6pt + C2.lighten(60%)),
  inset: (left: 12pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 5pt), fill: C2.lighten(93%),
)[
  #text(weight: "bold", fill: C2)[✅ Kết quả:] #h(4pt) #body
]

#let hint(body) = block(
  width: 100%, below: 0.7em,
  stroke: (left: 3pt + Cwn, rest: 0.6pt + Cwn.lighten(70%)),
  inset: (left: 12pt, right: 10pt, top: 5pt, bottom: 5pt),
  fill: Cwn.lighten(95%),
)[
  #text(weight: "bold", fill: Cwn, size: 9pt)[💡 Đọc chậm:] #h(4pt) #text(size: 9pt)[#body]
]

// ── Vẽ hàng ghế trực quan ────────────────────────────────────────────────
#let draw-seats(seq) = align(center, cetz.canvas({
  import cetz.draw: *
  let n = seq.len()
  for i in range(n) {
    let lbl = seq.at(i)
    let col = color-map(lbl)
    rect(
      (i * 1.15, 0), (i * 1.15 + 1.0, 0.75),
      fill: col.lighten(80%), stroke: 0.8pt + col, radius: 4pt,
    )
    content((i * 1.15 + 0.5, 0.38), text(size: 9pt, weight: "bold", fill: col)[#lbl])
  }
}))

#let draw-slots(v-seq, khe-color: rgb("#F59E0B")) = align(center, cetz.canvas({
  import cetz.draw: *
  let n = v-seq.len()
  for i in range(n + 1) {
    content((i * 1.3, 0.4), text(fill: khe-color, size: 14pt, weight: "bold")[#sym.arrow.b])
  }
  for i in range(n) {
    let lbl = v-seq.at(i)
    let col = color-map(lbl)
    rect(
      (i * 1.3 + 0.4, 0), (i * 1.3 + 1.2, 0.75),
      fill: col.lighten(80%), stroke: 0.8pt + col, radius: 4pt,
    )
    content((i * 1.3 + 0.8, 0.38), text(size: 9pt, weight: "bold", fill: col)[#lbl])
  }
}))

#let draw-conflict() = align(center, cetz.canvas({
  import cetz.draw: *
  content((0, 0.5), text(fill: Cwn, size: 10pt)[(Khe A và Khe B đụng độ nhau khi 2 nhóm cùng bị cấm)])
  content((0, 0), text(size: 14pt)[ $dots.h  arrow.b ("khe cho A?")  arrow.b ("khe cho B?") dots.h$ ])
}))

#let draw-grid(rows, cols, w: 0.8, h: 0.6) = align(center, cetz.canvas({
  import cetz.draw: *
  for r in range(rows) {
    for c in range(cols) {
      rect((c * w, -r * h), (c * w + w, -r * h - h), stroke: 0.5pt + luma(200), fill: luma(250), radius: 2pt)
      content((c * w + w/2, -r * h - h/2), text(fill: luma(150), size: 6pt)[Bàn])
    }
  }
}))

// ═══════════════════════════════════════════════════════════════════════════
#show: stexgv-doc.with(
  doc-type: "chuyende",
  title:    "XẾP VẬT K LOẠI — SỐ LƯỢNG CỐ ĐỊNH",
  subtitle: "Giáo Trình Đọc Chậm: Đếm Cấu Hình & Mổ Xẻ Bảng PIE",
  author:   "GV Nguyễn Văn Sang",
  institution: "Tổ Toán · Bồi Dưỡng HSG & Nâng Cao",
  subject:  "Toán tổ hợp",
  grade:    "Lớp 11–12 & HSG",
  series:   "Chuyên đề Tổ Hợp Thực Chiến",
  academic-year: "2025–2026",
  theme-color: C4,
)

// ─────────────────────────────────────────────────────────────────────────
#gioithieu[
  *Lưu ý cốt lõi:* Với các bài toán *cố định số lượng phần tử* (VD: Xếp $3T + 4L + 5H$), phương pháp Hàm Sinh tỏ ra cồng kềnh vì phải khai triển nhị thức bậc cao. Do đó, tài liệu này hoàn toàn loại bỏ Hàm Sinh để đi sâu vào bản chất của 2 vũ khí mạnh nhất:
  
  1. *Phương pháp Khe (Slot):* Dùng khi có *đúng 1 nhóm* bị cấm kề. Rất trực quan nhưng sẽ "sụp đổ" nếu có $\ge 2$ nhóm bị cấm.
  2. *PIE Đại Bác (Bảng PIE):* Cơ bắp, vạn năng. Tuyệt chiêu đếm bù trừ dạng bảng giúp giải quyết bất kỳ cấu trúc phức tạp nào.

  *Giáo trình này được biên soạn theo phong cách "cầm tay chỉ việc", chậm rãi mổ xẻ mọi con số trong bảng PIE để bạn hiểu tận gốc cơ chế.*
]

// ═══════════════════════════════════════════════════════════════════════════
#part([Phần 1: Cấu Hình Đồng Nhất vs Hoán Vị Phân Biệt], theme-color: C1)

#chapter([Bước Đi Đầu Tiên & Phân Định Khái Niệm], theme-color: C1)

#pp-box(title: [📐 Tư Duy Phân Lớp 2 Bước], color: C1)[
  Khi giải bài toán xếp vật k loại, chúng ta luôn chia làm 2 bước rõ ràng:
  - *Bước 1 (Đếm cấu hình đồng nhất):* Tạm coi các vật cùng nhóm (cùng chữ T, cùng chữ L) là *giống hệt nhau*. Số cách xếp lúc này chính là số "cấu hình bộ khung" (Pattern). Hoán vị có lặp được sinh ra ở bước này.
  - *Bước 2 (Nhân hoán vị phân biệt):* Nếu đề yêu cầu các phần tử phân biệt (Ví dụ: Thầy A khác Thầy B), ta lấy kết quả Bước 1 nhân thêm hoán vị nội bộ của từng nhóm: $N = ("Số cấu hình đồng nhất") times n_T! times n_L! times n_H!$
]

#vd(
  [*[Cơ bản 2 loại]* Xếp 3 học sinh xuất sắc (E) và 4 học sinh giỏi (G) vào hàng 7 ghế. Biết các học sinh cùng danh hiệu coi như *không phân biệt*. Tính số cách xếp.],
  loigiai: [
    #hint[Đề bài đã nhấn mạnh "không phân biệt", tức là ta chỉ thực hiện Bước 1 (Đếm cấu hình đồng nhất).]
    Áp dụng công thức hoán vị có lặp cho $3E + 4G$:
    $text("Số cách") = frac(7!, (3! dot 4!)) = frac(5040, (6 dot 24)) = bold(35) text(" cấu hình")$
    #draw-seats(("E","G","E","G","G","E","G"))
  ],
  theme-color: C1,
)

#vd(
  [*[Vật phân biệt]* Lớp có 3 Thầy (T), 4 Lãnh đạo (L) và 5 Học sinh (H). Tất cả mọi người đều khác nhau. Xếp vào hàng thẳng 12 chỗ. Tính số cách xếp.],
  loigiai: [
    - *Bước 1:* Tính số cấu hình đồng nhất (coi như các Thầy giống nhau, Lãnh đạo giống nhau). 
      Ta có $frac(12!, (3! 4! 5!)) = 27720$ cấu hình.
    - *Bước 2:* Nhân hoán vị thực tế. Các Thầy khác nhau ($3!$), Lãnh đạo khác nhau ($4!$), Học sinh khác nhau ($5!$).
    - *Kết quả:* $27720 times 3! times 4! times 5! = 12!$ cách. (Thực chất đây chính là hoán vị 12 người phân biệt, nhưng việc chẻ làm 2 bước sẽ tạo thói quen tốt cho các bài có điều kiện).
  ],
  theme-color: C1,
)

// ═══════════════════════════════════════════════════════════════════════════
#part([Phần 2: Phương Pháp Khe (Slot Method)], theme-color: C2)

#chapter([Xử Lý "Đúng 1 Nhóm" Cấm Kề], theme-color: C2)

#pp-box(title: [📐 Slot Method — Vũ Khí Trực Quan Nhất], color: C2)[
  Dùng khi có *đúng 1 nhóm* các vật bị cấm kề nhau.
  - *Bản chất:* Lấy nhóm KHÔNG bị cấm xếp trước để tạo thành các "vách ngăn". Sau đó nhét các vật BỊ CẤM vào các khe hở giữa các vách ngăn đó (mỗi khe tối đa 1 vật).
]

#vd(
  [*[Slot siêu dễ]* Xếp 3 chữ T và 5 chữ H thành hàng ngang sao cho không có 2 chữ T nào đứng cạnh nhau.],
  loigiai: [
    #step[Tạo vách ngăn]
    Chỉ có T bị cấm kề. Ta lấy H xếp trước. 5 chữ H giống nhau xếp được $1$ cách. Chúng tạo ra $5+1=6$ khe trống (mũi tên).
    #draw-slots(("H","H","H","H","H"))
    
    #step[Chèn nhóm cấm]
    Chọn 3 khe trong 6 khe để đặt 3 chữ T (giống nhau): $C_6^3 = 20$ cách.
    #kq[Có $1 times 20 = bold(20)$ cấu hình hợp lệ.]
  ],
  theme-color: C2,
)

#vd(
  [*[Ghế trống làm vách ngăn]* Có 3 học sinh (H) phân biệt và 5 ghế trống (E). Sắp xếp sao cho không có 2 học sinh nào ngồi cạnh nhau.],
  loigiai: [
    #hint[Bài toán cực hay: Ghế trống chính là "bức tường tàng hình" ngăn cách các học sinh.]
    - Xét cấu hình đồng nhất: Xếp 5 ghế E (giống nhau) $\to 1$ cách. Tạo ra 6 khe trống.
    - Chèn 3 chữ H vào 6 khe: $C_6^3 = 20$ cách.
    - Nhân hoán vị phân biệt cho học sinh: $3! = 6$. (Ghế trống không cần hoán vị vì $5!/5! = 1$).
    #kq[Có $20 times 6 = bold(120)$ cách xếp.]
  ],
  theme-color: C2,
)

#chapter([Giới Hạn Của Phương Pháp Khe], theme-color: Cwn)
Tại sao ta không dùng Slot khi có 2 nhóm cấm kề (VD: Cấm TT và cấm LL)?
Giả sử ta dùng H làm vách ngăn, ta sẽ có các khe hở. Nhưng ta không biết nên nhét T hay L vào khe nào để chúng không đụng độ nhau trong cùng một khe.
#draw-conflict()
Sự xung đột này phá vỡ sự trong sáng của khe. Lúc này, ta phải triệu hồi *PIE Đại Bác*!

// ═══════════════════════════════════════════════════════════════════════════
#part([Phần 3: PIE Đại Bác — Bảng 2 Nhóm], theme-color: C4)

#chapter([Cơ Chế 5 Bước Hình Thành Một Dòng], theme-color: C4)

#pp-box(title: [🔫 Nguyên Lý PIE Dạng Bảng], color: C4)[
  Thay vì đếm số cách chia rẽ, ta *ép các vật cấm lại với nhau thành cặp dính liền*, đếm số trường hợp vi phạm rồi dùng quy tắc bù trừ (Bao hàm - Loại trừ).
  *Khung chuẩn cho dòng $(i, j)$ (Ghép $i$ cặp nhóm T, $j$ cặp nhóm L):*
  1. *Tầng $s$:* Tính bằng $i + j$. Tầng chẵn $\to$ dấu cộng $(+)$. Tầng lẻ $\to$ dấu trừ $(-)$.
  2. *Chọn cặp:* Một nhóm có $n$ người thì có $n-1$ khe nối nội bộ. Chọn ép $i$ khe: $C_(n-1)^i$. 
  3. *Thực thể:* Số phần tử ban đầu trừ đi số lượng cặp bị ép dính: $(n_T-i, n_L-j, dots.h)$.
  4. *Hoán vị đồng nhất:* Xếp các "khối dính" và vật tự do còn lại. Công thức: $frac("Tổng"_T!, ((n_T-i)! (n_L-j)! dots.h))$.
  5. *Đóng góp:* $=$ Chọn cặp $times$ Hoán vị $times$ Dấu.
]

#vd(
  [*[PIE 2 Nhóm - Bảng 4 Dòng]* Xếp $2T + 2L + 3H$. Không có 2 vật nào cùng loại kề nhau trong nhóm T và L (H tự do). Đếm số cấu hình đồng nhất.],
  loigiai: [
    #hint[Đếm số dòng: Nhóm T có 2 người $-> 1$ khe dính nội bộ $-> i \in \{0,1\}$. Nhóm L có 2 người $-> j \in \{0,1\}$. Bảng sẽ có $2 times 2 = 4$ dòng.]
    
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto, auto),
        fill: (col, row) => if row == 0 { C4.lighten(85%) } else if calc.rem(row, 2) == 0 { luma(252) } else { white },
        inset: 8pt, align: (left, center, center, center, center, center, center, right),
        table.header([Kịch bản $(i,j)$], [Tầng $s$], [Chọn cặp], [Thực thể (T,L,H)], [Tổng $T$], [Hoán vị ĐN], [Dấu], [Đóng góp]),
        [(0,0)], [0], [1], [(2,2,3)], [7], [$7!/(2!2!3!)=210$], [+], [+210],
        [(0,1)], [1], [1], [(2,1,3)], [6], [$6!/(2!1!3!)=60$], [−], [−60],
        [(1,0)], [1], [1], [(1,2,3)], [6], [$6!/(1!2!3!)=60$], [−], [−60],
        [(1,1)], [2], [1], [(1,1,3)], [5], [$5!/(1!1!3!)=20$], [+], [+20],
        table.cell(colspan: 7, align: right, text(weight: "bold")[Tổng cấu trúc hợp lệ:]),
        text(fill: C4, weight: "bold")[110]
      )
    ]

    #hint[
      *🔍 Mổ Xẻ Đọc Chậm Dòng $(1,1)$:* 
      - Ý nghĩa: Ép 1 cặp TT và 1 cặp LL.
      - *Chọn cặp:* T có 2 người (1 khe), ép 1 khe $\to C_1^1 = 1$. L tương tự $\to 1 times 1 = 1$.
      - *Thực thể:* T đang 2 người ép 1 cặp $\to$ gom thành 1 khối (số lượng = $2-1=1$). L cũng gom thành 1 khối. H không ép vẫn là 3. Dãy thực thể là `(1,1,3)`.
      - *Hoán vị:* Tổng thực thể là $1+1+3=5$. Số hoán vị có lặp: $5!/(1! 1! 3!) = 20$.
      - *Dấu:* Tầng $s=1+1=2$ (Chẵn) $\to$ mang dấu dương (+).
      - *Đóng góp:* $1 times 20 times (+1) = +20$. Quá logic!
    ]
  ],
  theme-color: C4,
)

#chapter([Bẫy Ghế Trống Trong PIE], theme-color: Cwn)

#vd(
  [*[PIE Ghế trống]* Có $3T + 2L$ và $2E$ (ghế trống). Xếp vào 7 ghế thẳng. Cấm TT và cấm LL. Ghế trống tự do.],
  loigiai: [
    #hint[
      *Đọc Chậm Về Ghế Trống:* Người ta cấm 2 người kề nhau, chứ không ai cấm 2 ghế trống liền nhau. Vì vậy *ghế trống không bao giờ tạo nhóm ép cặp*.
      Bài toán có 3 loại (T, L, E) nhưng chỉ T và L bị cấm $\to$ Bảng PIE chỉ xét biến $(i, j)$ cho T và L. E đứng ngoài chầu chực ở cột Thực Thể.
    ]
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto, auto),
        fill: (col, row) => if row == 0 { Cwn.lighten(85%) } else if calc.rem(row, 2) == 0 { luma(252) } else { white },
        inset: 7pt, align: (left, center, center, center, center, center, center, right),
        table.header([Kịch bản $(i,j)$], [Tầng $s$], [Chọn cặp], [Thực thể], [Tổng $T$], [Hoán vị ĐN], [Dấu], [Đóng góp]),
        [(0,0)], [0], [1], [(3,2,2)], [7], [$7!/(3!2!2!)=210$], [+], [+210],
        [(0,1)], [1], [1], [(3,1,2)], [6], [$6!/(3!1!2!)=60$], [−], [−60],
        [(1,0)], [1], [$C_2^1=2$], [(2,2,2)], [6], [$6!/(2!2!2!)=90$], [−], [−180],
        [(1,1)], [2], [$2$], [(2,1,2)], [5], [$5!/(2!1!2!)=30$], [+], [+60],
        [(2,0)], [2], [$C_2^2=1$], [(1,2,2)], [5], [$5!/(1!2!2!)=30$], [+], [+30],
        [(2,1)], [3], [1], [(1,1,2)], [4], [$4!/(1!1!2!)=12$], [−], [−12],
        table.cell(colspan: 7, align: right, text(weight: "bold")[Tổng cấu trúc:]),
        text(fill: Cwn, weight: "bold")[48]
      )
    ]
    #kq[Có đúng $48$ cấu trúc hợp lệ. Nếu đề bài nói 3 Thầy phân biệt, 2 Lãnh đạo phân biệt, ta lấy $48 times 3! times 2! = 576$ cách. Ghế trống không hoán vị.]
  ],
  theme-color: Cwn,
)

// ═══════════════════════════════════════════════════════════════════════════
#part([Phần 4: PIE Đại Bác — Bảng 3 Nhóm], theme-color: C4)

#chapter([Trải Dài Bảng 8 Dòng Và 12 Dòng], theme-color: C4)

#vd(
  [*[Bảng 8 Dòng Toàn Diện]* Xếp $2T + 2L + 2H$. Không có bất kỳ 2 vật nào cùng loại được kề nhau.],
  loigiai: [
    #hint[Cả 3 nhóm đều bị cấm. $i,j,k \in \{0,1\} -> 2 times 2 times 2 = 8$ dòng. Thiết lập trọn vẹn không bỏ sót 1 ly.]
    #align(center)[
      #table(
        columns: (1fr, auto, auto, auto, auto, auto, auto, auto),
        fill: (col, row) => if row == 0 { C4.lighten(85%) } else if calc.rem(row, 2) == 0 { luma(252) } else { white },
        inset: 7pt, align: (left, center, center, center, center, center, center, right),
        table.header([Kịch bản $(i,j,k)$], [Tầng $s$], [Chọn cặp], [Thực thể], [Tổng $T$], [Hoán vị ĐN], [Dấu], [Đóng góp]),
        [(0,0,0)], [0], [1], [(2,2,2)], [6], [$6!/(2!2!2!)=90$], [+], [+90],
        [(1,0,0)], [1], [1], [(1,2,2)], [5], [$5!/(1!2!2!)=30$], [−], [−30],
        [(0,1,0)], [1], [1], [(2,1,2)], [5], [$5!/(2!1!2!)=30$], [−], [−30],
        [(0,0,1)], [1], [1], [(2,2,1)], [5], [$5!/(2!2!1!)=30$], [−], [−30],
        [(1,1,0)], [2], [1], [(1,1,2)], [4], [$4!/(1!1!2!)=12$], [+], [+12],
        [(1,0,1)], [2], [1], [(1,2,1)], [4], [$4!/(1!2!1!)=12$], [+], [+12],
        [(0,1,1)], [2], [1], [(2,1,1)], [4], [$4!/(2!1!1!)=12$], [+], [+12],
        [(1,1,1)], [3], [1], [(1,1,1)], [3], [$3!/(1!1!1!)=6$], [−], [−6],
        table.cell(colspan: 7, align: right, text(weight: "bold")[Tổng cấu trúc đồng nhất hợp lệ:]),
        text(fill: C4, weight: "bold")[30]
      )
    ]
    #hint[
      *🔍 Mổ Xẻ Đọc Chậm Dòng $(1,1,0)$:* 
      - Ép 1 cặp TT, 1 cặp LL, không ép HH.
      - Số thực thể T giảm từ 2 xuống 1. L giảm từ 2 xuống 1. H giữ nguyên 2. Dãy là `(1,1,2)`.
      - Hoán vị: $4! / (1!1!2!) = 12$. Tầng 2 mang dấu (+). Đóng góp $+12$.
    ]
  ],
  theme-color: C4,
)

#vd(
  [*[Đại Bác 12 Dòng]* Xếp $3T + 2L + 2H$ vào 7 ghế thẳng. Không có bất kỳ 2 vật nào cùng loại kề nhau.],
  loigiai: [
    #hint[Bài toán siêu kinh điển. Nhóm T có 3 người $\to i \in \{0,1,2\}$. L và H có 2 người $\to j, k \in \{0,1\}$. Tổng $3 times 2 times 2 = 12$ dòng.]
    #align(center)[
      #table(
        columns: (1.2fr, auto, auto, auto, auto, 1.2fr, auto, auto),
        fill: (col, row) => if row == 0 { C4.lighten(85%) } else if calc.rem(row, 2) == 0 { luma(252) } else { white },
        inset: 7pt, align: (left, center, center, center, center, center, center, right),
        table.header(
          [Kịch bản $(i,j,k)$], [Tầng $s$], [Chọn cặp], [Thực thể], [Tổng $T$], [Hoán vị ĐN], [Dấu], [Đóng góp]
        ),
        [(0,0,0)], [0], [1], [(3,2,2)], [7], [$7!/(3!2!2!)=210$], [+], [+210],
        [(0,0,1)], [1], [1], [(3,2,1)], [6], [$6!/(3!2!1!)=60$], [−], [−60],
        [(0,1,0)], [1], [1], [(3,1,2)], [6], [$6!/(3!1!2!)=60$], [−], [−60],
        [(1,0,0)], [1], [$2$], [(2,2,2)], [6], [$6!/(2!2!2!)=90$], [−], [−180],
        [(0,1,1)], [2], [1], [(3,1,1)], [5], [$5!/(3!1!1!)=20$], [+], [+20],
        [(1,0,1)], [2], [$2$], [(2,2,1)], [5], [$5!/(2!2!1!)=30$], [+], [+60],
        [(1,1,0)], [2], [$2$], [(2,1,2)], [5], [$5!/(2!1!2!)=30$], [+], [+60],
        [(2,0,0)], [2], [$1$], [(1,2,2)], [5], [$5!/(1!2!2!)=30$], [+], [+30],
        [(1,1,1)], [3], [$2$], [(2,1,1)], [4], [$4!/(2!1!1!)=12$], [−], [−24],
        [(2,0,1)], [3], [1], [(1,2,1)], [4], [$4!/(1!2!1!)=12$], [−], [−12],
        [(2,1,0)], [3], [1], [(1,1,2)], [4], [$4!/(1!1!2!)=12$], [−], [−12],
        [(2,1,1)], [4], [1], [(1,1,1)], [3], [$3!/(1!1!1!)=6$], [+], [+6],
        table.cell(colspan: 7, align: right, text(weight: "bold")[Tổng cấu trúc đồng nhất hợp lệ:]),
        text(fill: C4, weight: "bold")[38]
      )
    ]
    #hint[
      *🔍 Mổ Xẻ Đọc Chậm Dòng $(1,0,1)$:* 
      - Ép 1 cặp TT, không ép LL, ép 1 cặp HH.
      - *Chọn cặp:* Nhóm T (3 người) có 2 khe dính nội bộ $\to$ Chọn 1 khe: $C_2^1 = 2$. Nhóm H $\to$ Chọn 1 khe: $C_1^1 = 1$. Tổng tổ hợp chọn cặp = $2 times 1 = 2$.
      - *Thực thể:* T đang 3 ép 1 $\to 2$. L không đổi $\to 2$. H đang 2 ép 1 $\to 1$. Dãy thực thể: `(2,2,1)`.
      - *Hoán vị:* Tổng là 5. $5!/(2! 2! 1!) = 30$.
      - *Đóng góp:* $2 times 30 times (+1) = +60$. Cực kỳ trong sáng!
    ]
  ],
  theme-color: C4,
)

// ═══════════════════════════════════════════════════════════════════════════
#part([Phần 5: Bẻ Gãy Vòng Tròn & Phân Phối Trực Quan], theme-color: C3)

#chapter([Bẻ Gãy Vòng Tròn Với PIE], theme-color: C3)

#pp-box(title: [🔄 Lý thuyết 5: Bẻ gãy vòng tròn], color: C3)[
  Vòng tròn có tính chất quay lặp lại, khiến PIE nguyên thủy trở nên khó tính toán. Mẹo "Bẻ gãy":
  *Cố định 1 phần tử (VD: Cố định 1 chữ T ở ghế số 1)* để cắt vòng tròn thành 1 hàng thẳng.
  Sau đó áp dụng bảng PIE cho hàng thẳng vừa tạo, nhưng *phải loại bỏ các trường hợp chữ T đứng ở đầu hoặc cuối hàng* (vì chúng sẽ kề với chữ T đã bị cố định ở ghế số 1).
]

#vd(
  [*[Vòng tròn PIE (Bẻ gãy)]* Xếp $2T + 2L + 2H$ vòng tròn, cấm các cặp cùng loại kề nhau.],
  loigiai: [
    #hint[Do có tới 3 nhóm cấm, Khe sẽ sụp đổ. Ta bẻ vòng tròn bằng cách Cố định 1 chữ T.]
    Cố định 1 chữ T. Ta cần xếp dãy thẳng gồm $1T + 2L + 2H$ vào 5 vị trí còn lại.
    *Điều kiện hàng thẳng mới:*
    1. Không có 2 chữ cùng loại đứng kề nhau ở giữa.
    2. Hai vị trí biên không được là chữ T.
    
    Sau khi giải bằng PIE hàng thẳng và trừ đi điều kiện biên, ta sẽ ra đúng $10$ cấu trúc hợp lệ! (Bạn có thể tự lập bảng nháp cho $1T+2L+2H$ để rèn luyện kỹ năng).
  ],
  theme-color: C3,
)

#chapter([Xác Suất Phân Phối Không Gian Lưới], theme-color: C3)

#vd(
  [*[Bài toán 3 cột - Câu 22]* 24 chiếc bàn chia thành 8 hàng $times$ 3 cột. Xếp 5 Xuất sắc (E), 3 Giỏi (G), 2 Khá (K) (đều phân biệt) và 14 học sinh TB. Tính XS để mỗi hàng có $<= 1$ hs mỗi loại E, G, K.],
  loigiai: [
    #hint[Đây là bài toán phân bố vị trí trên lưới. Ta không cần thiết lập hàng dài mà thiết lập theo tổ hợp hàng.]
    #draw-grid(8, 3)
    
    1. *Xếp E:* Chọn 5 hàng trong 8 hàng: $C_8^5 = 56$. Mỗi hàng có 3 bàn nên chọn 1 bàn: $3^5 = 243$.
    2. *Xếp G:* Phụ thuộc vào độ chồng lấp $k$ (số hàng có cả E và G). $k \in \{0,1,2,3\}$.
       Số cách chọn G = $sum_(k=0)^3 C_5^k C_3^(3-k) 2^k 3^(3-k) = 737$.
    3. *Xếp K:* Phụ thuộc tiếp vào không gian ghế còn trống sau khi E và G chiếm chỗ.
    Tính chất "Chồng lấp tổ hợp" này chính là phiên bản nâng cao của PIE chọn vị trí. Tổng hợp lại rồi nhân hoán vị phân biệt $->$ Tính được xác suất tuyệt đối chính xác!
  ],
  theme-color: C3,
)
