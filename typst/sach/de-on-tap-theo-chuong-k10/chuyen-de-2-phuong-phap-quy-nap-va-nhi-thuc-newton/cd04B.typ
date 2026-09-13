#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0f766e") // Teal cho Đề 4B

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON",
  exam-title: "BÀI 1: PHƯƠNG PHÁP QUY NẠP TOÁN HỌC (ĐỀ B - BẤT ĐẲNG THỨC & LŨY THỪA)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "311",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Bất đẳng thức Bernoulli phát biểu rằng: Với mọi số thực $h > -1$ ($h != 0$) và mọi số tự nhiên $n >= 2$, ta luôn có
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Đồ thị tiếp tuyến Bernoulli
    line((-1.5, 0), (2.5, 0), stroke: 1pt, mark: (end: "stealth"))
    content((2.4, -0.3), text(size: 7.5pt)[$h$])
    line((0, -0.5), (0, 2.5), stroke: 1pt, mark: (end: "stealth"))
    content((-0.3, 2.4), text(size: 7.5pt)[$y$])
    // Đường cong (1+h)^n
    line((-0.8, 0.2), (-0.4, 0.4), (0, 1), (0.5, 1.8), (0.8, 2.5), stroke: 1.5pt + rgb("0f766e"))
    content((1.2, 2.3), text(size: 7.5pt, fill: rgb("0f766e"))[$(1+h)^n$])
    // Tiếp tuyến 1 + nh
    line((-1, -0.2), (1, 2.2), stroke: (dash: "dashed", paint: rgb("dc2626")))
    content((1.5, 1.2), text(size: 7pt, fill: rgb("dc2626"))[$1+n h$])
  })
]
Bất đẳng thức đúng là],
    (
        True([$(1 + h)^n >= 1 + n h$]),
        [$(1 + h)^n <= 1 + n h$],
        [$(1 + h)^n > 1 + n^2 h$],
        [$(1 + h)^n < 1 + h^n$]
    ),
    loigiai: [
        #step([Bất đẳng thức Bernoulli kinh điển])
        Theo định lý Bernoulli: Với $h > -1$, ta luôn có $(1 + h)^n >= 1 + n h$ với mọi $n in NN^*$.
        Dấu bằng xảy ra khi $n = 1$ hoặc $h = 0$.
    ]
)

// TN 2
#tn([So sánh giữa hàm mũ $2^n$ và số tự nhiên $n$, với mọi số nguyên dương $n in NN^*$, bất đẳng thức nào sau đây luôn đúng?],
    (
        True([$2^n > n$]),
        [$2^n < n$],
        [$2^n = n$],
        [$2^n <= n$]
    ),
    loigiai: [
        #step([Chứng minh bằng quy nạp])
        - Với $n = 1$: $2^1 = 2 > 1$ (đúng).
        - Giả sử đúng với $n = k >= 1$: $2^k > k$.
        - Với $n = k + 1$: $2^(k+1) = 2 times 2^k > 2k = k + k >= k + 1$ (vì $k >= 1$).
        Vậy $2^n > n$ với mọi $n in NN^*$.
    ]
)

// TN 3
#tn([Bất đẳng thức $2^n > 2n + 1$ đúng với mọi số tự nhiên $n >= n_0$. Giá trị nhỏ nhất của số tự nhiên $n_0$ là],
    (
        True([$n_0 = 3$]),
        [$n_0 = 1$],
        [$n_0 = 2$],
        [$n_0 = 4$]
    ),
    loigiai: [
        #step([Kiểm tra các giá trị nhỏ])
        - $n = 1: 2^1 = 2 < 2(1) + 1 = 3$ (sai).
        - $n = 2: 2^2 = 4 < 2(2) + 1 = 5$ (sai).
        - $n = 3: 2^3 = 8 > 2(3) + 1 = 7$ (đúng).
        - Chứng minh quy nạp cho $n >= 3$: Giả sử $2^k > 2k + 1$, thì $2^(k+1) = 2 times 2^k > 4k + 2 = (2k + 3) + (2k - 1) > 2(k + 1) + 1$ (do $2k - 1 > 0$ khi $k >= 3$).
        Vậy $n_0 = 3$.
    ]
)

// TN 4
#tn([So sánh giai thừa $n!$ và hàm mũ $2^n$. Bất đẳng thức $n! > 2^n$ đúng với mọi số tự nhiên $n >= n_0$. Giá trị nhỏ nhất của $n_0$ là],
    (
        True([$n_0 = 4$]),
        [$n_0 = 2$],
        [$n_0 = 3$],
        [$n_0 = 5$]
    ),
    loigiai: [
        #step([Thử các giá trị đầu tiên])
        - $n = 1: 1! = 1 < 2^1 = 2$.
        - $n = 2: 2! = 2 < 2^2 = 4$.
        - $n = 3: 3! = 6 < 2^3 = 8$.
        - $n = 4: 4! = 24 > 2^4 = 16$ (đúng).
        Với $n >= 4$: nếu $k! > 2^k$ thì $(k+1)! = (k+1) k! > 2 times 2^k = 2^(k+1)$ (vì $k+1 > 2$).
        Vậy $n_0 = 4$.
    ]
)

// TN 5
#tn([Với mọi số nguyên dương $n >= 2$, tổng nghịch đảo các căn bậc hai thỏa mãn bất đẳng thức:
$ 1 / sqrt(1) + 1 / sqrt(2) + 1 / sqrt(3) + ... + 1 / sqrt(n) > A $
Giá trị thích hợp của $A$ theo $n$ là],
    (
        True([$A = sqrt(n)$]),
        [$A = n$],
        [$A = 2n$],
        [$A = n^2$]
    ),
    loigiai: [
        #step([Đánh giá từng số hạng])
        Với mọi $k = 1, 2, ..., n$, ta có $k <= n => sqrt(k) <= sqrt(n) => 1/sqrt(k) >= 1/sqrt(n)$.
        Do đó:
        $ sum_(k=1)^n 1 / sqrt(k) > n times 1 / sqrt(n) = sqrt(n) quad ("với " n >= 2) $
    ]
)

// TN 6
#tn([Bất đẳng thức $3^n > n^3$ bắt đầu đúng với mọi số tự nhiên $n$ thỏa mãn điều kiện nào sau đây?],
    (
        True([$n >= 4$]),
        [$n >= 2$],
        [$n >= 3$],
        [$n >= 5$]
    ),
    loigiai: [
        #step([Kiểm tra các giá trị n nhỏ])
        - $n = 1: 3^1 = 3 > 1^3 = 1$ (đúng).
        - $n = 2: 3^2 = 9 > 2^3 = 8$ (đúng).
        - $n = 3: 3^3 = 27 = 3^3 = 27$ (không thỏa mãn dấu $>$).
        - $n = 4: 3^4 = 81 > 4^3 = 64$ (đúng).
        - Với $n >= 4$, quy nạp chứng minh $3^n > n^3$ luôn đúng.
        Do đó mệnh đề bắt đầu đúng liên tục từ $n >= 4$.
    ]
)

// TN 7
#tn([Tổng điều hòa thứ $2^n$ được định nghĩa là $H_(2^n) = 1 + 1/2 + 1/3 + ... + 1/(2^n)$.
Bằng cách gom các số hạng thành các nhóm có độ dài là lũy thừa của $2$:
- Nhóm 1: $1/2$
- Nhóm 2: $1/3 + 1/4 > 1/4 + 1/4 = 1/2$
- Nhóm 3: $1/5 + 1/6 + 1/7 + 1/8 > 4 times 1/8 = 1/2$
Bất đẳng thức nào sau đây đúng với mọi $n in NN^*$?],
    (
        True([$H_(2^n) >= 1 + n/2$]),
        [$H_(2^n) >= 1 + n$],
        [$H_(2^n) <= 1 + n/2$],
        [$H_(2^n) >= 2^n$]
    ),
    loigiai: [
        #step([Phương pháp nhóm số hạng của Oresme])
        Tổng $H_(2^n)$ gồm $1$ cộng với $n$ nhóm, mỗi nhóm đều có tổng lớn hơn hoặc bằng $1/2$:
        $ H_(2^n) >= 1 + n times 1/2 = 1 + n/2 $
        Hệ quả là chuỗi điều hòa phân kỳ ra vô cực khi $n -> oo$.
    ]
)

// TN 8
#tn([Cho $x > 0$ và số tự nhiên $n >= 2$. Áp dụng bất đẳng thức Cauchy (AM-GM) cho $n$ số dương gồm $(n - 1)$ số $1$ và một số $1 + n x$, ta suy ra bất đẳng thức nào?],
    (
        True([$(1 + x)^n > 1 + n x$]),
        [$(1 + x)^n < 1 + n x$],
        [$(1 + x)^n = 1 + n x$],
        [$(1 + x)^n > 1 + x^n$]
    ),
    loigiai: [
        #step([Áp dụng BĐT AM-GM])
        Trung bình cộng của $n$ số: $(1 + 1 + ... + 1 + (1 + n x)) / n = (n - 1 + 1 + n x) / n = (n + n x) / n = 1 + x$.
        Theo BĐT AM-GM:
        $ (1 + x)^n > 1 times 1 times ... times 1 times (1 + n x) = 1 + n x $
    ]
)

// TN 9
#tn([Dãy số $x_n = (1 + 1/n)^n$ là dãy số tăng và bị chặn trên bởi một hằng số $M$. Trong toán học giải tích, giới hạn của dãy số này khi $n -> oo$ tiến tới số vô tỉ nào?],
    (
        True([Số Euler $e approx 2.71828$]),
        [Số Pi $pi approx 3.14159$]),
        [Số vàng $phi approx 1.61803$],
        [Căn bậc hai của $2$ ($sqrt(2) approx 1.41421$)]
    ),
    loigiai: [
        #step([Định nghĩa số e])
        $ lim_(n -> oo) (1 + 1/n)^n = e approx 2.71828 $
        Dãy này luôn tăng và thỏa mãn $(1 + 1/n)^n < 3$ với mọi $n >= 1$.
    ]
)

// TN 10
#tn([Khi chứng minh bất đẳng thức $P(n): "A(n) > B(n)"$ bằng quy nạp, ở bước quy nạp ta đã có giả thiết $A(k) > B(k)$. Để chứng minh $A(k+1) > B(k+1)$, bước chuyển thông dụng và hiệu quả nhất là],
    (
        True([Chứng minh $A(k+1) - B(k+1) > 0$ bằng cách biểu diễn qua $A(k)$ và $B(k)$]),
        [Quy đồng mẫu số tất cả các biểu thức],
        [Thay một giá trị số bất kỳ vào],
        [Lấy đạo hàm hai vế theo $k$]
    ),
    loigiai: [
        #step([Kỹ thuật bước quy nạp])
        Ta liên hệ $A(k+1)$ với $A(k)$ và sử dụng giả thiết quy nạp $A(k) > B(k)$ để so sánh với $B(k+1)$.
    ]
)

// TN 11
#tn([Bất đẳng thức nào sau đây là khẳng định SAI với mọi số tự nhiên $n >= 1$?],
    (
        True([$2^n < n$]),
        [$3^n > 2^n$],
        [$n! >= 1$],
        [$2^n >= 2$]
    ),
    loigiai: [
        #step([Kiểm tra từng khẳng định])
        Ta luôn có $2^n > n$ với mọi $n >= 1$. Do đó mệnh đề $2^n < n$ là SAI hoàn toàn.
    ]
)

// TN 12
#tn([So sánh giữa $n!$ và $((n + 1)/2)^n$ với $n >= 2$. Bất đẳng thức nào sau đây luôn đúng?],
    (
        True([$n! < ((n + 1) / 2)^n$]),
        [$n! > ((n + 1) / 2)^n$],
        [$n! = ((n + 1) / 2)^n$],
        [$n! >= (n + 1)^n$]
    ),
    loigiai: [
        #step([Áp dụng BĐT AM-GM cho n số 1, 2, ..., n])
        Trung bình cộng: $(1 + 2 + ... + n) / n = (n(n+1)/2) / n = (n+1)/2$.
        Trung bình nhân: $root(n, 1 times 2 times ... times n) = root(n, n!)$.
        Vì các số $1, 2, ..., n$ không bằng nhau khi $n >= 2$:
        $ root(n, n!) < (n + 1) / 2 <=> n! < ((n + 1) / 2)^n $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Xét bất đẳng thức chứa biến $n$:
$ 2^n > n^2 $
với $n$ là số tự nhiên.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.5), (2.5, 0.5), fill: rgb("f0fdfa"), stroke: 1.2pt + rgb("0f766e"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("0f766e"))[So sánh hàm mũ $2^n$ và hàm đa thức $n^2$])
  })
]],
  (
    True([Với $n = 1$, ta có $2^1 = 2 > 1^2 = 1$ nên bất đẳng thức đúng.]),
    True([Với $n = 2, 3, 4$, bất đẳng thức không thỏa mãn dấu lớn hơn thực sự ($2^2 = 4 = 2^2, 2^3 = 8 < 3^2 = 9, 2^4 = 16 = 4^2$).]),
    True([Với $n = 5$, ta có $2^5 = 32 > 5^2 = 25$ nên bất đẳng thức đúng.]),
    [Bất đẳng thức $2^n > n^2$ đúng với mọi số tự nhiên $n >= 1$.]
  ),
  loigiai: [
    #step([Kiểm tra từng giá trị n])
    - $n = 1: 2 > 1$ (Ý a ĐÚNG).
    - $n = 2: 4 = 4$ (không thỏa mãn $>$).
    - $n = 3: 8 < 9$ (sai).
    - $n = 4: 16 = 16$ (không thỏa mãn $>$). (Ý b ĐÚNG).
    - $n = 5: 32 > 25$ (Ý c ĐÚNG).
    #step([Kết luận tập nghiệm])
    Bất đẳng thức đúng với $n = 1$ và mọi $n >= 5$. Do đó khẳng định đúng với mọi $n >= 1$ là SAI (Ý d SAI).
  ]
)

// DS 2 (Câu 14)
#ds([Cho bất đẳng thức Bernoulli: $(1 + x)^n >= 1 + n x$ với $x >= -1$ và $n in NN^*$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.2, -0.5), (2.2, 0.5), fill: rgb("f0fdfa"), stroke: 1.2pt + rgb("0f766e"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("0f766e"))[Ứng dụng BĐT Bernoulli ước lượng lũy thừa])
  })
]],
  (
    True([Khi $n = 1$, hai vế bằng nhau: $1 + x = 1 + x$.]),
    True([Nếu $x = 0$, hai vế bằng nhau với mọi số tự nhiên $n$.]),
    True([Áp dụng với $x = 0.1$ và $n = 10$, ta có $(1.1)^(10) >= 1 + 10(0.1) = 2$.]),
    [Giá trị của $(1.1)^(10)$ nhỏ hơn $2$.]
  ),
  loigiai: [
    #step([Xét các tính chất cơ bản])
    - $n = 1$: $(1 + x)^1 = 1 + 1x$ (Ý a ĐÚNG).
    - $x = 0$: $(1 + 0)^n = 1 = 1 + n(0)$ (Ý b ĐÚNG).
    - $x = 0.1, n = 10$: $(1 + 0.1)^(10) >= 1 + 10(0.1) = 1 + 1 = 2$ (Ý c ĐÚNG).
    - Thực tế $(1.1)^(10) approx 2.5937 > 2$. Khẳng định nhỏ hơn 2 là SAI (Ý d SAI).
  ]
)

// DS 3 (Câu 15)
#ds([Xét tổng nghịch đảo bình phương:
$ S_n = 1 / 1^2 + 1 / 2^2 + 1 / 3^2 + ... + 1 / n^2 quad (n >= 2) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0f766e"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("0f766e"))[$1/k^2 < 1/(k(k-1)) = 1/(k-1) - 1/k$])
  })
]],
  (
    True([Với $n = 2$, ta có $S_2 = 1 + 1/4 = 5/4 = 1.25 < 2 - 1/2 = 1.5$.]),
    True([Với mọi $k >= 2$, ta luôn có $1/k^2 < 1 / (k(k - 1))$.]),
    True([Bằng phương pháp quy nạp toán học, ta chứng minh được $S_n < 2 - 1/n$ với mọi $n >= 2$.]),
    [Tổng vô hạn $S_n$ khi $n -> oo$ có thể lớn hơn $2$.]
  ),
  loigiai: [
    #step([Kiểm tra cơ sở n = 2])
    $ S_2 = 1 + 1/4 = 5/4 = 1.25 $.
    Vế phải: $2 - 1/2 = 1.5$. Vì $1.25 < 1.5$ nên đúng (Ý a ĐÚNG).
    #step([Đánh giá số hạng])
    Vì $k^2 > k(k - 1)$ nên $1/k^2 < 1 / (k(k - 1))$ (Ý b ĐÚNG).
    #step([Quy nạp toán học])
    Giả sử $S_k < 2 - 1/k$.
    Khi đó $S_(k+1) = S_k + 1/(k+1)^2 < 2 - 1/k + 1/((k+1)k) = 2 - 1/(k+1)$.
    Vậy $S_n < 2 - 1/n$ với mọi $n >= 2$ (Ý c ĐÚNG).
    #step([Giới hạn vô hạn])
    Vì $S_n < 2 - 1/n < 2$ với mọi $n$, tổng này luôn bị chặn trên bởi $2$ (thực tế giới hạn là $pi^2 / 6 approx 1.6449 < 2$).
    Do đó khẳng định có thể lớn hơn 2 là SAI (Ý d SAI).
  ]
)

// DS 4 (Câu 16)
#ds([Xét bất đẳng thức giai thừa:
$ n! < ((n + 1) / 2)^n quad (n >= 2) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.4), (2.4, 0.4), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0f766e"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("0f766e"))[Bất đẳng thức trung bình nhân và trung bình cộng])
  })
]],
  (
    True([Với $n = 2$, vế trái bằng $2! = 2$, vế phải bằng $(3/2)^2 = 2.25$, do đó bất đẳng thức đúng.]),
    True([Với $n = 3$, vế trái bằng $3! = 6$, vế phải bằng $2^3 = 8$, do đó bất đẳng thức đúng.]),
    True([Với $n = 4$, vế trái bằng $24$, vế phải bằng $(2.5)^4 = 39.0625$, do đó bất đẳng thức đúng.]),
    [Tồn tại số tự nhiên $n >= 2$ để $n! >= ((n + 1) / 2)^n$.]
  ),
  loigiai: [
    #step([Kiểm tra các giá trị cụ thể])
    - $n = 2: 2 < 2.25$ (Ý a ĐÚNG).
    - $n = 3: 6 < 8$ (Ý b ĐÚNG).
    - $n = 4: 24 < 39.0625$ (Ý c ĐÚNG).
    #step([Tính đúng đắn tổng quát])
    Theo bất đẳng thức Cauchy cho $n$ số đôi một khác nhau $1, 2, ..., n$ ($n >= 2$), dấu bằng không bao giờ xảy ra, do đó $n! < ((n+1)/2)^n$ luôn đúng với mọi $n >= 2$.
    Không tồn tại $n >= 2$ để đảo chiều bất đẳng thức. Ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho bất đẳng thức $2^n > n^3$. Số tự nhiên $n_0$ nhỏ nhất ($n_0 >= 2$) để bất đẳng thức này đúng với mọi số tự nhiên $n >= n_0$ là bao nhiêu?],
    [10],
    loigiai: [
        #step([Thử các giá trị số tự nhiên từ nhỏ đến lớn])
        - $n = 8: 2^8 = 256, 8^3 = 512 => 256 < 512$ (sai).
        - $n = 9: 2^9 = 512, 9^3 = 729 => 512 < 729$ (sai).
        - $n = 10: 2^(10) = 1024, 10^3 = 1000 => 1024 > 1000$ (đúng).
        #step([Quy nạp chứng minh với n >= 10])
        Với $k >= 10$: giả sử $2^k > k^3$.
        Khi đó $2^(k+1) = 2 times 2^k > 2 k^3$.
        Ta cần chỉ ra $2 k^3 > (k + 1)^3 <=> k^3 > 3 k^2 + 3 k + 1 <=> k(k^2 - 3k - 3) > 1$.
        Với $k >= 10$, điều này luôn đúng.
        Vậy số tự nhiên nhỏ nhất là $n_0 = 10$.
    ]
)

// TLN 2 (Câu 18)
#tln([Xét tổng $S = 1 / sqrt(1) + 1 / sqrt(2) + 1 / sqrt(3) + ... + 1 / sqrt(100)$.
Số nguyên dương $M$ lớn nhất thỏa mãn $S > M$ theo đánh giá $S_n > sqrt(n)$ là bao nhiêu?],
    [10],
    loigiai: [
        #step([Áp dụng bất đẳng thức tổng nghịch đảo căn thức])
        Ta đã biết với $n >= 2$:
        $ S_n = sum_(k=1)^n 1 / sqrt(k) > sqrt(n) $
        Với $n = 100$:
        $ S_(100) > sqrt(100) = 10 $
        Số nguyên dương $M$ theo cận dưới $sqrt(n)$ là $M = 10$.
    ]
)

// TLN 3 (Câu 19)
#tln([Một khoản tiền gửi ngân hàng sinh lãi kép với lãi suất $5\%/"năm"$. Theo bất đẳng thức Bernoulli, hệ số tăng trưởng vốn sau $n$ năm thỏa mãn:
$ (1 + 0.05)^n >= 1 + 0.05 n $
Số nguyên dương $n$ nhỏ nhất để vế phải của bất đẳng thức ($1 + 0.05 n$) đạt giá trị từ $2$ trở lên (tức vốn tăng ít nhất gấp đôi theo ước lượng tuyến tính) là bao nhiêu?],
    [20],
    loigiai: [
        #step([Giải bất phương trình])
        Yêu cầu:
        $ 1 + 0.05 n >= 2 <=> 0.05 n >= 1 <=> n >= 1 / 0.05 = 20 $
        Số nguyên dương $n$ nhỏ nhất là $n = 20$.
    ]
)

// TLN 4 (Câu 20)
#tln([Tìm số tự nhiên $n$ nhỏ nhất sao cho giai thừa $n!$ lớn hơn $1000$.],
    [7],
    loigiai: [
        #step([Tính giai thừa các số tự nhiên liên tiếp])
        - $1! = 1$
        - $2! = 2$
        - $3! = 6$
        - $4! = 24$
        - $5! = 120$
        - $6! = 720 < 1000$
        - $7! = 720 times 7 = 5040 > 1000$
        Vậy số tự nhiên $n$ nhỏ nhất thỏa mãn là $n = 7$.
    ]
)

// TLN 5 (Câu 21)
#tln([Một bài toán quy nạp tìm công thức số hạng tổng quát của dãy số $u_n = 2^n - 1$. Biết rằng $u_n = 127$, tìm giá trị của chỉ số $n$.],
    [7],
    loigiai: [
        #step([Giải phương trình số mũ])
        $ 2^n - 1 = 127 <=> 2^n = 128 = 2^7 <=> n = 7 $
    ]
)

// TLN 6 (Câu 22)
#tln([Tính tổng tất cả các số nguyên dương $n$ thỏa mãn bất đẳng thức:
$ 2^n <= n^2 + 5 $],
    [10],
    loigiai: [
        #step([Thử các giá trị nguyên dương của n])
        - $n = 1: 2^1 = 2 <= 1^2 + 5 = 6$ (thỏa mãn).
        - $n = 2: 2^2 = 4 <= 2^2 + 5 = 9$ (thỏa mãn).
        - $n = 3: 2^3 = 8 <= 3^2 + 5 = 14$ (thỏa mãn).
        - $n = 4: 2^4 = 16 <= 4^2 + 5 = 21$ (thỏa mãn).
        - $n = 5: 2^5 = 32, 5^2 + 5 = 30 => 32 <= 30$ (không thỏa mãn).
        - Với $n >= 5$, bằng quy nạp ta có $2^n > n^2 + 5$.
        #step([Tính tổng các giá trị thỏa mãn])
        Các số nguyên dương thỏa mãn là $n in {1, 2, 3, 4}$.
        Tổng của chúng là:
        $ 1 + 2 + 3 + 4 = 10 $
    ]
)

] // end make-questions

#make-questions()
