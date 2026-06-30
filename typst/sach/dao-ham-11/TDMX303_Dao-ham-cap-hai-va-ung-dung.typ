#import "_config.typ": *

#lesson([Bài 3. Đạo hàm cấp hai và Gia tốc], theme-color: c-book)

#q-label([LÝ THUYẾT VÀ PHƯƠNG PHÁP], c-book)

#muc([1. Định nghĩa đạo hàm cấp hai])
#block(breakable: false)[
  #phuongphap(title: [Đạo hàm của đạo hàm])[
    Cho hàm số $y = f(x)$ có đạo hàm $y' = f'(x)$. Nếu hàm số $y'$ tiếp tục có đạo hàm thì đạo hàm của $y'$ được gọi là đạo hàm cấp hai của hàm số $f(x)$, ký hiệu là $y''$ hoặc $f''(x)$.
    $ y'' = (y')' $
    *Ví dụ:* Nếu $y = x^3$, thì đạo hàm cấp một là $y' = 3x^2$, và đạo hàm cấp hai là $y'' = (3x^2)' = 6x$.
  ]
]

#muc([2. Ý nghĩa cơ học của đạo hàm cấp hai])
#block(breakable: false)[
  #phuongphap(title: [Mô hình 3: Gia tốc tức thời])[
    Trong chuyển động thẳng, nếu $s(t)$ là phương trình quãng đường theo thời gian, thì:
    - Vận tốc tức thời là đạo hàm cấp một của quãng đường: $v(t) = s'(t)$.
    - Gia tốc tức thời là tốc độ thay đổi của vận tốc, tức là đạo hàm cấp một của vận tốc, hay đạo hàm cấp hai của quãng đường:
    $ a(t) = v'(t) = s''(t) $
  ]
]

#block(breakable: false)[
  #nhanxet(title: [Phân tích chuyển động bằng đạo hàm])[
    Dựa vào dấu của vận tốc $v(t)$ và gia tốc $a(t)$, ta có thể biết tính chất chuyển động của vật:
    - Nếu $v(t) > 0$ và $a(t) > 0$: Vật đang chuyển động thẳng nhanh dần (vận tốc tăng).
    - Nếu $v(t) > 0$ và $a(t) < 0$: Vật đang chuyển động thẳng chậm dần (vận tốc giảm, ví dụ: đạp phanh xe).
    - Nếu $v(t) = 0$: Vật tạm thời dừng lại.
    *(Đây là nền tảng của vật lý động học lớp 10, được số hóa dưới lăng kính đạo hàm lớp 11)*
  ]
]

---

#q-label([BÀI TẬP THỰC CHIẾN], c-book)

#dang([Dạng 1: Kỹ thuật tính đạo hàm cấp hai])

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = (2x + 1)/(x - 1)$. Đạo hàm cấp hai $y''$ của hàm số là:],
  (True([$y'' = 6 / (x - 1)^3$]), [$y'' = -6 / (x - 1)^3$], [$y'' = 3 / (x - 1)^3$], [$y'' = -3 / (x - 1)^3$]),
  loigiai: [
    #step[*B1: Tính đạo hàm cấp một* \ $y' = ((2)(x-1) - (1)(2x+1))/(x-1)^2 = (2x - 2 - 2x - 1)/(x-1)^2 = -3 / (x-1)^2 = -3(x-1)^(-2)$.]
    #step[*B2: Tính đạo hàm cấp hai* \ $y'' = (y')' = -3 \cdot (-2)(x-1)^(-3) \cdot (x-1)' = 6(x-1)^(-3) = 6 / (x-1)^3$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = x cos x$. Giá trị của $y''(pi/2)$ là:],
  ([$-pi/2$], True([$-2$]), [$2$], [$pi/2$]),
  loigiai: [
    #step[*B1: Tính đạo hàm cấp một* \ $y' = (x)' cos x + x(cos x)' = cos x - x sin x$.]
    #step[*B2: Tính đạo hàm cấp hai* \ $y'' = (cos x)' - (x sin x)' = -sin x - (sin x + x cos x) = -2 sin x - x cos x$.]
    #step[*B3: Thay số* \ $y''(pi/2) = -2 sin(pi/2) - (pi/2) cos(pi/2) = -2(1) - (pi/2)(0) = -2$.]
  ]
))

#dang([Dạng 2: Bài toán Động học & Dao động])

#q-wrap(dir: "doc", tn(
  [Cho phương trình chuyển động của một hạt là $s(t) = t^3 - 6t^2 + 9t$, trong đó $t$ được tính bằng giây và $s$ được tính bằng mét. Hỏi gia tốc của hạt tại thời điểm $t = 3$ (giây) là bao nhiêu?],
  ([$0$ m/s²], True([$6$ m/s²]), [$12$ m/s²], [$-6$ m/s²]),
  loigiai: [
    #step[*B1: Tính vận tốc* \ Đạo hàm quãng đường để tìm vận tốc: \ $v(t) = s'(t) = 3t^2 - 12t + 9$.]
    #step[*B2: Tính gia tốc* \ Đạo hàm vận tốc để tìm gia tốc (đạo hàm cấp hai của $s(t)$): \ $a(t) = v'(t) = 6t - 12$.]
    #step[*B3: Thay số* \ Tại $t = 3$, gia tốc của hạt là $a(3) = 6(3) - 12 = 18 - 12 = 6$ (m/s²).]
  ]
))

#q-wrap(dir: "doc", tn(
  [Một quả bóng được ném thẳng đứng lên cao với phương trình độ cao $h(t) = -5t^2 + 20t + 2$, trong đó $h$ tính bằng mét và $t$ tính bằng giây. Vận tốc của quả bóng bằng $0$ tại thời điểm nào? Gia tốc của quả bóng tại mọi thời điểm là bao nhiêu?],
  ([$t=1$, $a = -5$], [$t=2$, $a = -5$], [$t=1$, $a = -10$], True([$t=2$, $a = -10$])),
  loigiai: [
    #step[*B1: Phân tích vận tốc* \ Vận tốc của bóng: $v(t) = h'(t) = -10t + 20$. \ Quả bóng dừng lại (đạt độ cao tối đa) khi $v(t) = 0 <=> -10t + 20 = 0 <=> t = 2$ (giây).]
    #step[*B2: Phân tích gia tốc* \ Gia tốc của bóng là đạo hàm của vận tốc: $a(t) = v'(t) = -10$ (m/s²). \ *(Nhận xét: Con số $-10$ chính là gia tốc trọng trường $g approx -10$ m/s² kéo quả bóng rơi xuống)*.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Phương trình dao động của một con lắc lò xo là $x(t) = 4 cos(2 pi t + pi/3)$, trong đó $x$ là li độ tính bằng cm, $t$ là thời gian tính bằng giây. Hỏi gia tốc của con lắc tại thời điểm $t = 1$ giây là bao nhiêu?],
  (True([$-8 pi^2$ cm/s²]), [$8 pi^2$ cm/s²], [$-16 pi^2$ cm/s²], [$16 pi^2$ cm/s²]),
  loigiai: [
    #step[*B1: Lập phương trình vận tốc* \ Vận tốc là đạo hàm của li độ: $v(t) = x'(t) = 4 \cdot (-sin(2 pi t + pi/3)) \cdot (2 pi) = -8 pi sin(2 pi t + pi/3)$.]
    #step[*B2: Lập phương trình gia tốc* \ Gia tốc là đạo hàm của vận tốc: $a(t) = v'(t) = -8 pi \cdot cos(2 pi t + pi/3) \cdot (2 pi) = -16 pi^2 cos(2 pi t + pi/3)$. \ *(Chú ý: $a(t) = - (2pi)^2 x(t)$)*.]
    #step[*B3: Thay số tại $t = 1$* \ $a(1) = -16 pi^2 cos(2 pi(1) + pi/3) = -16 pi^2 cos(7 pi / 3)$. \ Do $cos(7 pi / 3) = cos(2 pi + pi/3) = cos(pi/3) = 1/2$. \ Vậy $a(1) = -16 pi^2 \cdot 1/2 = -8 pi^2$ cm/s².]
  ]
))

#q-wrap(dir: "doc", tn(
  [Một chiếc ô tô đang chạy với vận tốc cao thì người lái xe đạp phanh. Kể từ thời điểm đạp phanh, ô tô chuyển động chậm dần với phương trình quãng đường $s(t) = -2t^2 + 16t$, ($t$ tính bằng giây, $s$ tính bằng mét). Hỏi từ lúc đạp phanh đến khi dừng hẳn, ô tô đi được quãng đường bao nhiêu?],
  ([$16$ m], [$24$ m], True([$32$ m]), [$48$ m]),
  loigiai: [
    #step[*B1: Lập phương trình vận tốc* \ Vận tốc của ô tô là $v(t) = s'(t) = -4t + 16$.]
    #step[*B2: Tìm thời điểm xe dừng hẳn* \ Xe dừng hẳn khi vận tốc bằng $0$, tức là $v(t) = 0 <=> -4t + 16 = 0 <=> t = 4$ (giây).]
    #step[*B3: Tính quãng đường* \ Quãng đường ô tô đi được trong 4 giây đó là: \ $s(4) = -2(4)^2 + 16(4) = -32 + 64 = 32$ (mét).]
  ]
))
