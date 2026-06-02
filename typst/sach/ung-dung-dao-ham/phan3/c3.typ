#import "../_config.typ": *

#chapter([Tối Ưu Góc Nhìn & Cường Độ Chiếu Sáng], theme-color: c-p3)

#phuongphap(theme-color: c-p3)[
  *Hai khuôn quen thuộc của chương này:*
  - Với bài toán góc nhìn, nên biểu diễn $alpha$ qua hiệu hai góc phụ rồi tối đa hóa $tan alpha$ hoặc đạo hàm trực tiếp hàm $alpha(x)$.
  - Với bài toán chiếu sáng, trước hết phải thống nhất đúng mô hình vật lý rồi mới đạo hàm; tránh học thuộc đáp số khi công thức gốc chưa rõ biến nào là biến tối ưu.
  - Sau khi tìm được điểm dừng, luôn dùng BBT để xác nhận đó là giá trị cực đại thật sự.
]

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 16pt,
    [Trong một phòng triển lãm, một bức tranh cao $3$ m được treo trên tường sao cho mép dưới của tranh cao hơn tầm mắt người xem $1$ m. Người xem đứng cách tường một khoảng $x$ m. Hãy tìm $x$ để góc nhìn $alpha$ chắn bởi hai mép của bức tranh là lớn nhất.],
    canvas(length: 0.72cm, {
      import draw: *
      let E = (0, 0)
      let W1 = (4.5, 0)
      let D = (4.5, 1)
      let T = (4.5, 4)
      line((-0.5, 0), (5.5, 0), stroke: 1.5pt + rgb("666666"))
      line(W1, (4.5, 4.6), stroke: 1.5pt + rgb("666666"))
      line(D, T, stroke: 3pt + c-p3)
      line(E, D, stroke: 1pt + rgb("b45309"))
      line(E, T, stroke: 1pt + rgb("b45309"))
      circle(E, radius: 1.4pt, fill: black)
      content((-0.15, -0.38), [$E$])
      content((4.75, 1), [$D$])
      content((4.75, 4), [$T$])
      content((2.2, -0.45), [$x$])
      content((5.0, 2.5), [$3$ m], angle: 90deg)
      content((4.92, 0.5), [$1$ m], angle: 90deg)
      content((1.9, 1.6), [$alpha$])
    }),
  ),
  loigiai: [
    #ppgiai[
      - Biểu diễn góc nhìn qua hiệu hai góc tạo bởi tia nhìn tới mép trên và mép dưới của tranh.
      - Tối đa hóa $tan alpha$ để đưa bài toán về một hàm phân thức hữu tỉ đơn giản.
      - Dùng BBT để kết luận khoảng cách tối ưu.
    ]

    #step[Gọi $beta$ là góc tạo bởi tia nhìn tới mép dưới của tranh với phương nằm ngang. Khi đó
      $tan beta = frac(1, x)$,
      còn tia nhìn tới mép trên tạo với phương ngang góc $beta + alpha$ thỏa
      $tan(beta + alpha) = frac(4, x)$.]

    #step[Ta có
      $
        tan alpha = tan((beta + alpha) - beta)
        = frac(frac(4, x) - frac(1, x), 1 + frac(4, x^2))
        = frac(3 dot.c x, x^2 + 4).
      $
      Vì $alpha in (0°; 90°)$ nên $alpha$ lớn nhất khi và chỉ khi $tan alpha$ lớn nhất.]

    #step[Xét hàm
      $
        f(x) = frac(3 dot.c x, x^2 + 4), quad x > 0.
      $
      Khi đó
      $
        f'(x) = frac(3 dot.c (x^2 + 4) - 3 dot.c x dot.c 2 dot.c x, (x^2 + 4)^2)
        = frac(3 dot.c (4 - x^2), (x^2 + 4)^2).
      $
      Cho $f'(x) = 0$ suy ra $x = 2$.]

    #step[Bảng biến thiên của $f(x)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $f'$,
          func: $f$,
          x-vals: ($0$, $2$, $+oo$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $frac(3, 4)$, $0$),
          is-min: false,
        )
      ]]

    #step[Vậy người xem nên đứng cách tường $2$ m. Khi đó
      $tan alpha_max = frac(3, 4)$,
      nên
      $alpha_max = arctan(frac(3, 4)) approx 36{,}87°$.]
    #resetstep()
  ],
  theme-color: c-p3,
)

#bt(
  grid(
    columns: (1fr, auto),
    column-gutter: 16pt,
    [Một cột đèn cần chiếu sáng mạnh nhất vào điểm $P$ trên mặt đất, cách chân cột $6$ m. Gọi $h$ là chiều cao treo đèn. Biết cường độ chiếu sáng tại $P$ tỉ lệ với $frac(sin theta, d^2)$, trong đó $theta$ là góc giữa tia sáng và mặt đất, còn $d$ là khoảng cách từ đèn tới $P$. Hãy tìm $h$ để cường độ chiếu sáng tại $P$ lớn nhất.],
    canvas(length: 0.75cm, {
      import draw: *
      let O = (0, 0)
      let L = (0, 4.2)
      let P = (4.6, 0)
      line((-0.6, 0), (5.4, 0), stroke: 1.5pt + rgb("666666"))
      line(O, L, stroke: 1.5pt + rgb("666666"))
      line(L, P, stroke: 1.4pt + c-p3)
      circle(L, radius: 1.6pt, fill: rgb("f59e0b"))
      circle(O, radius: 1.4pt, fill: black)
      circle(P, radius: 1.4pt, fill: black)
      content((0.18, 4.38), [$L$])
      content((-0.22, -0.38), [$O$])
      content((4.78, -0.38), [$P$])
      content((-0.6, 2.1), [$h$], angle: 90deg)
      content((2.3, -0.48), [$6$ m])
      content((2.45, 1.5), [$d$])
      content((3.4, 0.35), [$theta$])
    }),
  ),
  loigiai: [
    #ppgiai[
      - Viết $sin theta$ và $d$ theo biến $h$.
      - Rút gọn cường độ chiếu sáng thành hàm một biến $I(h)$.
      - Dùng đạo hàm và BBT để tìm chiều cao treo đèn tối ưu.
    ]

    #step[Ta có
      $d = sqrt(h^2 + 6^2) = sqrt(h^2 + 36)$
      và
      $sin theta = frac(h, d) = frac(h, sqrt(h^2 + 36))$.]

    #step[Do đó cường độ chiếu sáng tại $P$ tỉ lệ với
      $
        I(h) = frac(sin theta, d^2)
        = frac(h, sqrt(h^2 + 36)) dot.c frac(1, h^2 + 36)
        = frac(h, (h^2 + 36)^(3/2)), quad h > 0.
      $]

    #step[Đạo hàm:
      $
        I'(h) = frac((h^2 + 36) - 3 dot.c h^2, (h^2 + 36)^(5/2))
        = frac(36 - 2 dot.c h^2, (h^2 + 36)^(5/2)).
      $
      Cho $I'(h) = 0$ suy ra
      $36 - 2 dot.c h^2 = 0 <=> h^2 = 18 <=> h = 3 dot.c sqrt(2)$.]

    #step[Bảng biến thiên của $I(h)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $h$,
          der: $I'$,
          func: $I$,
          x-vals: ($0$, $3 dot.c sqrt(2)$, $+oo$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $frac(1, 54 dot.c sqrt(3))$, $0$),
          is-min: false,
        )
      ]]

    #step[Vậy chiều cao tối ưu là
      $h = 3 dot.c sqrt(2) approx 4{,}24$ m.]
    #resetstep()
  ],
  theme-color: c-p3,
)

#bt(
  [Một biển quảng cáo có chiều cao $4$ m, mép dưới cao hơn tầm mắt người quan sát $2$ m. Hỏi người đó nên đứng cách tường bao nhiêu mét để góc nhìn đối với toàn bộ biển quảng cáo là lớn nhất?],
  loigiai: [
    #ppgiai[
      - Gọi $x$ là khoảng cách từ mắt người quan sát tới tường.
      - Dùng công thức tổng quát cho bài toán góc nhìn với phần dưới cách mắt $b$ và chiều cao vật là $a$.
      - Kết luận bằng cách thay số cụ thể $a = 4$, $b = 2$.
    ]

    #step[Với bài toán góc nhìn, điều kiện cực đại là
      $x^2 = b dot.c (a + b)$,
      trong đó $a$ là chiều cao vật quan sát còn $b$ là khoảng cách từ tầm mắt đến mép dưới của vật.]

    #step[Ở đây $a = 4$, $b = 2$, nên
      $x^2 = 2 dot.c (4 + 2) = 12$,
      do đó
      $x = 2 dot.c sqrt(3)$.]

    #step[Vậy người quan sát nên đứng cách tường
      $2 dot.c sqrt(3) approx 3{,}46$ m.]
    #resetstep()
  ],
  theme-color: c-p3,
)

#nhanxet(theme-color: c-p3)[
  *Điểm cần giữ chặt:* bài toán ánh sáng rất dễ sai nếu trộn lẫn các định nghĩa góc. Muốn tránh học sinh học vẹt đáp số, phải nêu rõ $theta$ là góc nào và đại lượng nào mới là biến tối ưu.
]

#bt-header(c-p3)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — Chọn một đáp án đúng], c-p3)

#tn(
  [Với một vật cao $a$ m, mép dưới cao hơn tầm mắt người quan sát $b$ m, nếu người đó đứng cách tường một khoảng $d$ m thì điều kiện để góc nhìn lớn nhất là],
  (
    [ $d^2 = a dot.c b$ ],
    True([ $d^2 = b dot.c (a + b)$ ]),
    [ $d = a + b$ ],
    [ $d^2 = a^2 + b^2$ ],
  ),
  accent: c-p3,
  loigiai: [
    #step[Đây là công thức tổng quát của bài toán góc nhìn. Góc nhìn đạt cực đại khi khoảng cách tới tường thỏa
      $d^2 = b dot.c (a + b)$.]
  ],
)

#tn(
  [Trong ví dụ bức tranh cao $3$ m, mép dưới cao hơn tầm mắt $1$ m, khoảng cách tối ưu từ người xem đến tường là],
  ([$1$ m], True([$2$ m]), [$3$ m], [$4$ m]),
  accent: c-p3,
  loigiai: [
    #step[Từ hàm
      $f(x) = frac(3 dot.c x, x^2 + 4)$
      suy ra $f'(x) = 0$ khi $x = 2$.]
  ],
)

#tn(
  [Một điểm $P$ cách chân cột đèn $6$ m. Nếu cường độ sáng tại $P$ tỉ lệ với $frac(sin theta, d^2)$ thì chiều cao treo đèn để cường độ sáng tại $P$ lớn nhất là],
  ([$3$ m], [$4$ m], True([$3 dot.c sqrt(2)$ m]), [$6$ m]),
  accent: c-p3,
  loigiai: [
    #step[Ta có
      $I(h) = frac(h, (h^2 + 36)^(3/2))$.]
    #step[Giải $I'(h) = 0$ được
      $36 - 2 dot.c h^2 = 0 <=> h = 3 dot.c sqrt(2)$.]
  ],
)

#tn(
  [Với mô hình $I(h) = frac(h, (h^2 + a^2)^(3/2))$ với $a > 0$ cố định, giá trị của $h$ làm $I(h)$ lớn nhất là],
  ([$a$], [$frac(a, 2)$], True([$frac(a, sqrt(2))$]), [$a dot.c sqrt(2)$]),
  accent: c-p3,
  loigiai: [
    #step[Đạo hàm cho
      $I'(h)$ cùng dấu với $a^2 - 2 dot.c h^2$.
      Do đó cực đại đạt được khi
      $h = frac(a, sqrt(2))$.]
  ],
)

#q-label([B. ĐÚNG – S A I — Xét tính đúng/sai của mỗi phát biểu], c-p3)
#resetexamstate()

#ds(
  [Xét bài toán bức tranh cao $3$ m, mép dưới cao hơn tầm mắt người xem $1$ m và người xem đứng cách tường $x$ m.],
  (
    True([Ta có $tan alpha = frac(3 dot.c x, x^2 + 4)$.]),
    True([Đạo hàm của hàm cần tối ưu triệt tiêu tại $x = 2$.]),
    [Góc nhìn lớn nhất khi $x = 1$.],
    True([Khi đó $tan alpha_max = frac(3, 4)$.]),
  ),
  accent: c-p3,
  loigiai: [
    #step[Từ công thức hiệu hai góc, suy ra
      $tan alpha = frac(3 dot.c x, x^2 + 4)$, nên phát biểu $1$ đúng.]
    #step[Giải phương trình $f'(x) = 0$ cho $f(x) = frac(3 dot.c x, x^2 + 4)$ được $x = 2$, nên phát biểu $2$ đúng.]
    #step[Điểm cực đại không phải tại $x = 1$, nên phát biểu $3$ sai.]
    #step[Thay $x = 2$ vào $f(x)$ được $frac(3, 4)$, nên phát biểu $4$ đúng.]
  ],
)

#ds(
  [Xét mô hình chiếu sáng tại điểm $P$ cách chân cột $6$ m, với
    $I(h) = frac(h, (h^2 + 36)^(3/2))$, $h > 0$.],
  (
    True([Đạo hàm của $I(h)$ là $I'(h) = frac(36 - 2 dot.c h^2, (h^2 + 36)^(5/2))$.]),
    [Cường độ sáng lớn nhất khi $h = 6$.],
    True([Chiều cao tối ưu là $h = 3 dot.c sqrt(2)$.]),
    True([Giá trị cực đại của cường độ sáng bằng $frac(1, 54 dot.c sqrt(3))$.]),
  ),
  accent: c-p3,
  loigiai: [
    #step[Lấy đạo hàm đúng như công thức ở phát biểu $1$, nên phát biểu $1$ đúng.]
    #step[Giải $I'(h) = 0$ cho kết quả $h = 3 dot.c sqrt(2)$, không phải $6$, nên phát biểu $2$ sai.]
    #step[Phát biểu $3$ đúng theo kết quả vừa tìm được.]
    #step[Thay $h = 3 dot.c sqrt(2)$ vào $I(h)$, ta được
      $I_max = frac(3 dot.c sqrt(2), 54^(3/2)) = frac(1, 54 dot.c sqrt(3))$,
      nên phát biểu $4$ đúng.]
  ],
)

#q-label([C. TỰ LUẬN NGẮN — Ghi một đáp số ngắn], c-p3)
#resetexamstate()

#tln(
  [Một bức tranh cao $3$ m, mép dưới cao hơn tầm mắt người xem $1$ m. Hỏi người xem nên đứng cách tường bao nhiêu mét để góc nhìn lớn nhất?],
  [$2$],
  accent: c-p3,
  loigiai: [
    #step[Ta tối ưu hàm
      $f(x) = frac(3 dot.c x, x^2 + 4)$.]
    #step[Giải $f'(x) = 0$ được $x = 2$.]
  ],
)

#tln(
  [Một biển quảng cáo cao $5$ m, mép dưới cao hơn tầm mắt người quan sát $4$ m. Khoảng cách từ người quan sát tới tường để góc nhìn lớn nhất là],
  [$6$],
  accent: c-p3,
  loigiai: [
    #step[Điều kiện cực đại là
      $x^2 = b dot.c (a + b) = 4 dot.c (5 + 4) = 36$.]
    #step[Suy ra $x = 6$.]
  ],
)

#tln(
  [Một điểm $P$ cách chân cột đèn $4 dot.c sqrt(2)$ m. Nếu cường độ sáng tại $P$ tỉ lệ với $frac(sin theta, d^2)$ thì chiều cao treo đèn tối ưu là],
  [$4$],
  accent: c-p3,
  loigiai: [
    #step[Ta có
      $I(h) = frac(h, (h^2 + 32)^(3/2))$.]
    #step[Giải $I'(h) = 0$ thu được
      $32 - 2 dot.c h^2 = 0 <=> h = 4$.]
  ],
)
