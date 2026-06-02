#import "../_config.typ": *

#chapter([Ứng Dụng Vi Phân trong Sai Số Thực Tế], theme-color: c-p5)

#phuongphap(theme-color: c-p5)[
  *Vi phân và xấp xỉ:* $Delta f approx f'(x_0) dot.c Delta x = upright(d)f$.
  - *Sai số tuyệt đối:* $|Delta f| approx |f'(x_0)| dot.c |Delta x|$.
  - *Sai số tương đối:* $frac(|Delta f|, |f(x_0)|) approx |frac(f'(x_0), f(x_0))| dot.c |Delta x|$.
  - *Sai số truyền qua:* Nếu $f = f(x, y, ...)$ thì
    $|Delta f| lt.tilde |frac(partial f, partial x)| |Delta x| + |frac(partial f, partial y)| |Delta y| + ...$
]

#vd(
  [Trong một nhà máy bi thép, bán kính viên bi được đo là $r = 5$ mm
    với sai số $|Delta r| <= 0{,}05$ mm.
    *(a)* Tính sai số tuyệt đối của thể tích.
    *(b)* Tính sai số tương đối của thể tích. Điều này có ý nghĩa gì về chất lượng sản xuất?],
  loigiai: [
    $V = frac(4, 3)pi r^3$, $V' = 4pi r^2$.

    *(a)* $|Delta V| approx |V'(r)| dot.c |Delta r| = 4pi (5)^2 times 0{,}05 = 5pi approx 15{,}7$ mm³.

    *(b)* $frac(|Delta V|, V) approx frac{4pi r^2 |Delta r|}{frac(4, 3)pi r^3}
    = frac(3|Delta r|, r) = frac{3 times 0{,}05}{5} = 3\%$.

    *Ý nghĩa:* Sai số bán kính 1% sẽ gây sai số thể tích 3%. Trong sản
    xuất vòng bi, sai số thể tích ảnh hưởng trực tiếp đến lực chịu tải
    và tuổi thọ sản phẩm — đây là lý do tiêu chuẩn I S O về dung sai kích thước
    rất nghiêm ngặt.
  ],
  theme-color: c-p5,
)

#vd(
  [Một máy kinh vĩ đo góc ngẩng $theta$ với sai số $|Delta theta| = 0{,}5°$.
    Chiều cao công trình $h = d tan theta$, với $d = 50$ m là khoảng cách
    nằm ngang (đo chính xác). Khi $theta = 60°$, tính sai số tuyệt đối
    trong phép đo chiều cao.],
  loigiai: [
    $h(theta) = 50tan theta$, $h'(theta) = 50/cos^2theta$.

    Đổi đơn vị: $|Delta theta| = 0{,}5° = pi/360$ rad.

    $|Delta h| approx frac(50, cos^2(60°)) dot.c frac(pi, 360)
    = frac(50, (1/2)^2) dot.c frac(pi, 360)
    = 200 dot.c frac(pi, 360) approx 1{,}745$ m.

    Sai số xấp xỉ gần 2 m — với công trình cao $h = 50tan 60° approx 86{,}6$ m,
    sai số tương đối $approx 2\%$.
  ],
  theme-color: c-p5,
)

#bt(
  [Độ sâu đáy biển được đo bằng sóng âm: $d = v dot.c t / 2$, với
    $v = 1500$ m/s là tốc độ âm (biết chính xác), $t$ là thời gian sóng
    phản hồi. Nếu $t$ đo được là 4 giây với sai số $|Delta t| = 0{,}01$ giây,
    tính sai số tuyệt đối của kết quả đo độ sâu.],
  lines: 5,
  theme-color: c-p5,
)

// ─── Chủ đề 5.3 ────────────────────────────────────────────────


// ════════════════════════════════════════════════════════════
#bt-header(c-p5)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — Chọn một đáp án đúng], c-p5)

#tn(
  [Vi phân của $y = f(x)$ tại $x$ là $d y = f'(x) d x$. Dùng vi phân để ước lượng $sqrt(4{,}02)$:],
  ([$2{,}002$], [$2{,}005$], [$2{,}01$], [$2{,}02$]),
  correct: (2,),
  accent: c-p5,
)

#tn(
  [Sai số tương đối của $V = frac(4, 3) pi r^3$ khi $r$ có sai số $delta r = 0{,}01 r$ là],
  ([$0{,}01$], [$0{,}02$], [$0{,}03$], [$0{,}04$]),
  correct: (3,),
  accent: c-p5,
)

#tn(
  [Diện tích hình tròn $S = pi r^2$. Sai số tuyệt đối $d S$ khi $r = 5$ cm có sai số $d r = 0{,}1$ cm là],
  ([$0{,}5 pi$ cm²], [$pi$ cm²], [$2 pi$ cm²], [$10 pi$ cm²]),
  correct: (2,),
  accent: c-p5,
)

#q-label([B. ĐÚNG – S A I — Xét tính đúng/sai của mỗi phát biểu], c-p5)
#resetexamstate()

#ds(
  [Vi phân $d y approx Delta y = f(x_0 + Delta x) - f(x_0)$ khi $Delta x$ nhỏ.],
  (
    [Vi phân $d y = f'(x_0) dot.c d x$ là xấp xỉ tuyến tính của số gia thực $Delta y$.],
    [Sai số tương đối của $y$ xấp xỉ bằng sai số tuyệt đối $|d y|$ chia cho $|y|$.],
    [Nếu $f(x) = x^n$, sai số tương đối $frac(|d y|, |y|) approx n dot.c frac(|d x|, |x|)$.],
    [Vi phân không thể dùng để ước lượng sai số trong đo lường thực tế.],
  ),
  accent: c-p5,
)

#q-label([C. TỰ LUẬN NGẮN — Ghi đáp số vào ô trống], c-p5)
#resetexamstate()

#tln(
  [Cạnh hình lập phương đo được $a = 10$ cm với sai số $delta a = 0{,}05$ cm. Sai số tuyệt đối của thể tích $V = a^3$ là $d V =$ (cm³).],
  [$15$],
  accent: c-p5,
)

#tln(
  [Dùng vi phân ước lượng $root(3, 27{,}3)$ biết $root(3, 27) = 3$. Kết quả gần đúng (3 chữ số thập phân) là.],
  [$3{,}037$],
  accent: c-p5,
)
