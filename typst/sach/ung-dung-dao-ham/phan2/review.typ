#import "../_config.typ": *

#chapter([Đề Tổng Hợp Phần 2: Hình Khối & Mô Hình Kinh Tế], theme-color: c-p2)

#nhanxet(theme-color: c-p2)[
  *Mục tiêu của cụm đề này:* trộn chung tối ưu hình khối và tối ưu kinh tế để học sinh buộc phải đọc mô hình, đặt ẩn đúng và chọn đúng hàm mục tiêu thay vì học thuộc công thức rời rạc.
]

#bt-header(c-p2)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — Chọn một đáp án đúng], c-p2)

#tn(
  [Trong các hình trụ kín có cùng thể tích, diện tích toàn phần nhỏ nhất khi],
  ([$h = r$], True([$h = 2r$]), [$h = 4r$], [$r = 2h$]),
  accent: c-p2,
  loigiai: [
    #step[Với thể tích cố định $V = pi dot.c r^2 dot.c h$, ta đưa diện tích toàn phần về một biến và đạo hàm. Điều kiện cực trị cho kết quả $h = 2r$.]
  ],
)

#tn(
  [Một bể không nắp có đáy hình vuông, thể tích cố định $32$ m^3 và chi phí làm đáy gấp đôi chi phí làm thành bên. Nếu gọi cạnh đáy là $x$ và chiều cao là $h$, tại phương án tối ưu ta có],
  ([$x = 2h$], True([$x = h$]), [$x = frac(h, 2)$], [$x = 4h$]),
  accent: c-p2,
  loigiai: [
    #step[Từ $x^2 h = 32$ suy ra $h = frac(32, x^2)$. Chi phí là
      $C(x) = 2 dot.c x^2 + 4 dot.c x dot.c h = 2 dot.c x^2 + frac(128, x)$.]
    #step[Giải $C'(x) = 4 dot.c x - frac(128, x^2) = 0$ được $x^3 = 32$, nên
      $h = frac(32, x^2) = x$.]
  ],
)

#tn(
  [Chi phí trung bình $overline(C)(x) = frac(C(x), x)$ đạt cực tiểu khi],
  ([$C'(x) = 0$], [$overline(C)'(x) = 0$ và $C'(x) = 0$], True([$C'(x) = overline(C)(x)$]), [$x dot.c C'(x) = 0$]),
  accent: c-p2,
  loigiai: [
    #step[Điều kiện cực trị của hàm chi phí trung bình là $overline(C)'(x) = 0$, tương đương với $x dot.c C'(x) = C(x)$, tức $C'(x) = overline(C)(x)$.]
  ],
)

#tn(
  [Trong mô hình E O Q với $D = 1200$, $S = 50$, $H = 2$, lượng đặt hàng tối ưu gần đúng bằng],
  ([$180$], [$200$], True([$245$]), [$300$]),
  accent: c-p2,
  loigiai: [
    #step[Ta có
      $Q^* = sqrt(frac(2 dot.c D dot.c S, H)) = sqrt(60000) = 100 dot.c sqrt(6) approx 245$.]
  ],
)

#tn(
  [Một doanh nghiệp bán sản phẩm với hàm giá $p(x) = 160 - x$ và chi phí $C(x) = 40x + 900$ (nghìn đồng). Sản lượng làm lợi nhuận lớn nhất là],
  ([$40$], True([$60$]), [$80$], [$120$]),
  accent: c-p2,
  loigiai: [
    #step[Lợi nhuận là
      $P(x) = x(160 - x) - (40x + 900) = -x^2 + 120x - 900$.]
    #step[Giải $P'(x) = -2x + 120 = 0$ được $x = 60$.]
  ],
)

#q-label([B. ĐÚNG – S A I — Xét tính đúng/sai của mỗi phát biểu], c-p2)
#resetexamstate()

#ds(
  [Xét hình trụ kín có thể tích $128 pi$, bán kính đáy $r > 0$, chiều cao $h > 0$.],
  (
    True([Ta có $h = frac(128, r^2)$.]),
    True([Diện tích toàn phần là $S(r) = 2 pi dot.c r^2 + frac(256 pi, r)$.]),
    True([Phương án tối ưu đạt tại $r = 4$, $h = 8$.]),
    [Tại phương án tối ưu, ta có $h = r$.],
  ),
  accent: c-p2,
  loigiai: [
    #step[Từ điều kiện thể tích $pi dot.c r^2 dot.c h = 128 pi$ suy ra $h = frac(128, r^2)$, nên phát biểu $1$ đúng.]
    #step[Thay vào công thức diện tích toàn phần
      $S = 2 pi dot.c r^2 + 2 pi dot.c r dot.c h$,
      được
      $S(r) = 2 pi dot.c r^2 + frac(256 pi, r)$, nên phát biểu $2$ đúng.]
    #step[Giải
      $S'(r) = 4 pi dot.c r - frac(256 pi, r^2) = 0$
      được $r^3 = 64$, suy ra $r = 4$ và $h = 8$. Phát biểu $3$ đúng.]
    #step[Tại phương án tối ưu $h = 8$, $r = 4$, nên $h = 2r$, không phải $h = r$. Phát biểu $4$ sai.]
  ],
)

#ds(
  [Xét đồng thời hai mô hình sau: chi phí trung bình với $C(x) = x^2 + 20x + 400$ và mô hình E O Q với nhu cầu năm $D$, chi phí đặt hàng $S$, chi phí lưu kho $H$.],
  (
    True([Chi phí trung bình là $overline(C)(x) = x + 20 + frac(400, x)$.]),
    True([Chi phí trung bình nhỏ nhất khi $x = 20$.]),
    [Trong mô hình E O Q, tại lượng đặt hàng tối ưu thì chi phí đặt hàng lớn hơn chi phí lưu kho.],
    True([Trong mô hình E O Q, lượng đặt hàng tối ưu là $Q^* = sqrt(frac(2 dot.c D dot.c S, H))$.]),
  ),
  accent: c-p2,
  loigiai: [
    #step[Từ định nghĩa chi phí trung bình, ta có
      $overline(C)(x) = frac(x^2 + 20x + 400, x) = x + 20 + frac(400, x)$,
      nên phát biểu $1$ đúng.]
    #step[Giải
      $overline(C)'(x) = 1 - frac(400, x^2) = 0$
      được $x = 20$, nên phát biểu $2$ đúng.]
    #step[Trong mô hình E O Q, tại điểm tối ưu hai thành phần chi phí đặt hàng và lưu kho bằng nhau, nên phát biểu $3$ sai.]
    #step[Phát biểu $4$ đúng theo công thức chuẩn của lượng đặt hàng kinh tế.]
  ],
)

#q-label([C. TỰ LUẬN NGẮN — Ghi một đáp số ngắn], c-p2)
#resetexamstate()

#tln(
  [Hình trụ kín có thể tích $128 pi$. Hỏi bán kính đáy tối ưu để diện tích toàn phần nhỏ nhất bằng bao nhiêu?],
  [$4$],
  accent: c-p2,
  loigiai: [
    #step[Giải phương trình
      $4 pi r - frac(256 pi, r^2) = 0$
      được $r^3 = 64$, nên $r = 4$.]
  ],
)

#tln(
  [Với hình trụ kín có thể tích $128 pi$, giá trị $S_min / pi$ bằng bao nhiêu?],
  [$96$],
  accent: c-p2,
  loigiai: [
    #step[Tại phương án tối ưu, ta có $r = 4$, $h = 8$.]
    #step[Suy ra
      $S_min = 2 pi dot.c r^2 + 2 pi dot.c r dot.c h = 2 pi dot.c 16 + 2 pi dot.c 4 dot.c 8 = 96 pi$.
      Vì vậy $S_min / pi = 96$.]
  ],
)

#tln(
  [Với hàm chi phí $C(x) = x^2 + 20x + 400$, hãy tìm giá trị $x > 0$ để chi phí trung bình nhỏ nhất.],
  [$20$],
  accent: c-p2,
  loigiai: [
    #step[Chi phí trung bình là
      $overline(C)(x) = x + 20 + frac(400, x)$.]
    #step[Giải
      $overline(C)'(x) = 1 - frac(400, x^2) = 0$
      được $x = 20$.]
  ],
)

#tln(
  [Trong mô hình E O Q với $D = 800$, $S = 50$, $H = 2$, lượng đặt hàng tối ưu là bao nhiêu?],
  [$200$],
  accent: c-p2,
  loigiai: [
    #step[Ta có
      $Q^* = sqrt(frac(2 dot.c 800 dot.c 50, 2)) = sqrt(40000) = 200$.]
  ],
)
