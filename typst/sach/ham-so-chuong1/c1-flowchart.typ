// Flowchart Tư duy vạn năng - Hàm số Lớp 12
// Pure Typst block/grid layout — Không dùng cetz/fletcher — Không bao giờ bị đè/tràn

// ── Màu ─────────────────────────────────────────────────────────
#let C-NAVY   = rgb("#0f4c81")
#let C-RED    = rgb("#b91c1c")
#let C-GREEN  = rgb("#15803d")
#let C-ORANGE = rgb("#c2410c")
#let C-PURPLE = rgb("#6d28d9")
#let C-TEAL   = rgb("#0f766e")
#let C-GRAY   = rgb("#374151")
#let C-GOLD   = rgb("#92400e")
#let C-INDIGO = rgb("#4f46e5")

#set text(font: "Times New Roman")

// ── Thành phần cơ bản ───────────────────────────────────────────
#let fbox(body, fill: white, border: C-GRAY) = block(
  width: 100%,
  fill: fill,
  stroke: 1.2pt + border,
  radius: 4pt,
  inset: (x: 10pt, y: 7pt),
  body
)

#let fbox-header(body, color: C-NAVY) = block(
  width: 100%,
  fill: color,
  stroke: 1.5pt + color.darken(25%),
  radius: 5pt,
  inset: (x: 12pt, y: 10pt),
  body
)

#let ftitle(body, color: C-NAVY) = text(
  size: 9pt, weight: "bold", fill: color
)[#body]

#let fsub(body) = text(size: 7.5pt, fill: C-GRAY)[#body]

// Mũi tên nhỏ
#let arr = align(center)[
  #v(0.15em)
  #text(size: 13pt, fill: C-GRAY)[▼]
  #v(0.1em)
]

// Mũi tên lớn, màu sắc
#let arr-bold(color) = align(center)[
  #v(0.2em)
  #text(size: 18pt, weight: "bold", fill: color)[▼]
  #v(0.1em)
]

// Nhãn bên trên mũi tên (giải thích)
#let step-label(n, body) = align(center)[
  #box(
    fill: C-GRAY.lighten(85%),
    stroke: 0.5pt + C-GRAY,
    radius: 3pt,
    inset: (x: 6pt, y: 3pt)
  )[#text(size: 7pt, fill: C-GRAY)[#n — #body]]
]

// ══════════════════════════════════════════════════════════════
// FLOWCHART BẮT ĐẦU
// ══════════════════════════════════════════════════════════════

// Tiêu đề trang
#align(center)[
  #v(0.2em)
  #text(size: 15pt, weight: "bold", fill: C-NAVY)[🧠 TƯ DUY VẠN NĂNG — CHƯƠNG HÀM SỐ]
  #v(0.25em)
  #text(size: 9pt, fill: C-GRAY, style: "italic")[
    "Từ 1 hàm số $y = f(x)$, khảo sát toàn bộ kiến thức liên quan"
  ]
  #v(0.6em)
]

// ── TẦNG 1: ĐIỂM XUẤT PHÁT ──────────────────────────────────
#fbox(
  align(center)[
    #ftitle(color: C-TEAL)[📌 TẦNG 1 — ĐIỂM XUẤT PHÁT: Xác định hàm số]
    #v(3pt)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      column-gutter: 0.4em,
      fbox(
        align(center)[
          #fsub[*Công thức*\ $y = f(x)$]
        ], fill: C-TEAL.lighten(92%), border: C-TEAL
      ),
      fbox(
        align(center)[
          #fsub[*Đồ thị*\ Đọc từ hình vẽ]
        ], fill: C-TEAL.lighten(92%), border: C-TEAL
      ),
      fbox(
        align(center)[
          #fsub[*Bảng số liệu*\ Dạng bảng $x, y$]
        ], fill: C-TEAL.lighten(92%), border: C-TEAL
      ),
      fbox(
        align(center)[
          #fsub[*Lời văn*\ Bài toán thực tế]
        ], fill: C-TEAL.lighten(92%), border: C-TEAL
      ),
      fbox(
        align(center)[
          #fsub[*Tham số*\ Hàm $f(x; m)$]
        ], fill: C-TEAL.lighten(92%), border: C-TEAL
      ),
    )
  ],
  fill: C-TEAL.lighten(93%), border: C-TEAL
)

#arr
// ── TẦNG 2: NỘI SUY ─────────────────────────────────────────
#fbox(
  align(center)[
    #ftitle(color: C-TEAL)[🔍 TẦNG 2 — NỘI SUY HÀM SỐ: Tìm biểu thức $y = f(x)$]
    #v(2pt)
    #fsub[Từ bảng giá trị / điều kiện bài toán → Lập PT → Xác định dạng hàm → Tìm hệ số]
  ],
  fill: C-TEAL.lighten(93%), border: C-TEAL
)

#arr-bold(C-NAVY)

// ── TẦNG 3: HÀM SỐ TRUNG TÂM ────────────────────────────────
#fbox-header(
  align(center)[
    #text(size: 13pt, weight: "bold", fill: white)[
      ⚙ TẦNG 3 — HÀM SỐ $y = f(x)$ — TRUNG TÂM TƯ DUY
    ]
    #v(3pt)
    #text(size: 8pt, fill: white.lighten(15%))[
      Ba hướng khai thác chính: Tập xác định · Đạo hàm · Giới hạn
    ]
  ],
  color: C-NAVY
)

#v(0.4em)
// Ba nhánh cấp 1
#grid(
  columns: (1fr, 1.3fr, 1fr),
  column-gutter: 0.5em,

  // Cột TXD
  stack(dir: ttb, spacing: 0.35em,
    fbox(
      align(center)[
        #ftitle(color: C-GREEN)[📐 Tập xác định $D$]
        #v(2pt)
        #fsub[Tìm điều kiện $x$ để $f(x)$ xác định\ Chia trường hợp nếu có tham số]
        #v(4pt)
        #box(
          fill: C-GREEN.lighten(88%),
          stroke: 0.5pt + C-GREEN, radius: 3pt,
          inset: (x: 6pt, y: 4pt), width: 100%
        )[
          #fsub[→ *Tính chẵn lẻ:*\ $f(-x) = f(x)$? Hàm chẵn\ $f(-x) = -f(x)$? Hàm lẻ]
        ]
        #v(3pt)
        #box(
          fill: C-GREEN.lighten(88%),
          stroke: 0.5pt + C-GREEN, radius: 3pt,
          inset: (x: 6pt, y: 4pt), width: 100%
        )[
          #fsub[→ *Tính tuần hoàn:*\ $f(x+T) = f(x)$]
        ]
      ],
      fill: rgb("#f0fdf4"), border: C-GREEN
    ),
  ),

  // Cột Đạo hàm
  stack(dir: ttb, spacing: 0.35em,
    fbox(
      align(center)[
        #ftitle(color: C-NAVY)[📉 Đạo hàm $y'$ và $y''$]
        #v(2pt)
        #fsub[Tính $y'$, tìm nghiệm $y' = 0$, dấu $y'$]
        #v(4pt)
        #grid(
          columns: (1fr, 1fr, 1fr),
          column-gutter: 0.3em,
          box(
            fill: C-NAVY.lighten(90%), stroke: 0.5pt + C-NAVY,
            radius: 3pt, inset: 5pt, width: 100%
          )[#fsub[*Đơn điệu*\ ĐB/NB]],
          box(
            fill: C-NAVY.lighten(90%), stroke: 0.5pt + C-NAVY,
            radius: 3pt, inset: 5pt, width: 100%
          )[#fsub[*Cực trị*\ CĐ/CT]],
          box(
            fill: C-NAVY.lighten(90%), stroke: 0.5pt + C-NAVY,
            radius: 3pt, inset: 5pt, width: 100%
          )[#fsub[*GTLN–GTNN*\ Max/Min]],
        )
        #v(4pt)
        #box(
          fill: C-NAVY.lighten(90%),
          stroke: 0.5pt + C-NAVY, radius: 3pt,
          inset: (x: 6pt, y: 4pt), width: 100%
        )[
          #fsub[*Đạo hàm cấp 2 $y''$:*\ Lồi/lõm · Điểm uốn]
        ]
      ],
      fill: rgb("#eff6ff"), border: C-NAVY
    ),
  ),

  // Cột Giới hạn
  stack(dir: ttb, spacing: 0.35em,
    fbox(
      align(center)[
        #ftitle(color: C-PURPLE)[∞ Giới hạn hàm số]
        #v(2pt)
        #fsub[$limits(lim)_(x -> x_0) f(x)$, #h(0.3em) $limits(lim)_(x -> ±oo) f(x)$]
        #v(4pt)
        #box(
          fill: C-PURPLE.lighten(88%),
          stroke: 0.5pt + C-PURPLE, radius: 3pt,
          inset: (x: 6pt, y: 4pt), width: 100%
        )[
          #fsub[→ *Tiệm cận đứng:*\ $limits(lim)_(x -> x_0) f(x) = ±oo$]
        ]
        #v(3pt)
        #box(
          fill: C-PURPLE.lighten(88%),
          stroke: 0.5pt + C-PURPLE, radius: 3pt,
          inset: (x: 6pt, y: 4pt), width: 100%
        )[
          #fsub[→ *Tiệm cận ngang:*\ $lim_(x -> ±oo) f(x) = L$]
        ]
        #v(3pt)
        #box(
          fill: C-PURPLE.lighten(88%),
          stroke: 0.5pt + C-PURPLE, radius: 3pt,
          inset: (x: 6pt, y: 4pt), width: 100%
        )[
          #fsub[→ *Tiệm cận xiên:*\ $y = a x + b$, $a eq.not 0$]
        ]
      ],
      fill: rgb("#faf5ff"), border: C-PURPLE
    ),
  ),
)

#arr-bold(C-NAVY)

// ── TẦNG 4: BẢNG BIẾN THIÊN ─────────────────────────────────
#fbox-header(
  align(center)[
    #text(size: 12pt, weight: "bold", fill: white)[
      📊 TẦNG 4 — BẢNG BIẾN THIÊN
    ]
    #v(3pt)
    #text(size: 8pt, fill: white.lighten(15%))[
      Tổng hợp tất cả: TXD · Nghiệm $y'$ · Chiều biến thiên · Cực trị · GTLN-GTNN · Tiệm cận
    ]
  ],
  color: C-NAVY
)

#arr-bold(C-RED)

// ── TẦNG 5: ĐỒ THỊ ──────────────────────────────────────────
#fbox-header(
  align(center)[
    #text(size: 12pt, weight: "bold", fill: white)[
      📈 TẦNG 5 — ĐỒ THỊ HÀM SỐ
    ]
    #v(3pt)
    #text(size: 8pt, fill: white.lighten(15%))[
      Vẽ đồ thị · Nhận dạng dạng đồ thị · Đọc tính chất từ đồ thị
    ]
  ],
  color: C-RED
)

#v(0.4em)

// ── TẦNG 6: PHÉP BIẾN ĐỔI ĐỒ THỊ & TÍNH ĐỐI XỨNG ─────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-TEAL)[🔄 TẦNG 6 — PHÉP BIẾN ĐỔI ĐỒ THỊ & TÍNH ĐỐI XỨNG]]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 0.5em,
      fbox(
        align(center)[
          #ftitle(color: C-TEAL)[Biến đổi Tịnh tiến]
          #v(2pt)
          #fsub[$y = f(x) + a$: Lên/xuống $a$ đv\ $y = f(x+a)$: Trái/phải $a$ đv]
        ], fill: C-TEAL.lighten(91%), border: C-TEAL
      ),
      fbox(
        align(center)[
          #ftitle(color: C-TEAL)[Biến đổi Trị tuyệt đối]
          #v(2pt)
          #fsub[$y = |f(x)|$: Giữ phần trên Ox, lật phần dưới lên trên\ $y = f(|x|)$: Giữ bên phải Oy, lấy đối xứng sang trái]
        ], fill: C-TEAL.lighten(91%), border: C-TEAL
      ),
      fbox(
        align(center)[
          #ftitle(color: C-TEAL)[Tính đối xứng]
          #v(2pt)
          #fsub[Hàm bậc 3: Điểm uốn là tâm đối xứng\ Phân thức: Giao 2 tiệm cận là tâm đối xứng]
        ], fill: C-TEAL.lighten(91%), border: C-TEAL
      ),
    )
  ],
  fill: C-TEAL.lighten(93%), border: C-TEAL
)

#arr

// ── TẦNG 7: BÀI TOÁN LIÊN QUAN ──────────────────────────────
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.5em,
  fbox(
    align(center)[
      #ftitle(color: C-ORANGE)[🔀 Tương giao đồ thị]
      #v(3pt)
      #fsub[Giải PT $f(x) = g(x)$\ ↔ Tìm số giao điểm\ của 2 đường cong]
      #v(4pt)
      #box(
        fill: C-ORANGE.lighten(88%), stroke: 0.5pt + C-ORANGE,
        radius: 3pt, inset: 5pt, width: 100%
      )[#fsub[→ Dùng BBT + đồ thị\ để đếm nghiệm]]
    ],
    fill: rgb("#fff7ed"), border: C-ORANGE
  ),
  fbox(
    align(center)[
      #ftitle(color: C-ORANGE)[📐 Tiếp tuyến đồ thị]
      #v(3pt)
      #fsub[$y = f'(x_0)(x - x_0) + f(x_0)$]
      #v(4pt)
      #box(
        fill: C-ORANGE.lighten(88%), stroke: 0.5pt + C-ORANGE,
        radius: 3pt, inset: 5pt, width: 100%
      )[#fsub[Tiếp tuyến tại $M(x_0, y_0)$]]
      #v(3pt)
      #box(
        fill: C-ORANGE.lighten(88%), stroke: 0.5pt + C-ORANGE,
        radius: 3pt, inset: 5pt, width: 100%
      )[#fsub[TT song song / vuông góc\ với đường thẳng cho trước]]
    ],
    fill: rgb("#fff7ed"), border: C-ORANGE
  ),
  fbox(
    align(center)[
      #ftitle(color: C-ORANGE)[🔢 Biện luận tham số $m$]
      #v(3pt)
      #fsub[PT $f(x) = m$ có $k$ nghiệm\ ↔ Đường $y = m$ cắt đồ thị $k$ lần]
      #v(4pt)
      #box(
        fill: C-ORANGE.lighten(88%), stroke: 0.5pt + C-ORANGE,
        radius: 3pt, inset: 5pt, width: 100%
      )[#fsub[→ Dùng BBT tìm min/max\ → Biện luận theo $m$]]
    ],
    fill: rgb("#fff7ed"), border: C-ORANGE
  ),
)

#arr

// ── TẦNG 8: TƯ DUY 2 CHIỀU f(x) <--> f'(x) ──────────────────────
#fbox-header(
  [
    #align(center)[#text(size: 11pt, weight: "bold", fill: white)[🔄 TẦNG 8 — TƯ DUY 2 CHIỀU: MỐI LIÊN HỆ $f(x) arrow.l.r f'(x)$]]
    #v(4pt)
    #grid(
      columns: (1fr, auto, 1fr),
      column-gutter: 0.8em,
      align: horizon,
      // Cột trái: f -> f'
      box(fill: white, stroke: 1.5pt+C-NAVY, radius:4pt, inset:8pt, width:100%)[
        #align(center)[#ftitle(color: C-NAVY)[Chiều xuôi: $f(x) arrow.r f'(x)$]]
        #v(3pt)
        #fsub[
          ▸ $f(x)$ đồng biến $=> f'(x) >= 0$\
          ▸ $f(x)$ đạt cực trị tại $x_0 => f'(x_0) = 0$\
          ▸ Điểm uốn của $f(x) =>$ Cực trị của $f'(x)$\
          *(Từ hình dáng $f(x)$ suy ra dấu, nghiệm của $f'(x)$)*
        ]
      ],
      // Mũi tên 2 chiều
      align(center)[
        #text(size: 20pt, weight: "bold", fill: white)[$arrow.l.r$]
      ],
      // Cột phải: f' -> f
      box(fill: white, stroke: 1.5pt+C-RED, radius:4pt, inset:8pt, width:100%)[
        #align(center)[#ftitle(color: C-RED)[Chiều ngược: $f'(x) arrow.r f(x)$]]
        #v(3pt)
        #fsub[
          ▸ Đồ thị $f'(x)$ cắt $O x =>$ Cực trị của $f(x)$\
          ▸ Phần $f'(x)$ trên/dưới $O x => f(x)$ ĐB/NB\
          ▸ *Phục hồi hàm:* Cần $integral f'(x) d x$ và **1 điều kiện $f(x_0)=y_0$**\
          ▸ *So sánh GT cực trị:* Dùng diện tích $integral_a^b f'(x) d x$
        ]
      ]
    )
  ],
  color: C-INDIGO
)

#arr

// ── TẦNG 9: HÀM HỢP & HÀM ẨN (VẬN DỤNG CAO) ───────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-RED.darken(10%))[🔥 TẦNG 9 — HÀM HỢP & HÀM ẨN (VẬN DỤNG CAO)]]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 0.5em,
      fbox(
        align(center)[
          #ftitle(color: C-RED.darken(10%))[Đơn điệu hàm hợp]
          #v(2pt)
          #fsub[Xét $g(x) = f(u(x))$\ Đạo hàm: $g'(x) = u'(x) dot f'(u(x))$\ Giải PT $g'(x) = 0$ và xét dấu]
        ], fill: C-RED.lighten(93%), border: C-RED.darken(10%)
      ),
      fbox(
        align(center)[
          #ftitle(color: C-RED.darken(10%))[Cực trị hàm hợp / hàm ẩn]
          #v(2pt)
          #fsub[Tìm số nghiệm bội lẻ của PT $g'(x) = 0$\ Dùng sơ đồ V (ghép trục) để giải nhanh cực trị]
        ], fill: C-RED.lighten(93%), border: C-RED.darken(10%)
      ),
      fbox(
        align(center)[
          #ftitle(color: C-RED.darken(10%))[Tương giao hàm hợp]
          #v(2pt)
          #fsub[Giải $f(u(x)) = m$:\ Đặt $t = u(x)$, tìm điều kiện của $t$\ Dựa vào đồ thị $f(t)$ để biện luận nghiệm]
        ], fill: C-RED.lighten(93%), border: C-RED.darken(10%)
      ),
    )
  ],
  fill: C-RED.lighten(95%), border: C-RED.darken(10%)
)

#arr

// ── TẦNG 10: HÀM ĐA BIỂU THỨC ────────────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-GOLD)[🔷 TẦNG 10 — HÀM ĐA BIỂU THỨC (Hàm phân đoạn)]]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 0.5em,
      row-gutter: 0.4em,
      // Ô 1
      fbox(
        align(center)[
          #ftitle(color: C-GOLD)[Xác định TXD]
          #v(2pt)
          #fsub[Tính TXD từng phần\ rồi hợp lại: $D = D_1 union D_2 union ...$]
        ], fill: C-GOLD.lighten(91%), border: C-GOLD
      ),
      // Ô 2
      fbox(
        align(center)[
          #ftitle(color: C-GOLD)[Kiểm tra liên tục]
          #v(2pt)
          #fsub[Tại điểm nối $x = c$:\ $limits(lim)_(x -> c^-) f(x) = limits(lim)_(x -> c^+) f(x) = f(c)$?]
        ], fill: C-GOLD.lighten(91%), border: C-GOLD
      ),
      // Ô 3
      fbox(
        align(center)[
          #ftitle(color: C-GOLD)[Đạo hàm tại điểm nối]
          #v(2pt)
          #fsub[Tính $f'(c^-)$ và $f'(c^+)$\ Nếu bằng nhau → có đạo hàm tại $c$ (đồ thị trơn)]
        ], fill: C-GOLD.lighten(91%), border: C-GOLD
      ),
    )
    #v(3pt)
    #align(center)[#fsub[
      *Ví dụ dạng hàm đa biểu thức:*
      $f(x) = cases(x^2 + 1 & "nếu" x >= 0, -x + 3 & "nếu" x < 0)$ — 
      *Bài toán tham số:* Tìm $m$ để hàm liên tục / có đạo hàm tại $x = c$
    ]]
  ],
  fill: C-GOLD.lighten(93%), border: C-GOLD
)

#arr

// ── TẦNG 11: ỨNG DỤNG THỰC TẾ ────────────────────────────────
// 11a - Tiêu đề tầng
#block(
  width: 100%, fill: C-PURPLE, stroke: 1.5pt + C-PURPLE.darken(20%),
  radius: 5pt, inset: (x: 12pt, y: 8pt),
  align(center)[
    #text(size: 11pt, weight: "bold", fill: white)[🌍 TẦNG 11 — ỨNG DỤNG THỰC TẾ]
    #h(1em)
    #text(size: 8pt, fill: white.lighten(20%))[Toán tối ưu hóa · Hàm kinh tế · Vật lý · Hình học · Thuế lũy tiến]
  ]
)

#v(0.35em)

// 8b - Hàng 1: 3 nhóm ứng dụng lớn
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.5em,

  // Nhóm 1: TỐI ƯU HÓA HÌNH HỌC
  fbox(
    [
      #align(center)[#ftitle(color: C-GREEN)[📐 Tối ưu hóa Hình học]]
      #v(3pt)
      #box(fill: C-GREEN.lighten(88%), stroke: 0.5pt+C-GREEN, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Diện tích / Chu vi lớn nhất:*\ Lập $S(x)$ hoặc $C(x)$ → Tìm Max]
      ]
      #v(3pt)
      #box(fill: C-GREEN.lighten(88%), stroke: 0.5pt+C-GREEN, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Thể tích lớn nhất:*\ Hộp không nắp, bể chứa, hình trụ nội tiếp]
      ]
      #v(3pt)
      #box(fill: C-GREEN.lighten(88%), stroke: 0.5pt+C-GREEN, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Khoảng cách nhỏ nhất:*\ Từ điểm đến đường cong]
      ]
    ],
    fill: C-GREEN.lighten(94%), border: C-GREEN
  ),

  // Nhóm 2: VẬT LÝ - CHUYỂN ĐỘNG
  fbox(
    [
      #align(center)[#ftitle(color: C-NAVY)[⚡ Vật lý & Chuyển động]]
      #v(3pt)
      #box(fill: C-NAVY.lighten(88%), stroke: 0.5pt+C-NAVY, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Phương trình chuyển động:* $s(t)$\ Vận tốc $v = s'(t)$, Gia tốc $a = v'(t)$]
      ]
      #v(3pt)
      #box(fill: C-NAVY.lighten(88%), stroke: 0.5pt+C-NAVY, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Vật dừng:* $v(t) = 0$\ *Vật đổi chiều:* $v$ đổi dấu]
      ]
      #v(3pt)
      #box(fill: C-NAVY.lighten(88%), stroke: 0.5pt+C-NAVY, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Quãng đường dài nhất:*\ Tìm Max $s(t)$ trên $[t_1, t_2]$]
      ]
    ],
    fill: rgb("#eff6ff"), border: C-NAVY
  ),

  // Nhóm 3: TOÁN KINH TẾ
  fbox(
    [
      #align(center)[#ftitle(color: C-RED)[💰 Toán Kinh tế]]
      #v(3pt)
      #box(fill: C-RED.lighten(88%), stroke: 0.5pt+C-RED, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Hàm cầu/cung:* $Q = f(P)$\ Điểm cân bằng: $Q_d = Q_s$]
      ]
      #v(3pt)
      #box(fill: C-RED.lighten(88%), stroke: 0.5pt+C-RED, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Doanh thu:* $R(x) = x dot P(x)$\ *Chi phí:* $C(x)$ · *Lợi nhuận:* $L = R - C$]
      ]
      #v(3pt)
      #box(fill: C-RED.lighten(88%), stroke: 0.5pt+C-RED, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Tối đa hóa lợi nhuận:*\ $L'(x) = 0$ → tìm sản lượng tối ưu]
      ]
    ],
    fill: rgb("#fff1f2"), border: C-RED
  ),
)

#v(0.35em)

// 8c - Hàng 2: thuế lũy tiến + đa điều kiện + chi phí biên
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.5em,

  // Thuế lũy tiến
  fbox(
    [
      #align(center)[#ftitle(color: C-GOLD)[📊 Thuế lũy tiến]]
      #v(3pt)
      #fsub[
        Hàm thuế $T(x)$ là *hàm đa biểu thức:*
      ]
      #v(3pt)
      #box(fill: C-GOLD.lighten(88%), stroke: 0.5pt+C-GOLD, radius:3pt, inset:5pt, width:100%)[
        #fsub[
          $T(x) = cases(
            5% dot x & x <= 60","tr,
            3","tr + 10% dot (x-60) & 60 < x <= 120","tr,
            9","tr + 15% dot (x-120) & x > 120","tr
          )$
        ]
      ]
      #v(3pt)
      #box(fill: C-GOLD.lighten(88%), stroke: 0.5pt+C-GOLD, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ Tính thuế tại $x = c$: xác định $c$ thuộc khoảng nào\ ▸ Kiểm tra tính liên tục tại điểm nối]
      ]
    ],
    fill: C-GOLD.lighten(93%), border: C-GOLD
  ),

  // Đa điều kiện
  fbox(
    [
      #align(center)[#ftitle(color: C-ORANGE)[📋 Bài toán Đa điều kiện]]
      #v(3pt)
      #box(fill: C-ORANGE.lighten(88%), stroke: 0.5pt+C-ORANGE, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Giá vé theo số lượng:*\ $P = f(n)$ — giảm giá nếu $n > N_0$]
      ]
      #v(3pt)
      #box(fill: C-ORANGE.lighten(88%), stroke: 0.5pt+C-ORANGE, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Chi phí điện nước:*\ Bậc thang $C = g(x)$ — đa mức giá]
      ]
      #v(3pt)
      #box(fill: C-ORANGE.lighten(88%), stroke: 0.5pt+C-ORANGE, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Lương/Thưởng có điều kiện:*\ $W = h(x)$ — đa ngưỡng KPI]
      ]
      #v(3pt)
      #box(fill: C-ORANGE.lighten(88%), stroke: 0.5pt+C-ORANGE, radius:3pt, inset:5pt, width:100%)[
        #fsub[→ *Quy trình:* Lập hàm → Tìm TXD → BBT → Tối ưu]
      ]
    ],
    fill: rgb("#fff7ed"), border: C-ORANGE
  ),

  // Tăng trưởng, Nồng độ thuốc (Toán Y sinh học)
  fbox(
    [
      #align(center)[#ftitle(color: C-PURPLE)[💊 Tăng trưởng & Y sinh]]
      #v(3pt)
      #box(fill: C-PURPLE.lighten(88%), stroke: 0.5pt+C-PURPLE, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Dân số/Vi khuẩn:* $P(t) = P_0 e^(r t)$\ Tốc độ tăng trưởng là đạo hàm $P'(t)$]
      ]
      #v(3pt)
      #box(fill: C-PURPLE.lighten(88%), stroke: 0.5pt+C-PURPLE, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Nồng độ thuốc trong máu:* $C(t) = (a t)/(t^2+b)$\ Tìm thời điểm $t$ để nồng độ Max]
      ]
      #v(3pt)
      #box(fill: C-PURPLE.lighten(88%), stroke: 0.5pt+C-PURPLE, radius:3pt, inset:5pt, width:100%)[
        #fsub[▸ *Tối ưu vật liệu:* Tìm kích thước (bán kính $r$, chiều cao $h$) để chi phí làm hộp, lon sữa là nhỏ nhất]
      ]
    ],
    fill: rgb("#fdf4ff"), border: C-PURPLE
  ),
)

#v(0.35em)

// 8d - Tổng kết quy trình vạn năng
#block(
  width: 100%,
  fill: C-NAVY.lighten(90%),
  stroke: 1.5pt + C-NAVY,
  radius: 5pt,
  inset: (x: 12pt, y: 10pt),
  [
    #align(center)[#ftitle(color: C-NAVY)[🏆 QUY TRÌNH VẠN NĂNG — Áp dụng cho MỌI bài toán Hàm số]]
    #v(5pt)
    #grid(
      columns: (auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr),
      column-gutter: 0.2em,
      align: horizon,
      // Step 1
      box(fill: C-TEAL, stroke: none, radius:3pt, inset:(x:5pt,y:4pt))[
        #text(size:8pt, weight:"bold", fill:white)[① Lập hàm]
      ],
      align(center)[#text(size:14pt, fill:C-GRAY)[→]],
      // Step 2
      box(fill: C-GREEN, stroke: none, radius:3pt, inset:(x:5pt,y:4pt))[
        #text(size:8pt, weight:"bold", fill:white)[② Tìm TXD]
      ],
      align(center)[#text(size:14pt, fill:C-GRAY)[→]],
      // Step 3
      box(fill: C-NAVY, stroke: none, radius:3pt, inset:(x:5pt,y:4pt))[
        #text(size:8pt, weight:"bold", fill:white)[③ Xét $y'$]
      ],
      align(center)[#text(size:14pt, fill:C-GRAY)[→]],
      // Step 4
      box(fill: C-NAVY, stroke: none, radius:3pt, inset:(x:5pt,y:4pt))[
        #text(size:8pt, weight:"bold", fill:white)[④ Lập BBT]
      ],
      align(center)[#text(size:14pt, fill:C-GRAY)[→]],
      // Step 5
      box(fill: C-RED, stroke: none, radius:3pt, inset:(x:5pt,y:4pt))[
        #text(size:8pt, weight:"bold", fill:white)[⑤ Kết luận]
      ],
      // Spacer
      [],
    )
  ]
)
