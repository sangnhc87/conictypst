#import "_config.typ": *

#lesson([Góc Lượng Giác và Số Đo Lượng Giác], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Góc Lượng Giác])

#block(breakable: false)[
  #dn(title: [Định nghĩa góc lượng giác])[
    Trong mặt phẳng, chọn một điểm $O$ và hai tia $O x$, $O y$ xuất phát từ $O$. Một *góc lượng giác* $(O x, O y)$ là một góc được tạo thành bằng cách quay tia $O x$ về tia $O y$ theo một chiều xác định.

    - *Chiều dương*: Ngược chiều kim đồng hồ.
    - *Chiều âm*: Cùng chiều kim đồng hồ.
    - *Tia đầu*: $O x$ (tia xuất phát); *Tia cuối*: $O y$ (tia kết thúc).
    - Hai góc có cùng tia đầu và tia cuối nhưng số đo khác nhau một bội số nguyên của $2pi$ (hay $360°$) thì gọi là *đồng vị*.
  ]
]

#block(breakable: false)[
  #luuy(title: [▲ Sự khác biệt với góc hình học])[
    Trong hình học Euclid, góc chỉ có số đo trong $[0°; 180°]$. Trong lượng giác, góc có thể âm, có thể lớn hơn $360°$, và hai góc *có thể khác nhau* dù cùng tia cuối. Đây là điểm mở rộng quan trọng nhất cần ghi nhớ.
  ]
]

#muc([Đơn vị đo góc])

#block(breakable: false)[
  #ghinho(title: [★ Hệ độ và Hệ Radian])[
    - *Hệ độ:* Chia vòng tròn thành $360$ phần đều — $1$ phần = $1°$. Đây là hệ quen thuộc nhưng tạo ra hệ số $pi/180$ khi tính toán.

    - *Hệ Radian:* $1$ radian là góc ở tâm chắn cung bằng bán kính. Một vòng tròn đầy đủ = $2pi$ rad.

    - *Mối liên hệ cốt lõi:*
      $ 180° = pi " rad" quad quad arrow.l.r quad quad alpha° = alpha dot frac(pi, 180) " rad" $

    - *Ưu điểm của radian:* Đạo hàm của $sin x$ là $cos x$ — không có hệ số dư thừa (lý do duy nhất radian tốt hơn cho tính toán).
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Quy đổi nhanh các góc đặc biệt])[
    #align(center)[
      #table(
        columns: (auto,) * 7,
        align: center,
        stroke: 0.5pt + luma(180),
        inset: 8pt,
        fill: (col, row) => if row == 0 { c-book.lighten(85%) } else if col == 0 { c-book.lighten(92%) } else { white },
        [*Độ*], [$0°$], [$30°$], [$45°$], [$60°$], [$90°$], [$180°$],
        [*Radian*], [$0$], [$display(pi/6)$], [$display(pi/4)$], [$display(pi/3)$], [$display(pi/2)$], [$pi$],
      )
    ]

    *Mẹo nhớ sin:* $sin 0°, sin 30°, sin 45°, sin 60°, sin 90°$ lần lượt bằng $sqrt(0)/2, sqrt(1)/2, sqrt(2)/2, sqrt(3)/2, sqrt(4)/2$.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Công thức độ dài cung và diện tích hình quạt])[
    Cho hình quạt tròn bán kính $R$, góc ở tâm $alpha$ (*radian*):

    $ display(l = R alpha) quad quad display(S = frac(1,2) R^2 alpha = frac(1,2) R l) $

    *Lưu ý bắt buộc:* $alpha$ phải là số đo radian. Nếu đề cho số đo độ thì phải chuyển trước.
  ]
]

#vd([Tính độ dài cung $A B$ của đường tròn bán kính $R = 5$ cm, biết góc ở tâm $A O B = 72°$.])[
  *Chuyển đổi:* $72° = 72 dot display(pi/180) = display(2pi/5)$ (rad).

  *Độ dài cung:* $l = R alpha = 5 dot display(2pi/5) = 2pi approx 6{,}28$ (cm).
]

#muc([Đường tròn lượng giác])

#block(breakable: false)[
  #dn(title: [Đường tròn lượng giác và bốn hàm lượng giác])[
    Đường tròn lượng giác là đường tròn tâm $O$, bán kính $R = 1$ được dùng để định nghĩa tổng quát bốn hàm lượng giác.

    Với góc $alpha$ (tia đầu $O x$, tia cuối $O M$), điểm $M(x_0, y_0)$ trên đường tròn xác định:
    - $cos alpha = x_0$ (hoành độ của $M$)
    - $sin alpha = y_0$ (tung độ của $M$)
    - $tan alpha = display(y_0/x_0) = display(sin alpha / cos alpha)$ (với $cos alpha != 0$)
    - $cot alpha = display(x_0/y_0) = display(cos alpha / sin alpha)$ (với $sin alpha != 0$)

    *Điều này hoạt động với mọi góc thực:* âm, lớn hơn $360°$, hay bất kỳ số thực nào.
  ]
]

#block(breakable: false)[
  #ghinho(title: [★ Các hằng đẳng thức cơ bản — bắt buộc thuộc lòng])[
    - $sin^2 alpha + cos^2 alpha = 1$ (trực tiếp từ định lý Pythagoras trên đường tròn đơn vị)
    - $display(1 + tan^2 alpha = frac(1, cos^2 alpha))$ (với $cos alpha != 0$)
    - $display(1 + cot^2 alpha = frac(1, sin^2 alpha))$ (với $sin alpha != 0$)
    - $tan alpha dot cot alpha = 1$ (khi cả hai đều xác định)
  ]
]

#block(breakable: false)[
  #nhanxet(title: [◈ Dấu theo góc phần tư — Quy tắc "Nhất cả, Nhì sin, Tam tang, Tứ cos"])[
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center,
        stroke: 0.5pt + luma(180),
        inset: 8pt,
        fill: (col, row) => if row == 0 { c-book.lighten(85%) } else if col == 0 { c-book.lighten(92%) } else { white },
        [*Góc phần tư*], [*sin*], [*cos*], [*tan*], [*cot*],
        [I $(0 < alpha < pi/2)$],   [$+$], [$+$], [$+$], [$+$],
        [II $(pi/2 < alpha < pi)$], [$+$], [$-$], [$-$], [$-$],
        [III $(pi < alpha < 3pi/2)$],[$-$], [$-$], [$+$], [$+$],
        [IV $(3pi/2 < alpha < 2pi)$],[$-$], [$+$], [$-$], [$-$],
      )
    ]
  ]
]

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b1-de1.typ"
