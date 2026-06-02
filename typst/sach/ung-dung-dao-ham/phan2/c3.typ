#import "../_config.typ": *

#chapter([Phân Tích Biên Tế (Marginal Analysis) trong Doanh Nghiệp], theme-color: c-p2)

#phuongphap(theme-color: c-p2)[
  *Ý nghĩa thực chiến:*
  - $C'(x)$: *Chi phí biên* — chi phí tăng thêm khi sản xuất thêm 1 đơn vị.
  - $R'(x)$: *Doanh thu biên* — doanh thu tăng thêm khi bán thêm 1 đơn vị.
  - *Điều kiện tối ưu lợi nhuận:* $R'(x) = C'(x)$.
  - *Chi phí trung bình:* $overline(C)(x) = C(x)/x$. Chi phí trung bình cực tiểu tại nghiệm của $C'(x) = overline(C)(x)$.
  - *E O Q:* Tổng chi phí tồn kho là tổng của chi phí đặt hàng và chi phí lưu kho; tối ưu bằng cách đạo hàm hóa hàm tổng chi phí.
]

#vd(
  [_(Mô hình E O Q)_ Một cửa hàng bán $D = 1200$ hộp sản phẩm/năm. Chi phí mỗi lần đặt hàng là $S = 50$ nghìn đồng. Chi phí lưu kho là $H = 2$ nghìn đồng/hộp/năm. Tìm lượng đặt hàng tối ưu $Q^*$ để tổng chi phí tồn kho nhỏ nhất.],
  loigiai: [
    #ppgiai[
      - Biểu diễn tổng chi phí tồn kho theo lượng đặt hàng $Q$.
      - Lấy đạo hàm theo $Q$ để tìm điểm tối ưu.
      - Dùng bảng biến thiên để xác nhận GTNN.
    ]

    #step[Nếu mỗi lần đặt $Q$ hộp thì số lần đặt hàng trong năm là $1200 / Q$.]

    #step[Tổng chi phí tồn kho là:
      $
        T(Q) & = (1200 / Q) dot.c 50 + (Q / 2) dot.c 2 \
             & = 60000 / Q + Q, quad Q > 0.
      $]

    #step[Đạo hàm:
      $ T'(Q) = -60000 / Q^2 + 1. $
      Cho $T'(Q) = 0 <=> Q^2 = 60000 <=> Q = sqrt(60000) = 100 sqrt(6).$]

    #step[Bảng biến thiên của $T(Q)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $Q$,
          der: $T'$,
          func: $T$,
          x-vals: ($0$, $100 sqrt(6)$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $200 sqrt(6)$, $+oo$),
          is-min: true,
        )
      ]]

    #step[Vậy lượng đặt hàng tối ưu là:
      $ Q^* = 100 sqrt(6) approx 245 $ hộp mỗi lần.]
    #resetstep()
  ],
  theme-color: c-p2,
)

#vd(
  [Một doanh nghiệp có hàm chi phí tổng cộng $C(x) = x^2 + 20x + 400$ (nghìn đồng), với $x > 0$ là số sản phẩm. Tìm sản lượng để chi phí trung bình nhỏ nhất.],
  loigiai: [
    #ppgiai[
      - Lập hàm chi phí trung bình $overline(C)(x)$.
      - Tính đạo hàm của hàm chi phí trung bình.
      - Khảo sát bằng BBT và liên hệ với điều kiện $C'(x) = overline(C)(x)$.
    ]

    #step[Chi phí trung bình là:
      $ overline(C)(x) = C(x) / x = x + 20 + 400/x, quad x > 0. $]

    #step[Đạo hàm:
      $ overline(C)'(x) = 1 - 400/x^2. $
      Cho $overline(C)'(x) = 0 <=> x^2 = 400 <=> x = 20.$]

    #step[Bảng biến thiên của $overline(C)(x)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $overline(C)'$,
          func: $overline(C)$,
          x-vals: ($0$, $20$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $60$, $+oo$),
          is-min: true,
        )
      ]]

    #step[Vậy chi phí trung bình nhỏ nhất khi doanh nghiệp sản xuất $20$ sản phẩm. Khi đó:
      $ overline(C)_(min) = 20 + 20 + 20 = 60 $ (nghìn đồng/sản phẩm).]

    #step[Mặt khác $C'(x) = 2x + 20$, nên $C'(20) = 60 = overline(C)(20)$. Điều này minh họa đúng quy tắc tối ưu $C'(x) = overline(C)(x)$.]
    #resetstep()
  ],
  theme-color: c-p2,
)

#nhanxet(theme-color: c-p2)[
  *Góc nhìn quản trị:* Chi phí biên và chi phí trung bình không chỉ là kiến thức giải tích. Chúng là công cụ ra quyết định về mở rộng sản xuất, tối ưu lô hàng, định giá và kiểm soát hiệu quả vận hành.
]

#bt(
  [Một doanh nghiệp bán sản phẩm với hàm giá $p(x) = 160 - x$ (nghìn đồng/sản phẩm), còn hàm chi phí là $C(x) = 40x + 900$ (nghìn đồng). Hãy tìm sản lượng tối ưu để lợi nhuận lớn nhất và tính lợi nhuận lớn nhất đó.],
  loigiai: [
    #ppgiai[
      - Lập hàm doanh thu và hàm lợi nhuận.
      - Đạo hàm hàm lợi nhuận để tìm điểm cực đại.
      - Kết luận qua BBT.
    ]

    #step[Doanh thu là:
      $ R(x) = x(160 - x) = 160x - x^2. $]

    #step[Lợi nhuận là:
      $ P(x) = R(x) - C(x) = 160x - x^2 - (40x + 900) = -x^2 + 120x - 900. $]

    #step[Đạo hàm:
      $ P'(x) = -2x + 120. $
      Cho $P'(x) = 0 <=> x = 60.$]

    #step[Bảng biến thiên của $P(x)$ trên $(0; 160)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $P'$,
          func: $P$,
          x-vals: ($0$, $60$, $160$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($-900$, $2700$, $-7300$),
          is-min: false,
        )
      ]]

    #step[Vậy sản lượng tối ưu là $60$ sản phẩm và lợi nhuận lớn nhất là $2700$ nghìn đồng.]
    #resetstep()
  ],
  theme-color: c-p2,
)

#bt(
  [Chi phí sản xuất một lô hàng phụ thuộc số lượng $x$ theo công thức $C(x) = x^3 - 9x^2 + 30x + 20$. Hãy tìm giá trị nhỏ nhất của chi phí biên.],
  loigiai: [
    #ppgiai[
      - Tính hàm chi phí biên $C'(x)$.
      - Xét cực trị của $C'(x)$ bằng đạo hàm cấp hai hoặc BBT.
      - Kết luận giá trị nhỏ nhất của chi phí biên.
    ]

    #step[Chi phí biên là:
      $ C'(x) = 3x^2 - 18x + 30. $]

    #step[Xét đạo hàm của chi phí biên:
      $ C''(x) = 6x - 18. $
      Cho $C''(x) = 0 <=> x = 3.$]

    #step[Vì $C'(x)$ là một tam thức bậc hai có hệ số đầu dương nên đạt GTNN tại đỉnh $x = 3$.]

    #step[Khi đó:
      $ C'(3) = 27 - 54 + 30 = 3. $
      Vậy chi phí biên nhỏ nhất bằng $3$.]
    #resetstep()
  ],
  theme-color: c-p2,
)

// ════════════════════════════════════════════════════════════
#bt-header(c-p2)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — Chọn một đáp án đúng], c-p2)

#tn(
  [Chi phí trung bình $overline(C)(x) = C(x)/x$ cực tiểu khi],
  ([$C'(x) = 0$], [$overline(C)'(x) = 0$], True([$C'(x) = overline(C)(x)$]), [$x dot.c C'(x) = 0$]),
  accent: c-p2,
  loigiai: [
    #step[Ta có $overline(C)(x) = C(x)/x$. Điều kiện cực trị của hàm này là $overline(C)'(x) = 0$.]
    #step[Biến đổi $overline(C)'(x) = 0$ cho kết quả tương đương $x dot.c C'(x) = C(x)$, tức $C'(x) = overline(C)(x)$.]
  ],
)

#tn(
  [Nếu $C(x) = x^3 - 9x^2 + 30x + 10$, chi phí biên $C'(x)$ tại $x = 3$ bằng],
  (True([$3$]), [$6$], [$9$], [$12$]),
  accent: c-p2,
  loigiai: [
    #step[Chi phí biên là $C'(x) = 3x^2 - 18x + 30$.]
    #step[Tại $x = 3$, ta có $C'(3) = 27 - 54 + 30 = 3$.]
  ],
)

#tn(
  [Khi $C'(x) < overline(C)(x)$, chi phí trung bình đang],
  ([Tăng], True([Giảm]), [Không đổi], [Không xác định được]),
  accent: c-p2,
  loigiai: [
    #step[Ta có $overline(C)'(x)$ cùng dấu với $C'(x) - overline(C)(x)$.]
    #step[Nếu $C'(x) < overline(C)(x)$ thì $overline(C)'(x) < 0$, nghĩa là chi phí trung bình đang giảm.]
  ],
)

#tn(
  [Trong mô hình EOQ với $D = 1200$, $S = 50$, $H = 2$, lượng đặt hàng tối ưu xấp xỉ bằng],
  ([$120$], [$180$], True([$245$]), [$300$]),
  accent: c-p2,
  loigiai: [
    #step[Ta có $Q^* = sqrt(2 dot.c D dot.c S / H) = sqrt(2 dot.c 1200 dot.c 50 / 2) = sqrt(60000)$.]
    #step[Suy ra $Q^* approx 245$.]
  ],
)

#q-label([B. ĐÚNG – S A I — Xét tính đúng/sai của mỗi phát biểu], c-p2)
#resetexamstate()

#ds(
  [Chi phí sản xuất $C(x) = x^3 - 6x^2 + 15x + 20$ (triệu đồng), $x > 0$.],
  (
    True([Chi phí biên $C'(x) = 3x^2 - 12x + 15$.]),
    True([Chi phí biên cực tiểu tại $x = 2$.]),
    True([Tại điểm $C'(x) = overline(C)(x)$, chi phí trung bình đạt cực trị.]),
    True([Chi phí biên luôn dương vì $Delta = 144 - 180 < 0$.]),
  ),
  accent: c-p2,
  loigiai: [
    #step[Lấy đạo hàm được $C'(x) = 3x^2 - 12x + 15$, nên phát biểu $1$ đúng.]
    #step[Vì $C'(x)$ là tam thức bậc hai có đỉnh tại $x = -(-12)/(2 dot.c 3) = 2$, nên phát biểu $2$ đúng.]
    #step[Theo lý thuyết chi phí trung bình, điều kiện cực trị là $C'(x) = overline(C)(x)$, nên phát biểu $3$ đúng.]
    #step[Biệt thức của $C'(x)$ là $Delta = (-12)^2 - 4 dot.c 3 dot.c 15 = -36 < 0$ và hệ số đầu dương, nên $C'(x) > 0$ với mọi $x$. Phát biểu $4$ đúng.]
  ],
)

#ds(
  [Xét mô hình EOQ với nhu cầu năm $D$, chi phí mỗi lần đặt hàng $S$, chi phí lưu kho $H$, lượng đặt hàng mỗi lần là $Q > 0$.],
  (
    True([Tổng chi phí tồn kho là $T(Q) = D dot.c S / Q + H dot.c Q / 2$.]),
    True([Đạo hàm của hàm tổng chi phí là $T'(Q) = -D dot.c S / Q^2 + H / 2$.]),
    True([Lượng đặt hàng tối ưu là $Q^* = sqrt(2 dot.c D dot.c S / H)$.]),
    [Tại lượng đặt hàng tối ưu, chi phí đặt hàng lớn hơn chi phí lưu kho.],
  ),
  accent: c-p2,
  loigiai: [
    #step[Từ mô hình EOQ chuẩn, công thức tổng chi phí là $T(Q) = D dot.c S / Q + H dot.c Q / 2$, nên phát biểu $1$ đúng.]
    #step[Lấy đạo hàm theo $Q$, được $T'(Q) = -D dot.c S / Q^2 + H / 2$, nên phát biểu $2$ đúng.]
    #step[Giải $T'(Q) = 0$ cho $Q > 0$ thu được $Q^* = sqrt(2 dot.c D dot.c S / H)$, nên phát biểu $3$ đúng.]
    #step[Tại điểm tối ưu, hai thành phần chi phí bằng nhau, không phải chi phí đặt hàng lớn hơn chi phí lưu kho. Vì vậy phát biểu $4$ sai.]
  ],
)

#q-label([C. TỰ LUẬN NGẮN — Ghi đáp số vào ô trống], c-p2)
#resetexamstate()

#tln(
  [Chi phí $C(x) = x^3 - 9x^2 + 30x + 20$. Chi phí biên cực tiểu bằng bao nhiêu?],
  [$3$],
  accent: c-p2,
  loigiai: [
    #step[Chi phí biên là $C'(x) = 3x^2 - 18x + 30$.]
    #step[Đỉnh của parabol này ở $x = 3$, nên giá trị nhỏ nhất là $C'(3) = 3$.]
  ],
)

#tln(
  [Với hàm chi phí $C(x) = x^2 + 20x + 400$, hãy tìm giá trị $x > 0$ để chi phí trung bình $overline(C)(x)$ đạt giá trị nhỏ nhất.],
  [$20$],
  accent: c-p2,
  loigiai: [
    #step[Chi phí trung bình là $overline(C)(x) = x + 20 + 400/x$.]
    #step[Giải $overline(C)'(x) = 1 - 400/x^2 = 0$ được $x = 20$.]
  ],
)

#tln(
  [Trong mô hình EOQ với $D = 1200$, $S = 50$, $H = 2$, lượng đặt hàng tối ưu gần đúng bằng bao nhiêu hộp?],
  [$245$],
  accent: c-p2,
  loigiai: [
    #step[Ta có $Q^* = sqrt(2 dot.c D dot.c S / H) = sqrt(60000) = 100 sqrt(6)$.]
    #step[Suy ra $Q^* approx 245$ hộp.]
  ],
)
