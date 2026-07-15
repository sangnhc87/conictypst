#import "../lib.typ": *

#set page(width: 21cm, height: 8cm, margin: 12mm)
#set text(size: 14pt)
#show: sang-setup

= Option baseline contract

#mcq(
  [Các nhãn A, B, C, D phải ngang baseline với ký tự $a$, không ngang giữa toàn bộ số mũ.],
  (
    [$a^(1/6)$],
    [$a^(2/3)$],
    [$a^(5/6)$],
    [$a^(5/3)$],
  ),
  cols: 4,
)

#mcq(
  [Dòng dài vẫn phải thụt treo đúng sau nhãn.],
  (
    [Nội dung dài có $x^2$ và tự xuống dòng nhưng không chui xuống dưới nhãn A.],
    [Nội dung thường],
  ),
  cols: 2,
)
