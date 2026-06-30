#import "_config.typ": *

#lesson([Lũy Thừa], theme-color: c-book)

#q-label([A. LÝ THUYẾT TRỌNG TÂM], c-book)

#muc([1. Lũy thừa với số mũ nguyên])

#block(breakable: false)[
  #phuongphap(title: [⚙ Khái niệm và Tính chất])[
    - Cho $a in RR$, $n in NN^*$. Lũy thừa bậc $n$ của $a$ là tích của $n$ thừa số $a$:
      $ a^n = underbrace(a dot a dot ... dot a, n "thừa số") $
    - Với $a != 0$, ta quy ước: 
      $ a^0 = 1, quad a^(-n) = 1/a^n quad (n in NN^*) $
    - *Lưu ý:* $0^0$ và $0^(-n)$ không có nghĩa.
  ]
]

#muc([2. Căn bậc $n$])

#block(breakable: false)[
  #phuongphap(title: [⚙ Định nghĩa và Tính chất])[
    - Cho $n in NN, n >= 2$. Số $x$ được gọi là căn bậc $n$ của số $a$ nếu $x^n = a$.
    - *Với $n$ lẻ:* Mọi số thực $a$ đều có duy nhất một căn bậc $n$, ký hiệu là $root(n, a)$.
    - *Với $n$ chẵn:*
      - Nếu $a < 0$: Không tồn tại căn bậc $n$ của $a$.
      - Nếu $a = 0$: Có một căn bậc $n$ là $0$.
      - Nếu $a > 0$: Có hai căn bậc $n$ là hai số đối nhau, ký hiệu là $root(n, a)$ (căn số học) và $-root(n, a)$.
    - *Tính chất (với $a, b > 0$):*
      - $root(n, a b) = root(n, a) dot root(n, b)$
      - $root(n, a/b) = (root(n, a)) / (root(n, b))$
      - $root(n, a^m) = (root(n, a))^m$
      - $root(n, root(k, a)) = root(n k, a)$
  ]
]

#muc([3. Lũy thừa với số mũ hữu tỉ và số thực])

#block(breakable: false)[
  #phuongphap(title: [⚙ Số mũ hữu tỉ])[
    - Cho $a > 0$ và số hữu tỉ $r = m/n$ trong đó $m in ZZ, n in NN^*, n >= 2$.
    - Lũy thừa của $a$ với số mũ $r$ được định nghĩa là:
      $ a^(m/n) = root(n, a^m) $
    - *Lưu ý:* Cơ số $a$ *bắt buộc phải dương* ($a > 0$). Ví dụ: $(-2)^(1/3)$ là không xác định dù $root(3, -2)$ có nghĩa.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Số mũ thực và Tính chất chung])[
    - Lũy thừa với số mũ thực $alpha in RR$ của $a > 0$ là giới hạn của các lũy thừa với số mũ hữu tỉ tiến dần tới $alpha$.
    - *Các tính chất của lũy thừa (với $a, b > 0; x, y in RR$):*
      1. $a^x dot a^y = a^(x+y)$
      2. $a^x / a^y = a^(x-y)$
      3. $(a^x)^y = a^(x y)$
      4. $(a b)^x = a^x dot b^x$
      5. $(a/b)^x = a^x / b^x$
    - *Tính đồng biến, nghịch biến:*
      - Nếu $a > 1$: $a^x > a^y <=> x > y$ (Cùng chiều).
      - Nếu $0 < a < 1$: $a^x > a^y <=> x < y$ (Ngược chiều).
  ]
]

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c2-b1-de1.typ"
