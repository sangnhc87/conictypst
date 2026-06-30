#import "_config.typ": *

#lesson([Hàm Số $y = a sin x + b cos x$ — Biên Độ và Pha], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

// ─────────────────────────────────────────────────
#muc([Biến Đổi $a sin x + b cos x$ về Dạng $R sin(x + phi)$])
// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Công thức biến đổi cốt lõi])[
    Với $a, b in RR$ không đồng thời bằng 0, ta có:
    $ a sin x + b cos x = R sin(x + phi) $
    trong đó:
    $ R = sqrt(a^2 + b^2) > 0 $
    $ cos phi = display(a / R), quad sin phi = display(b / R) $

    *Cách nhớ:* Đặt $phi$ là góc trong tam giác vuông có cạnh $a$, $b$ và cạnh huyền $R$.
    - Nếu $a > 0, b > 0$: $phi in (0°, 90°)$ (góc I).
    - Nếu $a < 0, b > 0$: $phi in (90°, 180°)$ (góc II).
    - Nếu $a < 0, b < 0$: $phi in (-180°, -90°)$ (góc III).

    *Hệ quả ngay lập tức:*
    $ -R <= a sin x + b cos x <= R $
    $ max = R quad "khi" quad x + phi = pi/2 + k 2 pi $
    $ min = -R quad "khi" quad x + phi = -pi/2 + k 2 pi $
  ]
]

// Minh họa bằng CeTZ — vector quay
#block(breakable: false)[
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Hệ trục
      line((-0.5, 0), (4, 0), mark: (end: ">"), stroke: 0.8pt)
      line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
      content((4.1, -0.25), text(size: 9pt)[$a$])
      content((0.25, 3.4), text(size: 9pt)[$b$])
      content((-0.2, -0.2), text(size: 9pt)[$O$])

      // Tam giác vuông biểu diễn (a, b, R)
      let a_val = 2.5
      let b_val = 1.8
      let R = calc.sqrt(a_val * a_val + b_val * b_val)

      line((0, 0), (a_val, 0), stroke: (paint: rgb("#0f766e"), thickness: 2pt))
      line((a_val, 0), (a_val, b_val), stroke: (paint: rgb("#b91c1c"), thickness: 2pt))
      line((0, 0), (a_val, b_val), stroke: (paint: c-book, thickness: 2pt))

      // Nhãn
      content((a_val/2, -0.3), text(size: 9pt, fill: rgb("#0f766e"))[$a$])
      content((a_val + 0.3, b_val/2), text(size: 9pt, fill: rgb("#b91c1c"))[$b$])
      content((a_val/2 - 0.2, b_val/2 + 0.2), text(size: 10pt, weight: "bold", fill: c-book)[$R$])

      // Góc phi
      let phi_angle = calc.atan2(b_val, a_val)
      arc((rel: (angle: 0deg, radius: 0.8), to: (0,0)), start: 0deg, stop: phi_angle, radius: 0.8,
          stroke: 0.5pt + c-book)
      content((0.65, 0.2), text(size: 9pt, fill: c-book)[$phi$])

      // Điểm R
      circle((a_val, b_val), radius: 0.07, fill: c-book)

      // Chú thích
      content((a_val + 0.6, b_val + 0.2), text(size: 9pt)[$R = sqrt(a^2+b^2)$])
    })
  ]
]

#vd([Biến đổi $f(x) = 3 sin x + 4 cos x$ về dạng $R sin(x + phi)$. Tìm giá trị lớn nhất và nhỏ nhất của $f(x)$.],
  loigiai: [
    $R = sqrt(3^2 + 4^2) = sqrt(9 + 16) = sqrt(25) = 5$.

    $cos phi = 3/5$; $sin phi = 4/5$ → $phi = arctan(4/3) approx 53.1°$.

    Vậy $f(x) = 5 sin(x + phi)$.

    - $max f(x) = 5$ khi $x + phi = pi/2 + k 2pi$, tức $x = pi/2 - phi + k 2pi$.
    - $min f(x) = -5$ khi $x + phi = -pi/2 + k 2pi$.
  ]
)

// ─────────────────────────────────────────────────
#muc([Đồ Thị $y = R sin(x + phi)$ — Dịch Pha])
// ─────────────────────────────────────────────────

#block(breakable: false)[
  #ghinho(title: [★ Đọc đồ thị hàm số $y = R sin(b x + phi) + d$])[
    #grid(columns: (1fr, 1fr), gutter: 1.5em,
      [
        - *Biên độ*: $R = |a|$ (chiều cao nửa sóng)
        - *Chu kỳ*: $T = display(2pi / |b|)$
        - *Tần số*: $f = display(1/T)$
        - *Pha ban đầu*: $-phi/b$ (dịch ngang)
        - *Đường trung bình*: $y = d$
      ],
      [
        #align(center)[
          #cetz.canvas(length: 0.7cm, {
            import cetz.draw: *
            let pi = 3.14159
            // Trục
            line((-0.5, 0), (7, 0), mark: (end: ">"), stroke: 0.7pt)
            line((0, -2), (0, 2.3), mark: (end: ">"), stroke: 0.7pt)
            // Hàm sin gốc (mờ)
            let pts1 = range(0, 140).map(i => (i/20, calc.sin(i/20)))
            line(..pts1, stroke: (paint: gray.lighten(40%), thickness: 0.6pt))
            // Hàm sin dịch pha (nét đậm)
            let phi = 0.785  // pi/4
            let pts2 = range(0, 140).map(i => (i/20, 1.5 * calc.sin(i/20 + phi)))
            line(..pts2, stroke: (paint: c-book, thickness: 1.5pt))

            // Nhãn
            content((3.14, -0.35), text(size: 7pt)[$pi$])
            content((6.28, -0.35), text(size: 7pt)[$2pi$])
            content((-0.3, 1.5), text(size: 7pt)[$R$])
            content((-0.35, -1.5), text(size: 7pt)[$-R$])
            line((-0.05, 1.5), (0.05, 1.5))
            line((-0.05, -1.5), (0.05, -1.5))
            line((3.14, -0.05), (3.14, 0.05))
            line((6.28, -0.05), (6.28, 0.05))
          })
        ]
      ]
    )
  ]
]

// ─────────────────────────────────────────────────
#muc([Ứng Dụng: Sóng âm, Điện xoay chiều, Dao động])
// ─────────────────────────────────────────────────

#block(breakable: false)[
  #nhanxet(title: [◈ Mô hình hóa âm nhạc và điện học])[
    *Sóng âm:* Một nốt nhạc tần số $f$ Hz có phương trình áp suất:
    $ p(t) = A sin(2 pi f t + phi_0) $

    *Điện xoay chiều:* Điện áp lưới điện Việt Nam:
    $ u(t) = 220 sqrt(2) sin(100 pi t) approx 311 sin(314 t) quad text("(V)") $
    Đây là $R sin(t + phi)$ với $R = 220 sqrt(2)$, tần số 50 Hz.

    *Cộng hai nguồn điện cùng tần số:*
    $ u_1 + u_2 = U_1 sin(omega t + phi_1) + U_2 sin(omega t + phi_2) $
    Biến đổi về tổng $sin + cos$ rồi dùng công thức trên để tính biên độ tổng hợp.
  ]
]

#vd([Điện áp tại hai điểm trong mạch điện là $u_1 = 3 sin(omega t)$ và $u_2 = 4 cos(omega t)$ (V). Tính biên độ điện áp tổng $u = u_1 + u_2$.],
  loigiai: [
    $u = 3 sin(omega t) + 4 cos(omega t) = R sin(omega t + phi)$

    $R = sqrt(3^2 + 4^2) = sqrt(25) = 5$ V.

    Biên độ điện áp tổng là $5$ V.

    *Ứng dụng vật lý:* Đây chính là phép cộng véc-tơ biên độ trong giản đồ Fresnel.
  ]
)

// ─────────────────────────────────────────────────
#muc([Giải Phương Trình $a sin x + b cos x = c$])
// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Các bước giải $a sin x + b cos x = c$])[
    + Tính $R = sqrt(a^2 + b^2)$.
    + *Điều kiện có nghiệm:* $|c| <= R$ (nếu $|c| > R$: vô nghiệm).
    + Biến đổi: $R sin(x + phi) = c => sin(x + phi) = display(c/R)$.
    + Giải phương trình $sin$ cơ bản.
  ]
]

#vd([Giải phương trình $sin x + cos x = 1$.],
  loigiai: [
    $R = sqrt(1 + 1) = sqrt(2)$.

    $sin x + cos x = sqrt(2) sin(x + pi/4) = 1$

    $sin(x + pi/4) = display(1/sqrt(2)) = display(sqrt(2)/2)$

    $hoac(x + pi/4 = pi/4 + k 2pi, x + pi/4 = pi - pi/4 + k 2pi)
    <=> hoac(x = k 2pi, x = pi/2 + k 2pi) quad (k in ZZ)$
  ]
)

#block(breakable: false)[
  #luuy(title: [▲ Dạng thay thế: nhân với hệ số phụ])[
    Ngoài dạng $R sin(x+phi)$, ta cũng có thể biến đổi về $R cos(x - phi')$:
    $ a sin x + b cos x = R cos(x - phi') $
    với $cos phi' = display(b/R)$, $sin phi' = display(a/R)$.

    Dùng dạng nào cũng cho kết quả tương đương — chọn dạng dễ nhớ hơn.
  ]
]

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b6-de1.typ"
