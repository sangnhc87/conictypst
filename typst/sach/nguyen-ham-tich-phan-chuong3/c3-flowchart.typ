#import "_theme.typ": *
#import "@preview/cetz:0.5.2": canvas, draw

// ── Định nghĩa màu bổ sung cho Flowchart ────────────────────────
#let C-RED    = rgb("#b91c1c")
#let C-GREEN  = rgb("#15803d")
#let C-ORANGE = rgb("#c2410c")
#let C-TEAL   = rgb("#0f766e")
#let C-GRAY   = rgb("#374151")
#let C-INDIGO = rgb("#4f46e5")

#set text(font: "Times New Roman")

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
  #text(size: 16pt, weight: "bold", fill: C-NAVY)[SƠ ĐỒ TƯ DUY VẠN NĂNG: NGUYÊN HÀM, TÍCH PHÂN & ỨNG DỤNG THỰC TẾ]
  #v(4pt)
  #text(size: 10pt, style: "italic", fill: luma(100))[Bản đồ cấu trúc Giải tích 12 bám sát thực tế SGK mới — Công thức rõ nét, trực quan sinh động]
]
#v(1em)

// ── TẦNG 1: NGUYÊN HÀM & ĐIỀU KIỆN ĐẦU ──────────────────────────
#fbox-header(color: C-NAVY)[
  #align(center)[#text(size: 11pt, weight: "bold", fill: white)[📍 TẦNG 1 — NGUYÊN HÀM & ĐIỀU KIỆN ĐẦU (Khởi nguồn tích lũy)]]
  #v(4pt)
  #grid(
    columns: (1.2fr, 1fr, 1fr),
    column-gutter: 0.5em,
    fbox(
      align(center)[
        #ftitle(color: C-NAVY)[Định nghĩa & Bảng cơ bản]
        #v(2pt)
        #fsub[
          ▸ $F'(x) = f(x) <=> display(integral f(x) dif x) = F(x) + C$\
          ▸ $display(integral x^alpha dif x) = display((x^(alpha+1))/(alpha+1)) + C \ (alpha != -1)$\
          ▸ $display(integral 1/x dif x) = ln |x| + C$\
          ▸ $display(integral e^x dif x) = e^x + C$, $display(integral a^x dif x) = display(a^x / (ln a)) + C$
        ]
      ], fill: white, border: C-NAVY.lighten(40%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-NAVY)[Hằng số $C$ & Động học]
        #v(2pt)
        #fsub[
          ▸ Hằng số $C$ xác định bằng *Điều kiện đầu*.\
          ▸ Vật lý: Biết gia tốc $a(t)$ và vận tốc ban đầu $v(0) = v_0$, tìm vận tốc:\
          $v(t) = display(integral a(t) dif t) = F_v (t) + C$
        ]
      ], fill: white, border: C-NAVY.lighten(40%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-NAVY)[Ứng dụng Kinh tế]
        #v(2pt)
        #fsub[
          ▸ Tìm hàm Tổng chi phí $C(x)$ từ Chi phí biên $M C(x)$ và Chi phí cố định $C_0$:\
          $C(x) = display(integral M C(x) dif x) = F_c (x) + C_0$
        ]
      ], fill: white, border: C-NAVY.lighten(40%)
    ),
  )
]

#arr

// ── TẦNG 2: PHƯƠNG PHÁP TÍNH NGUYÊN HÀM ────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-PURPLE)[⚙️ TẦNG 2 — PHƯƠNG PHÁP TÌM NGUYÊN HÀM CỐT LÕI]]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 0.5em,
      fbox(
        align(center)[
          #ftitle(color: C-PURPLE)[Đổi biến số (Substitution)]
          #v(2pt)
          #fsub[▸ Đặt $u = u(x) => dif u = u'(x) dif x$.\ ▸ Đưa về dạng cơ bản theo biến mới $u$:\ $display(integral f(u(x)) u'(x) dif x) = display(integral f(u) dif u) = F(u) + C$]
        ], fill: C-PURPLE.lighten(93%), border: C-PURPLE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-PURPLE)[Tích phân từng phần (By Parts)]
          #v(2pt)
          #fsub[▸ Công thức gốc: $display(integral u dif v) = u v - display(integral v dif u)$.\ ▸ Quy tắc chọn $u$ (Nhất lô, nhì đa, tam lượng, tứ mũ):\ $ln x -> x^n -> sin x / cos x -> e^x$]
        ], fill: C-PURPLE.lighten(93%), border: C-PURPLE
      ),
    )
  ],
  fill: C-PURPLE.lighten(95%), border: C-PURPLE
)

#arr

// ── TẦNG 3: TÍCH PHÂN & TÍNH CHẤT ──────────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-FOREST)[👁 TẦNG 3 — TÍCH PHÂN XÁC ĐỊNH & CÁC TÍNH CHẤT]]
    #v(4pt)
    #grid(
      columns: (1.2fr, 1fr),
      column-gutter: 0.5em,
      fbox(
        align(center)[
          #ftitle(color: C-FOREST)[Công thức & Ý nghĩa]
          #v(2pt)
          #fsub[
            ▸ Công thức Newton-Leibniz: $display(integral_a^b f(x) dif x) = F(b) - F(a)$\
            ▸ Bản chất: Sự tích lũy lượng biến thiên liên tục từ $a$ đến $b$.\
            ▸ Tích lũy có hướng: Có thể mang giá trị âm.
          ]
        ], fill: C-FOREST.lighten(93%), border: C-FOREST
      ),
      fbox(
        align(center)[
          #ftitle(color: C-FOREST)[Tính chất cơ bản]
          #v(2pt)
          #fsub[
            ▸ Đảo cận: $display(integral_a^b) = - display(integral_b^a)$\
            ▸ Tách cận: $display(integral_a^b) = display(integral_a^c) + display(integral_c^b)$\
            ▸ Tuyến tính: $display(integral (k f +- g)) = k display(integral f) +- display(integral g)$
          ]
        ], fill: C-FOREST.lighten(93%), border: C-FOREST
      ),
    )
  ],
  fill: C-FOREST.lighten(95%), border: C-FOREST
)

#arr

// ── TẦNG 4: ỨNG DỤNG VẬT LÝ & ĐỘNG HỌC THỰC TẾ ──────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-RED)[⚡ TẦNG 4 — ỨNG DỤNG VẬT LÝ & CHUYỂN ĐỘNG THỰC TẾ]]
    #v(4pt)
    #grid(
      columns: (1fr, 1.2fr, 1fr),
      column-gutter: 0.5em,
      fbox(
        align(center)[
          #ftitle(color: C-RED)[Quãng đường vs Độ dời]
          #v(2pt)
          #fsub[
            ▸ *Độ dời* (Vị trí thay đổi ròng):\
            $Delta s = display(integral_(t_1)^(t_2) v(t) dif t)$\
            ▸ *Quãng đường* thực tế đi được:\
            $s = display(integral_(t_1)^(t_2) |v(t)| dif t)$
          ]
        ], fill: C-RED.lighten(91%), border: C-RED
      ),
      fbox(
        align(center)[
          #ftitle(color: C-RED)[Chuyển động từ Gia tốc]
          #v(2pt)
          #fsub[
            ▸ Cho gia tốc biến đổi $a(t)$.\
            ▸ Vận tốc tại thời điểm $t$:\
            $v(t) = v(t_0) + display(integral_(t_0)^t a(u) dif u)$\
            ▸ Quãng đường chuyển động:\
            $s(t) = s(t_0) + display(integral_(t_0)^t v(u) dif u)$
          ]
        ], fill: C-RED.lighten(91%), border: C-RED
      ),
      fbox(
        align(center)[
          #ftitle(color: C-RED)[Công của lực biến thiên]
          #v(2pt)
          #fsub[
            ▸ Lực kéo lò xo $F(x) = k x$.\
            ▸ Công dịch chuyển từ $a$ đến $b$:\
            $W = display(integral_a^b F(x) dif x)$ (Joule)\
            ▸ Với lò xo: $W = display(integral_a^b k x dif x)$
          ]
        ], fill: C-RED.lighten(91%), border: C-RED
      ),
    )
  ],
  fill: C-RED.lighten(95%), border: C-RED
)

#arr

// ── TẦNG 5: ỨNG DỤNG HÌNH HỌC & KIẾN TRÚC ───────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-GOLD)[📐 TẦNG 5 — ỨNG DỤNG HÌNH HỌC, THIẾT KẾ & KIẾN TRÚC]]
    #v(4pt)
    #grid(
      columns: (1.2fr, 1.2fr),
      column-gutter: 0.5em,
      fbox(
        align(center)[
          #ftitle(color: C-GOLD)[Diện tích hình phẳng ($S$)]
          #v(4pt)
          #grid(
            columns: (1.5fr, 1fr),
            column-gutter: 0.4em,
            align: horizon,
            fsub[
              ▸ Giới hạn bởi 2 đường cong:\
              $S = display(integral_a^b |f(x) - g(x)| dif x)$\
              ▸ *Ứng dụng:* Tính diện tích vách kính cong tòa nhà, mặt cắt vòm cầu, diện tích khu đất méo mó.
            ],
            // Hình vẽ diện tích hình phẳng
            canvas(length: 0.9cm, {
              import draw: *
              line((-0.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt + gray)
              line((0, -0.2), (0, 1.5), mark: (end: ">"), stroke: 0.5pt + gray)
              
              let pts = ()
              for i in range(0, 16) {
                let x = 0.4 + i * 1.4 / 15
                let y = 0.3 + 0.3 * (x - 0.4) * (x - 0.4)
                pts.push((x, y))
              }
              let fill-pts = ((0.4, 0),) + pts + ((1.8, 0),)
              line(..fill-pts, close: true, fill: rgb("#C9A2272a"), stroke: none)
              line(..pts, stroke: 1.2pt + C-GOLD)
              
              line((0.4, 0), (0.4, 0.3), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
              line((1.8, 0), (1.8, 0.9), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
              
              content((0.4, -0.25), $a$, size: 7pt)
              content((1.8, -0.25), $b$, size: 7pt)
              content((1.1, 0.3), $S$, fill: C-GOLD.darken(20%), size: 8pt)
            })
          )
        ], fill: C-GOLD.lighten(91%), border: C-GOLD
      ),
      fbox(
        align(center)[
          #ftitle(color: C-GOLD)[Thể tích khối tròn xoay ($V$)]
          #v(4pt)
          #grid(
            columns: (1.5fr, 1fr),
            column-gutter: 0.4em,
            align: horizon,
            fsub[
              ▸ Quay hình quanh trục $O x$:\
              $V = pi display(integral_a^b [f(x)]^2 dif x)$\
              ▸ *Ứng dụng:* Đo dung tích thùng chứa (Kepler), chi tiết máy cơ khí chính xác hình khối tròn xoay.
            ],
            // Hình vẽ khối tròn xoay
            canvas(length: 0.8cm, {
              import draw: *
              let sx = -0.3
              let sy = -0.2
              let proj(x, y, z) = (x + y * sx, z + y * sy)
              
              line(proj(-0.2, 0, 0), proj(2.2, 0, 0), mark: (end: ">"), stroke: 0.5pt + gray)
              
              let a = 0.4
              let b = 1.8
              let R(x) = 0.3 + 0.1 * x * x
              
              let upper = ()
              let lower = ()
              for i in range(0, 11) {
                let x = a + i * (b - a) / 10
                upper.push(proj(x, 0, R(x)))
                lower.push(proj(x, 0, -R(x)))
              }
              
              let ell-a = ()
              let ell-b = ()
              for i in range(0, 21) {
                let phi = i * 2 * calc.pi / 20
                ell-a.push(proj(a, R(a) * calc.cos(phi), R(a) * calc.sin(phi)))
                ell-b.push(proj(b, R(b) * calc.cos(phi), R(b) * calc.sin(phi)))
              }
              
              line(..ell-a, fill: rgb("#C9A2271a"), stroke: 0.4pt + gray)
              line(..ell-b, fill: rgb("#C9A2271a"), stroke: 0.4pt + gray)
              line(..upper, stroke: 1pt + C-GOLD)
              line(..lower, stroke: 1pt + C-GOLD)
              
              content(proj(1.1, 0, 0), $V$, fill: C-GOLD.darken(20%), size: 8pt)
            })
          )
        ], fill: C-GOLD.lighten(91%), border: C-GOLD
      ),
    )
  ],
  fill: C-GOLD.lighten(93%), border: C-GOLD
)

#arr

// ── TẦNG 6: MÔ HÌNH HÓA THỰC TẾ & TÍCH LŨY TÀI NGUYÊN ──────────────
#fbox-header(
  [
    #align(center)[#text(size: 11pt, weight: "bold", fill: white)[🌍 TẦNG 6 — MÔ HÌNH HÓA THỰC TẾ & TÍCH LŨY TÀI NGUYÊN]]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 0.8em,
      align: horizon,
      box(fill: white, stroke: 1.5pt+C-INDIGO, radius:4pt, inset:8pt, width:100%)[
        #align(center)[#ftitle(color: C-INDIGO)[Tích lũy Tài nguyên & Môi trường]]
        #v(3pt)
        #fsub[
          ▸ Tốc độ rò rỉ nước hoặc dầu biến thiên theo thời gian $r(t)$.\
          ▸ Tổng lượng chất lỏng thất thoát từ thời điểm $t_1$ đến $t_2$:\
          $Q = display(integral_(t_1)^(t_2) r(t) dif t)$
        ]
      ],
      box(fill: white, stroke: 1.5pt+C-INDIGO, radius:4pt, inset:8pt, width:100%)[
        #align(center)[#ftitle(color: C-INDIGO)[Thặng dư Kinh tế thực tế]]
        #v(3pt)
        #fsub[
          ▸ Thặng dư tiêu dùng (CS) và Thặng dư sản xuất (PS) tại mức giá cân bằng $P_0$, sản lượng $Q_0$:\
          $C S = display(integral_0^(Q_0) [P_d (Q) - P_0] dif Q)$ \
          $P S = display(integral_0^(Q_0) [P_0 - P_s (Q)] dif Q)$
        ]
      ]
    )
  ],
  color: C-INDIGO
)
