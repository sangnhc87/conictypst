#import "_theme.typ": *
#import "@preview/cetz:0.5.2": canvas, draw

// ── Định nghĩa màu sắc TƯƠI SÁNG, HIỆN ĐẠI ────────────────────────
#let C-BLUE   = rgb("#1d4ed8")
#let C-CYAN   = rgb("#0891b2")
#let C-EMERALD = rgb("#059669")
#let C-AMBER  = rgb("#d97706")
#let C-ROSE   = rgb("#e11d48")
#let C-PURPLE = rgb("#7e22ce")
#let C-INDIGO = rgb("#4338ca")
#let C-TEAL   = rgb("#0f766e")

#set text(font: "Times New Roman")

// ── Thành phần cơ bản ───────────────────────────────────────────
#let ftitle(color: black, body) = text(fill: color, weight: "bold", size: 11pt)[#body]
#let fsub(body) = text(size: 9.5pt, fill: luma(40))[#set par(leading: 0.65em); #body]

#let fbox(body, fill: white, border: black) = box(
  fill: fill, 
  stroke: 1.2pt + border, 
  radius: 6pt, 
  inset: (x: 10pt, y: 10pt), 
  width: 100%
)[#body]

#let fbox-header(body, color: black) = box(
  fill: color,
  stroke: none,
  radius: 6pt,
  inset: (x: 10pt, y: 10pt),
  width: 100%
)[#body]

#let arr = align(center)[
  #v(2pt)
  #text(fill: luma(180), size: 16pt)[⬇]
  #v(2pt)
]

// =====================================================================
// BẮT ĐẦU FLOWCHART
// =====================================================================

#align(center)[
  #text(size: 17pt, weight: "bold", fill: C-PURPLE)[SƠ ĐỒ TƯ DUY: XÁC SUẤT CÓ ĐIỀU KIỆN & BAYES (CHƯƠNG CUỐI LỚP 12)]
  #v(4pt)
  #text(size: 11pt, style: "italic", fill: luma(80))[Bản đồ tư duy từ Biến cố độc lập đến Xác suất toàn phần và Định lý Bayes]
]
#v(1em)

// ── TẦNG 1: BIẾN CỐ ĐỘC LẬP & XUNG KHẮC ──────────────────────────
#fbox-header(color: C-TEAL)[
  #align(center)[#text(size: 12pt, weight: "bold", fill: white)[📍 TẦNG 1 — NỀN TẢNG: SỰ ĐỘC LẬP VÀ XUNG KHẮC]]
  #v(6pt)
  #grid(
    columns: (1fr, 1.2fr, 1fr),
    column-gutter: 0.6em,
    fbox(
      align(center)[
        #ftitle(color: C-TEAL)[Biến cố Xung khắc]
        #v(3pt)
        #fsub[
          ▸ Không thể xảy ra cùng lúc.\
          $ A inter B = emptyset $
          ▸ *Quy tắc cộng:*
          $ P(A union B) = P(A) + P(B) $
        ]
      ], fill: white, border: C-TEAL.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-TEAL)[Biến cố Độc lập]
        #v(3pt)
        #fsub[
          ▸ Việc $A$ xảy ra không ảnh hưởng đến xác suất xảy ra của $B$ và ngược lại.\
          ▸ *Định lý (Quy tắc nhân):* $A, B$ độc lập khi và chỉ khi:
          $ P(A B) = P(A) dot P(B) $
        ]
      ], fill: white, border: C-TEAL.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-TEAL)[Nhầm lẫn kinh điển]
        #v(3pt)
        #fsub[
          ▸ *Độc lập* $!=$ *Xung khắc*.\
          ▸ Xung khắc: "Nếu anh sống thì tôi chết" (Ảnh hưởng cực mạnh).\
          ▸ Độc lập: "Anh sống hay chết không liên quan đến tôi" (Không ảnh hưởng).
        ]
      ], fill: white, border: C-TEAL.lighten(30%)
    ),
  )
]

#arr

// ── TẦNG 2: XÁC SUẤT CÓ ĐIỀU KIỆN ────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-BLUE)[📊 TẦNG 2 — XÁC SUẤT CÓ ĐIỀU KIỆN (Bẻ cong không gian mẫu)]]
    #v(4pt)
    #grid(
      columns: (1.2fr, 1fr),
      column-gutter: 0.6em,
      fbox(
        align(center)[
          #ftitle(color: C-BLUE)[Định nghĩa & Công thức]
          #v(3pt)
          #fsub[
            ▸ Xác suất để $A$ xảy ra, *biết rằng $B$ đã xảy ra* được ký hiệu là $P(A|B)$.
            $ P(A|B) = P(A B) / P(B) $
            ▸ Suy ra quy tắc nhân tổng quát:
            $ P(A B) = P(B) dot P(A|B) = P(A) dot P(B|A) $
          ]
        ], fill: C-BLUE.lighten(94%), border: C-BLUE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-BLUE)[Bản chất hình học]
          #v(3pt)
          #fsub[
            ▸ Khi biết $B$ xảy ra, không gian mẫu $Omega$ bị thu hẹp lại chỉ còn $B$.\
            ▸ Mọi tính toán xác suất từ nay về sau lấy $B$ làm hệ quy chiếu mới (làm mẫu số).\
            ▸ Nếu $A, B$ độc lập thì $P(A|B) = P(A)$.
          ]
        ], fill: C-BLUE.lighten(94%), border: C-BLUE
      ),
    )
  ],
  fill: C-BLUE.lighten(96%), border: C-BLUE
)

#arr

// ── TẦNG 3: HỆ ĐẦY ĐỦ & CÔNG THỨC XÁC SUẤT TOÀN PHẦN ──────────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-ROSE)[🎯 TẦNG 3 — CÔNG THỨC XÁC SUẤT TOÀN PHẦN (Chia để trị)]]
    #v(4pt)
    #grid(
      columns: (1fr, 1.2fr),
      column-gutter: 0.6em,
      fbox(
        align(center)[
          #ftitle(color: C-ROSE)[Hệ đầy đủ các biến cố]
          #v(3pt)
          #fsub[
            ▸ Các biến cố $B_1, B_2, dots, B_k$ tạo thành hệ đầy đủ nếu:
            1. Phủ kín mọi khả năng: $B_1 union dots union B_k = Omega$
            2. Rời rạc (Xung khắc đôi một): $B_i inter B_j = emptyset$\
            ▸ Ví dụ: Chọn 1 người thì "Nam" và "Nữ" tạo thành hệ đầy đủ.
          ]
        ], fill: C-ROSE.lighten(94%), border: C-ROSE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-ROSE)[Công thức Toàn phần]
          #v(3pt)
          #fsub[
            ▸ Một biến cố $A$ có thể xảy ra qua nhiều con đường $B_1, B_2, dots$:
            $ P(A) = P(B_1)P(A|B_1) + P(B_2)P(A|B_2) + dots $
            ▸ *Ý nghĩa:* Tính xác suất tổng bằng cách cộng trọng số xác suất nhánh (vẽ sơ đồ cây).\
          ]
        ], fill: C-ROSE.lighten(94%), border: C-ROSE
      ),
    )
  ],
  fill: C-ROSE.lighten(96%), border: C-ROSE
)

#arr

// ── TẦNG 4: ĐỊNH LÝ BAYES (SUY LUẬN NGƯỢC) ──────────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-PURPLE)[🔮 TẦNG 4 — CÔNG THỨC BAYES (Suy luận ngược từ Kết quả ra Nguyên nhân)]]
    #v(4pt)
    #grid(
      columns: (1.2fr, 1fr),
      column-gutter: 0.6em,
      fbox(
        align(center)[
          #ftitle(color: C-PURPLE)[Công thức Bayes]
          #v(3pt)
          #fsub[
            ▸ Giả sử $A$ đã xảy ra. Ta muốn tìm xác suất do nguyên nhân $B_i$ gây ra:
            $ P(B_i | A) = (P(B_i) dot P(A|B_i)) / P(A) $
            (Mẫu số $P(A)$ tính bằng CT Xác suất toàn phần ở Tầng 3).
          ]
        ], fill: C-PURPLE.lighten(94%), border: C-PURPLE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-PURPLE)[Tư duy Cập nhật Niềm tin]
          #v(3pt)
          #fsub[
            ▸ $P(B_i)$: Niềm tin ban đầu (Tiền nghiệm).\
            ▸ $A$: Bằng chứng mới xuất hiện.\
            ▸ $P(B_i|A)$: Niềm tin được cập nhật (Hậu nghiệm).\
            Toán học của việc "rút kinh nghiệm" dưới ánh sáng của dữ liệu mới.
          ]
        ], fill: C-PURPLE.lighten(94%), border: C-PURPLE
      ),
    )
  ],
  fill: C-PURPLE.lighten(96%), border: C-PURPLE
)

#arr

// ── TẦNG 5: ỨNG DỤNG THỰC TẾ & KINH TẾ (ĐÁNH GIÁ VÀ QUYẾT ĐỊNH) ──────────────────
#fbox-header(color: C-AMBER)[
  #align(center)[#text(size: 12pt, weight: "bold", fill: white)[💡 TẦNG 5 — ỨNG DỤNG THỰC TẾ: BÀI TOÁN Y TẾ & TRÍ TUỆ NHÂN TẠO]]
  #v(4pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.6em,
    fbox(
      align(center)[
        #ftitle(color: C-AMBER.darken(20%))[Xét nghiệm Y tế (Dương tính giả)]
        #v(3pt)
        #fsub[
          ▸ Bài toán kinh điển: Một xét nghiệm chính xác 99%. Bạn test ra dương tính ($A$). Xác suất bạn thực sự mắc bệnh ($B$) là bao nhiêu?
          ▸ Nhờ định lý Bayes, ta biết $P(B|A)$ thường rất thấp nếu căn bệnh đó hiếm gặp (Nghịch lý dương tính giả).
        ]
      ], fill: white, border: C-AMBER.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-AMBER.darken(20%))[Bộ lọc Email Rác (Spam Filter)]
        #v(3pt)
        #fsub[
          ▸ Nhận được email chứa từ "Khuyến mãi" ($A$). Xác suất đây là thư rác ($B$) là bao nhiêu?\
          ▸ Máy tính dùng thuật toán Naive Bayes học từ hàng triệu email cũ để tính $P("Spam" | "Khuyến mãi")$.
        ]
      ], fill: white, border: C-AMBER.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-AMBER.darken(20%))[Chiến lược Đầu tư / Bảo hiểm]
        #v(3pt)
        #fsub[
          ▸ Cập nhật xác suất khách hàng vỡ nợ khi biết thêm điều kiện họ trễ hạn trả thẻ tín dụng tháng trước.\
          ▸ Đánh giá xác suất dự án thành công khi biết kết quả khả quan từ đợt khảo sát thị trường (Bayesian updating).
        ]
      ], fill: white, border: C-AMBER.lighten(30%)
    ),
  )
]
