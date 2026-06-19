#import "_config.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════════════════
// HÌNH VẼ MINH HỌA CETZ - BÀI TOÁN TỐI ƯU VÀ TIỆM CẬN
// ═══════════════════════════════════════════════════════════

// Hình 1: Đồ thị mô hình nồng độ thuốc (tiệm cận ngang)
#let fig-nongdo = cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Ox (Thời gian t), Oy (Nồng độ C(t))
  line((0, 0), (6, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, 0), (0, 3.5), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((5.8, -0.3), [$t$ (giờ)])
  content((-0.6, 3.2), $C(t)$)
  content((-0.2, -0.2), $O$)

  // Đường tiệm cận ngang y = 2
  line((0, 2), (6, 2), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  content((-0.2, 2), $K$)

  // Đồ thị C(t) = 2 - 2*exp(-0.8*t)
  let f(t) = { 2 - 2 * calc.exp(-0.8 * t) }
  let pts = ()
  for i in range(50) {
    let t = i * 5.8 / 50
    pts.push((t, f(t)))
  }
  line(..pts, stroke: rgb("#b91c1c") + 1.2pt)

  // Điểm đánh dấu trên đường cong
  circle((2, f(2)), radius: 0.05, fill: rgb("#0f4c81"))
  content((2.5, 1.2), $C(t)$, fill: rgb("#b91c1c"))
  content((4.0, 2.3), text(size: 8pt)[Trạng thái bão hòa])
})

// ═══════════════════════════════════════════════════════════
// NỘI DUNG LÝ THUYẾT BÀI HỌC
// ═══════════════════════════════════════════════════════════

#lesson([Ứng dụng thực tiễn của hàm số và đồ thị], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Các bước giải bài toán bằng mô hình hóa Toán học])

#block(breakable: false)[
  #dn(title: [Quy trình giải toán thực tế])[
    Để giải một bài toán thực tiễn bằng công cụ đạo hàm và đồ thị hàm số, ta thường thực hiện qua 4 bước cơ bản sau:
    - *Bước 1: Lựa chọn ẩn số.* Gọi một hoặc một vài đại lượng cần thiết là ẩn số (ví dụ: $x, t$). Đặt điều kiện cho ẩn số dựa vào thực tế bài toán.
    - *Bước 2: Thiết lập hàm số (Mô hình hóa).* Biểu diễn đại lượng cần tìm cực trị, cần tính tốc độ thay đổi hoặc cần tìm giới hạn dưới dạng một hàm số theo ẩn đã chọn: $y = f(x)$ hoặc $C = f(t)$.
    - *Bước 3: Khảo sát hàm số.* Sử dụng công cụ đạo hàm để tìm khoảng đơn điệu, cực trị, giá trị lớn nhất nhỏ nhất, hoặc tìm các đường tiệm cận của hàm số $f(x)$ trên miền xác định của nó.
    - *Bước 4: Kết luận.* Đối chiếu các kết quả tìm được với điều kiện thực tế và đưa ra câu trả lời cho bài toán ban đầu.
  ]
]

#v(0.5em)
#align(center)[
  #fig-nongdo
  #v(0.2em)
  #text(
    size: 10pt,
    style: "italic",
    fill: gray,
  )[Hình 1. Minh họa hàm nồng độ thuốc $C(t)$ theo thời gian đạt tiệm cận ngang ở ngưỡng $K$]
]

#muc([Các dạng toán thực tế tối ưu hóa trọng tâm])

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 1: Tối ưu hóa Hình học 2D - Hình trong hình (Inscribed Shapes)])[
    Bài toán tìm thiết kế của một hình phẳng $H_1$ (chữ nhật, tam giác) nội tiếp trong một hình $H_2$ cho trước (tam giác, đường tròn, elip, parabol) sao cho diện tích của $H_1$ đạt giá trị lớn nhất.

    *1. Hình chữ nhật nội tiếp trong tam giác:*
    - Cho tam giác đáy $a$, chiều cao tương ứng $h$. Một hình chữ nhật có hai đỉnh nằm trên đáy, hai đỉnh còn lại nằm trên hai cạnh bên.
    - Gọi chiều cao của hình chữ nhật là $x$ ($0 < x < h$). Cạnh còn lại của hình chữ nhật là $y = a(1 - frac(x, h))$.
    - Hàm diện tích: $S(x) = x dot y = a x (1 - frac(x, h)) = a(x - frac(x^2, h))$.
    - Cực đại tại $x = frac(h, 2)$ với $S_"max" = frac(1, 4) a h = frac(1, 2) S_"tam giác"$.

    *2. Hình chữ nhật nội tiếp nửa hình tròn:*
    - Nửa hình tròn bán kính $R$. Hình chữ nhật nội tiếp có một cạnh nằm trên đường kính.
    - Gọi nửa chiều dài cạnh trên đường kính là $x$ ($0 < x < R$), chiều cao là $y = sqrt(R^2 - x^2)$.
    - Diện tích: $S(x) = 2x y = 2x sqrt(R^2 - x^2) = sqrt(4x^2 (R^2 - x^2))$.
    - Sử dụng BĐT Cauchy (AM-GM): $2x dot sqrt(R^2 - x^2) <= x^2 + (R^2 - x^2) = R^2$.
    - Đạt cực đại tại $x = frac(R, sqrt(2))$ với $S_"max" = R^2$.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 2: Bài toán cắt dây uốn hình (Wire Cutting & Shape Forming)])[
    Đoạn dây dài $L$ được cắt thành hai phần: phần thứ nhất uốn thành hình $H_1$ (hình vuông hoặc tam giác đều), phần còn lại uốn thành hình $H_2$ (hình tròn). Tìm vị trí cắt để tổng diện tích hai hình là nhỏ nhất hoặc lớn nhất.

    *Bài toán uốn thành Hình vuông (cạnh $a$) và Hình tròn (bán kính $R$):*
    - Gọi phần dây uốn thành hình vuông là $x$ ($0 < x < L$), phần uốn thành hình tròn là $L - x$.
    - Cạnh hình vuông: $a = frac(x, 4) => S_"vuông" = frac(x^2, 16)$.
    - Chu vi tròn: $2 pi R = L - x => R = frac(L - x, 2 pi) => S_"tròn" = pi R^2 = frac((L - x)^2, 4 pi)$.
    - Hàm tổng diện tích: $S(x) = frac(x^2, 16) + frac((L - x)^2, 4 pi)$.
    - Đạo hàm: $S'(x) = frac(x, 8) - frac(L - x, 2 pi) = 0 <=> x(pi + 4) = 4L <=> x = frac(4L, pi + 4)$.
    - *Nhận xét:* Tổng diện tích nhỏ nhất khi đường kính hình tròn bằng cạnh hình vuông ($2R = a$).
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 3: Bài toán cắt giấy gấp hình (Cardboard Cutting & Paper Folding)])[
    *1. Cắt 4 góc hộp từ tấm bìa chữ nhật $a times b$:*
    - Cắt đi 4 hình vuông góc cạnh $x$ ở 4 góc và gập thành hộp không nắp.
    - Thể tích: $V(x) = x(a - 2x)(b - 2x)$ với $0 < x < frac(min(a, b), 2)$.
    - Giải phương trình đạo hàm $V'(x) = 12x^2 - 4(a+b)x + a b = 0$ để tìm điểm cực đại.

    *2. Gấp góc tờ giấy hình chữ nhật:*
    - Gấp góc tờ giấy sao cho đỉnh góc trùng với một điểm trên cạnh đối diện. Tìm cách gấp để nếp gấp ngắn nhất (tối thiểu hóa độ dài đường nếp gấp).
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 4: Di chuyển qua nhiều môi trường (Snell's Law / Path Optimization)])[
    Bài toán tìm đường đi tối ưu (thời gian ngắn nhất hoặc chi phí thấp nhất) khi di chuyển qua các môi trường có vận tốc hoặc đơn giá khác nhau.

    *Mô hình tổng quát:*
    - Đi từ $A(0, a)$ đến $B(d, -b)$ qua điểm $M(x, 0)$ trên trục phân cách. Vận tốc ở môi trường 1 là $v_1$, ở môi trường 2 là $v_2$.
    - Hàm thời gian di chuyển: $T(x) = frac(sqrt(x^2 + a^2), v_1) + frac(sqrt((d-x)^2 + b^2), v_2)$.
    - Đạo hàm: $T'(x) = frac(x, v_1 sqrt(x^2 + a^2)) - frac(d - x, v_2 sqrt((d-x)^2 + b^2)) = 0 <=> frac(sin theta_1, v_1) = frac(sin theta_2, v_2)$ (Định luật khúc xạ ánh sáng Snell).
    - Dạng toán này cũng áp dụng trực tiếp cho bài toán lắp đặt đường ống dẫn dầu/nước từ đảo vào đất liền với đơn giá thi công dưới biển khác trên đất liền.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 5: Khoảng cách giữa hai đồ thị và chuyển động (Distance & Motion Optimization)])[
    *1. Khoảng cách ngắn nhất giữa hai chuyển động:*
    - Hai vật chuyển động trên hai quỹ đạo cắt nhau vuông góc tại $O$. Tại thời điểm ban đầu ($t=0$), vật A cách $O$ khoảng $d_1$ và đi về $O$ với vận tốc $v_1$. Vật B cách $O$ khoảng $d_2$ và đi ra xa $O$ với vận tốc $v_2$.
    - Khoảng cách giữa hai vật tại thời điểm $t$: $d(t) = sqrt((d_1 - v_1 t)^2 + (d_2 + v_2 t)^2)$.
    - Tìm cực trị của tam thức bậc hai dưới dấu căn.

    *2. Khoảng cách giữa hai đồ thị:*
    - Cho điểm $M$ chạy trên đường cong $(C): y = f(x)$ và một đường thẳng $d$ cho trước. Tìm vị trí $M$ để khoảng cách từ $M$ đến $d$ ngắn nhất.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 6: Toán tối ưu kinh tế (Economics & Operating Costs)])[
    *1. Tối ưu giá dịch vụ / giá phòng:*
    - Một chung cư có $N_0$ căn hộ. Nếu giá thuê là $P_0$ triệu đồng thì tất cả các căn đều được thuê. Cứ mỗi lần tăng giá thêm $Delta P$ triệu đồng thì có $k$ căn bị bỏ trống.
    - Gọi $x$ là số lần tăng giá ($x >= 0$). Giá thuê mới: $P = P_0 + x dot Delta P$. Số căn được thuê: $N = N_0 - k dot x$.
    - Hàm doanh thu: $R(x) = (P_0 + x dot Delta P)(N_0 - k dot x)$. Tìm $x$ để $R(x)$ đạt cực đại.

    *2. Tối ưu chi phí vận chuyển xe tải:*
    - Một chiếc xe tải chạy quãng đường $S$ (km) với vận tốc $v$ (km/h) ($v > 0$). Chi phí nhiên liệu mỗi giờ là $a dot v^2 + b$ (đồng). Chi phí trả cho tài xế cố định là $c$ (đồng/giờ).
    - Tổng thời gian di chuyển: $t = frac(S, v)$ (giờ).
    - Tổng chi phí chuyến đi: $T(v) = (a dot v^2 + b + c) dot frac(S, v) = S(a dot v + frac(b + c, v))$.
    - Theo BĐT Cauchy: $a dot v + frac(b + c, v) >= 2 sqrt(a(b + c))$. Cực tiểu đạt được khi $a v = frac(b + c, v) <=> v = sqrt(frac(b + c, a))$.
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 7: Bài toán Khai thác Bền vững Tài nguyên Tái tạo (Sản lượng bền vững tối đa)])[
    Quần thể cá (hoặc rừng, năng lượng tự nhiên...) tăng trưởng theo *mô hình logistic*:
    $
      N'(t) = r N(t) (1 - frac(N(t), K))
    $
    trong đó $N(t)$ là quy mô (sinh khối) của quần thể tại thời điểm $t$, $N'(t)$ là tốc độ tăng trưởng tự nhiên, $r > 0$ là hệ số tăng trưởng tự nhiên và $K$ là *sức chứa tối đa* của môi trường.

    Nếu khai thác với sản lượng cố định là $H$ (tấn/năm), tốc độ thay đổi sinh khối của quần thể trở thành:
    $
      N'(t) = r N(t) (1 - frac(N(t), K)) - H
    $

    *Mức khai thác bền vững tối đa (Sản lượng bền vững tối đa):*
    - Khi quần thể ở trạng thái cân bằng và phát triển ổn định ($N'(t) = 0$), ta có phương trình: $r N (1 - N/K) = H <=> r N - frac(r N^2, K) = H$.
    - Tốc độ tăng trưởng tự nhiên $g(N) = r N(1-N/K)$ đạt giá trị lớn nhất khi $g'(N) = r(1 - frac(2N, K)) = 0 <=> N = K/2$ (tức là duy trì quần thể ở mức một nửa sức chứa tối đa của môi trường).
    - Sản lượng khai thác bền vững tối đa mỗi năm tương ứng là: $H_"max" = g(K/2) = r dot.c frac(K, 2) dot.c (1 - 1/2) = frac(r K, 4)$.
    - *Cảnh báo:* Nếu lượng khai thác hằng năm vượt quá mức tối đa ($H > H_"max" = frac(r K, 4)$), tốc độ thay đổi sinh khối luôn âm ($N'(t) < 0$), quần thể sẽ liên tục suy giảm về $0$ và sụp đổ hoàn toàn.

    *Ví dụ:* Đàn cá với $r = 0,4$ và $K = 2.000$ tấn. Sản lượng khai thác bền vững tối đa hằng năm là $H_"max" = frac(0.4 times 2000, 4) = 200$ tấn/năm. Nếu khai thác trên $200$ tấn/năm, đàn cá sẽ bị tuyệt chủng.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 8: Mô hình Dịch bệnh và Điểm Uốn Lây nhiễm (Epidemic Peak & Inflection)])[
    Trong giai đoạn bùng phát ban đầu (trước khi đạt đỉnh), số ca bệnh mới hằng ngày có thể mô hình hóa bởi:
    $
      I(t) = C dot t dot e^{-k t}
    $
    trong đó $C > 0$ là hệ số cường độ, $k > 0$ là tốc độ suy giảm (phụ thuộc vào biện pháp phòng dịch).

    *Phân tích bằng đạo hàm:*
    - $I'(t) = C e^{-k t}(1 - k t) = 0 => t^* = 1/k$ — *đỉnh dịch*.
    - $I''(t) = C e^{-k t}(k^2 t - 2k) = 0 => t_"uốn" = 2/k$ — *điểm uốn*: sau thời điểm này, tốc độ giảm số ca bắt đầu chậm lại.
    - *Gánh nặng bệnh (Disease Burden):* $display(integral_0^{+oo} I(t) dif t = frac(C, k^2))$.

    *Ý nghĩa điểm uốn:* Tại $t = 2/k$ (gấp đôi thời điểm đỉnh), đường cong $I(t)$ đổi từ *lõm* sang *lồi*. Trước điểm uốn: số ca giảm ngày càng nhanh. Sau điểm uốn: số ca vẫn giảm nhưng *chậm lại*.

    *Quy tắc nhận biết:*

    #table(
      columns: (auto, 1fr, 1fr, 1fr),
      align: center,
      stroke: 0.5pt + gray,
      inset: 8pt,
      [*Giai đoạn*], [*$I'(t)$*], [*$I''(t)$*], [*Nhận xét*],
      [$0 < t < t^*$], [$> 0$], [−], [Số ca đang tăng],
      [$t = t^*$], [$= 0$], [−], [Đỉnh dịch],
      [$t^* < t < t_"uốn"$], [$< 0$], [$< 0$], [Giảm nhanh dần],
      [$t = t_"uốn"$], [$< 0$], [$= 0$], [Điểm uốn],
      [$t > t_"uốn"$], [$< 0$], [$> 0$], [Giảm chậm dần],
    )
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c1-b7-de1.typ"
#include "c1-b7-de2.typ"
#include "c1-b7-de3.typ"
