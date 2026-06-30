#import "_config.typ": *

#lesson([Logarit], theme-color: c-book)

#q-label([A. LÝ THUYẾT TRỌNG TÂM], c-book)

#muc([1. Định nghĩa])

#block(breakable: false)[
  #phuongphap(title: [⚙ Định nghĩa Logarit])[
    - Cho hai số dương $a, b$ với $a != 1$. Số $alpha$ thỏa mãn đẳng thức $a^alpha = b$ được gọi là logarit cơ số $a$ của $b$, ký hiệu là $log_a b$.
    - Như vậy: $alpha = log_a b <=> a^alpha = b$.
    - *Chú ý:* Không có logarit của số âm và số $0$. Cơ số $a$ phải dương và khác 1.
  ]
]

#muc([2. Tính chất và các quy tắc tính Logarit])

#block(breakable: false)[
  #phuongphap(title: [⚙ Các tính chất cơ bản])[
    Với $a > 0, a != 1$ và $b > 0$:
    1. $log_a 1 = 0$
    2. $log_a a = 1$
    3. $a^(log_a b) = b$
    4. $log_a (a^alpha) = alpha$
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Quy tắc tính logarit])[
    Với $a > 0, a != 1$ và $b, c > 0$:
    - *Logarit của một tích:* $log_a (b c) = log_a b + log_a c$
    - *Logarit của một thương:* $log_a (b/c) = log_a b - log_a c$
    - *Logarit của một lũy thừa:* $log_a (b^alpha) = alpha log_a b$
    - *Đặc biệt:* $log_a (root(n, b)) = 1/n log_a b$ (với $n in NN^*, n >= 2$)
  ]
]

#muc([3. Đổi cơ số])

#block(breakable: false)[
  #phuongphap(title: [⚙ Công thức đổi cơ số])[
    Cho $a, b, c > 0$ và $a, c != 1$. Ta có:
    $ log_a b = (log_c b) / (log_c a) $
    - *Hệ quả 1:* $log_a b = 1 / (log_b a)$ (khi $b != 1$)
    - *Hệ quả 2:* $log_(a^alpha) b = 1/alpha log_a b$ (với $alpha != 0$)
    - *Hệ quả 3:* $log_a b dot log_b c = log_a c$
  ]
]

#muc([4. Logarit thập phân và Logarit tự nhiên])

#block(breakable: false)[
  #phuongphap(title: [⚙ Các logarit đặc biệt])[
    - *Logarit thập phân:* Là logarit cơ số 10. Ký hiệu là $log x$ hoặc $lg x$ thay cho $log_10 x$.
    - *Logarit tự nhiên:* Là logarit cơ số $e$ (với $e approx 2.71828...$). Ký hiệu là $ln x$ thay cho $log_e x$.
  ]
]

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c2-b2-de1.typ"
