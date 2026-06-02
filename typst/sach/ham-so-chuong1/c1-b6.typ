#import "_config.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════════════════
// HÌNH VẼ MINH HỌA TIẾP TUYẾN BẰNG CETZ
// ═══════════════════════════════════════════════════════════

#let fig-tieptuyen = cetz.canvas(length: 1.0cm, {
  import cetz.draw: *
  // Ox, Oy
  line((-2.2, 0), (3.8, 0), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  line((0, -1.8), (0, 3.5), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  content((3.6, -0.3), $x$)
  content((0.3, 3.2), $y$)
  content((-0.25, -0.25), $O$)

  // Vẽ đồ thị y = -0.1*x^3 + x
  let f(x) = { -0.1 * x * x * x + x }
  let pts = ()
  for i in range(50) {
    let x = -1.8 + i * 5.0 / 50
    pts.push((x, f(x)))
  }
  line(..pts, stroke: rgb("#0f4c81") + 1.2pt)

  // Tiếp điểm M(1; 0.9)
  circle((1, 0.9), radius: 0.05, fill: rgb("#b91c1c"))
  content((1.2, 1.2), $M(x_0; y_0)$)

  // Đường tiếp tuyến y = 0.7x + 0.2
  let tangent(x) = { 0.7 * x + 0.2 }
  let t_pts = ()
  for i in range(20) {
    let x = -1.2 + i * 4.4 / 20
    t_pts.push((x, tangent(x)))
  }
  line(..t_pts, stroke: rgb("#b91c1c") + 1.0pt)
  content((3.0, 2.5), $d$, fill: rgb("#b91c1c"))

  // Gióng tọa độ
  line((1, 0), (1, 0.9), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
  line((0, 0.9), (1, 0.9), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
  content((1.0, -0.35), $x_0$)
  content((-0.35, 0.9), $y_0$)
})

// ═══════════════════════════════════════════════════════════
// NỘI DUNG LÝ THUYẾT BÀI HỌC
// ═══════════════════════════════════════════════════════════

#lesson([Tiếp tuyến và các điểm đặc biệt của đồ thị hàm số], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Tiếp tuyến của đồ thị hàm số])

#block(breakable: false)[
  #dn(title: [Ý nghĩa hình học của đạo hàm & Phương trình tiếp tuyến])[
    Cho hàm số $y = f(x)$ xác định và có đạo hàm trên khoảng $(a; b)$. Đồ thị của hàm số là đường cong $(C)$.
    - Đạo hàm của hàm số tại điểm $x_0$ ký hiệu là $f'(x_0)$, chính là hệ số góc $k$ của tiếp tuyến $d$ của đồ thị $(C)$ tại điểm $M(x_0; f(x_0))$.
    - Phương trình tiếp tuyến của đồ thị $(C)$ tại tiếp điểm $M(x_0; y_0)$ (với $y_0 = f(x_0)$) có dạng:
      $ y - y_0 = f'(x_0)(x - x_0) <=> y = f'(x_0)(x - x_0) + y_0. $
  ]
]

#v(0.5em)
#align(center)[
  #fig-tieptuyen
  #v(0.2em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 1. Minh họa tiếp tuyến $d$ của đồ thị hàm số tại tiếp điểm $M$]
]

#block(breakable: false)[
  #phuongphap(title: [Các dạng toán viết phương trình tiếp tuyến thường gặp])[
    *Dạng 1: Viết phương trình tiếp tuyến khi biết tiếp điểm $M(x_0; y_0)$*
    - Nếu đề bài cho trước hoành độ tiếp điểm $x_0$: tính $y_0 = f(x_0)$ và $f'(x_0)$, rồi thế vào công thức tiếp tuyến.
    - Nếu đề bài cho trước tung độ tiếp điểm $y_0$: giải phương trình $f(x_0) = y_0$ để tìm $x_0$, tính $f'(x_0)$ và thế vào công thức.

    *Dạng 2: Viết phương trình tiếp tuyến khi biết hệ số góc $k$ của tiếp tuyến*
    - Bước 1: Gọi $x_0$ là hoành độ của tiếp điểm. Ta có hệ số góc tiếp tuyến là $f'(x_0) = k$.
    - Bước 2: Giải phương trình $f'(x_0) = k$ để tìm hoành độ tiếp điểm $x_0$ (phương trình có thể có nhiều nghiệm, tương ứng với nhiều tiếp tuyến).
    - Bước 3: Với mỗi $x_0$ tìm được, tính $y_0 = f(x_0)$ và viết phương trình tiếp tuyến tương ứng.

    *Chú ý mối quan hệ về hệ số góc:*
    - Tiếp tuyến song song với đường thẳng $y = a x + b => k = f'(x_0) = a$.
    - Tiếp tuyến vuông góc với đường thẳng $y = a x + b$ ($a != 0$) $=> k = f'(x_0) = -1/a$.

    *Dạng 3: Viết phương trình tiếp tuyến đi qua một điểm $A(x_A; y_A)$ cho trước*
    - Bước 1: Gọi tiếp tuyến cần tìm là $d$ có hệ số góc $k$ đi qua $A(x_A; y_A)$, ta có phương trình $d: y = k(x - x_A) + y_A$.
    - Bước 2: Đường thẳng $d$ tiếp xúc với đồ thị $(C): y = f(x)$ khi và chỉ khi hệ phương trình sau có nghiệm:
      $ cases(f(x) = k(x - x_A) + y_A, f'(x) = k) $
    - Bước 3: Thay $k = f'(x)$ vào phương trình thứ nhất ta được phương trình ẩn $x$ (hoành độ tiếp điểm):
      $ f(x) = f'(x)(x - x_A) + y_A $
      Giải phương trình này tìm $x_0$, từ đó suy ra hệ số góc $k$ và phương trình tiếp tuyến.
  ]
]

#pagebreak()

#muc([Các điểm đặc biệt trên đồ thị hàm số])

#block(breakable: false)[
  #dn(title: [Điểm cố định của họ đường cong])[
    Cho họ đường cong $(C_m): y = f(x, m)$ phụ thuộc vào tham số $m$. Điểm $M(x_0; y_0)$ gọi là điểm cố định của họ đường cong $(C_m)$ nếu tọa độ của nó thỏa mãn phương trình hàm số với mọi giá trị của $m$.
    - *Phương pháp tìm điểm cố định:*
      - Bước 1: Thay tọa độ $M(x_0; y_0)$ vào phương trình đồ thị ta được: $y_0 = f(x_0, m)$.
      - Bước 2: Biến đổi phương trình trên về dạng đa thức ẩn $m$, gom các số hạng chứa $m$:
        $ A(x_0, y_0) . m + B(x_0, y_0) = 0, "với mọi" m $
        (hoặc tương tự với bậc cao của $m$: $A m^2 + B m + C = 0$).
      - Bước 3: Giải hệ phương trình điều kiện để phương trình đúng với mọi $m$:
        $ cases(A(x_0, y_0) = 0, B(x_0, y_0) = 0) $
      - Bước 4: Nghiệm $(x_0; y_0)$ của hệ chính là tọa độ điểm cố định cần tìm.
  ]
]

#block(breakable: false)[
  #dn(title: [Tính chất đối xứng của đồ thị])[
    - *Tâm đối xứng:* Điểm $I(a; b)$ là tâm đối xứng của đồ thị $(C): y = f(x)$ nếu với mọi $x$ thỏa mãn $a - x$ và $a + x$ đều thuộc tập xác định thì $f(a - x) + f(a + x) = 2b$.
      - Đồ thị hàm bậc ba luôn nhận điểm uốn làm tâm đối xứng.
      - Đồ thị hàm phân thức 1/1 và 2/1 luôn nhận giao điểm của hai tiệm cận làm tâm đối xứng.
    - *Trục đối xứng:* Đường thẳng $x = a$ là trục đối xứng của đồ thị $(C): y = f(x)$ nếu $f(a - x) = f(a + x)$ với mọi $x$ thỏa mãn điều kiện xác định.
  ]
]

#muc([Tìm điểm có tọa độ nguyên trên đồ thị])

#block(breakable: false)[
  #phuongphap(title: [Phương pháp tìm điểm nguyên của đồ thị hàm phân thức])[
    Để tìm các điểm có cả hoành độ $x$ và tung độ $y$ đều là các số nguyên ($x, y in ZZ$), ta thực hiện các bước sau:

    *Bước 1:* Thực hiện chia đa thức ở tử số cho mẫu số để đưa hàm số về dạng:
    - Đối với hàm phân thức 1/1: $y = P + frac(Q, c x + d)$ với $P, Q$ là các số nguyên hoặc phân số.
    - Đối với hàm phân thức 2/1: $y = m x + n + frac(r, d x + e)$ với $m, n, r$ là các số nguyên hoặc phân số.

    *Bước 2:* Lập luận để tọa độ điểm là nguyên:
    - Để $x$ nguyên và $y$ nguyên, trước hết phần dư phân thức chứa biến ở mẫu phải nhận giá trị nguyên.
    - Ta thường đưa về dạng mẫu số phải là ước nguyên của tử số (ở phần dư).

    *Bước 3:* Lập bảng giá trị các ước số, tìm $x$, kiểm tra điều kiện xác định, rồi tính $y$ tương ứng để kết luận các điểm nguyên.
  ]
]

#pagebreak()

#muc([Dựng hàm số trong các bài toán thực tế])

#block(breakable: false)[
  #phuongphap(title: [Khung đọc đề và xây dựng hàm mục tiêu])[
    Với các đề có cụm *"mỗi lần tăng ... thì ..."* hoặc *"cứ thêm ... thì bớt ..."*, nên ưu tiên đặt $x$ là *số lần thay đổi* trước. Cách đặt này giúp các đại lượng đều hiện ra dưới dạng hàm bậc nhất theo $x$, nhìn bảng sẽ rõ hơn đặt trực tiếp giá hay số giờ.

    #table(
      columns: (1.2fr, 2.8fr),
      stroke: 0.4pt + gray,
      inset: 6pt,
      [*Bước*], [*Việc cần làm*],
      [1], [Chọn biến điều khiển: số lần tăng giá, số lần tăng ca, vận tốc, mật độ gieo trồng, mức quảng cáo, ...],
      [2],
      [Lập bảng từ dữ kiện gốc để viết từng đại lượng theo $x$: giá bán, lượng khách, số tổ, năng suất, chi phí, phế phẩm, ...],

      [3],
      [Viết hàm mục tiêu đúng bản chất bài toán: doanh thu, lợi nhuận, sản lượng thực, chi phí tối thiểu, thời gian ngắn nhất, ...],

      [4], [Tìm miền xác định thực tế từ điều kiện dương, điều kiện giới hạn, điều kiện nguyên nếu có],
      [5], [Dùng đạo hàm hoặc bất đẳng thức để tối ưu, rồi đổi ngược từ $x$ về đại lượng đề hỏi],
    )
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 1: Tăng giảm giá phòng, giá vé, giá dịch vụ])[
    *Cách đặt ẩn nên ưu tiên:* đặt $x$ là *số lần tăng giá*, mỗi lần tăng $m$ đồng. Đây là cách dựng hàm gọn nhất và rất phù hợp với bài khách sạn, căn hộ, vé xem phim, tour du lịch.

    #table(
      columns: (1.3fr, 2.5fr),
      stroke: 0.4pt + gray,
      inset: 6pt,
      [*Đại lượng*], [*Biểu thức theo $x$*],
      [Giá mới], [$p(x) = p_0 + m x$],
      [Lượng khách hoặc số phòng được thuê], [$n(x) = N_0 - k x$],
      [Doanh thu], [$R(x) = p(x) dot n(x)$],
      [Lợi nhuận], [$L(x) = R(x) - C(x)$],
    )

    - Nếu chi phí chỉ tính trên số phòng đang thuê thì thường có dạng $C(x) = c_1 (N_0 - k x)$.
    - Nếu vẫn có chi phí bảo trì cho phòng trống, thêm thành phần $c_0 k x$ vào hàm chi phí.
    - Sau khi tìm được $x^*$, phải đổi lại mức giá thực tế: $p^* = p_0 + m x^*$.

    *Nhận xét:* Đặt $x$ là số lần tăng giá thường cho tam thức bậc hai đẹp hơn nhiều so với đặt trực tiếp giá niêm yết ngay từ đầu.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 2: Năng suất - nhà máy - tối ưu sản lượng thực])[
    Với dạng nhà máy, xưởng may, trang trại, tổ hợp sản xuất, nên đặt $x$ là *số lần tăng ca* hoặc *số lần điều chỉnh đầu vào*. Khi đó phần dựng hàm rất rõ:

    #table(
      columns: (1.35fr, 2.45fr),
      stroke: 0.4pt + gray,
      inset: 6pt,
      [*Đại lượng*], [*Biểu thức theo $x$*],
      [Số giờ làm hoặc mức đầu vào], [$t(x) = t_0 + h x$],
      [Số tổ sản xuất], [$T(x) = T_0 - a x$],
      [Năng suất mỗi tổ], [$N(x) = N_0 - b x$],
      [Sản lượng thô], [$Q_0(x) = t(x) dot T(x) dot N(x)$],
      [Phế phẩm hoặc tổn hao], [$P(x)$],
      [Sản lượng thực], [$Q(x) = Q_0(x) - P(x)$],
    )

    - Miền xác định luôn phải lấy từ thực tế: $x >= 0$, $T(x) > 0$, $N(x) > 0$.
    - Nếu đề hỏi *số giờ tối ưu* thì đổi lại sau cùng: $t^* = t_0 + h x^*$.
    - Dạng này hay ở chỗ học sinh thấy rõ ba lớp tác động cùng lúc: tăng giờ làm chưa chắc tốt vì có thể làm giảm nhân lực, giảm năng suất và tăng phế phẩm.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 3: Chi phí ẩn liên quan vận tốc])[
    Đây là dạng bài rất thực tế trong giao thông, logistics, ca nô du lịch, xe tải, máy bay. Chọn trực tiếp $v$ là vận tốc vì đại lượng thay đổi liên tục.

    - Chi phí nhiên liệu cho cả chuyến thường có dạng $C_1(v) = a v^2$.
    - Chi phí thời gian có dạng $C_2(v) = frac(b, v)$.
    - Tổng chi phí: $C(v) = a v^2 + frac(b, v)$ với $v > 0$.

    *Cách dựng hệ số nhanh:*
    - Nếu đề cho chi phí nhiên liệu *cho $1$ km* tại vận tốc $v_0$ là $M$ thì $a = S frac(M, v_0^2)$.
    - Nếu đề cho chi phí nhiên liệu *cho $1$ giờ* tại vận tốc $v_0$ là $M$ thì phải đổi về theo km trước, suy ra $a = S frac(M, v_0^3)$.
    - Nếu đề cho chi phí nhiên liệu *cho cả chuyến* tại vận tốc $v_0$ là $M$ thì $a = frac(M, v_0^2)$.
    - Nếu chi phí thời gian là $k$ đồng/giờ thì $b = S k$.

    Sau khi dựng xong hàm, cực tiểu đạt tại $v^* = root(3, frac(b, 2a))$. Khi đó $C_2(v^*) = 2 C_1(v^*)$, tức là chi phí thời gian gấp đôi chi phí nhiên liệu.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Chuyên đề 4: Một số mô hình thực tế cùng họ cần bao quát])[
    *1. Quảng cáo - bán hàng - lợi nhuận:*
    - Đặt $x$ là mức chi quảng cáo hoặc số đợt khuyến mãi.
    - Hàm mục tiêu thường là $L(x) = R(x) - C(x)$, trong đó $R(x)$ đi qua số lượng bán được, còn $C(x)$ gồm chi phí quảng cáo và chi phí vận hành.

    *2. Nông nghiệp - mật độ gieo trồng - chi phí phụ trội:*
    - Đặt $x$ là số lần tăng hạt giống, phân bón hoặc lượng nước tưới.
    - Năng suất có thể tăng chậm dần hoặc giảm dần, còn chi phí sâu bệnh và hao hụt thường tăng nhanh theo $x$.
    - Hàm ròng thường có dạng $F(x) = p dot Y(x) - C(x)$ hoặc $F(x) = Y(x) - C(x)$ nếu cùng đơn vị.

    *3. Đường ống, cáp, lộ trình qua hai môi trường:*
    - Chọn $x$ là vị trí điểm nối trung gian.
    - Viết tổng thời gian hoặc tổng chi phí bằng cách cộng hai đoạn: đoạn thứ nhất trong môi trường 1, đoạn thứ hai trong môi trường 2.

    *4. Dược học, sinh học, dịch bệnh:*
    - Hàm số thường cho sẵn theo thời gian $t$; việc chính là đọc ý nghĩa của cực đại, điểm uốn, tiệm cận, hoặc diện tích dưới đồ thị.
    - Phần dựng hàm ở đây nằm ở chỗ xác định đúng đại lượng cần tối ưu hay cần diễn giải: nồng độ, số ca mới, lượng thuốc còn lại, quy mô quần thể.
  ]
]

#block(breakable: false)[
  #ghinho(title: [Bảng quy đổi nhanh khi xây dựng hàm])[
    #table(
      columns: (1.55fr, 2.45fr),
      stroke: 0.4pt + gray,
      inset: 6pt,
      [*Bối cảnh*], [*Hàm mục tiêu thường gặp*],
      [Giá phòng, giá bán], [$R = ("giá") dot ("lượng bán")$, $L = R - C$],
      [Nhà máy, tăng ca], [$Q = ("giờ") dot ("số tổ") dot ("năng suất") - ("phế phẩm")$],
      [Vận tốc và chi phí ẩn], [$C = a v^2 + frac(b, v)$],
      [Nông nghiệp], [$F = ("giá bán") dot ("năng suất") - ("chi phí phụ trội")$],
      [Di chuyển qua hai môi trường], [$T = frac(d_1(x), v_1) + frac(d_2(x), v_2)$],
    )

    *Điểm chung cần nhớ:* trước khi đạo hàm, phải trả lời được ba câu hỏi: *biến điều khiển là gì*, *đại lượng nào thay đổi theo biến đó*, và *hàm mục tiêu thực sự là doanh thu, lợi nhuận, sản lượng thực hay chi phí*. Nếu ba câu này rõ, phần đạo hàm phía sau gần như chỉ còn là kỹ thuật.
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c1-b6-de1.typ"
#include "c1-b6-de2.typ"
#include "c1-b6-de3.typ"
#include "c1-b6-de4.typ"
