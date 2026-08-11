// ═══════════════════════════════════════════════════════════════════════════
// BỘ BÀI GIẢNG TOÁN 12 — HỌC KỲ II
// Kết nối tri thức · Chương IV, V, VI · 9 bài chính + ôn tập
// GV Nguyễn Văn Sang · THPT Nguyễn Hữu Cảnh
//
// Đây là bộ mới, độc lập với các deck hiện có. Có thể trình chiếu liền mạch
// hoặc dùng thanh điều hướng PDF để nhảy tới từng bài.
// ═══════════════════════════════════════════════════════════════════════════

#import "../../giao-an/modules/lecture-beamer.typ": *

#show: lecture-theme.with(
  title:       "TOÁN 12 — HỌC KỲ II",
  subtitle:    "Bộ bài giảng hoàn chỉnh · Chương IV–VI",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size:   23pt,
  math-color:  rgb("#c2185b"),
  math-size:   1.04em,
  body-font:   ("Arial", "Times New Roman"),
)

#lec-reset()
#lt-toc(title: "📚 LỘ TRÌNH HỌC KỲ II")

// ═══════════════════════════════════════════════════════════════════════════
// CHƯƠNG IV — NGUYÊN HÀM VÀ TÍCH PHÂN
// ═══════════════════════════════════════════════════════════════════════════
#lt-section("IV", [NGUYÊN HÀM VÀ TÍCH PHÂN])

#lt-slide-back(title: "Bài 11 · Nguyên hàm — Khởi động")[
  #lt-history(title: "Từ vận tốc đến quãng đường")[
    Nếu biết vận tốc $v(t)$ của một chuyển động, làm thế nào tìm lại quãng đường $s(t)$?
    Ta cần một phép toán ngược với đạo hàm: *nguyên hàm*.
  ]
  #v(0.6em)
  #lt-two-col(
    ratio: (48%, 52%),
    [
      #lt-definition(title: "Nguyên hàm")[
        Hàm số $F(x)$ là một nguyên hàm của $f(x)$ trên khoảng $K$ nếu
        $F'(x) = f(x)$ với mọi $x in K$.
      ]
    ],
    [
      #lt-example(title: "Nhận diện nhanh")[
        Vì $(x^3)' = 3x^2$, nên một nguyên hàm của $3x^2$ là $x^3$.
        Kiểm tra bằng cách lấy đạo hàm.
      ]
    ],
  )
]

#lt-slide-back(title: "Bài 11 · Họ nguyên hàm và tính chất")[
  #lt-theorem(title: "Họ nguyên hàm")[
    Nếu $F'(x) = f(x)$ thì mọi nguyên hàm của $f$ có dạng
    $integral f(x) d x = F(x) + C$, với $C in RR$.
  ]
  #v(0.7em)
  #lt-compare(
    left-title: "Tính tuyến tính",
    right-title: "Công thức cơ bản",
    [
      $integral (f(x) plus g(x)) d x = integral f(x) d x + integral g(x) d x$
      $integral k f(x) d x = k integral f(x) d x$
    ],
    [
      $integral x^n d x = frac(x^(n+1), n+1) + C$ $(n != -1)$
      $integral frac(1, x) d x = ln abs(x) + C$
    ],
  )
  #lt-note(title: "Sai lầm thường gặp")[
    Không được quên hằng số $C$. Với $1/x$, phải viết $ln abs(x)$.
  ]
]

#lt-slide-back(title: "Bài 11 · Ví dụ có hướng dẫn")[
  #lt-example(title: "Tìm nguyên hàm thỏa điều kiện")[
    Tìm $F(x)$ biết $F'(x) = 3x^2 - 4x + 1$ và $F(1) = 2$.
  ]
  #pause
  #lt-solution[
    $F(x) = x^3 - 2x^2 + x + C$.
    Từ $F(1) = 2$ suy ra $C = 2$, vậy
    $F(x) = x^3 - 2x^2 + x + 2$.
  ]
  #v(0.5em)
  #lt-highlight[$F'(x) = f(x) quad and quad F(x_0) = y_0$]
]

#lt-slide-back(title: "Bài 12 · Tích phân xác định")[
  #lt-history(title: "Tổng liên tục")[
    Diện tích dưới đồ thị, quãng đường từ vận tốc, lượng nước chảy vào bể:
    tích phân là phép cộng vô hạn các phần rất nhỏ.
  ]
  #v(0.5em)
  #lt-definition(title: "Tích phân")[
    Nếu $F'(x) = f(x)$ trên $[a,b]$ thì
    $integral_a^b f(x) d x = F(b) - F(a)$.
  ]
  #v(0.6em)
  #lt-note(title: "Định lý cơ bản")[
    Kết quả không phụ thuộc vào việc chọn nguyên hàm nào; hằng số $C$ bị triệt tiêu.
  ]
]

#lt-slide-back(title: "Bài 12 · Tính chất và phương pháp")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Tính chất")[
        $integral_a^b (f plus g) d x = integral_a^b f d x + integral_a^b g d x$
        $integral_a^b k f d x = k integral_a^b f d x$
        $integral_a^b f d x = - integral_b^a f d x$
      ]
    ],
    [
      #lt-step(1)[Đưa về tổng các hàm quen thuộc.]
      #lt-step(2)[Tìm một nguyên hàm $F$.]
      #lt-step(3)[Tính $F(b) - F(a)$.]
    ],
  )
  #v(0.5em)
  #lt-example(title: "Tính nhanh")[
    $integral_0^1 (3x^2 + 2x) d x = [x^3 + x^2]_0^1 = 2$.
  ]
]

#lt-slide-back(title: "Bài 13 · Ứng dụng hình học của tích phân")[
  #lt-definition(title: "Diện tích hình phẳng")[
    Nếu $f(x) >= g(x)$ trên $[a,b]$ thì diện tích miền giới hạn bởi hai đồ thị là
    $S = integral_a^b (f(x) - g(x)) d x$.
  ]
  #v(0.7em)
  #lt-example(title: "Miền giữa parabol và trục hoành")[
    Với $y = 4 - x^2$ trên $[-2,2]$:
    $S = integral_(-2)^2 (4 - x^2) d x = frac(32,3)$.
  ]
  #lt-note(title: "Quy trình vẽ hình")[
    Tìm giao điểm trước, xác định hàm trên–hàm dưới, rồi mới lập tích phân.
  ]
]

#lt-slide-back(title: "Chương IV · Ôn tập nhanh")[
  #lt-compare(
    left-title: "Nguyên hàm",
    right-title: "Tích phân",
    [
      Kết quả là một *họ hàm số*: $F(x) + C$.
      Kiểm tra bằng đạo hàm.
      Dùng điều kiện ban đầu để tìm $C$.
    ],
    [
      Kết quả là một *số*.
      Dùng Newton–Leibniz.
      Luôn kiểm tra cận và dấu.
    ],
  )
  #v(0.7em)
  #lt-example(title: "Exit ticket")[
    Tính $integral_0^2 (2x + 1) d x$. Đáp án: $6$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CHƯƠNG V — PHƯƠNG PHÁP TỌA ĐỘ TRONG KHÔNG GIAN
// ═══════════════════════════════════════════════════════════════════════════
#lt-section("V", [PHƯƠNG PHÁP TỌA ĐỘ TRONG KHÔNG GIAN])

#lt-slide-back(title: "Bài 14 · Phương trình mặt phẳng")[
  #lt-history(title: "Mặt phẳng trong không gian")[
    Một mặt phẳng được xác định bởi một điểm và một vectơ pháp tuyến.
    Tọa độ biến hình học không gian thành đại số có thể tính được.
  ]
  #v(0.5em)
  #lt-definition(title: "Phương trình tổng quát")[
    Mặt phẳng $(P)$ có dạng $a x + b y + c z + d = 0$, trong đó
    $vec(n) = (a,b,c)$ là một vectơ pháp tuyến.
  ]
  #lt-example(title: "Lập phương trình")[
    Qua $A(1,2,0)$ và có $vec(n)=(2,-1,3)$:
    $2(x-1) - (y-2) + 3z = 0$.
  ]
]

#lt-slide-back(title: "Bài 15 · Phương trình đường thẳng")[
  #lt-definition(title: "Dạng tham số")[
    Đường thẳng đi qua $M(x_0,y_0,z_0)$, có vectơ chỉ phương
    $vec(u)=(a,b,c)$:
    $cases(x = x_0 + a t, y = y_0 + b t, z = z_0 + c t)$.
  ]
  #v(0.6em)
  #lt-compare(
    left-title: "Điểm thuộc đường thẳng",
    right-title: "Mặt phẳng chứa đường thẳng",
    [
      Thay tọa độ điểm vào hệ tham số và tìm cùng một $t$.
    ],
    [
      Lập phương trình mặt phẳng qua một điểm của đường thẳng
      và hai vectơ không cùng phương nằm trong mặt phẳng.
    ],
  )
]

#lt-slide-back(title: "Bài 16 · Góc trong không gian")[
  #lt-theorem(title: "Góc giữa hai vectơ")[
    $cos angle(vec(u), vec(v)) = frac(vec(u) dot vec(v), abs(vec(u)) abs(vec(v)))$.
  ]
  #v(0.5em)
  #lt-theorem(title: "Góc giữa đường thẳng và mặt phẳng", kind: "CÔNG THỨC")[
    Nếu $vec(u)$ là chỉ phương của đường thẳng và $vec(n)$ là pháp tuyến của
    mặt phẳng thì $sin alpha = abs(vec(u) dot vec(n)) / (abs(vec(u)) abs(vec(n)))$.
  ]
  #lt-note(title: "Kiểm tra dấu")[
    Góc hình học lấy trong $[0, pi/2]$; dùng giá trị tuyệt đối khi cần.
  ]
]

#lt-slide-back(title: "Bài 17 · Phương trình mặt cầu")[
  #lt-definition(title: "Mặt cầu tâm I")[
    Mặt cầu tâm $I(a,b,c)$, bán kính $R$:
    $(x-a)^2 + (y-b)^2 + (z-c)^2 = R^2$.
  ]
  #v(0.6em)
  #lt-example(title: "Từ đường kính")[
    Với $A(1,0,2)$, $B(5,2,4)$, tâm là trung điểm $I(3,1,3)$ và
    $R = sqrt(6)$.
  ]
  #lt-solution[
    Phương trình: $(x-3)^2 + (y-1)^2 + (z-3)^2 = 6$.
  ]
]

#lt-slide-back(title: "Chương V · Bài toán khoảng cách")[
  #lt-theorem(title: "Khoảng cách từ điểm đến mặt phẳng")[
    Với $M(x_0,y_0,z_0)$ và $(P): a x + b y + c z + d = 0$:
    $d(M,(P)) = frac(abs(a x_0 + b y_0 + c z_0 + d), sqrt(a^2+b^2+c^2))$.
  ]
  #v(0.6em)
  #lt-example(title: "Ứng dụng")[
    Khoảng cách từ $M(1,2,3)$ đến $(P): 2x-y+2z-4=0$ là
    $d = 4/3$.
  ]
]

#lt-slide-back(title: "Chương V · Ôn tập chiến lược")[
  #lt-step(1)[Đọc dữ kiện hình học: điểm, hướng, pháp tuyến.]
  #lt-step(2)[Chuyển sang vectơ tọa độ.]
  #lt-step(3)[Chọn công thức: góc, khoảng cách, giao điểm hoặc mặt cầu.]
  #lt-step(4)[Kiểm tra nghiệm bằng cách thế ngược vào phương trình.]
  #v(0.4em)
  #lt-note(title: "Mẹo trình bày")[
    Ghi rõ vectơ đang dùng là chỉ phương hay pháp tuyến; đây là lỗi mất điểm phổ biến nhất.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CHƯƠNG VI — XÁC SUẤT CÓ ĐIỀU KIỆN
// ═══════════════════════════════════════════════════════════════════════════
#lt-section("VI", [XÁC SUẤT CÓ ĐIỀU KIỆN])

#lt-slide-back(title: "Bài 18 · Xác suất có điều kiện")[
  #lt-history(title: "Cập nhật thông tin")[
    Xác suất của một biến cố thay đổi khi ta biết thêm thông tin.
    Ví dụ: xác suất mưa hôm nay khi đã biết dự báo thời tiết báo mưa.
  ]
  #v(0.5em)
  #lt-definition(title: "Xác suất có điều kiện")[
    Với $P(B) > 0$, xác suất của $A$ khi biết $B$ đã xảy ra:
    $P(A|B) = frac(P(A inter B), P(B))$.
  ]
  #lt-note(title: "Đọc đúng ký hiệu")[
    $P(A|B)$ không phải là $P(A) / P(B)$; tử số phải là xác suất đồng thời.
  ]
]

#lt-slide-back(title: "Bài 18 · Công thức nhân xác suất")[
  #lt-theorem(title: "Công thức nhân")[
    $P(A inter B) = P(B) P(A|B) = P(A) P(B|A)$.
  ]
  #v(0.6em)
  #lt-example(title: "Rút bi không hoàn lại")[
    Hộp có 3 bi đỏ, 2 bi xanh. Xác suất rút lần hai là đỏ biết lần đầu đã đỏ:
    $P(R_2|R_1) = 2/4 = 1/2$.
  ]
  #lt-solution[
    Điều kiện “lần đầu đỏ” làm không gian mẫu thay đổi: còn 4 viên, trong đó 2 đỏ.
  ]
]

#lt-slide-back(title: "Bài 19 · Xác suất toàn phần")[
  #lt-theorem(title: "Công thức xác suất toàn phần")[
    Nếu $B_1, B_2, ..., B_n$ là một hệ đầy đủ biến cố thì
    $P(A) = sum_(i=1)^n P(B_i) P(A|B_i)$.
  ]
  #v(0.6em)
  #lt-example(title: "Hai dây chuyền")[
    Dây chuyền I sản xuất 60% sản phẩm, lỗi 2%; dây chuyền II sản xuất 40%,
    lỗi 5%. Xác suất một sản phẩm bất kỳ bị lỗi là
    $0.6 dot.c 0.02 + 0.4 dot.c 0.05 = 0.032$.
  ]
]

#lt-slide-back(title: "Bài 19 · Công thức Bayes")[
  #lt-theorem(title: "Bayes")[
    $P(B_j|A) = frac(P(B_j) P(A|B_j), sum_i P(B_i) P(A|B_i))$.
  ]
  #v(0.6em)
  #lt-example(title: "Truy ngược nguồn gốc")[
    Với dữ kiện dây chuyền ở slide trước, biết sản phẩm bị lỗi.
    Xác suất sản phẩm đến từ dây chuyền II là
    $frac(0.4 dot.c 0.05, 0.032) = 0.625$.
  ]
  #lt-note(title: "Ý nghĩa")[
    Bayes đi từ “nguồn → kết quả” sang “kết quả → nguồn”.
  ]
]

#lt-slide-back(title: "Chương VI · Sơ đồ cây và chiến lược giải")[
  #lt-step(1)[Chia trường hợp bằng hệ đầy đủ $B_i$.]
  #lt-step(2)[Ghi xác suất nhánh đầu tiên $P(B_i)$.]
  #lt-step(3)[Ghi xác suất có điều kiện $P(A|B_i)$.]
  #lt-step(4)[Nhân theo từng nhánh, cộng các nhánh cần thiết.]
  #v(0.3em)
  #lt-highlight[$P(A) = sum P(B_i) P(A|B_i)$]
]

#lt-slide-back(title: "Ôn tập cuối học kỳ II · Bản đồ kiến thức")[
  #lt-compare(
    left-title: "Giải tích",
    right-title: "Hình học & xác suất",
    [
      Nguyên hàm → tích phân → diện tích, thể tích.
      Luôn kiểm tra cận và dấu.
    ],
    [
      Tọa độ → vectơ → góc/khoảng cách.
      Điều kiện → toàn phần → Bayes.
    ],
  )
  #v(0.7em)
  #lt-example(title: "Ba câu tự kiểm tra")[
    1. Tính một nguyên hàm có điều kiện đầu.
    2. Lập mặt phẳng qua điểm và vuông góc đường thẳng.
    3. Tính xác suất nguồn gốc khi biết kết quả.
  ]
]

#lt-slide-back(title: "Kết thúc · Chuẩn bị cho kỳ thi")[
  #lt-history(title: "Ba thói quen")[
    Đọc kỹ điều kiện · Viết công thức trước khi bấm máy · Thế ngược để kiểm tra.
  ]
  #v(0.8em)
  #lt-highlight[
    #text(size: 30pt)[Học hiểu bản chất — trình bày rõ ràng — kiểm tra kết quả]
  ]
  #v(0.7em)
  #align(center)[
    #text(size: 14pt, fill: lec-palette.muted)[Chúc các em học tốt và tự tin bước vào kỳ thi.]
  ]
]
