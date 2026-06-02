#import "../_config.typ": *

#chapter([Đọc Hiểu Đồ Thị & Nội Suy Dữ Liệu Thực Nghiệm], theme-color: c-p5)

#phuongphap(theme-color: c-p5)[
  *Kỹ thuật đọc đồ thị $f'(x)$ để suy ra $f(x)$:*
  - $f'(x) > 0$ (đồ thị $f'$ trên trục $O x$) $=>$ $f$ *tăng*.
  - $f'(x) < 0$ (đồ thị $f'$ dưới trục $O x$) $=>$ $f$ *giảm*.
  - $f'(x_0) = 0$ và $f'$ đổi dấu $+$ sang $-$ $=>$ $x_0$ là *cực đại* của $f$.
  - $f'(x_0) = 0$ và $f'$ đổi dấu $-$ sang $+$ $=>$ $x_0$ là *cực tiểu* của $f$.
  - $f''(x) > 0$ (tức $f'$ tăng) $=>$ $f$ *lõm* (đồ thị cong lên).
  - $f'(a)$ = độ dốc tiếp tuyến với đồ thị $f$ tại $x = a$.
]

#vd(
  [Đồ thị sau mô tả vận tốc $v(t)$ (m/s) của một vật theo thời gian $t$ (giây):
    $v(t) = 0$ tại $t = 0$; tăng đến cực đại $v = 12$ m/s tại $t = 3$;
    giảm về $0$ tại $t = 6$; tiếp tục giảm về $-6$ m/s tại $t = 8$.
    *(a)* Vật đứng yên tại những thời điểm nào? Ở đó gia tốc bằng bao nhiêu?
    *(b)* Tính quãng đường vật đi được trong $[0; 8]$ giây nếu biết diện tích
    dưới đường cong vận tốc: $integral_0^3 v dif t = 20$, $integral_3^6 v dif t = 15$,
    $integral_6^8 v dif t = -8$.],
  loigiai: [
    *(a)* Vật đứng yên khi $v = 0$: $t = 0$ và $t = 6$ s.
    Tại $t = 0$: $a = v'(0)$ — đồ thị $v$ tăng, nên $a > 0$ (đang tăng tốc).
    Tại $t = 6$: $v$ đang giảm (từ 12 về 0 rồi xuống $-6$), nên $a < 0$ (đang giảm tốc).

    *(b)* Độ dịch chuyển: $Delta  s = 20 + 15 + (-8) = 27$ m.
    Quãng đường thực đi: $|20| + |15| + |-8| = 20 + 15 + 8 = 43$ m.
  ],
  theme-color: c-p5,
)

#vd(
  [Bảng dưới đây ghi nhiệt độ (°C) đo được của một phòng lạnh theo giờ:

    #table(
      columns: 7,
      align: center,
      [*$t$ (giờ)*], [0], [1], [2], [3], [4], [5],
      [*$T(t)$ (°C)*], [25], [19], [14], [10], [7], [5],
    )

    *(a)* Ước tính *tốc độ làm lạnh tại $t = 2$ h* bằng sai phân trung tâm.
    *(b)* Phòng lạnh đang được làm lạnh nhanh nhất vào khoảng giờ nào?],
  loigiai: [
    *(a)* Sai phân trung tâm tại $t = 2$:
    $T'(2) approx frac(T(3) - T(1), 3 - 1) = frac(10 - 19, 2) = -4{,}5$ °C/giờ.

    *(b)* Tính xấp xỉ tốc độ tại từng điểm nội:
    $T'(1) approx (14-25)/2 = -5{,}5$;
    $T'(2) approx -4{,}5$;
    $T'(3) approx (7-14)/2 = -3{,}5$;
    $T'(4) approx (5-10)/2 = -2{,}5$.
    Tốc độ giảm nhanh nhất (trị tuyệt đối lớn nhất) tại $t approx  1$ giờ.
  ],
  theme-color: c-p5,
)

// ─── Chủ đề 5.2 ────────────────────────────────────────────────


// ════════════════════════════════════════════════════════════
#bt-header(c-p5)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — Chọn một đáp án đúng], c-p5)

#tn([Đồ thị hàm số $f$ có $f'(a) = 0$ và $f''(a) < 0$. Tại $x = a$, hàm số],
  ([Đạt cực tiểu], [Đạt cực đại], [Có điểm uốn], [Không xác định được cực trị]), correct: (2,), accent: c-p5)

#tn([Đồ thị $f$ dốc lên và ngày càng dốc hơn (lõm lên). Điều đó nghĩa là],
  ([$f' > 0$ và $f'' < 0$], [$f' > 0$ và $f'' > 0$], [$f' < 0$ và $f'' > 0$], [$f' < 0$ và $f'' < 0$]), correct: (2,), accent: c-p5)

#tn([Từ bảng số liệu thực nghiệm, nội suy tuyến tính giữa hai điểm $(x_1, y_1)$ và $(x_2, y_2)$ cho giá trị tại $x$ là],
  ([$frac(y_1 + y_2, 2)$], [$y_1 + frac((y_2 - y_1)(x - x_1), x_2 - x_1)$], [$frac(y_2 - y_1, x_2 - x_1)$], [$y_1 dot.c frac(x - x_2, x_1 - x_2) + y_2 dot.c frac(x - x_1, x_2 - x_1)$]), correct: (2,), accent: c-p5)

#q-label([B. ĐÚNG – S A I — Xét tính đúng/sai của mỗi phát biểu], c-p5)
#resetexamstate()

#ds([Cho đồ thị hàm $f$ trên $[a, b]$ với $f'$ và $f''$ xác định.],
  (
    [Nếu $f'(x) > 0$ với mọi $x in (a,b)$, hàm tăng trên $(a,b)$.],
    [Nếu $f''(x) > 0$ trên $(a,b)$, đồ thị lõm lên trên $(a,b)$.],
    [Điểm uốn xảy ra khi $f''(c) = 0$ và $f''$ đổi dấu tại $c$.],
    [Cực đại luôn là điểm cao nhất trên đồ thị.],
  ), accent: c-p5)

#q-label([C. TỰ LUẬN NGẮN — Ghi đáp số vào ô trống], c-p5)
#resetexamstate()

#tln([Từ đồ thị, $f(2) = 5$, $f(4) = 9$. Nội suy tuyến tính, $f(3) approx$ bằng bao nhiêu?], [$7$], accent: c-p5)

#tln([Đồ thị $f$ có $f'(x) = 0$ tại $x = 1$ và $x = 4$. Trên $(1, 4)$: $f'(x) < 0$. Khoảng đồng biến của $f$ (trong $[0, 5]$) là $[0, 1) union (4, 5]$. Số điểm cực trị của $f$ trên $(0, 5)$ là.], [$2$], accent: c-p5)
