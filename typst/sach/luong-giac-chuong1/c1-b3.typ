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
]// ─────────────────────────────────────────────────
#muc([Ứng Dụng Thực Tế (Mô Hình Hóa Toán Học)])
// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Các bước giải bài toán mô hình hóa bằng PTLG])[
    1. Đọc phương trình mô hình (thường có dạng $h(t) = A sin(omega t + phi) + B$).
    2. Xác định giá trị cần tìm và thiết lập phương trình lượng giác.
    3. Giải phương trình tìm ra họ nghiệm tổng quát.
    4. Áp dụng điều kiện thực tế (ví dụ $t >= 0$, $t$ nằm trong một chu kỳ,...) để lọc nghiệm.
  ]
]

#vd([
  Chiều cao của một cabin trên vòng đu quay so với mặt đất được cho bởi công thức:
  $ h(t) = 15 - 12 cos((pi t)/4) $
  trong đó $t$ tính bằng phút kể từ khi vòng đu quay bắt đầu hoạt động, $h(t)$ tính bằng mét.
  Lần đầu tiên cabin đạt độ cao $21$ mét là ở phút thứ bao nhiêu?
],
  loigiai: [
    #grid(columns: (1fr, auto), gutter: 1em,
      [
        *Bước 1: Thiết lập phương trình.* \
        Ta cần giải phương trình $h(t) = 21$:
        $ 15 - 12 cos((pi t)/4) = 21 \
          <=> -12 cos((pi t)/4) = 6 \
          <=> cos((pi t)/4) = -1/2 $
        
        *Bước 2: Giải phương trình lượng giác.* \
        Ta biết $cos((2pi)/3) = -1/2$, do đó:
        $ hoac((pi t)/4 &= (2pi)/3 + k 2pi, (pi t)/4 &= -(2pi)/3 + k 2pi) <=> hoac(t &= 8/3 + 8k, t &= -8/3 + 8k) quad (k in ZZ) $
        
        *Bước 3: Lọc nghiệm thực tế.* \
        Thời điểm lần đầu tiên ứng với $t > 0$ nhỏ nhất.
        - Với họ nghiệm $t = 8/3 + 8k$, nghiệm dương nhỏ nhất là $t = 8/3$ (khi $k=0$).
        - Với họ nghiệm $t = -8/3 + 8k$, nghiệm dương nhỏ nhất là $t = 16/3$ (khi $k=1$).
        Vậy lần đầu tiên cabin đạt độ cao $21$ m là $t = 8/3$ phút ($2$ phút $40$ giây).
      ],
      [
        #align(center)[
          #cetz.canvas(length: 0.8cm, {
            import cetz.draw: *
            // Vòng quay
            circle((0, 1.5), radius: 1.2, stroke: 1.5pt + c-book)
            // Trục đỡ
            line((0, 1.5), (-0.8, -0.5), stroke: 1.5pt)
            line((0, 1.5), (0.8, -0.5), stroke: 1.5pt)
            // Mặt đất
            line((-1.5, -0.5), (1.5, -0.5), stroke: 1.5pt)
            // Đường đứt nét 21m
            line((-1.5, 2.1), (1.5, 2.1), stroke: (dash: "dashed", paint: red))
            content((1.8, 2.1), text(size: 8pt, fill: red)[$21$m])
            
            // Các vị trí 21m
            circle((calc.cos(120deg)*1.2, 1.5 + calc.sin(120deg)*1.2), radius: 0.1, fill: red)
            circle((calc.cos(60deg)*1.2, 1.5 + calc.sin(60deg)*1.2), radius: 0.1, fill: red)
            
            // Cabin xuất phát
            circle((0, 0.3), radius: 0.1, fill: blue)
            content((-0.4, 0.2), text(size: 8pt, fill: blue)[$t=0$])
          })
        ]
      ]
    )
  ]
)

#pagebreak()


#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b3-de1.typ"
