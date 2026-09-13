#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#bai("HỆ THỨC LƯỢNG TRONG TAM GIÁC", mau: C3)

#ly-thuyet(tieu-de: "A. LÝ THUYẾT CẦN NHỚ", mau: C3)[
  Cho tam giác $A B C$, đặt $B C = a, C A = b, A B = c, S$ là diện tích tam giác. Giả sử $h_a, h_b, h_c$ lần lượt là độ dài các đường cao; $m_a, m_b, m_c$ là các đường trung tuyến; $R$ và $r$ lần lượt là bán kính đường tròn ngoại tiếp và nội tiếp tam giác $A B C$.
  
  + *1. Định lý côsin*:
    $ a^2 = b^2 + c^2 - 2 b c cos A, quad b^2 = c^2 + a^2 - 2 c a cos B, quad c^2 = a^2 + b^2 - 2 a b cos C $
    - *Hệ quả*:
      $ cos A = (b^2 + c^2 - a^2)/(2 b c), quad cos B = (a^2 + c^2 - b^2)/(2 a c), quad cos C = (a^2 + b^2 - c^2)/(2 a b) $

  + *2. Định lý sin*:
    $ a / (sin A) = b / (sin B) = c / (sin C) = 2 R $

  + *3. Các công thức tính diện tích tam giác*:
    - $S = 1/2 a h_a = 1/2 b h_b = 1/2 c h_c$.
    - $S = 1/2 b c sin A = 1/2 c a sin B = 1/2 a b sin C$.
    - $S = (a b c)/(4 R)$.
    - $S = p r$ với nửa chu vi $p = (a + b + c)/2$.
    - *Công thức Heron*: $S = sqrt(p(p - a)(p - b)(p - c))$.

  + *4. Công thức tính độ dài đường trung tuyến*:
    $ m_a^2 = (2(b^2 + c^2) - a^2)/4, quad m_b^2 = (2(a^2 + c^2) - b^2)/4, quad m_c^2 = (2(a^2 + b^2) - c^2)/4 $
]

#include "bai02-dang01.typ"
#include "bai02-dang02.typ"
#include "bai02-dang03.typ"
#include "bai02-dang04.typ"
