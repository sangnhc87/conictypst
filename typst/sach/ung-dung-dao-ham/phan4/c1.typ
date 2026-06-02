#import "../_config.typ": *

#chapter([Tốc Độ Thay Đổi Liên Quan (Related Rates)], theme-color: c-p4)

#phuongphap(theme-color: c-p4)[
  *Quy trình "Related Rates" — 5 bước:*
  + *Vẽ hình và gán tên biến* cho tất cả đại lượng thay đổi theo thời gian $t$.
  + *Tìm phương trình liên hệ* giữa các biến đó (dùng hình học, Pytago, ...).
  + *Đạo hàm hai vế theo $t$* (dùng chain rule).
  + *Thay giá trị tại thời điểm đang xét* vào phương trình vừa đạo hàm.
  + *Giải ẩn* là tốc độ thay đổi cần tìm.
  *Chú ý:* Tốc độ tăng → dương; tốc độ giảm → âm.
]

#vd(
  [Một chiếc thang dài *5 m* dựa vào tường thẳng đứng. Chân thang trượt
    ra xa tường với tốc độ *0,5 m/s*. Hỏi khi chân thang cách tường *3 m*,
    đỉnh thang đang hạ xuống với tốc độ bao nhiêu?],
  loigiai: [
    Gọi $x(t)$ = khoảng cách chân thang đến tường, $y(t)$ = chiều cao đỉnh thang.

    *Phương trình liên hệ:* $x^2 + y^2 = 25$ (Pytago, thang dài 5 m).

    *Đạo hàm theo $t$:* $2x dot(x) + 2y dot(y) = 0 => dot(y) = -frac(x, y)dot(x)$.

    *Tại $x = 3$:* $y = sqrt(25 - 9) = 4$ m.

    $dot(y) = -frac(3, 4) times 0{,}5 = -0{,}375$ m/s.

    Đỉnh thang hạ xuống với tốc độ $0{,}375$ m/s (dấu "−" là đang giảm).
  ],
  theme-color: c-p4,
)

#vd(
  [Nước được bơm vào bồn hình nón ngược (đỉnh quay xuống), chiều cao
    bồn $H = 4$ m, bán kính miệng $R = 3$ m. Tốc độ bơm nước vào
    *$2$ m³/phút*. Khi mực nước cao $h = 2$ m, mực nước đang dâng
    với tốc độ bao nhiêu?],
  loigiai: [
    Bán kính mặt nước: $r/h = R/H = 3/4 => r = 3h/4$.

    Thể tích nước: $V = frac(1, 3)pi r^2 h = frac(1, 3)pi dot.c frac(9h^2, 16) dot.c h = frac(3pi h^3, 16)$.

    Đạo hàm theo $t$: $dot(V) = frac(9pi h^2, 16) dot(h)$.

    Tại $h = 2$: $2 = frac(9pi dot.c 4, 16) dot(h) = frac(9pi, 4) dot(h)$.

    $dot(h) = frac(8, 9pi) approx  0{,}283$ m/phút.
  ],
  theme-color: c-p4,
)

#bt(
  [Một vết dầu loang trên mặt biển có dạng hình tròn. Diện tích vết dầu
    tăng với tốc độ $10$ m²/giây. Tính tốc độ tăng của bán kính khi
    bán kính vết dầu là $50$ m.],
  lines: 6,
  theme-color: c-p4,
)

#bt(
  [Một người đứng cách gốc đèn 5 m, bóng người dài $ell(t)$, người cao 2 m,
    đèn cao 5 m. Nếu người đi ra xa đèn với tốc độ $1{,}5$ m/s, tính
    tốc độ kéo dài của bóng.],
  lines: 8,
  theme-color: c-p4,
)

// ─── Chủ đề 4.2 ────────────────────────────────────────────────


// ════════════════════════════════════════════════════════════
#bt-header(c-p4)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — Chọn một đáp án đúng], c-p4)

#tn([Bán kính hình tròn tăng với tốc độ $2$ cm/s. Diện tích tăng với tốc độ nào khi $r = 5$ cm?],
  ([$10 pi$ cm²/s], [$20 pi$ cm²/s], [$25 pi$ cm²/s], [$4 pi$ cm²/s]), correct: (2,), accent: c-p4)

#tn([Cạnh hình vuông tăng $3$ cm/s. Chu vi tăng với tốc độ],
  ([$3$ cm/s], [$6$ cm/s], [$9$ cm/s], [$12$ cm/s]), correct: (4,), accent: c-p4)

#tn([Thể tích hình cầu $V = frac(4, 3) pi r^3$. Khi $r = 3$ cm và $frac(d r, d t) = 0{,}5$ cm/s, tốc độ tăng thể tích là],
  ([$6 pi$ cm³/s], [$9 pi$ cm³/s], [$18 pi$ cm³/s], [$27 pi$ cm³/s]), correct: (3,), accent: c-p4)

#q-label([B. ĐÚNG – S A I — Xét tính đúng/sai của mỗi phát biểu], c-p4)
#resetexamstate()

#ds([Bóng bay hình cầu được bơm không khí vào với tốc độ $100$ cm³/s.],
  (
    [$frac(d V, d t) = 100$ cm³/s.],
    [Khi $r = 5$ cm, $frac(d r, d t) = frac(1, pi)$ cm/s.],
    [Tốc độ tăng bán kính giảm khi bóng to dần.],
    [Tốc độ tăng diện tích bề mặt bằng $frac(200, r)$ cm²/s.],
  ), accent: c-p4)

#q-label([C. TỰ LUẬN NGẮN — Ghi đáp số vào ô trống], c-p4)
#resetexamstate()

#tln([Bán kính hình tròn tăng $0{,}5$ cm/s. Tốc độ tăng diện tích khi $r = 4$ cm là (cm²/s).], [$4 pi$], accent: c-p4)

#tln([Cầu thang leo thẳng đứng, chân thang trượt ra xa tường tốc độ $2$ m/s. Chiều dài thang $5$ m, khi chân cách tường $3$ m, đỉnh thang hạ xuống với tốc độ (m/s).], [$frac(3, 2)$], accent: c-p4)
