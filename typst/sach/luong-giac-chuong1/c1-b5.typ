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
  Vị trí cân bằng tương ứng $x = 0$:
  $ 4 cos(2pi t - pi/3) = 0 <=> cos(2pi t - pi/3) = 0 $
  $ 2pi t - pi/3 = pi/2 + k pi <=> 2pi t = (5pi)/6 + k pi <=> t = 5/12 + k/2 quad (k in ZZ) $
  Vì thời gian $t >= 0$ nên $5/12 + k/2 >= 0 <=> k >= -5/6 => k = 0, 1, 2, ...$
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
  Mực nước cao nhất khi $cos(pi/6 t) = 1$.
  $ pi/6 t = k 2pi <=> t = 12k quad (k in ZZ) $
  Với $0 <= t < 24$, ta có $k = 0 => t = 0$ (nửa đêm) và $k = 1 => t = 12$ (trưa).
  Vậy mực nước cao nhất lúc $0$ giờ và $12$ giờ trưa.
]

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b5-de1.typ"
