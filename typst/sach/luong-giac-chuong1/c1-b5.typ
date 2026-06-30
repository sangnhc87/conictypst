#import "_config.typ": *

#lesson([Ứng Dụng Thực Tế Của Lượng Giác], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Ứng dụng trong vật lý: Dao động điều hòa])

#block(breakable: false)[
  #phuongphap(title: [⚙ Dao động điều hòa])[
    Phương trình li độ: $x = A cos(omega t + phi)$
    - $x$: Li độ (vị trí so với VTCB).
    - $A > 0$: Biên độ.
    - $omega > 0$: Tần số góc. Chu kỳ $T = (2pi)/omega$.
    - $phi$: Pha ban đầu.

    *Bài toán thường gặp:*
    - Tìm thời điểm vật đi qua vị trí cân bằng ($x = 0 <=> cos(omega t + phi) = 0$).
    - Tìm thời điểm vật đạt li độ lớn nhất ($x = A <=> cos(omega t + phi) = 1$).
  ]
]

#vd([Một vật dao động điều hòa theo phương trình $x = 4 cos(2pi t - pi/3)$ (cm, s). Tìm các thời điểm vật đi qua vị trí cân bằng.])[
  #grid(columns: (1fr, auto), gutter: 1em,
    [
      Vị trí cân bằng tương ứng $x = 0$:
      $ 4 cos(2pi t - pi/3) = 0 <=> cos(2pi t - pi/3) = 0 $
      $ 2pi t - pi/3 = pi/2 + k pi <=> 2pi t = (5pi)/6 + k pi <=> t = 5/12 + k/2 quad (k in ZZ) $
      Vì thời gian $t >= 0$ nên $5/12 + k/2 >= 0 <=> k >= -5/6 => k = 0, 1, 2, ...$ \
      Các thời điểm đầu tiên: $t_1 = 5/12$ s, $t_2 = 11/12$ s, $t_3 = 17/12$ s.
    ],
    [
      #align(center)[
        #cetz.canvas(length: 0.8cm, {
          import cetz.draw: *
          line((0, 0), (6.5, 0), mark: (end: ">"), stroke: 0.8pt)
          content((6.2, -0.3), text(size: 8pt)[$t$ (s)])
          line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
          content((-0.4, 2.3), text(size: 8pt)[$x$ (cm)])
          
          let pts = range(0, 125).map(i => {
            let t = i / 20
            let x = 4 * calc.cos(360deg * t - 60deg)
            (t, x / 2) // scale x by 2
          })
          line(..pts, stroke: 1.5pt + orange)
          
          // Điểm t = 5/12 ≈ 0.416
          circle((5/12, 0), radius: 0.1, fill: red)
          content((5/12, 0.4), text(size: 7pt, fill: red)[$t_1$])
          // Điểm t = 11/12 ≈ 0.916
          circle((11/12, 0), radius: 0.1, fill: red)
          content((11/12, 0.4), text(size: 7pt, fill: red)[$t_2$])
        })
      ]
    ]
  )
]

#muc([Ứng dụng trong thuỷ triều và thời tiết])

#block(breakable: false)[
  #nhanxet(title: [◈ Mô hình hoá bằng hàm sin/cos])[
    Nhiều hiện tượng tự nhiên có tính lặp lại (chu kỳ) như mực nước biển (thuỷ triều), nhiệt độ trung bình trong năm, thời gian mặt trời mọc... được mô hình hoá bởi hàm số dạng:
    $ y = a sin(b(t - c)) + d $
    Trong đó:
    - Biên độ $a = (max y - min y) / 2$.
    - Đường trục $d = (max y + min y) / 2$.
    - Chu kỳ $T = (2pi)/b$.
  ]
]

#vd([Mực nước biển tại một cảng trong ngày được cho bởi hàm số $h(t) = 1.5 cos(pi/6 t) + 3$ (m), với $t$ là số giờ kể từ nửa đêm. Tìm thời điểm mực nước cao nhất trong ngày ($0 <= t < 24$).])[
  #grid(columns: (1fr, auto), gutter: 1em,
    [
      Mực nước cao nhất khi $cos(pi/6 t) = 1$.
      $ pi/6 t = k 2pi <=> t = 12k quad (k in ZZ) $
      Với $0 <= t < 24$, ta có $k = 0 => t = 0$ (nửa đêm) và $k = 1 => t = 12$ (trưa). \
      Mực nước lớn nhất là $1.5 + 3 = 4.5$ (m). \
      Vậy mực nước cao nhất lúc $0$ giờ và $12$ giờ trưa.
    ],
    [
      #align(center)[
        #cetz.canvas(length: 0.6cm, {
          import cetz.draw: *
          line((0, 0), (8.5, 0), mark: (end: ">"), stroke: 0.8pt)
          content((8.2, -0.4), text(size: 8pt)[$t$ (h)])
          line((0, -0.5), (0, 5.5), mark: (end: ">"), stroke: 0.8pt)
          content((-0.6, 5.3), text(size: 8pt)[$h$ (m)])
          
          let pts = range(0, 80).map(i => {
            let t = i * 24 / 79
            let h = 1.5 * calc.cos(180deg / 6 * t) + 3
            (t / 3, h) // scale t by 3
          })
          
          // Thủy triều
          line(..pts, stroke: 1.5pt + blue)
          
          // Đánh dấu Max
          circle((0, 4.5), radius: 0.1, fill: red)
          circle((12/3, 4.5), radius: 0.1, fill: red)
          line((0, 4.5), (12/3, 4.5), stroke: (dash: "dashed", paint: gray))
          line((12/3, 0), (12/3, 4.5), stroke: (dash: "dashed", paint: gray))
          
          content((-0.6, 4.5), text(size: 8pt, fill: red)[$4.5$])
          content((12/3, -0.5), text(size: 8pt)[$12$])
          content((24/3, -0.5), text(size: 8pt)[$24$])
        })
      ]
    ]
  )
]

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b5-de1.typ"
