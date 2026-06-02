#import "../_config.typ": *

#chapter([Tối Ưu Hóa Khối Đa Diện & Chi Phí Chênh Lệch], theme-color: c-p2)

#phuongphap(theme-color: c-p2)[
  *Quy trình cho bài toán bể/hộp 3D:*

  + *Vẽ hình và đặt biến:* Gọi cạnh đáy, chiều rộng, chiều cao là $x$, $y$, $h$.
  + *Thiết lập ràng buộc:* Thường xuất phát từ thể tích không đổi, ví dụ $V = x^2 h$.
  + *Đưa về một biến:* Từ ràng buộc rút $h$ theo $x$ hoặc ngược lại.
  + *Lập hàm mục tiêu:* Chi phí, diện tích vật liệu hoặc tổng tiền đều phải viết theo một biến duy nhất.
  + *Đạo hàm và BBT:* Tính đạo hàm, tìm điểm tới hạn và kết luận qua bảng biến thiên.
]

#vd(
  [Một bể nước hình hộp chữ nhật đáy vuông, không có nắp, có thể tích
    $V = 32$ m³. Đáy bể làm bằng vật liệu đắt gấp đôi thành bể.
    Đặt đơn giá vật liệu làm thành bể là $k$ đồng/m². Tìm kích thước bể để
    tổng chi phí vật liệu nhỏ nhất.],
  loigiai: [
    #ppgiai[
      - Gọi cạnh đáy vuông là $x$, chiều cao là $h$.
      - Từ thể tích không đổi rút $h$ theo $x$.
      - Lập hàm chi phí rồi khảo sát bằng đạo hàm và bảng biến thiên.
    ]

    #step[Gọi $x$ (m) là cạnh đáy vuông, $h$ (m) là chiều cao của bể. Khi đó:
      $ x > 0, quad h > 0, quad x^2 h = 32. $
      Suy ra:
      $ h = 32 / x^2. $]

    #step[Diện tích đáy là $x^2$ (m²), còn diện tích bốn thành là:
      $ 4 dot.c x dot.c h = 4x dot.c 32 / x^2 = 128 / x. $
      Vì đáy đắt gấp đôi thành bể nên hàm chi phí là:
      $ C(x) = 2 dot.c k x^2 + 128 dot.c k / x, quad x > 0. $]

    #step[Tính đạo hàm:
      $ C'(x) = 4 dot.c k x - 128 dot.c k / x^2. $
      Cho $C'(x) = 0 <=> 4x^3 = 128 <=> x^3 = 32 <=> x = root(3, 32).$]

    #step[Bảng biến thiên của $C(x)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $root(3, 32)$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $24 k root(3, 4)$, $+oo$),
          is-min: true,
        )
      ]]

    #step[Từ bảng biến thiên, chi phí nhỏ nhất khi $x = root(3, 32)$ m. Khi đó:
      $ h = 32 / x^2 = root(3, 32). $
      Vậy bể tối ưu có chiều cao bằng cạnh đáy.]
    #resetstep()
  ],
  theme-color: c-p2,
)

#bt(
  [Thiết kế một thùng chứa nước hình hộp chữ nhật có đáy hình vuông,
    thể tích $54$ m³, không nắp. Biết chi phí làm đáy là $500.000$ đồng/m²
    và chi phí làm thành là $200.000$ đồng/m². Tìm kích thước tối ưu để
    chi phí nhỏ nhất.],
  loigiai: [
    #ppgiai[
      - Gọi cạnh đáy vuông là $x$, chiều cao là $h$.
      - Từ thể tích $54$ m³ rút $h$ theo $x$.
      - Lập hàm chi phí và khảo sát bằng đạo hàm, BBT.
    ]

    #step[Gọi $x$ (m) là cạnh đáy vuông và $h$ (m) là chiều cao của thùng. Ta có:
      $ x^2 h = 54 <=> h = 54 / x^2, quad x > 0. $]

    #step[Chi phí làm đáy là $500000 x^2$ (đồng). Chi phí làm bốn thành là:
      $ 200000 dot.c 4 dot.c x dot.c h = 800000 dot.c x dot.c 54 / x^2 = 43200000 / x. $
      Vậy hàm chi phí là:
      $ C(x) = 500000 x^2 + 43200000 / x. $]

    #step[Tính đạo hàm:
      $ C'(x) = 1000000 x - 43200000 / x^2. $
      Cho $C'(x) = 0 <=> 1000000 x^3 = 43200000 <=> x^3 = 43.2.$
      Suy ra:
      $ x = root(3, 43.2) approx 3.51. $]

    #step[Bảng biến thiên của $C(x)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $root(3, 43.2)$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $C(root(3, 43.2))$, $+oo$),
          is-min: true,
        )
      ]]

    #step[Từ bảng biến thiên, chi phí nhỏ nhất khi $x = root(3, 43.2) approx 3.51$ m.
      Khi đó:
      $ h = 54 / x^2 approx 4.39 $ m.
      Vậy kích thước tối ưu xấp xỉ là cạnh đáy $3.51$ m và chiều cao $4.39$ m.]
    #resetstep()
  ],
  theme-color: c-p2,
)

#bt(
  [Một bể chứa không nắp có đáy hình chữ nhật, trong đó chiều dài gấp đôi chiều rộng. Thể tích bể là $128$ m³. Biết chi phí làm đáy là $300.000$ đồng/m² và chi phí làm thành là $150.000$ đồng/m². Tìm chiều rộng đáy để tổng chi phí nhỏ nhất.],
  loigiai: [
    #ppgiai[
      - Gọi chiều rộng đáy là $x$, chiều dài là $2x$, chiều cao là $h$.
      - Dùng điều kiện thể tích để rút $h$ theo $x$.
      - Lập hàm chi phí, đạo hàm và bảng biến thiên.
    ]

    #step[Gọi chiều rộng đáy là $x$ (m), chiều dài là $2x$ (m), chiều cao là $h$ (m). Khi đó:
      $ 2 dot.c x^2 h = 128 <=> h = 64 / x^2, quad x > 0. $]

    #step[Diện tích đáy là $2 dot.c x^2$. Diện tích bốn thành là:
      $ 2(2 dot.c x dot.c h) + 2(x dot.c h) = 6 dot.c x dot.c h = 6 dot.c x dot.c 64 / x^2 = 384 / x. $
      Hàm chi phí là:
      $ C(x) = 300000 dot.c 2 dot.c x^2 + 150000 dot.c 384 / x = 600000 x^2 + 57600000 / x. $]

    #step[Đạo hàm:
      $ C'(x) = 1200000 x - 57600000 / x^2. $
      Cho $C'(x) = 0 <=> x^3 = 48 <=> x = root(3, 48).$]

    #step[Bảng biến thiên của $C(x)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $root(3, 48)$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $C(root(3, 48))$, $+oo$),
          is-min: true,
        )
      ]]

    #step[Vậy tổng chi phí nhỏ nhất khi chiều rộng đáy là $x = root(3, 48) approx 3.63$ m.]
    #resetstep()
  ],
  theme-color: c-p2,
)

// ════════════════════════════════════════════════════════════
#bt-header(c-p2)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — Chọn một đáp án đúng], c-p2)

#tn(
  [Hộp tứ giác không nắp có thể tích $V = 1000$ cm³, đáy hình vuông cạnh $x$. Chi phí đáy là $2 x^2$, bốn thành là $4000/x$. Giá trị $x$ để chi phí nhỏ nhất là],
  ([$x = 5$ cm], True([$x = 10$ cm]), [$x = root(3, 500)$ cm], [$x = 2 root(3, 250)$ cm]),
  accent: c-p2,
  loigiai: [
    #step[Hàm chi phí là $C(x) = 2 x^2 + 4000/x$.]
    #step[Đạo hàm $C'(x) = 4x - 4000/x^2 = 0 <=> x^3 = 1000 <=> x = 10$.]
  ],
)

#tn(
  [Hình trụ nội tiếp khối cầu bán kính $R$. Thể tích trụ cực đại khi chiều cao $h$ bằng],
  ([$R / sqrt(3)$], [$2R / sqrt(3)$], True([$2R sqrt(3) / 3$]), [$R sqrt(3)$]),
  accent: c-p2,
  loigiai: [
    #step[Ta có $r^2 + (h/2)^2 = R^2$, nên thể tích trụ là:
      $ V(h) = pi(R^2 - h^2/4)h. $]
    #step[Đạo hàm $V'(h) = pi(R^2 - 3h^2/4) = 0 <=> h = 2R / sqrt(3) = 2R sqrt(3) / 3$.]
  ],
)

#tn(
  [Hộp chữ nhật không nắp đáy hình vuông cạnh $x$, thể tích $500$ cm³. Tổng diện tích vật liệu $S = x^2 + 2000/x$ cực tiểu tại],
  ([$root(3, 500)$ cm], [10 cm], True([$root(3, 1000)$ cm]), [$5 root(3, 4)$ cm]),
  accent: c-p2,
  loigiai: [
    #step[Đạo hàm $S'(x) = 2x - 2000/x^2$.]
    #step[Cho $S'(x) = 0 <=> 2x^3 = 2000 <=> x^3 = 1000 <=> x = root(3, 1000) = 10$.]
  ],
)

#tn(
  [Một bể không nắp đáy vuông có thể tích $V = 32$ m³, đáy đắt gấp đôi thành. Khi chi phí nhỏ nhất thì],
  (
    [Chiều cao bằng một nửa cạnh đáy],
    True([Chiều cao bằng cạnh đáy]),
    [Chiều cao gấp đôi cạnh đáy],
    [Chiều cao không phụ thuộc cạnh đáy],
  ),
  accent: c-p2,
  loigiai: [
    #step[Từ bài toán chuẩn, ta có $C(x) = 2 dot.c k x^2 + 128 dot.c k / x$.]
    #step[Điểm cực tiểu thỏa $x = root(3, 32)$ và khi đó $h = 32/x^2 = x$.]
  ],
)

#q-label([B. ĐÚNG – S A I — Xét tính đúng/sai của mỗi phát biểu], c-p2)
#resetexamstate()

#ds(
  [Cho một hộp không nắp có đáy hình vuông cạnh $x$ (cm), chiều cao $h$ (cm), thể tích $V = 1000$ cm³.],
  (
    True([Ta có hệ thức ràng buộc $x^2 h = 1000$.]),
    True([Nếu biểu diễn theo $x$ thì $h = 1000/x^2$.]),
    True([Tổng diện tích vật liệu là $S(x) = x^2 + 4000/x$.]),
    [Diện tích vật liệu nhỏ nhất khi $x = 10$ cm.],
  ),
  accent: c-p2,
  loigiai: [
    #step[Từ công thức thể tích hộp, $V = x^2 h = 1000$, nên phát biểu $1$ đúng.]
    #step[Suy ra ngay $h = 1000/x^2$, nên phát biểu $2$ đúng.]
    #step[Tổng diện tích vật liệu bằng diện tích đáy cộng bốn thành:
      $ S(x) = x^2 + 4 dot.c x dot.c h = x^2 + 4000/x. $
      Do đó phát biểu $3$ đúng.]
    #step[Đạo hàm $S'(x) = 2x - 4000/x^2 = 0 <=> x^3 = 2000$, nên $x = root(3, 2000)$ chứ không phải $10$.
      Vì vậy phát biểu $4$ sai.]
  ],
)

#ds(
  [Một bể không nắp có đáy chữ nhật, trong đó chiều dài gấp đôi chiều rộng. Gọi chiều rộng là $x$, chiều cao là $h$, thể tích bể bằng $128$ m³.],
  (
    True([Ta có $2 x^2 h = 128$.]),
    True([Biểu diễn theo $x$ thì $h = 64/x^2$.]),
    [Diện tích bốn thành là $4 x h$.],
    True([Tổng chi phí nhỏ nhất có thể tìm bằng cách xét đạo hàm của một hàm một biến.]),
  ),
  accent: c-p2,
  loigiai: [
    #step[Từ thể tích $V = 2 x^2 h = 128$, suy ra phát biểu $1$ đúng.]
    #step[Từ đó rút được $h = 64/x^2$, nên phát biểu $2$ đúng.]
    #step[Diện tích bốn thành bằng $2(2 dot.c x dot.c h) + 2(x dot.c h) = 6x dot.c h$, không phải $4x dot.c h$, nên phát biểu $3$ sai.]
    #step[Sau khi rút $h$ theo $x$, hàm chi phí trở thành hàm của một biến duy nhất. Vì vậy phát biểu $4$ đúng.]
  ],
)

#q-label([C. TỰ LUẬN NGẮN — Ghi đáp số vào ô trống], c-p2)
#resetexamstate()

#tln(
  [Hộp không nắp có đáy hình vuông, thể tích $V = 32$ cm³. Tổng diện tích vật liệu nhỏ nhất (cm²) bằng bao nhiêu?],
  [$24 root(3, 16)$],
  accent: c-p2,
  loigiai: [
    #step[Ta có $x^2 h = 32 <=> h = 32/x^2$. Tổng diện tích là:
      $ S(x) = x^2 + 4 dot.c x dot.c h = x^2 + 128/x. $]
    #step[Đạo hàm $S'(x) = 2x - 128/x^2 = 0 <=> x^3 = 64 <=> x = 4$.]
    #step[Khi đó $h = 2$ và $S_(min) = 4^2 + 4 dot.c 4 dot.c 2 = 48$ cm².]
  ],
)

#tln(
  [Hình hộp chữ nhật đáy vuông cạnh $x$, chiều cao $h$, thể tích $V = 4$ dm³, chi phí thành bằng $4 x h$, chi phí đáy bằng $x^2$. Chi phí nhỏ nhất khi $x =$ (dm).],
  [$2$],
  accent: c-p2,
  loigiai: [
    #step[Từ $x^2 h = 4$ suy ra $h = 4/x^2$. Hàm chi phí là:
      $ C(x) = x^2 + 4 dot.c x dot.c h = x^2 + 16/x. $]
    #step[Đạo hàm $C'(x) = 2x - 16/x^2 = 0 <=> x^3 = 8 <=> x = 2$.]
  ],
)

#tln(
  [Một bể không nắp đáy vuông có thể tích $V = 108$ m³. Nếu bỏ qua đơn giá và chỉ xét tổng diện tích vật liệu, cạnh đáy tối ưu bằng bao nhiêu mét?],
  [$6$],
  accent: c-p2,
  loigiai: [
    #step[Từ $x^2 h = 108$ suy ra $h = 108/x^2$. Tổng diện tích vật liệu là:
      $ S(x) = x^2 + 4 dot.c x dot.c h = x^2 + 432/x. $]
    #step[Đạo hàm $S'(x) = 2x - 432/x^2 = 0 <=> x^3 = 216 <=> x = 6$.]
  ],
)
