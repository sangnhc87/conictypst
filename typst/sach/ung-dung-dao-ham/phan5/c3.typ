#import "../_config.typ": *

#chapter([Nguồn Gốc Mô Hình Toán Học — Từ Thực Nghiệm đến Phương Trình], theme-color: c-p5)

#phuongphap(theme-color: c-p5)[
  *Nguyên lý thiết lập mô hình vi phân:* Nhiều định luật vật lý, hóa học,
  sinh học đến từ nguyên tắc *"tốc độ thay đổi tỉ lệ với lượng hiện có":*
  $frac(d N, d t) = k N => N(t) = N_0 e^(k t)$.
  Hoặc *"tốc độ thay đổi tỉ lệ với độ lệch so với trạng thái cân bằng":*
  $frac(d T, d t) = -k(T - T_("env"))$ — *Định luật Newton về làm nguội*.
]

#vd(
  [_(Định luật Newton về làm nguội)_ Một tách cà phê $90°C$ được để trong
    phòng $20°C$. Sau 5 phút, nhiệt độ còn $70°C$. Theo định luật Newton:
    $T(t) = T_("env") + (T_0 - T_("env"))e^(-k t)$.
    *(a)* Tìm hằng số $k$.
    *(b)* Sau bao nhiêu phút thì cà phê nguội về $45°C$?],
  loigiai: [
    $T(t) = 20 + 70 e^(-k t)$.

    *(a)* $T(5) = 70$: $20 + 70e^(-5k) = 70 => e^(-5k) = 50/70 = 5/7$.
    $k = frac(1, 5)ln frac(7, 5) approx  0{,}0673$ phút⁻¹.

    *(b)* $20 + 70e^(-k t) = 45 => e^(-k t) = 25/70 = 5/14$.
    $t = frac(ln(14/5), k) = 5 dot.c frac(ln(14/5), ln(7/5)) approx  5 times frac{1{,}030}{0{,}336} approx  15{,}3$ phút.
  ],
  theme-color: c-p5,
)

#vd(
  [_(Phân rã phóng xạ — Định tuổi C-14)_ Carbon-14 phân rã với chu kỳ bán
    rã $T_(1/2) = 5730$ năm. Trong một mẫu xương, C-14 còn lại $40\%$ so
    với cơ thể sống. Tính tuổi mẫu xương.],
  loigiai: [
    $A(t) = A_0 e^(-k t)$, $k = frac(ln 2, 5730)$.

    $0{,}4 A_0 = A_0 e^(-k t) => e^(-k t) = 0{,}4 => k t = ln frac{1}{0{,}4} = ln 2{,}5$.

    $t = frac{ln 2{,}5}{k} = frac{5730 ln 2{,}5}{ln 2} approx frac{5730 times 0{,}916}{0{,}693} approx  7575$ năm.
  ],
  theme-color: c-p5,
)

#nhanxet(theme-color: c-p5)[
  *Kết nối liên môn (Khảo cổ học & Vật lý hạt nhân):* Phương pháp định
  tuổi bằng C-14 (do Willard Libby phát triển, giải Nobel 1960) đã cách
  mạng hóa khảo cổ học. Từ bộ xương pharaoh Ai Cập đến cuộn sách biển Chết,
  tất cả được định tuổi bằng... *đạo hàm hàm mũ*!
]

#bt(
  [Một loài vi khuẩn nhân đôi sau mỗi 20 phút. Sau 2 giờ, quần thể gồm
    bao nhiêu vi khuẩn nếu ban đầu có 1000 con? Viết phương trình $N(t)$
    và tính tốc độ sinh trưởng tại $t = 1$ giờ.],
  lines: 6,
  theme-color: c-p5,
)



// ════════════════════════════════════════════════════════════
#bt-header(c-p5)
#resetexamstate()

#q-label([A. TRẮC NGHIỆM — Chọn một đáp án đúng], c-p5)

#tn([Từ dữ liệu thực nghiệm, hồi quy tuyến tính $y = a x + b$ tối thiểu hóa],
  ([Tổng $sum y_i$], [Tổng $sum (y_i - hat(y)_i)$], [Tổng $sum (y_i - hat(y)_i)^2$], [Tổng $sum |y_i - hat(y)_i|$]), correct: (3,), accent: c-p5)

#tn([Phương trình tăng trưởng $frac(d P, d t) = k P$ có nghiệm tổng quát],
  ([$P = k t + C$], [$P = C e^(k t)$], [$P = C ln(k t)$], [$P = C k^t$]), correct: (2,), accent: c-p5)

#tn([Mô hình chuẩn đoán bệnh lây lan: $frac(d I, d t) = beta S I - gamma I$. Dịch bùng phát khi],
  ([$frac(beta S, gamma) < 1$], [$frac(beta S, gamma) = 1$], [$frac(beta S, gamma) > 1$], [$beta < gamma$]), correct: (3,), accent: c-p5)

#q-label([B. ĐÚNG – S A I — Xét tính đúng/sai của mỗi phát biểu], c-p5)
#resetexamstate()

#ds([Bài toán tìm mô hình từ dữ liệu thực nghiệm.],
  (
    [Đồ thị thực nghiệm dạng đường thẳng → mô hình tuyến tính $y = a x + b$.],
    [Đồ thị dạng hàm mũ → có thể đặt $ln y = ln A + k t$ để tuyến tính hóa.],
    [Đạo hàm của mô hình mô tả tốc độ thay đổi của hiện tượng theo thời gian.],
    [Phương trình vi phân $frac(d y, d t) = k y$ chỉ có nghiệm khi $k > 0$.],
  ), accent: c-p5)

#q-label([C. TỰ LUẬN NGẮN — Ghi đáp số vào ô trống], c-p5)
#resetexamstate()

#tln([Vi khuẩn tăng gấp đôi sau $3$ giờ. Hằng số tăng trưởng $k = frac(ln 2, 3) approx$ (giữ $2$ chữ số thập phân) là.], [$0{,}23$], accent: c-p5)

#tln([Dân số tuân theo $P(t) = 500 e^(0{,}02 t)$ (nghìn người, $t$ = năm). Tốc độ tăng dân số $P'(t)$ tại $t = 0$ là (nghìn người/năm).], [$10$], accent: c-p5)
