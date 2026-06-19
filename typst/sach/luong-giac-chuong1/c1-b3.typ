#import "_config.typ": *

#lesson([Phương Trình Lượng Giác Cơ Bản], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Phương trình $sin x = m$])

#block(breakable: false)[
  #phuongphap(title: [⚙ Giải phương trình $sin x = m$])[
    - *Điều kiện có nghiệm:* $|m| <= 1$. (Nếu $|m| > 1$, phương trình vô nghiệm).
    - *Cách giải:* Tìm một góc $alpha$ sao cho $sin alpha = m$. Khi đó:
      $ hoac(x = alpha + k 2pi, x = pi - alpha + k 2pi) quad (k in ZZ) $
    - *Chú ý:* Nếu dùng đơn vị độ, công thức trở thành:
      $ hoac(x = alpha° + k 360°, x = 180° - alpha° + k 360°) $
  ]
]

#vd([Giải phương trình $sin x = 1/2$.])[
  Ta biết $sin(pi/6) = 1/2$, nên ta chọn $alpha = pi/6$.
  Nghiệm của phương trình là:
  $ hoac(x &= pi/6 + k 2pi, x &= pi - pi/6 + k 2pi) <=> hoac(x &= pi/6 + k 2pi, x &= (5pi)/6 + k 2pi) quad (k in ZZ) $
]

#muc([Phương trình $cos x = m$])

#block(breakable: false)[
  #phuongphap(title: [⚙ Giải phương trình $cos x = m$])[
    - *Điều kiện có nghiệm:* $|m| <= 1$.
    - *Cách giải:* Tìm một góc $alpha$ sao cho $cos alpha = m$. Khi đó:
      $ hoac(x = alpha + k 2pi, x = -alpha + k 2pi) quad (k in ZZ) $
  ]
]

#vd([Giải phương trình $cos 2x = -sqrt(2)/2$.])[
  Ta có $cos((3pi)/4) = -sqrt(2)/2$.
  Nghiệm của phương trình:
  $ 2x = +- (3pi)/4 + k 2pi <=> x = +- (3pi)/8 + k pi quad (k in ZZ) $
]

#muc([Phương trình $tan x = m$ và $cot x = m$])

#block(breakable: false)[
  #phuongphap(title: [⚙ Giải phương trình $tan x = m$ và $cot x = m$])[
    - *Điều kiện có nghiệm:* Luôn có nghiệm với mọi $m in RR$.
    - *Phương trình $tan x = m$:*
      Tìm $alpha$ sao cho $tan alpha = m$. Nghiệm: $x = alpha + k pi quad (k in ZZ)$
    - *Phương trình $cot x = m$:*
      Tìm $alpha$ sao cho $cot alpha = m$. Nghiệm: $x = alpha + k pi quad (k in ZZ)$
  ]
]

#block(breakable: false)[
  #luuy(title: [▲ Các trường hợp đặc biệt cần nhớ nhanh])[
    Với $sin x$:
    - $sin x = 0 <=> x = k pi$
    - $sin x = 1 <=> x = pi/2 + k 2pi$
    - $sin x = -1 <=> x = -pi/2 + k 2pi$

    Với $cos x$:
    - $cos x = 0 <=> x = pi/2 + k pi$
    - $cos x = 1 <=> x = k 2pi$
    - $cos x = -1 <=> x = pi + k 2pi$
  ]
]

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b3-de1.typ"
