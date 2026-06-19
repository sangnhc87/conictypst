#import "_config.typ": *

#lesson([Phương Trình, Bất Phương Trình Mũ và Logarit], theme-color: c-book)

#q-label([A. LÝ THUYẾT TRỌNG TÂM], c-book)

#muc([1. Phương trình mũ cơ bản])

#block(breakable: false)[
  #phuongphap(title: [⚙ Phương trình $a^x = b$ (với $a > 0, a != 1$)])[
    - Nếu $b <= 0$: Phương trình vô nghiệm.
    - Nếu $b > 0$: Phương trình có nghiệm duy nhất $x = log_a b$.
    - *Ví dụ:* $2^x = 8 <=> x = log_2 8 = 3$.
  ]
]

#muc([2. Phương trình logarit cơ bản])

#block(breakable: false)[
  #phuongphap(title: [⚙ Phương trình $log_a x = b$ (với $a > 0, a != 1$)])[
    - Điều kiện: $x > 0$.
    - Phương trình luôn có nghiệm duy nhất $x = a^b$ với mọi $b in RR$.
    - *Ví dụ:* $log_3 x = 2 <=> x = 3^2 = 9$.
  ]
]

#muc([3. Các phương pháp giải thường gặp])

#block(breakable: false)[
  #phuongphap(title: [⚙ Phương pháp đưa về cùng cơ số])[
    - **Đối với phương trình mũ:** $a^(f(x)) = a^(g(x)) <=> f(x) = g(x)$.
    - **Đối với phương trình logarit:** $log_a f(x) = log_a g(x) <=> f(x) = g(x) > 0$. \
      *(Lưu ý: Bắt buộc phải có điều kiện $f(x) > 0$ hoặc $g(x) > 0$ trước khi giải).*
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Phương pháp đặt ẩn phụ])[
    - Đưa phương trình về dạng đa thức của một hàm số mũ hoặc logarit.
    - *Ví dụ:* $A dot a^(2x) + B dot a^x + C = 0$, ta đặt $t = a^x$ (điều kiện $t > 0$) để đưa về phương trình bậc hai $A t^2 + B t + C = 0$.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Phương pháp logarit hóa / mũ hóa])[
    - Áp dụng khi hai vế có cơ số khác nhau.
    - *Ví dụ:* $2^x = 3^(x-1)$, ta lấy logarit cơ số 2 hai vế: $x = (x-1) log_2 3$.
  ]
]

#muc([4. Bất phương trình mũ và logarit])

#block(breakable: false)[
  #phuongphap(title: [⚙ Dấu của bất phương trình phụ thuộc vào cơ số])[
    - **Trường hợp cơ số $a > 1$ (giữ nguyên chiều):**
      - $a^(f(x)) > a^(g(x)) <=> f(x) > g(x)$
      - $log_a f(x) > log_a g(x) <=> f(x) > g(x) > 0$
    - **Trường hợp cơ số $0 < a < 1$ (đảo chiều):**
      - $a^(f(x)) > a^(g(x)) <=> f(x) < g(x)$
      - $log_a f(x) > log_a g(x) <=> 0 < f(x) < g(x)$
  ]
]

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c2-b4-de1.typ"
