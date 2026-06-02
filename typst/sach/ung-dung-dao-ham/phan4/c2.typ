#import "../_config.typ": *

#chapter([Y Sinh Học, Môi Trường & Lãi Suất Kép — Hàm Mũ & Logarit], theme-color: c-p4)

#phuongphap(theme-color: c-p4)[
  *Các mô hình tăng trưởng/suy giảm theo hàm mũ:*
  - *Tăng trưởng liên tục:* $N(t) = N_0 e^(k t)$ ($k > 0$: tốc độ tăng trưởng riêng).
  - *Phân rã phóng xạ / thuốc trong máu:* $A(t) = A_0 e^(-k t)$ ($k > 0$).
  - *Chu kỳ bán rã:* $T_(1/2) = ln 2 / k$.
  - *Lãi suất kép liên tục:* $A(t) = P e^(r t)$ ($r$ = lãi suất/năm, $P$ = vốn ban đầu).
  - *Thời gian tối ưu bán tài sản:* tìm $t$ cực đại của $V(t) e^(-r t)$
    (giá trị hiện tại của tài sản).
]

#vd(
  [_(Dược động học)_ Sau khi tiêm, nồng độ thuốc trong máu (mg/L) theo thời gian:
    $C(t) = 10 e^{-0{,}3t}$ với $t$ tính bằng giờ.
    *(a)* Tốc độ thay đổi nồng độ thuốc tại $t = 2$ giờ là bao nhiêu?
    *(b)* Nồng độ thuốc giảm xuống còn 2 mg/L sau bao nhiêu giờ?
    *(c)* Thuốc có hiệu quả khi $C(t) >= 3$ mg/L. Tìm khoảng thời gian thuốc có hiệu quả.],
  loigiai: [
    *(a)* $C'(t) = -3e^{-0{,}3t}$. Tại $t = 2$: $C'(2) = -3e^{-0{,}6} approx -1{,}65$ mg/L/giờ.
    Nồng độ giảm khoảng 1,65 mg/L mỗi giờ tại thời điểm đó.

    *(b)* $10e^{-0{,}3t} = 2 => e^{-0{,}3t} = 0{,}2 => t = frac{ln 5}{0{,}3} approx 5{,}37$ giờ.

    *(c)* $10e^{-0{,}3t} >= 3 => t <= frac{ln(10/3)}{0{,}3} approx 4{,}02$ giờ.
    Thuốc có hiệu quả trong khoảng $[0; 4{,}02]$ giờ (kể từ khi tiêm).
  ],
  theme-color: c-p4,
)

#vd(
  [_(Tài chính cá nhân)_ Bạn mua một mảnh đất với giá $P = 500$ triệu đồng.
    Giá đất tăng theo mô hình $V(t) = 500 e^{0{,}08t}$ (triệu đồng), với
    $t$ là số năm. Lãi suất ngân hàng $r = 6\%$/năm (lãi kép liên tục).
    Tìm thời điểm *tối ưu để bán đất*, tức là tối đa hóa *giá trị hiện tại*
    $"P V"(t) = V(t) e^{-0{,}06t}$.],
  loigiai: [
    $"P V"(t) = 500 e^{0{,}08t} dot.c e^{-0{,}06t} = 500 e^{0{,}02t}$.

    $"P V"'(t) = 500 times 0{,}02 times e^{0{,}02t} = 10 e^{0{,}02t} > 0$ với mọi $t$.

    *Kết luận:* $"P V"(t)$ luôn tăng — giá trị hiện tại của mảnh đất tăng mãi.
    Mô hình này nghĩa là: giữ đất càng lâu càng tốt vì tốc độ tăng giá đất
    ($8\%$) lớn hơn lãi suất ngân hàng ($6\%$). Điểm tối ưu khi $g = r$.
  ],
  theme-color: c-p4,
)

#nhanxet(theme-color: c-p4)[
  *Nguyên tắc tổng quát:* Tài sản tăng giá với tỉ lệ $g$ nên bán khi
  $g < r$ (lãi suất cơ hội). Nếu $g > r$: giữ. Nếu $g = r$: thời điểm
  tối ưu (hoặc bất kỳ thời điểm nào cũng như nhau). Đây là ứng dụng cơ bản
  của *Optimal Stopping Theory* trong tài chính.
]

#bt(
  [Lượng chất phóng xạ Carbon-14 trong một mẫu hóa thạch hiện chỉ còn
    $30\%$ lượng ban đầu. Biết chu kỳ bán rã của C-14 là 5730 năm.
    Tính tuổi của mẫu hóa thạch.],
  lines: 6,
  theme-color: c-p4,
)

#bt(
  [Một dịch bệnh lây lan theo mô hình logistic:
    $I(t) = frac(K, 1 + A e^(-r t))$,
    với $K = 10\,000$ người (sức chứa dân số), $A = 999$, $r = 0{,}5$/ngày.
    *(a)* Tìm thời điểm tốc độ lây lan nhanh nhất.
    *(b)* Tính tốc độ lây lan tối đa đó (số người mắc mới/ngày).],
  lines: 10,
  theme-color: c-p4,
)

// ═══════════════════════════════════════════════════════════════════


// ════════════════════════════════════════════════════════════
#bt-header(c-p4)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — Chọn một đáp án đúng], c-p4)

#tn(
  [Dân số tăng theo $N(t) = N_0 e^(k t)$. Nếu dân số tăng gấp đôi sau $70$ năm, tốc độ tăng $k approx$],
  ([$0{,}005$ / năm], [$0{,}01$ / năm], [$0{,}02$ / năm], [$0{,}03$ / năm]),
  correct: (2,),
  accent: c-p4,
)

#tn(
  [Tiền gửi $P$ với lãi suất $r$ liên tục trong $t$ năm: $A = P e^(r t)$. Số năm để vốn tăng gấp 3 khi $r = 10%$ / năm là $t approx$],
  ([$5{,}5$ năm], [$7$ năm], [$11$ năm], [$15$ năm]),
  correct: (3,),
  accent: c-p4,
)

#tn(
  [Chất phóng xạ phân rã $A(t) = A_0 e^(-0{,}0693 t)$. Chu kỳ bán rã (năm) gần đúng là],
  ([$5$ năm], [$8$ năm], [$10$ năm], [$14$ năm]),
  correct: (3,),
  accent: c-p4,
)

#q-label([B. ĐÚNG – S A I — Xét tính đúng/sai của mỗi phát biểu], c-p4)
#resetexamstate()

#ds(
  [Mô hình tăng trưởng logistic: $P'(t) = k P(1 - P/M)$, với $M$ là sức chứa môi trường.],
  (
    [Khi $P << M$, mô hình gần với tăng trưởng mũ $P' approx k P$.],
    [Tốc độ tăng dân số $P'$ đạt cực đại khi $P = M/2$.],
    [Khi $P = M$, dân số không còn tăng nữa ($P' = 0$).],
    [Mô hình logistic luôn cho kết quả thực tế hơn mô hình mũ.],
  ),
  accent: c-p4,
)

#q-label([C. TỰ LUẬN NGẮN — Ghi đáp số vào ô trống], c-p4)
#resetexamstate()

#tln(
  [Tiền gửi $10$ triệu đồng, lãi suất $8%$/năm ghép liên tục. Sau $5$ năm số tiền là $10 e^(0{,}4)$ triệu. Giá trị $e^(0{,}4) approx 1{,}4918$, số tiền (triệu, làm tròn đến 0,01) là.],
  [$14{,}92$],
  accent: c-p4,
)

#tln(
  [Dân số thành phố hiện tại $500.000$ người, tăng $2%$/năm liên tục. Sau bao nhiêu năm dân số đạt $600.000$ người? (Làm tròn đến 1 năm, dùng $ln 1{,}2 approx 0{,}182$.)],
  [$9$ năm],
  accent: c-p4,
)
