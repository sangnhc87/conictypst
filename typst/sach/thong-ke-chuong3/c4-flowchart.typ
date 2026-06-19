#import "_config.typ": *
#import "@preview/cetz:0.5.2": canvas, draw

// ── Định nghĩa màu sắc TƯƠI SÁNG, HIỆN ĐẠI ────────────────────────
#let C-BLUE   = rgb("#1d4ed8")
#let C-CYAN   = rgb("#0891b2")
#let C-EMERALD = rgb("#059669")
#let C-AMBER  = rgb("#d97706")
#let C-ROSE   = rgb("#e11d48")
#let C-PURPLE = rgb("#7e22ce")
#let C-INDIGO = rgb("#4338ca")

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
  #text(size: 16pt, weight: "bold", fill: C-INDIGO)[SƠ ĐỒ TƯ DUY VẠN NĂNG: SAI SỐ & ĐO MỨC ĐỘ PHÂN TÁN]
  #v(4pt)
  #text(size: 11pt, style: "italic", fill: luma(80))[Tổng hợp toàn diện từ Lớp 10 (Số liệu đơn) đến Lớp 12 (Số liệu ghép nhóm)]
]
#v(1em)

// ── TẦNG 1: SỐ GẦN ĐÚNG & SAI SỐ (LỚP 10) ──────────────────────────
#fbox-header(color: C-PURPLE)[
  #align(center)[#text(size: 12pt, weight: "bold", fill: white)[📍 TẦNG 1 — SỐ GẦN ĐÚNG, SAI SỐ & QUY TRÒN SỐ]]
  #v(6pt)
  #grid(
    columns: (1fr, 1.2fr, 1fr),
    column-gutter: 0.6em,
    fbox(
      align(center)[
        #ftitle(color: C-PURPLE)[Sai số tuyệt đối ($Delta_a$)]
        #v(3pt)
        #fsub[
          ▸ Giả sử $overline(a)$ là số đúng, $a$ là số gần đúng.\
          ▸ Công thức: $display(Delta_a = |overline(a) - a|)$\
          ▸ *Độ chính xác $d$:* Nếu $Delta_a <= d$ thì ta viết $overline(a) = a +- d$.
        ]
      ], fill: white, border: C-PURPLE.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-PURPLE)[Sai số tương đối ($delta_a$)]
        #v(3pt)
        #fsub[
          ▸ Định nghĩa: Tỉ số giữa sai số tuyệt đối và trị tuyệt đối của số gần đúng.\
          ▸ Công thức: 
          $ delta_a = Delta_a / |a| <= d / |a| $
          ▸ *Ý nghĩa:* $delta_a$ càng nhỏ thì phép đo/tính toán càng chính xác.
        ]
      ], fill: white, border: C-PURPLE.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-PURPLE)[Quy tròn số]
        #v(3pt)
        #fsub[
          ▸ Chữ số ngay sau hàng quy tròn $< 5$: Giữ nguyên chữ số hàng quy tròn.\
          ▸ Chữ số ngay sau hàng quy tròn $>= 5$: Tăng chữ số hàng quy tròn thêm 1.\
          ▸ Sai số quy tròn không vượt quá nửa đơn vị của hàng quy tròn.
        ]
      ], fill: white, border: C-PURPLE.lighten(30%)
    ),
  )
]

#arr

// ── TẦNG 2: TỔNG QUAN BẢNG DỮ LIỆU & BƯỚC CHUẨN BỊ ──────────────────────────
#fbox-header(color: C-BLUE)[
  #align(center)[#text(size: 12pt, weight: "bold", fill: white)[📍 TẦNG 2 — NỀN TẢNG: BẢNG SỐ LIỆU ĐƠN & GHÉP NHÓM]]
  #v(6pt)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.6em,
    fbox(
      align(center)[
        #ftitle(color: C-BLUE)[Mẫu số liệu ĐƠN (Lớp 10)]
        #v(3pt)
        #fsub[
          ▸ Cho mẫu: $x_1, x_2, dots, x_n$ (Cỡ mẫu là $n$)\
          ▸ Nếu có tần số: Giá trị $x_i$ có tần số $n_i$.\
          ▸ Số trung bình: 
          $ overline(x) = (x_1 + x_2 + dots + x_n)/n $
          $ overline(x) = (n_1 x_1 + dots + n_k x_k)/n $
        ]
      ], fill: white, border: C-BLUE.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-BLUE)[Mẫu số liệu GHÉP NHÓM (Lớp 12)]
        #v(3pt)
        #fsub[
          ▸ Nhóm số liệu: $[a_i; a_{i+1})$, tần số $n_i$, tần số tích luỹ $c f_i$.\
          ▸ *Giá trị đại diện:* $ x_i = (a_i + a_{i+1})/2 $\
          ▸ Độ dài nhóm: $h_i = a_{i+1} - a_i$\
          ▸ Số trung bình: Dùng giá trị đại diện $x_i$ thay cho dữ liệu thật: 
          $ overline(x) = (n_1 x_1 + dots + n_k x_k)/n $
        ]
      ], fill: white, border: C-BLUE.lighten(30%)
    ),
  )
]

#arr

// ── TẦNG 3: ĐO BIẾN THIÊN THÔ & TỨ PHÂN VỊ ────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-EMERALD)[📊 TẦNG 3 — KHOẢNG BIẾN THIÊN & KHOẢNG TỨ PHÂN VỊ ($R$ và $Delta_Q$)]]
    #v(4pt)
    #grid(
      columns: (1fr, 1.1fr),
      column-gutter: 0.6em,
      fbox(
        align(center)[
          #ftitle(color: C-EMERALD)[Số liệu ĐƠN (Không ghép nhóm)]
          #v(3pt)
          #fsub[
            ▸ *Khoảng biến thiên:* $display(R = x_max - x_min)$\
            ▸ *Tứ phân vị ($Q_1, Q_2, Q_3$):*\
              • Sắp xếp số liệu tăng dần.\
              • $Q_2$ là trung vị (Median) của toàn bộ.\
              • $Q_1$ là trung vị của nửa số liệu bên trái $Q_2$.\
              • $Q_3$ là trung vị của nửa số liệu bên phải $Q_2$.\
            ▸ *Khoảng tứ phân vị:* $ display(Delta_Q = Q_3 - Q_1) $
          ]
        ], fill: C-EMERALD.lighten(94%), border: C-EMERALD
      ),
      fbox(
        align(center)[
          #ftitle(color: C-EMERALD)[Số liệu GHÉP NHÓM]
          #v(3pt)
          #fsub[
            ▸ *Khoảng biến thiên:* $display(R = a_k - a_1)$\
            ▸ *Tứ phân vị ($Q_1, Q_2, Q_3$)*: \
            Tìm nhóm chứa vị trí tương ứng ($n/4, n/2, 3n/4$) và dùng nội suy:
            $ Q_1 = a_p + (n/4 - c f_(p-1)) / n_p dot h_p $
            $ Q_2 = a_q + (n/2 - c f_(q-1)) / n_q dot h_q $
            $ Q_3 = a_r + (3n/4 - c f_(r-1)) / n_r dot h_r $
            ▸ *Khoảng tứ phân vị:* $ display(Delta_Q = Q_3 - Q_1) $
          ]
        ], fill: C-EMERALD.lighten(94%), border: C-EMERALD
      ),
    )
  ],
  fill: C-EMERALD.lighten(96%), border: C-EMERALD
)

#arr

// ── TẦNG 4: PHƯƠNG SAI & ĐỘ LỆCH CHUẨN ──────────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-ROSE)[🎯 TẦNG 4 — PHƯƠNG SAI & ĐỘ LỆCH CHUẨN ($s^2$ và $s$)]]
    #v(4pt)
    #grid(
      columns: (1fr, 1.2fr),
      column-gutter: 0.6em,
      fbox(
        align(center)[
          #ftitle(color: C-ROSE)[Số liệu ĐƠN]
          #v(3pt)
          #fsub[
            ▸ *Phương sai* định nghĩa:
            $ s^2 = ((x_1 - overline(x))^2 + dots + (x_n - overline(x))^2)/n $
            ▸ Khi có tần số $n_i$:
            $ s^2 = 1/n (n_1 x_1^2 + dots + n_k x_k^2) - (overline(x))^2 $
            ▸ *Độ lệch chuẩn:* $ s = sqrt(s^2) $ \
            Đo độ phân tán so với giá trị trung bình.
          ]
        ], fill: C-ROSE.lighten(94%), border: C-ROSE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-ROSE)[Số liệu GHÉP NHÓM]
          #v(3pt)
          #fsub[
            ▸ *Phương sai* (dùng giá trị đại diện $x_i$):
            $ s^2 = (n_1 (x_1 - overline(x))^2 + dots + n_k (x_k - overline(x))^2)/n $
            ▸ *Công thức tính nhanh* (thực chiến):
            $ s^2 = 1/n (n_1 x_1^2 + dots + n_k x_k^2) - (overline(x))^2 $
            ▸ *Độ lệch chuẩn:* $ s = sqrt(s^2) $\
            • $s$ càng nhỏ $->$ số liệu càng đồng đều, ổn định.\
            • $s$ càng lớn $->$ số liệu càng phân tán, rủi ro biến động cao.
          ]
        ], fill: C-ROSE.lighten(94%), border: C-ROSE
      ),
    )
  ],
  fill: C-ROSE.lighten(96%), border: C-ROSE
)

#arr

// ── TẦNG 5: ỨNG DỤNG THỰC TẾ & KINH TẾ (ĐÁNH GIÁ VÀ QUYẾT ĐỊNH) ──────────────────
#fbox-header(color: C-AMBER)[
  #align(center)[#text(size: 12pt, weight: "bold", fill: white)[💡 TẦNG 5 — ỨNG DỤNG THỰC TẾ & KINH TẾ QUẢN TRỊ (Ra quyết định)]]
  #v(4pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.6em,
    fbox(
      align(center)[
        #ftitle(color: C-AMBER.darken(20%))[Kiểm soát Chất lượng (QC)]
        #v(3pt)
        #fsub[
          ▸ Đánh giá dây chuyền sản xuất: Phương sai đường kính linh kiện càng nhỏ, máy móc hoạt động càng chính xác. \
          ▸ *Sàng lọc dị biệt:* Sản phẩm nằm ngoài khoảng $[overline(x) - 3s, overline(x) + 3s]$ thường bị loại (Tiêu chuẩn 6-Sigma).
        ]
      ], fill: white, border: C-AMBER.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-AMBER.darken(20%))[Tài chính & Đầu tư (Rủi ro)]
        #v(3pt)
        #fsub[
          ▸ Đo lường Rủi ro (Volatility): Hai quỹ đầu tư có cùng lợi nhuận trung bình $overline(x)$, quỹ nào có độ lệch chuẩn $s$ lớn hơn thì rủi ro cao hơn.\
          ▸ Phương sai lợi nhuận ghép nhóm theo tháng là cơ sở tính chỉ số Sharpe định giá danh mục.
        ]
      ], fill: white, border: C-AMBER.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-AMBER.darken(20%))[Giáo dục & Năng suất]
        #v(3pt)
        #fsub[
          ▸ Đánh giá độ đồng đều:\
          Hai lớp có cùng điểm trung bình, nhưng lớp có $s$ nhỏ hơn chứng tỏ lực học đồng đều hơn, ít học sinh cá biệt.\
          ▸ So sánh hiệu suất hai nhân viên/bộ phận.
        ]
      ], fill: white, border: C-AMBER.lighten(30%)
    ),
  )
]
