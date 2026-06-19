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
  #text(size: 17pt, weight: "bold", fill: C-BLUE)[SƠ ĐỒ TƯ DUY: HÀM SỐ MŨ & HÀM SỐ LOGARIT]
  #v(4pt)
  #text(size: 11pt, style: "italic", fill: luma(80))[Bản đồ tuyến tính từ nền tảng Đại số đến Phương trình và Mô hình Thực tiễn]
]
#v(1em)

#grid(
  columns: (1fr),
  gutter: 0pt,

  // --- PHASE 1: NỀN TẢNG ---
  fbox-header(color: C-BLUE)[
    #align(center)[#text(size: 12pt, fill: white, weight: "bold")[GIAI ĐOẠN 1: NỀN TẢNG ĐẠI SỐ (LŨY THỪA & LOGARIT)]]
  ],
  v(10pt),

  grid(
    columns: (1fr, 40pt, 1fr),
    gutter: 0pt,
    
    // Lũy thừa
    fbox(fill: color.mix((C-CYAN, 5%), (white, 95%)), border: C-CYAN)[
      #ftitle(color: C-CYAN)[1. LŨY THỪA $a^alpha$]
      #v(6pt)
      #fsub[
        • *Khái niệm:* $a^n, a^(1/n) = root(n, a), a^(m/n) = root(n, a^m)$.\
        • *Tính chất:* $(a b)^x = a^x b^x$, $a^x / a^y = a^(x-y)$, $(a^x)^y = a^(x y)$.\
        • *Điều kiện cơ số:* \
          - Mũ nguyên dương: $a in RR$\
          - Mũ nguyên âm, $0$: $a != 0$\
          - Mũ hữu tỉ, vô tỉ: $a > 0$
      ]
    ],
    
    align(center + horizon)[#text(size: 16pt, fill: luma(180))[➡]],
    
    // Logarit
    fbox(fill: color.mix((C-EMERALD, 5%), (white, 95%)), border: C-EMERALD)[
      #ftitle(color: C-EMERALD)[2. LOGARIT $log_a b$]
      #v(6pt)
      #fsub[
        • *Định nghĩa:* $alpha = log_a b <=> a^alpha = b$ ($a > 0, a != 1, b > 0$).\
        • *Tính chất:* $log_a 1 = 0$, $log_a a = 1$, $a^(log_a b) = b$.\
        • *Quy tắc:* Tích thành Tổng, Thương thành Hiệu.\
        • *Đổi cơ số:* $log_a b = (log_c b)/(log_c a)$.\
        • *Log đặc biệt:* Thập phân ($lg x$), Tự nhiên ($ln x$).
      ]
    ]
  ),

  arr,

  // --- PHASE 2: HÀM SỐ ---
  fbox-header(color: C-PURPLE)[
    #align(center)[#text(size: 12pt, fill: white, weight: "bold")[GIAI ĐOẠN 2: HÀM SỐ & ĐỒ THỊ (HAI HÀM NGƯỢC NHAU)]]
  ],
  v(10pt),

  grid(
    columns: (1fr, 40pt, 1fr),
    gutter: 0pt,
    
    fbox(fill: color.mix((C-PURPLE, 5%), (white, 95%)), border: C-PURPLE)[
      #ftitle(color: C-PURPLE)[HÀM SỐ MŨ $y = a^x$]
      #v(6pt)
      #fsub[
        • *Tập xác định:* $D = RR$.\
        • *Tập giá trị:* $T = (0; +oo)$.\
        • *Tiệm cận:* Tiệm cận ngang $y = 0$.\
        • Đi qua điểm $(0; 1)$ và $(1; a)$.
      ]
    ],
    
    align(center + horizon)[
      #text(size: 12pt, fill: C-ROSE, weight: "bold")[Đối xứng qua \ $y = x$] \
      #text(size: 16pt, fill: luma(180))[↔]
    ],
    
    fbox(fill: color.mix((C-PURPLE, 5%), (white, 95%)), border: C-PURPLE)[
      #ftitle(color: C-PURPLE)[HÀM SỐ LOGARIT $y = log_a x$]
      #v(6pt)
      #fsub[
        • *Tập xác định:* $D = (0; +oo)$.\
        • *Tập giá trị:* $T = RR$.\
        • *Tiệm cận:* Tiệm cận đứng $x = 0$.\
        • Đi qua điểm $(1; 0)$ và $(a; 1)$.
      ]
    ]
  ),
  v(10pt),
  fbox(fill: color.mix((C-ROSE, 5%), (white, 95%)), border: C-ROSE)[
    #align(center)[
      #ftitle(color: C-ROSE)[TÍNH ĐƠN ĐIỆU CỦA CẢ HAI HÀM]
      #v(4pt)
      #fsub[
        *Nếu $a > 1$:* Hàm số Đồng Biến (Cùng chiều $a^x > a^y <=> x > y$).\
        *Nếu $0 < a < 1$:* Hàm số Nghịch Biến (Đảo chiều $a^x > a^y <=> x < y$).
      ]
    ]
  ],

  arr,

  // --- PHASE 3: PHƯƠNG TRÌNH ---
  fbox-header(color: C-AMBER)[
    #align(center)[#text(size: 12pt, fill: white, weight: "bold")[GIAI ĐOẠN 3: PHƯƠNG TRÌNH & BẤT PHƯƠNG TRÌNH]]
  ],
  v(10pt),
  
  grid(
    columns: (1fr, 20pt, 1fr, 20pt, 1fr),
    gutter: 0pt,
    fbox(fill: color.mix((C-AMBER, 5%), (white, 95%)), border: C-AMBER)[
      #ftitle(color: C-AMBER)[1. CÙNG CƠ SỐ]
      #v(6pt)
      #fsub[
        • $a^(f(x)) = a^(g(x)) <=> f(x) = g(x)$.\
        • $log_a f(x) = log_a g(x) <=> f(x) = g(x) > 0$.\
        • Quan trọng: Đừng quên điều kiện $X > 0$ của Logarit!
      ]
    ],
    [],
    fbox(fill: color.mix((C-AMBER, 5%), (white, 95%)), border: C-AMBER)[
      #ftitle(color: C-AMBER)[2. ĐẶT ẨN PHỤ]
      #v(6pt)
      #fsub[
        • Đặt $t = a^x$ (ĐK: $t > 0$). Chuyển về PT bậc hai $A t^2 + B t + C = 0$.\
        • Đặt $t = log_a x$ (Không cần ĐK).
      ]
    ],
    [],
    fbox(fill: color.mix((C-AMBER, 5%), (white, 95%)), border: C-AMBER)[
      #ftitle(color: C-AMBER)[3. LOGARIT HÓA]
      #v(6pt)
      #fsub[
        • Khi cơ số khác nhau, ta lấy logarit hai vế.\
        • Ví dụ: $2^x = 3^(x-1) => x = (x-1) log_2 3$.
      ]
    ]
  ),

  arr,

  // --- PHASE 4: ỨNG DỤNG THỰC TẾ ---
  fbox-header(color: C-TEAL)[
    #align(center)[#text(size: 12pt, fill: white, weight: "bold")[GIAI ĐOẠN 4: TOÁN THỰC TẾ (MÔ HÌNH HÓA THẾ GIỚI)]]
  ],
  v(10pt),
  grid(
    columns: (1fr, 20pt, 1fr),
    gutter: 0pt,
    fbox(fill: color.mix((C-TEAL, 5%), (white, 95%)), border: C-TEAL)[
      #ftitle(color: C-TEAL)[1. TÀI CHÍNH & KINH TẾ]
      #v(6pt)
      #fsub[
        • *Lãi kép:* $T = A(1 + r)^n$.\
        • *Lạm phát:* Tiền mất giá theo hàm mũ ngược.\
        • *Trả góp mua nhà:* Dòng tiền khấu hao (Amortization).
      ]
    ],
    [],
    fbox(fill: color.mix((C-TEAL, 5%), (white, 95%)), border: C-TEAL)[
      #ftitle(color: C-TEAL)[2. VẬT LÝ, Y TẾ & ĐỊA LÝ]
      #v(6pt)
      #fsub[
        • *Virus/Dân số:* $N(t) = N_0 e^(r t)$ (Tăng trưởng hàm mũ).\
        • *Carbon-14:* Phân rã xác định tuổi khảo cổ.\
        • *Richter & Decibel:* Động đất, cường độ âm thanh.\
        • *Newton:* Định luật làm nguội ly cà phê.
      ]
    ]
  )
)

#pagebreak()
