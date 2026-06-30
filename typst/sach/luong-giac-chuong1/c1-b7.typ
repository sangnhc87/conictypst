#import "_config.typ": *

#lesson([Bất Phương Trình Lượng Giác và Tập Xác Định Hàm Số LG], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

// ─────────────────────────────────────────────────
#muc([Bất Phương Trình $sin x >= m$ và $sin x <= m$])
// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Giải bất phương trình $sin x >= m$])[
    - *Nếu $m > 1$:* Vô nghiệm.
    - *Nếu $m < -1$:* Nghiệm là $forall x in RR$.
    - *Nếu $-1 <= m <= 1$:* Đặt $alpha = arcsin(m) in [-pi/2; pi/2]$. Khi đó:
    $ sin x >= m arrow.l.r alpha + k 2pi <= x <= pi - alpha + k 2pi quad (k in ZZ) $

    *Trực quan trên đường tròn:* Phần cung tương ứng sin $>= m$ là cung nằm trên đường thẳng ngang $y = m$.
  ]
]

// Hình minh họa BPT sinx >= m
#block(breakable: false)[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Trên đường tròn đơn vị:* \
      #align(center)[
        #cetz.canvas(length: 1.1cm, {
          import cetz.draw: *
          // Đường tròn
          circle((0,0), radius: 2, stroke: 1pt + c-book)
          // Trục
          line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.8pt)
          line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
          content((2.6, -0.2), text(size: 8pt)[$x$])
          content((0.2, 2.4), text(size: 8pt)[$y$])

          // Đường y = m = 1
          let m_val = 1.0  // m = 0.5, scaled to R=2
          line((-2.3, m_val), (2.3, m_val), stroke: (paint: red, thickness: 1pt, dash: "dashed"))
          content((2.5, m_val + 0.2), text(size: 8pt, fill: red)[$m$])

          // Cung thỏa mãn sinx >= m (tô màu)
          // m_val=1.0, R=2, so m/R=0.5, arcsin(0.5)=30deg
          arc((0,0), start: 30deg, stop: 150deg, radius: 2,
              stroke: (paint: c-book, thickness: 3pt))
          // Điểm alpha
          circle((calc.cos(30deg) * 2, m_val), radius: 0.07, fill: c-book)
          circle((calc.cos(150deg) * 2, m_val), radius: 0.07, fill: c-book)
          content((-0.3, m_val - 0.3), text(size: 7pt, fill: c-book)[$alpha$])
          content((0, -2.4), text(size: 7pt, fill: luma(60))[Phần đậm: $sin x >= m$])

        })
      ]
    ],
    [
      *Trên đồ thị hàm sin:* \
      #align(center)[
        #cetz.canvas(length: 0.8cm, {
          import cetz.draw: *
          let pi = 3.14159

          line((-0.5, 0), (7.2, 0), mark: (end: ">"), stroke: 0.8pt)
          line((0, -2.2), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)

          // Đường y = m (mờ)
          let m = 1.0
          line((-0.3, m), (7, m), stroke: (paint: red, thickness: 0.8pt, dash: "dashed"))
          content((7.2, m + 0.2), text(size: 7pt, fill: red)[$m$])

          // Sin curve
          let pts = range(0, 150).map(i => (i/20, 2*calc.sin(i/20)))
          line(..pts, stroke: (paint: gray, thickness: 0.8pt))

          // Phần cung sinx >= m (tô đặc) — dùng float
          let a_val = 0.5236  // arcsin(0.5) = pi/6 ≈ 0.5236
          let b_val = pi - a_val
          let pts2 = range(int(a_val*20), int(b_val*20)+1).map(i => (i/20, 2*calc.sin(i/20)))
          line(..pts2, stroke: (paint: c-book, thickness: 2.5pt))

          // Khu vực k=1
          let a2 = a_val + 2*pi
          let b2 = b_val + 2*pi
          let pts3 = range(int(a2*20), int(b2*20)+1).map(i => (i/20, 2*calc.sin(i/20)))
          line(..pts3, stroke: (paint: c-book, thickness: 2.5pt))

          // Nhãn trục
          for (x, l) in ((pi, $pi$), (2*pi, $2pi$)) {
            line((x, -0.08), (x, 0.08))
            content((x, -0.35), text(size: 7pt)[#l])
          }
        })
      ]
    ]
  )
]

#vd([Giải bất phương trình $2 sin x - sqrt(3) >= 0$.],
  loigiai: [
    $sin x >= display(sqrt(3)/2)$. Vì $|display(sqrt(3)/2)| <= 1$ nên bất phương trình có nghiệm.

    $arcsin(display(sqrt(3)/2)) = pi/3$.

    Nghiệm: $pi/3 + k 2pi <= x <= pi - pi/3 + k 2pi = 2pi/3 + k 2pi quad (k in ZZ)$.
  ]
)

// ─────────────────────────────────────────────────
#muc([Bất Phương Trình $cos x >= m$ và $cos x <= m$])
// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Giải bất phương trình $cos x >= m$])[
    Đặt $alpha = arccos(m) in [0; pi]$. Khi đó:
    $ cos x >= m arrow.l.r -alpha + k 2pi <= x <= alpha + k 2pi quad (k in ZZ) $

    *Nhận xét quan trọng:*
    - Bất phương trình $cos x >= m$ cho ta các khoảng đối xứng qua trục $O y$ (hoặc các giá trị tương đương modulo $2pi$).
    - Bất phương trình $sin x >= m$ cho ta cung *từ trái sang phải* (góc từ $alpha$ đến $pi - alpha$).
    - Bất phương trình $cos x >= m$ cho ta cung *từ trên xuống* (góc từ $-alpha$ đến $alpha$).
  ]
]

#vd([Giải bất phương trình $cos(2x - pi/3) <= 1/2$.],
  loigiai: [
    $arccos(1/2) = pi/3$.

    $cos(2x - pi/3) <= 1/2 arrow.l.r not [cos(2x - pi/3) > 1/2]$

    Nghiệm $cos(2x - pi/3) > 1/2$: $-pi/3 + k 2pi < 2x - pi/3 < pi/3 + k 2pi$

    $=> 0 + k 2pi < 2x < 2pi/3 + k 2pi => k pi < x < pi/3 + k pi$

    Vậy nghiệm của $cos(2x - pi/3) <= 1/2$: $x in [pi/3 + k pi; pi + k pi] = [pi/3 + k pi; (k+1)pi] quad (k in ZZ)$.
  ]
)

// ─────────────────────────────────────────────────
#muc([Tập Xác Định Của Hàm Số Chứa Lượng Giác])
// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Điều kiện xác định các hàm cơ bản])[
    #align(center)[
      #table(
        columns: (auto, 1.2fr, auto),
        align: (left, center, left),
        stroke: 0.5pt + luma(180),
        inset: 8pt,
        fill: (col, row) => if row == 0 { c-book.lighten(85%) } else { white },
        [*Hàm số*], [*Điều kiện xác định*], [*Ký hiệu*],
        [$y = tan f(x)$], [$f(x) != pi/2 + k pi$], [$cos f(x) != 0$],
        [$y = cot f(x)$], [$f(x) != k pi$], [$sin f(x) != 0$],
        [$y = display(1/sin f(x))$], [$sin f(x) != 0$, tức $f(x) != k pi$], [tương tự cot],
        [$y = sqrt(sin f(x))$], [$sin f(x) >= 0$], [bất phương trình LG],
        [$y = sqrt(cos f(x) - m)$], [$cos f(x) >= m$], [bất phương trình LG],
        [$y = ln(sin f(x))$], [$sin f(x) > 0$], [bất phương trình LG nghiêm],
      )
    ]
  ]
]

#vd([Tìm tập xác định của hàm số $y = display(sqrt(sin x - 1/2))$.],
  loigiai: [
    Điều kiện: $sin x - 1/2 >= 0 arrow.l.r sin x >= 1/2$.

    $arcsin(1/2) = pi/6$.

    $sin x >= 1/2 arrow.l.r pi/6 + k 2pi <= x <= 5pi/6 + k 2pi quad (k in ZZ)$.

    Tập xác định: $D = union.big_(k in ZZ) [pi/6 + k 2pi; 5pi/6 + k 2pi]$.
  ]
)

#vd([Tìm tập xác định của hàm số $y = display(1 / (1 - 2 cos x))$.],
  loigiai: [
    Điều kiện: $1 - 2 cos x != 0 arrow.l.r cos x != 1/2$.

    $cos x = 1/2 arrow.l.r x = ±pi/3 + k 2pi quad (k in ZZ)$.

    Tập xác định: $D = RR \\ {±pi/3 + k 2pi, k in ZZ}$.
  ]
)

// ─────────────────────────────────────────────────
#muc([Ứng Dụng: Miền Giá Trị và Điều Kiện Tồn Tại])
// ─────────────────────────────────────────────────

#block(breakable: false)[
  #ghinho(title: [★ Chiến lược tìm TXD cho hàm phức hợp])[
    + Phân tích hàm số thành các bộ phận (căn, log, phân thức, sin, cos...).
    + Viết điều kiện xác định cho *từng bộ phận*.
    + Lấy *giao* của tất cả điều kiện.

    *Ví dụ tổng quát:* $y = display(sqrt(sin x) / tan x)$ yêu cầu:
    - $sin x >= 0$ (dưới căn không âm)
    - $cos x != 0$ (mẫu tan khác 0)
    Giao: $sin x >= 0$ và $x != pi/2 + k pi$ → $[0; pi/2) union (pi/2; pi] + k 2pi$.
  ]
]

#vd([Tìm tập xác định của $y = display(sqrt(1 - 2 sin x)) + display(1 / cos x)$.],
  loigiai: [
    *Điều kiện 1:* $1 - 2 sin x >= 0 arrow.l.r sin x <= 1/2$.

    $sin x <= 1/2 arrow.l.r x in (-pi; pi/6] union [5pi/6; pi] + k 2pi$ (ngoài cung $[pi/6; 5pi/6]$).

    *Điều kiện 2:* $cos x != 0 arrow.l.r x != pi/2 + k pi$.

    *Giao:* $D = lr({x in RR : sin x <= 1/2 "và" cos x != 0})$.
  ]
)

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b7-de1.typ"
