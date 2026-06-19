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
  #text(size: 17pt, weight: "bold", fill: C-INDIGO)[SƠ ĐỒ TƯ DUY: HÀM SỐ LƯỢNG GIÁC & PHƯƠNG TRÌNH LƯỢNG GIÁC (TOÁN 11)]
  #v(4pt)
  #text(size: 11pt, style: "italic", fill: luma(80))[Bản đồ tư duy từ Góc lượng giác, Đường tròn, Công thức đến Phương trình cơ bản]
]
#v(1em)

// ── TẦNG 1: GÓC LƯỢNG GIÁC & SỐ ĐO ──────────────────────────
#fbox-header(color: C-TEAL)[
  #align(center)[#text(size: 12pt, weight: "bold", fill: white)[📍 TẦNG 1 — NỀN TẢNG: GÓC VÀ SỐ ĐO LƯỢNG GIÁC]]
  #v(6pt)
  #grid(
    columns: (1fr, 1.2fr, 1fr),
    column-gutter: 0.6em,
    fbox(
      align(center)[
        #ftitle(color: C-TEAL)[Góc lượng giác]
        #v(3pt)
        #fsub[
          ▸ Góc quét bởi tia quay từ tia đầu tới tia cuối.\
          ▸ Chiều dương: Ngược chiều kim đồng hồ.\
          ▸ Chiều âm: Cùng chiều kim đồng hồ.
        ]
      ], fill: white, border: C-TEAL.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-TEAL)[Đơn vị đo (Độ & Radian)]
        #v(3pt)
        #fsub[
          ▸ Mối liên hệ cốt lõi: $ 180^degree = pi " rad" $
          ▸ Quy đổi: $ a / 180 = alpha / pi $
          ($a$ là số đo độ, $alpha$ là số đo radian).
        ]
      ], fill: white, border: C-TEAL.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-TEAL)[Độ dài cung tròn]
        #v(3pt)
        #fsub[
          ▸ Một cung của đường tròn bán kính $R$, số đo $alpha$ (radian) có độ dài:
          $ display(l = R alpha) $
          (Bắt buộc dùng hệ Radian).
        ]
      ], fill: white, border: C-TEAL.lighten(30%)
    ),
  )
]

#arr

// ── TẦNG 2: ĐƯỜNG TRÒN LƯỢNG GIÁC & GIÁ TRỊ LƯỢNG GIÁC ────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-BLUE)[🛞 TẦNG 2 — ĐƯỜNG TRÒN LƯỢNG GIÁC & GÓC LIÊN QUAN ĐẶC BIỆT]]
    #v(4pt)
    #grid(
      columns: (1fr, 1.1fr, 1.1fr),
      column-gutter: 0.6em,
      fbox(
        align(center)[
          #ftitle(color: C-BLUE)[Đường tròn lượng giác]
          #v(3pt)
          #fsub[
            ▸ Tâm $O$, bán kính $R = 1$.\
            ▸ Trục hoành $O x$ là *trục Cos*.\
            ▸ Trục tung $O y$ là *trục Sin*.\
            ▸ Trục song song $O y$ qua $(1,0)$ là Tang.\
            ▸ Điểm $M(x_0, y_0)$ biểu diễn góc $alpha$ thì:
            $ cos alpha = x_0 ; space sin alpha = y_0 $
          ]
        ], fill: C-BLUE.lighten(94%), border: C-BLUE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-BLUE)[Dấu & Hằng đẳng thức]
          #v(3pt)
          #fsub[
            ▸ *Dấu:* "Nhất cả, Nhì sin, Tam tang, Tứ cos".
            ▸ *Các hằng đẳng thức cơ bản:*
            $ sin^2 alpha + cos^2 alpha = 1 $
            $ 1 + tan^2 alpha = 1 / (cos^2 alpha) $
            $ 1 + cot^2 alpha = 1 / (sin^2 alpha) $
          ]
        ], fill: C-BLUE.lighten(94%), border: C-BLUE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-BLUE)[Các góc có liên quan]
          #v(3pt)
          #fsub[
            ▸ *Thần chú:* "Cos đối, Sin bù, Phụ chéo, Hơn kém $pi$ tang".
            ▸ *Đối ($–alpha$):* Chỉ có $cos$ giữ nguyên dấu.
            ▸ *Bù ($pi - alpha$):* Chỉ có $sin$ giữ nguyên dấu.
            ▸ *Phụ ($pi/2 - alpha$):* Đổi chéo $sin <-> cos$, $tan <-> cot$.
          ]
        ], fill: C-BLUE.lighten(94%), border: C-BLUE
      ),
    )
  ],
  fill: C-BLUE.lighten(96%), border: C-BLUE
)

#arr

// ── TẦNG 3: CÁC CÔNG THỨC LƯỢNG GIÁC ──────────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-ROSE)[🧬 TẦNG 3 — CÁC CÔNG THỨC LƯỢNG GIÁC (Biến đổi hình học thành đại số)]]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr, 1.2fr),
      column-gutter: 0.6em,
      fbox(
        align(center)[
          #ftitle(color: C-ROSE)[Công thức cộng]
          #v(3pt)
          #fsub[
            ▸ $sin(a plus.minus b) = sin a cos b plus.minus cos a sin b$
            ▸ $cos(a plus.minus b) = cos a cos b minus.plus sin a sin b$
            ▸ $tan(a plus.minus b) = (tan a plus.minus tan b)/(1 minus.plus tan a tan b)$
          ]
        ], fill: C-ROSE.lighten(94%), border: C-ROSE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-ROSE)[Công thức nhân đôi & Hạ bậc]
          #v(3pt)
          #fsub[
            ▸ $sin 2a = 2 sin a cos a$
            ▸ $cos 2a = cos^2 a - sin^2 a$\
            $= 2cos^2 a - 1 = 1 - 2sin^2 a$
            ▸ *Hạ bậc:* $cos^2 a = (1+cos 2a)/2$
          ]
        ], fill: C-ROSE.lighten(94%), border: C-ROSE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-ROSE)[Biến đổi Tổng $arrow.l.r$ Tích]
          #v(3pt)
          #fsub[
            ▸ *Tổng thành tích:* "Cos cộng cos bằng hai cos cos, sin cộng sin bằng hai sin cos..."
            $ cos a + cos b = 2 cos((a+b)/2) cos((a-b)/2) $
            ▸ *Tích thành tổng:*
            $ cos a cos b = 1/2 [cos(a-b) + cos(a+b)] $
          ]
        ], fill: C-ROSE.lighten(94%), border: C-ROSE
      ),
    )
  ],
  fill: C-ROSE.lighten(96%), border: C-ROSE
)

#arr

// ── TẦNG 4: HÀM SỐ LƯỢNG GIÁC ──────────────────────────────
#fbox(
  [
    #align(center)[#ftitle(color: C-PURPLE)[🌊 TẦNG 4 — HÀM SỐ LƯỢNG GIÁC (Tính tuần hoàn & Đồ thị)]]
    #v(4pt)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 0.6em,
      fbox(
        align(center)[
          #ftitle(color: C-PURPLE)[Hàm Sin ($y = sin x$) & Cosin ($y = cos x$)]
          #v(3pt)
          #fsub[
            ▸ *Tập xác định:* $D = RR$.
            ▸ *Tập giá trị:* $[-1; 1]$. (Bounded/Bị chặn).
            ▸ *Chu kì tuần hoàn:* $T = 2pi$.
            ▸ Hàm Sin là hàm lẻ (đồ thị đối xứng qua gốc tọa độ). Hàm Cos là hàm chẵn (đối xứng qua $O y$).
          ]
        ], fill: C-PURPLE.lighten(94%), border: C-PURPLE
      ),
      fbox(
        align(center)[
          #ftitle(color: C-PURPLE)[Hàm Tang ($y = tan x$) & Cotang ($y = cot x$)]
          #v(3pt)
          #fsub[
            ▸ *Tập xác định:* Tang đòi $cos x != 0$, Cotang đòi $sin x != 0$.
            ▸ *Tập giá trị:* $RR$ (Không bị chặn).
            ▸ *Chu kì tuần hoàn:* $T = pi$.
            ▸ Đều là hàm lẻ (đối xứng qua gốc tọa độ). Đồ thị có các đường tiệm cận đứng.
          ]
        ], fill: C-PURPLE.lighten(94%), border: C-PURPLE
      ),
    )
  ],
  fill: C-PURPLE.lighten(96%), border: C-PURPLE
)

#arr

// ── TẦNG 5: PHƯƠNG TRÌNH LƯỢNG GIÁC CƠ BẢN ──────────────────
#fbox-header(color: C-EMERALD)[
  #align(center)[#text(size: 12pt, weight: "bold", fill: white)[🗝️ TẦNG 5 — PHƯƠNG TRÌNH LƯỢNG GIÁC CƠ BẢN (Tìm điểm trên đường tròn)]]
  #v(4pt)
  #grid(
    columns: (1.2fr, 1.2fr, 1fr),
    column-gutter: 0.6em,
    fbox(
      align(center)[
        #ftitle(color: C-EMERALD.darken(20%))[Phương trình $sin x = m$]
        #v(3pt)
        #fsub[
          ▸ Nếu $|m| > 1$: Phương trình vô nghiệm.
          ▸ Nếu $|m| <= 1$: Gọi $alpha$ sao cho $sin alpha = m$.
          $ x = alpha + k 2pi  \
          x = pi - alpha + k 2pi $
          (Mở rộng với góc radian. Nếu dùng độ thì thay $pi$ bằng $180^degree$).
        ]
      ], fill: white, border: C-EMERALD.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-EMERALD.darken(20%))[Phương trình $cos x = m$]
        #v(3pt)
        #fsub[
          ▸ Nếu $|m| > 1$: Phương trình vô nghiệm.
          ▸ Nếu $|m| <= 1$: Gọi $alpha$ sao cho $cos alpha = m$.
          $ x = alpha + k 2pi \
          x = -alpha + k 2pi $
          (Nhớ lại tính chất: $cos$ của $alpha$ và $-alpha$ bằng nhau).
        ]
      ], fill: white, border: C-EMERALD.lighten(30%)
    ),
    fbox(
      align(center)[
        #ftitle(color: C-EMERALD.darken(20%))[Phương trình $tan x, cot x$]
        #v(3pt)
        #fsub[
          ▸ Với $tan x = m$, luôn có nghiệm với mọi $m$.
          Gọi $alpha$ sao cho $tan alpha = m$:
          $ x = alpha + k pi $
          (Tương tự với phương trình $cot x = m$). Chú ý chu kì của Tang và Cotang chỉ là $pi$.
        ]
      ], fill: white, border: C-EMERALD.lighten(30%)
    ),
  )
]
