#import "_config.typ": *

#lesson([Các Công Thức Lượng Giác], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Công thức cộng])

#block(breakable: false)[
  #phuongphap(title: [⚙ Công thức cộng])[
    $ sin(a + b) &= sin a cos b + cos a sin b \
    sin(a - b) &= sin a cos b - cos a sin b \
    cos(a + b) &= cos a cos b - sin a sin b \
    cos(a - b) &= cos a cos b + sin a sin b $

    *Mẹo nhớ:*
    - "Sin thì sin cos cos sin" (cùng dấu)
    - "Cos thì cos cos sin sin" (ngược dấu)
    
    $ tan(a + b) &= (tan a + tan b) / (1 - tan a tan b) \
    tan(a - b) &= (tan a - tan b) / (1 + tan a tan b) $
  ]
]

#vd([Tính giá trị $sin 75°$.])[
  $sin 75° = sin(45° + 30°) = sin 45° cos 30° + cos 45° sin 30°$
  $ = sqrt(2)/2 dot sqrt(3)/2 + sqrt(2)/2 dot 1/2 = (sqrt(6) + sqrt(2))/4 $
]

#muc([Công thức nhân đôi và hạ bậc])

#block(breakable: false)[
  #phuongphap(title: [⚙ Công thức nhân đôi và hạ bậc])[
    *Công thức nhân đôi:*
    $ sin 2a &= 2 sin a cos a \
    cos 2a &= cos^2 a - sin^2 a = 2 cos^2 a - 1 = 1 - 2 sin^2 a \
    tan 2a &= (2 tan a) / (1 - tan^2 a) $

    *Công thức hạ bậc (suy ra từ cos 2a):*
    $ cos^2 a = (1 + cos 2a) / 2 \
    sin^2 a = (1 - cos 2a) / 2 $
  ]
]

#vd([Cho $sin a = 3/5$ và $pi/2 < a < pi$. Tính $sin 2a$ và $cos 2a$.])[
  Vì $pi/2 < a < pi$ nên $cos a < 0$. Ta tính được $cos a = -4/5$.
  $sin 2a = 2 sin a cos a = 2 (3/5) (-4/5) = -24/25$.
  $cos 2a = 1 - 2 sin^2 a = 1 - 2(9/25) = 7/25$.
]

#muc([Công thức biến đổi tổng thành tích và ngược lại])

#block(breakable: false)[
  #phuongphap(title: [⚙ Biến đổi tổng thành tích])[
    $ cos a + cos b &= 2 cos((a+b)/2) cos((a-b)/2) \
    cos a - cos b &= -2 sin((a+b)/2) sin((a-b)/2) \
    sin a + sin b &= 2 sin((a+b)/2) cos((a-b)/2) \
    sin a - sin b &= 2 cos((a+b)/2) sin((a-b)/2) $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Biến đổi tích thành tổng])[
    $ cos a cos b &= 1/2 [cos(a - b) + cos(a + b)] \
    sin a sin b &= 1/2 [cos(a - b) - cos(a + b)] \
    sin a cos b &= 1/2 [sin(a - b) + sin(a + b)] $
  ]
]

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b4-de1.typ"
