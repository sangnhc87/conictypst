#import "_config.typ": *

#lesson([Hàm Số Lượng Giác — Đồ Thị và Tính Chất], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Bốn Hàm Số Lượng Giác Cơ Bản])

#block(breakable: false)[
  #phuongphap(title: [⚙ Bảng tổng hợp tính chất bốn hàm lượng giác])[
    #align(center)[
      #table(
        columns: (1.124fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        stroke: 0.5pt + luma(180),
        inset: 8pt,
        fill: (col, row) => if row == 0 { c-book.lighten(85%) } else if col == 0 { c-book.lighten(92%) } else { white },
        [*Tính chất*],        [*$y = sin x$*],  [*$y = cos x$*],  [*$y = tan x$*],   [*$y = cot x$*],
        [Tập xác định],       [$RR$],            [$RR$],           [$RR backslash {pi/2 + k pi}$], [$RR backslash {k pi}$],
        [Tập giá trị],        [$[-1;1]$],        [$[-1;1]$],       [$RR$],            [$RR$],
        [Chu kỳ],             [$2pi$],           [$2pi$],          [$pi$],            [$pi$],
        [Chẵn/Lẻ],           [Lẻ],              [Chẵn],           [Lẻ],              [Lẻ],
        [Đồng biến trên],     [$[-pi/2; pi/2]$], [$[-pi; 0]$],    [Mọi khoảng xác định], [nghịch biến],
      )
    ]
  ]
]

#muc([Đồ Thị Hàm $y = a sin(b x + c) + d$])

#block(breakable: false)[
  #ghinho(title: [★ Đọc thông số từ dạng tổng quát])[
    Hàm số $y = a sin(b x + c) + d$ (với $a, b != 0$):

    - *Biên độ* $= |a|$ — chiều cao tối đa của sóng tính từ đường trục.
    - *Chu kỳ* $T = display(frac(2pi, |b|))$ — khoảng cách để đồ thị lặp lại hoàn toàn.
    - *Pha ban đầu* $= -c/b$ — điểm dịch ngang của đồ thị.
    - *Dịch đứng* $= d$ — đường trục của sóng dịch lên/xuống.
    - *Tập giá trị*: $[d - |a|; d + |a|]$.
  ]
]

#vd([Xác định biên độ, chu kỳ, pha ban đầu và vẽ đồ thị $y = 2sin(2x + pi/6) - 1$.])[
  - $a = 2 => $ Biên độ $= 2$.
  - $b = 2 => $ Chu kỳ $T = 2pi/2 = pi$.
  - $c = pi/6 => $ Pha ban đầu $= -pi/12$ (đồ thị dịch phải $pi/12$).
  - $d = -1 => $ Đường trục $y = -1$; Tập giá trị $= [-3; 1]$.

  *Các điểm đặc biệt trong một chu kỳ* (bắt đầu từ $x = -pi/12$):

  #align(center)[
    #table(
      columns: (auto,) * 6,
      align: center,
      stroke: 0.5pt + luma(180),
      inset: 8pt,
      fill: (col, row) => if row == 0 { c-book.lighten(85%) } else { white },
      [$x$], [$-pi/12$], [$pi/6$], [$5pi/12$], [$2pi/3$], [$11pi/12$],
      [$y$], [$-1$], [$1$], [$-1$], [$-3$], [$-1$],
    )
  ]
]

#muc([Ý Nghĩa Vật Lý Của Hàm Lượng Giác])

#block(breakable: false)[
  #nhanxet(title: [◈ Hàm số lượng giác mô tả mọi dao động điều hòa])[
    Mọi dao động tuần hoàn trong tự nhiên đều có thể biểu diễn bởi $x(t) = A sin(omega t + phi)$ trong đó:
    - $A$ là *biên độ dao động* (độ lệch cực đại so với vị trí cân bằng).
    - $omega = 2pi f = 2pi/T$ là *tần số góc* (rad/s).
    - $phi$ là *pha ban đầu* (xác định trạng thái tại $t = 0$).

    *Ứng dụng:* Điện xoay chiều $u(t) = 220sqrt(2) sin(100 pi t)$ V (lưới điện Việt Nam 50 Hz).
  ]
]

#vd([Dòng điện xoay chiều có phương trình $i(t) = 5sin(100 pi t - pi/4)$ (A). Tìm biên độ, chu kỳ, và cường độ hiệu dụng.])[
  - Biên độ $I_0 = 5$ A.
  - Chu kỳ $T = 2pi/(100 pi) = 0{,}02$ s (tần số $f = 50$ Hz).
  - Cường độ hiệu dụng: $I = I_0/sqrt(2) = 5/sqrt(2) = 5sqrt(2)/2 approx 3{,}54$ A.
]

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b2-de1.typ"
