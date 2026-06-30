#import "_config.typ": *

// ── Định nghĩa màu sắc TƯƠI SÁNG, HIỆN ĐẠI ────────────────────────
#let C-BLUE    = rgb("#1d4ed8")
#let C-CYAN    = rgb("#0891b2")
#let C-EMERALD = rgb("#059669")
#let C-AMBER   = rgb("#d97706")
#let C-ROSE    = rgb("#e11d48")
#let C-PURPLE  = rgb("#7e22ce")
#let C-INDIGO  = rgb("#4338ca")
#let C-TEAL    = rgb("#0f766e")

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
  #text(size: 17pt, weight: "bold", fill: C-BLUE)[SƠ ĐỒ TƯ DUY: DÃY SỐ VÀ CẤP SỐ]
  #v(4pt)
  #text(size: 11pt, style: "italic", fill: luma(80))[Bản đồ tăng trưởng từ Tuyến tính đến Bùng nổ]
]
#v(1em)

#grid(
  columns: (1fr),
  gutter: 0pt,

  // --- PHASE 1: NỀN TẢNG ---
  fbox-header(color: C-BLUE)[
    #align(center)[#text(size: 12pt, fill: white, weight: "bold")[GIAI ĐOẠN 1: DÃY SỐ (QUY LUẬT VẠN VẬT)]]
  ],
  v(10pt),

  fbox(fill: color.mix((C-CYAN, 5%), (white, 95%)), border: C-CYAN)[
    #ftitle(color: C-CYAN)[TÍNH CHẤT CỦA DÃY SỐ $u_n$]
    #v(6pt)
    #fsub[
      • *Tăng / Giảm:* Lập hiệu $u_(n+1) - u_n$ hoặc thương $u_(n+1) / u_n$. \
      • *Bị chặn:* Tồn tại biên $m <= u_n <= M$. \
      • *Truy hồi:* Số hạng sau tính dựa vào số hạng trước (Ví dụ: Fibonacci $1, 1, 2, 3, 5, 8...$).
    ]
  ],

  arr,

  // --- PHASE 2: CẤP SỐ ---
  fbox-header(color: C-PURPLE)[
    #align(center)[#text(size: 12pt, fill: white, weight: "bold")[GIAI ĐOẠN 2: HAI MÔ HÌNH TĂNG TRƯỞNG KINH ĐIỂN]]
  ],
  v(10pt),

  grid(
    columns: (1fr, 40pt, 1fr),
    gutter: 0pt,
    
    fbox(fill: color.mix((C-PURPLE, 5%), (white, 95%)), border: C-PURPLE)[
      #ftitle(color: C-PURPLE)[CẤP SỐ CỘNG (CSC)]
      #v(6pt)
      #fsub[
        • *Định nghĩa:* $u_(n+1) = u_n + d$ (Cộng thêm hằng số $d$). \
        • *Số hạng tổng quát:* $u_n = u_1 + (n-1)d$. \
        • *Tính chất:* $u_k = (u_(k-1) + u_(k+1))/2$. \
        • *Tổng $n$ số hạng:* $S_n = n/2 (u_1 + u_n)$. \
        • *Đặc trưng:* Tăng trưởng ĐỀU (Đường thẳng tuyến tính).
      ]
    ],
    
    align(center + horizon)[
      #text(size: 12pt, fill: C-ROSE, weight: "bold")[Cộng \ vs \ Nhân] \
      #text(size: 16pt, fill: luma(180))[↔]
    ],
    
    fbox(fill: color.mix((C-EMERALD, 5%), (white, 95%)), border: C-EMERALD)[
      #ftitle(color: C-EMERALD)[CẤP SỐ NHÂN (CSN)]
      #v(6pt)
      #fsub[
        • *Định nghĩa:* $u_(n+1) = u_n dot q$ (Nhân thêm hằng số $q$). \
        • *Số hạng tổng quát:* $u_n = u_1 dot q^(n-1)$. \
        • *Tính chất:* $u_k^2 = u_(k-1) dot u_(k+1)$. \
        • *Tổng $n$ số hạng:* $S_n = u_1 (1 - q^n)/(1 - q)$. \
        • *Đặc trưng:* Tăng trưởng BÙNG NỔ (Đường cong mũ).
      ]
    ]
  ),

  arr,

  // --- PHASE 3: ỨNG DỤNG ---
  fbox-header(color: C-AMBER)[
    #align(center)[#text(size: 12pt, fill: white, weight: "bold")[GIAI ĐOẠN 3: BÁCH KHOA TOÀN THƯ THỰC TẾ]]
  ],
  v(10pt),
  
  grid(
    columns: (1fr, 20pt, 1fr),
    gutter: 0pt,
    fbox(fill: color.mix((C-AMBER, 5%), (white, 95%)), border: C-AMBER)[
      #ftitle(color: C-AMBER)[1. ỨNG DỤNG CẤP SỐ CỘNG]
      #v(6pt)
      #fsub[
        • *Kiến trúc:* Số gạch xây cầu thang, mái ngói. \
        • *Sự kiện:* Xếp ghế rạp hát, sân vận động. \
        • *Chuyển động:* Quãng đường rơi tự do (Galileo). \
        • *Kinh tế:* Khấu hao tài sản đường thẳng.
      ]
    ],
    [],
    fbox(fill: color.mix((C-AMBER, 5%), (white, 95%)), border: C-AMBER)[
      #ftitle(color: C-AMBER)[2. ỨNG DỤNG CẤP SỐ NHÂN]
      #v(6pt)
      #fsub[
        • *Cổ tích:* Nghịch lý hạt thóc bàn cờ vua. \
        • *Tài chính:* Lãi kép, Lạm phát, Amortization. \
        • *Sinh học:* Phân chia tế bào, Vi khuẩn. \
        • *Vật lý:* Quả bóng nảy (Quãng đường sau $n$ lần nảy).
      ]
    ]
  )
)

#pagebreak()
