#import "../_config.typ": *

#chapter([Quãng đường – Vận tốc – Gia tốc], theme-color: c-p2)

#phuongphap(theme-color: c-p2)[
  *Mối quan hệ ba chiều của chuyển động thẳng:*
  + Cho gia tốc $a(t)$, vận tốc $v(t)$ được tính bằng nguyên hàm:
    $
      v(t) = v(0) + integral_0^t a(tau) d tau
    $
  + Cho vận tốc $v(t)$, quãng đường đi được $s(t)$ được tính bằng nguyên hàm:
    $
      s(t) = integral_0^t v(tau) d tau
    $
  *Quãng đường đi được từ thời điểm $t_1$ đến $t_2$:*
  $
    s = integral_(t_1)^(t_2) |v(t)| d t
  $
  - Nếu vật chuyển động theo một chiều ($v(t) >= 0$ hoặc $v(t) <= 0$ trên $[t_1, t_2]$) thì:
    $
      s = |integral_(t_1)^(t_2) v(t) d t|
    $
  - Nếu vật đổi chiều chuyển động (vận tốc đổi dấu), ta phải chia miền tích phân tại các điểm thời điểm dừng hoặc đổi chiều ($v(t) = 0$).
]

#topic([Bài toán hãm phanh], prefix: "Bài", theme-color: c-p2)

#dang([Tính quãng đường hãm từ vận tốc đến dừng hẳn], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  Đối với bài toán hãm phanh với gia tốc giảm đều $a(t) = -k$ ($k > 0$, gia tốc âm đóng vai trò là gia tốc hãm):
  1. Vận tốc tại thời điểm $t$ tính từ lúc đạp phanh là:
     $
       v(t) = v_0 - k t  wide  ("với " v_0 " là vận tốc lúc bắt đầu phanh")
     $
  2. Thời điểm xe dừng hẳn $T$ thỏa mãn $v(T) = 0 => T = frac(v_0, k)$.
  3. Quãng đường xe đi được từ lúc phanh đến khi dừng hẳn là:
     $
       s = integral_0^T v(t) d t = integral_0^T (v_0 - k t) d t
     $
  *Lưu ý:* Phải đồng nhất đơn vị (thường là mét và giây). Nếu vận tốc ban đầu cho bằng km/h, cần đổi sang m/s bằng cách chia cho $3.6$.
]

#vd(
  [Một chiếc xe ô tô đang di chuyển trên đường cao tốc với vận tốc $v_0 = 72$ km/h thì người lái xe phát hiện chướng ngại vật phía trước và phanh gấp. Kể từ lúc đạp phanh, ô tô chuyển động chậm dần đều với gia tốc hãm $a(t) = -5$ m/s². Tính quãng đường ô tô đi được từ lúc bắt đầu đạp phanh đến khi xe dừng hẳn.],
  loigiai: [
    *Bước 1:* Đổi đơn vị vận tốc ban đầu của ô tô sang đơn vị mét trên giây (m/s):
    $
      v_0 = 72 " km/h" = frac(72, 3.6) " m/s" = 20 " m/s"
    $
    *Bước 2:* Xác định phương trình vận tốc của ô tô kể từ lúc đạp phanh ($t = 0$):
    $
      v(t) = v_0 + integral_0^t a(tau) d tau = 20 + integral_0^t (-5) d tau = 20 - 5t " (m/s)"
    $
    *Bước 3:* Xác định thời điểm xe dừng hẳn. Khi xe dừng hẳn, vận tốc của xe bằng $0$:
    $
      v(t) = 0  wide  <=>  wide  20 - 5t = 0  wide  <=>  wide  t = 4 " (giây)"
    $
    *Bước 4:* Tính quãng đường đi được từ lúc phanh ($t=0$) đến khi dừng hẳn ($t=4$):
    $
      s = integral_0^4 v(t) d t = integral_0^4 (20 - 5t) d t
    $
    Tìm nguyên hàm và thế cận:
    $
      s = [ 20t - frac(5, 2) t^2 ]_0^4 = (20 dot 4 - 2.5 dot 4^2) - 0 \
      s = 80 - 40 = 40 " (m)"
    $
    Vậy quãng đường ô tô đi được từ lúc đạp phanh đến khi dừng hẳn là $40$ mét.
  ],
  theme-color: c-p2,
)

#dang([Vật chuyển động có gia tốc biến thiên], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  Khi gia tốc không phải là hằng số mà là một hàm biến thiên theo thời gian $a(t) = f(t)$:
  - Tìm vận tốc $v(t) = integral a(t) d t = F(t) + C$, xác định $C$ từ điều kiện vận tốc ban đầu.
  - Tính quãng đường $s = integral_a^b v(t) d t$.
]

#topic([Chuyển động ghép giai đoạn], prefix: "Bài", theme-color: c-p2)

#dang([Quãng đường tổng hợp nhiều giai đoạn], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  Khi chuyển động của vật chia làm nhiều giai đoạn với các hàm vận tốc khác nhau (ví dụ: giai đoạn 1 tăng tốc, giai đoạn 2 đi đều, giai đoạn 3 giảm tốc):
  - Tìm phương trình vận tốc và thời gian hoạt động của từng giai đoạn.
  - Đảm bảo vận tốc liên tục tại các thời điểm bàn giao giai đoạn.
  - Tổng quãng đường đi được bằng tổng các quãng đường thành phần:
    $
      s = s_1 + s_2 + s_3 = integral_0^(t_1) v_1(t) d t + integral_(t_1)^(t_2) v_2(t) d t + integral_(t_2)^(t_3) v_3(t) d t
    $
]

#vd(
  [Một xe điện chạy thử nghiệm trên một đoạn đường thẳng từ trạng thái đứng yên ($v(0) = 0$). Quá trình di chuyển của xe chia làm 3 giai đoạn:
    - *Giai đoạn 1 (Tăng tốc):* Từ $t = 0$ đến $t = 20$ giây, xe tăng tốc với gia tốc biến thiên $a(t) = 0.1t$ (m/s²).
    - *Giai đoạn 2 (Đều):* Từ $t = 20$ đến $t = 80$ giây, xe chuyển động thẳng đều với vận tốc đạt được ở cuối giai đoạn 1.
    - *Giai đoạn 3 (Hãm phanh):* Từ $t = 80$ đến khi dừng hẳn, xe chuyển động chậm dần đều với gia tốc hãm $a(t) = -1$ m/s².
    Tính tổng quãng đường xe điện đã đi được từ lúc khởi hành đến khi dừng hẳn.],
  loigiai: [
    *Giai đoạn 1 ($t in [0, 20]$):*
    Phương trình vận tốc $v_1(t)$ của xe:
    $
      v_1(t) = v(0) + integral_0^t a(tau) d tau = 0 + integral_0^t 0.1 tau d tau = 0.05 t^2 " (m/s)"
    $
    Vận tốc ở cuối giai đoạn 1 là: $v_1(20) = 0.05 dot 20^2 = 20$ m/s.
    Quãng đường xe đi được trong giai đoạn 1 là:
    $
      s_1 = integral_0^(20) v_1(t) d t = integral_0^(20) 0.05 t^2 d t = [ frac(0.05, 3) t^3 ]_0^(20) = frac(0.05 dot 8000, 3) = frac(400, 3) " (m)"
    $

    *Giai đoạn 2 ($t in [20, 80]$):*
    Xe đi đều với vận tốc $v_2(t) = 20$ m/s. Thời gian đi đều là $80 - 20 = 60$ giây.
    Quãng đường đi được trong giai đoạn này là:
    $
      s_2 = 20 dot 60 = 1200 " (m)"
    $

    *Giai đoạn 3 ($t >= 80$):*
    Đặt mốc thời gian $t'$ bắt đầu giai đoạn 3 từ $t' = 0$ tương ứng với $t = 80$.
    Vận tốc ban đầu của giai đoạn này là $20$ m/s, gia tốc hãm là $a = -1$ m/s².
    Phương trình vận tốc của xe là: $v_3(t') = 20 - 1t'$ (m/s).
    Thời gian từ lúc bắt đầu hãm phanh đến khi xe dừng hẳn ($v_3 = 0$) là:
    $
      20 - t' = 0  wide  <=>  wide  t' = 20 " (giây)"
    $
    Quãng đường đi được trong giai đoạn hãm phanh này là:
    $
      s_3 = integral_0^(20) v_3(t') d t' = integral_0^(20) (20 - t') d t' = [ 20t' - frac((t')^2, 2) ]_0^(20) = 400 - 200 = 200 " (m)"
    $

    *Tổng quãng đường đi được:*
    $
      s = s_1 + s_2 + s_3 = frac(400, 3) + 1200 + 200 = frac(400, 3) + 1400 = frac(4600, 3) approx 1533.3 " (m)"
    $
    Vậy tổng quãng đường xe đã đi được xấp xỉ $1533.3$ mét.
  ],
  theme-color: c-p2,
)
