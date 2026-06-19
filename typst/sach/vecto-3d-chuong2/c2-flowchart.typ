#import "_config.typ": *

#set text(font: "Times New Roman")

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

// ── Thành phần cơ bản ───────────────────────────────────────────
#let ftitle(color: black, body) = text(fill: color, weight: "bold", size: 10.5pt)[#body]
#let fsub(body) = text(size: 9pt, fill: luma(60))[#par(leading: 0.6em)[#body]]

#let fbox(body, fill: white, border: black) = box(
  fill: fill, 
  stroke: 1.2pt + border, 
  radius: 4pt, 
  inset: (x: 8pt, y: 8pt), 
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
  #text(fill: luma(150), size: 14pt)[▼]
  #v(2pt)
]

// =====================================================================
// BẮT ĐẦU FLOWCHART
// =====================================================================

#align(center)[
  #text(size: 16pt, weight: "bold", fill: C-NAVY)[TƯ DUY VẠN NĂNG HÌNH HỌC OXYZ - BÁM SÁT THỰC TẾ SGK MỚI]
  #v(4pt)
  #text(size: 10pt, style: "italic", fill: luma(100))[Biến không gian ảo thành các bài toán thực tiễn: Kiến trúc, Hàng không, GPS, Xây dựng]
]
#v(1em)

// ── TẦNG 1: NỀN TẢNG OXYZ ────────────────────────────────────────
#fbox-header(color: C-NAVY)[
  #align(center)[#text(size: 11pt, weight: "bold", fill: white)[📍 TẦNG 1 — ĐIỂM & VECTƠ CƠ BẢN (Nền móng)]]
  #v(4pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.5em,
    fbox(
      align(center)[
        #ftitle(color: C-NAVY)[Tọa độ Điểm & Trung điểm]
        #v(2pt)
        #fsub[▸ Vectơ: $arrow(A B) = (x_B - x_A, y_B - y_A, z_B - z_A)$\ ▸ Trung điểm $I$: $I = display((A+B)/2)$\ ▸ Trọng tâm $Delta A B C$: $G = display((A+B+C)/3)$\ ▸ Trọng tâm tứ diện: $G = display((A+B+C+D)/4)$]
      ], fill: white, border: C-NAVY.lighten(40%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-NAVY)[Phép toán Vectơ]
        #v(2pt)
        #fsub[▸ $arrow(a) +- arrow(b) = (x_a +- x_b, y_a +- y_b, z_a +- z_b)$\ ▸ Cùng phương ($arrow(a) = k arrow(b)$):\ $display(x_a / x_b) = display(y_a / y_b) = display(z_a / z_b) = k$]
      ], fill: white, border: C-NAVY.lighten(40%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-NAVY)[Tích vô hướng & Độ dài]
        #v(2pt)
        #fsub[▸ $arrow(a) dot arrow(b) = x_a x_b + y_a y_b + z_a z_b$\ ▸ Độ dài: $|arrow(a)| = sqrt(x_a^2 + y_a^2 + z_a^2)$\ ▸ Vuông góc: $arrow(a) dot arrow(b) = 0$]
      ], fill: white, border: C-NAVY.lighten(40%)
    ),
  )
]

#arr

// ── TẦNG 2: KỸ NĂNG GẮN HỆ TRỤC TỌA ĐỘ ──────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-TEAL)[🎯 TẦNG 2 — TỌA ĐỘ HÓA THỰC TẾ (CHÌA KHÓA VẠN NĂNG)]]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 0.5em,
      fbox(
        align(center)[
          #ftitle(color: C-TEAL)[Cách gắn Gốc tọa độ $O(0,0,0)$]
          #v(2pt)
          #fsub[▸ *Kiến trúc / Xây dựng:* Chọn góc phòng, chân cột, hoặc tâm móng nhà làm Gốc $O$.\ ▸ *Hàng không / Ra-đa:* Trạm kiểm soát không lưu hoặc đài phát sóng là $O(0,0,0)$.]
        ], fill: C-TEAL.lighten(91%), border: C-TEAL
      ),
      fbox(
        align(center)[
          #ftitle(color: C-TEAL)[Định hướng Trục $O x, O y, O z$]
          #v(2pt)
          #fsub[▸ Trục $O z$: Luôn hướng thẳng đứng lên trên (chiều cao cột, độ cao máy bay).\ ▸ Trục $O x, O y$: Nằm ngang trên mặt đất, dọc theo các mép tường vuông góc hoặc hướng Đông/Bắc.]
        ], fill: C-TEAL.lighten(91%), border: C-TEAL
      ),
    )
  ],
  fill: C-TEAL.lighten(93%), border: C-TEAL
)

#arr

// ── TẦNG 3: ĐỘNG HỌC & KIỂM SOÁT KHÔNG LƯU ──────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-PURPLE)[✈️ TẦNG 3 — ĐỘNG HỌC HÀNG KHÔNG & KIỂM SOÁT RA-ĐA]]
    #v(4pt)
    #grid(
      columns: (1fr, 1.2fr, 1fr),
      column-gutter: 0.5em,
      fbox(
        align(center)[
          #ftitle(color: C-PURPLE)[Chuyển động (Vận tốc, Quãng đường)]
          #v(2pt)
          #fsub[▸ Vật đi qua $A$ với vectơ vận tốc $arrow(v)$.\ ▸ *Tốc độ* (Speed): $v = |arrow(v)|$.\ ▸ *Quãng đường:* $s = |arrow(v)| dot t$.\ ▸ Gió cản/xuôi: $arrow(v)_"thực" = arrow(v)_"máy bay" + arrow(v)_"gió"$.]
        ], fill: C-PURPLE.lighten(93%), border: C-PURPLE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-PURPLE)[Phương trình Quỹ đạo (Vị trí)]
          #v(2pt)
          #fsub[▸ Vị trí máy bay lúc $t$:\ $M(t) = A + t dot arrow(v) => cases(x = x_A + v_x t, y = y_A + v_y t, z = z_A + v_z t)$\ ▸ *Va chạm:* 2 vật đâm nhau $<=>$ Tồn tại CÙNG 1 thời điểm $t$ sao cho tọa độ $M_1(t) = M_2(t)$.]
        ], fill: C-PURPLE.lighten(93%), border: C-PURPLE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-PURPLE)[Bài toán Ra-đa (Mặt cầu)]
          #v(2pt)
          #fsub[▸ Ra-đa tại $I$, tầm quét $R$. Phương trình không gian quét: $(x-a)^2+(y-b)^2+(z-c)^2 <= R^2$.\ ▸ Phát hiện vật thể: Nếu $d(I, M) <= R$.]
        ], fill: C-PURPLE.lighten(93%), border: C-PURPLE
      ),
    )
  ],
  fill: C-PURPLE.lighten(95%), border: C-PURPLE
)

#arr

// ── TẦNG 4: XÂY DỰNG, KIẾN TRÚC & LỰC ──────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-GOLD)[🏗️ TẦNG 4 — ỨNG DỤNG XÂY DỰNG, KIẾN TRÚC & TĨNH HỌC]]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 0.5em,
      fbox(
        align(center)[
          #ftitle(color: C-GOLD)[Tĩnh học & Cân bằng lực]
          #v(2pt)
          #fsub[▸ Các lực căng cáp treo, cần cẩu: $arrow(F)_1, arrow(F)_2, ...$\ ▸ *Vật cân bằng* $\<=>$ $sum arrow(F) = arrow(0)$.\ ▸ *Công của lực* $arrow(F)$ đẩy vật dời theo $arrow(d)$:\ $A = arrow(F) dot arrow(d)$ (Đơn vị Joule).]
        ], fill: C-GOLD.lighten(91%), border: C-GOLD
      ),
      fbox(
        align(center)[
          #ftitle(color: C-GOLD)[Tính diện tích mái nhà / Vật liệu]
          #v(2pt)
          #fsub[▸ Diện tích tấm pin mặt trời, mái ngói (Tam giác):\ $S = display(1 / 2) |[arrow(A B), arrow(A C)]|$\ ▸ Thể tích không gian phòng (để lắp Điều hòa): $V = display(1 / 6) |[arrow(A B), arrow(A C)] dot arrow(A D)|$]
        ], fill: C-GOLD.lighten(91%), border: C-GOLD
      ),
      fbox(
        align(center)[
          #ftitle(color: C-GOLD)[Góc nghiêng tối ưu]
          #v(2pt)
          #fsub[▸ Lắp pin mặt trời phải tạo góc $alpha$ với mặt ngang $(O x y)$ để đón nắng.\ ▸ Tính Cos góc giữa mặt phẳng tấm pin và mặt $(O x y)$:\ $cos alpha = display( (|arrow(n)_"pin" dot arrow(k)|) / (|arrow(n)_"pin"|) )$.]
        ], fill: C-GOLD.lighten(91%), border: C-GOLD
      ),
    )
  ],
  fill: C-GOLD.lighten(93%), border: C-GOLD
)

#arr

// ── TẦNG 5: MẶT PHẲNG VÀ ĐƯỜNG THẲNG (HÌNH HỌC LÝ THUYẾT) ──────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-ORANGE)[📏 TẦNG 5 — PHƯƠNG TRÌNH ĐƯỜNG & MẶT (LÝ THUYẾT NỀN)]]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 0.5em,
      fbox(
        align(center)[
          #ftitle(color: C-ORANGE)[Phương trình Mặt Phẳng $(P)$]
          #v(2pt)
          #fsub[▸ Cần 1 Điểm + 1 VTPT $arrow(n) = (A,B,C)$.\ ▸ PT: $A(x - x_0) + B(y - y_0) + C(z - z_0) = 0$\ ▸ Tìm VTPT: $arrow(n) = [arrow(u)_1, arrow(u)_2]$ (Tích có hướng 2 VTCP).\ ▸ Khoảng cách: Điểm đến mặt (Đo chiều cao tòa nhà).\ $d(M, (P)) = display( |A x_0 + B y_0 + C z_0 + D| / sqrt(A^2 + B^2 + C^2) )$]
        ], fill: C-ORANGE.lighten(88%), border: C-ORANGE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-ORANGE)[Phương trình Đường Thẳng $d$]
          #v(2pt)
          #fsub[▸ Cần 1 Điểm + 1 VTCP $arrow(u) = (a,b,c)$.\ ▸ PT Chính tắc: $display((x - x_0)/a) = display((y - y_0)/b) = display((z - z_0)/c)$\ ▸ Khoảng cách an toàn giữa 2 quỹ đạo bay (Chéo nhau):\ $d(d_1, d_2) = display( |[arrow(u)_1, arrow(u)_2] dot arrow(M_1 M_2)| / |[arrow(u)_1, arrow(u)_2]| )$]
        ], fill: C-ORANGE.lighten(88%), border: C-ORANGE
      ),
    )
  ],
  fill: rgb("#fff7ed"), border: C-ORANGE
)

#arr

// ── TẦNG 6: VỊ TRÍ TƯƠNG ĐỐI & HÌNH CHIẾU THỰC TẾ ────────────────
#fbox-header(
  [
    #align(center)[#text(size: 11pt, weight: "bold", fill: white)[🔍 TẦNG 6 — VỊ TRÍ TƯƠNG ĐỐI, HÌNH CHIẾU TỌA ĐỘ VÀ GÓC]]
    #v(4pt)
    #grid(
      columns: (1fr, 1.2fr, 1fr),
      column-gutter: 0.8em,
      align: horizon,
      box(fill: white, stroke: 1.5pt+C-INDIGO, radius:4pt, inset:8pt, width:100%)[
        #align(center)[#ftitle(color: C-INDIGO)[Vị trí tương đối 2 Quỹ đạo]]
        #v(3pt)
        #fsub[
          ▸ Song song/Trùng: $arrow(u)_1 = k arrow(u)_2$.\
          ▸ Cắt nhau: Hệ PT có đúng 1 nghiệm (Đâm nhau).\
          ▸ Chéo nhau: Khác mặt phẳng (Bay khác cao độ an toàn), $[arrow(u)_1, arrow(u)_2] dot arrow(A B) eq.not 0$.
        ]
      ],
      box(fill: white, stroke: 1.5pt+C-INDIGO, radius:4pt, inset:8pt, width:100%)[
        #align(center)[#ftitle(color: C-INDIGO)[Hình chiếu & Đối xứng]]
        #v(3pt)
        #fsub[
          ▸ Bóng đèn chiếu xuống mặt sàn: Lập $d$ qua bóng đèn $A$, $d perp (P)$. Giao $H = d sect (P)$ là hình chiếu.\
          ▸ Hình ảnh phản chiếu qua gương: $A'$ đối xứng $A$ qua $(P) <=> A' = 2H - A$.
        ]
      ],
      box(fill: white, stroke: 1.5pt+C-INDIGO, radius:4pt, inset:8pt, width:100%)[
        #align(center)[#ftitle(color: C-INDIGO)[Góc (Cos/Sin)]]
        #v(3pt)
        #fsub[
          ▸ Đường-Đường / Mặt-Mặt (Cùng loài) -> Dùng Cos.\
          ▸ Đường thẳng - Mặt phẳng (Khác loài) -> Dùng Sin:\
          $sin phi = display( (|arrow(u) dot arrow(n)|) / (|arrow(u)| |arrow(n)|) )$
        ]
      ]
    )
  ],
  color: C-INDIGO
)
