// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C6-BÀI 1: XÁC SUẤT CÓ ĐIỀU KIỆN
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 1: XÁC SUẤT CÓ ĐIỀU KIỆN",
  subtitle:    "Đánh giá rủi ro dựa trên thông tin có sẵn",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Thông tin làm thay đổi niềm tin")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Bài toán thực tế:]
    
    Tỷ lệ mắc bệnh viêm gan B ở một địa phương là 10%. Nếu chọn ngẫu nhiên một người, xác suất người đó mắc bệnh là $0.1$.
    
    *Tuy nhiên, nếu bạn biết thêm thông tin rằng người đó vừa có kết quả xét nghiệm máu dương tính (với độ chính xác của xét nghiệm là 95%), liệu xác suất người đó mắc bệnh có còn là 10%?*
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Bản chất của Xác suất có điều kiện]
  
  Khi chúng ta nhận được thông tin mới, không gian mẫu bị thu hẹp lại. Việc cập nhật xác suất dựa trên một sự kiện đã xảy ra được gọi là tính *Xác suất có điều kiện*.
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Định nghĩa và Công thức")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Định nghĩa:*
    Cho hai biến cố $A$ và $B$ ($P(B) > 0$). Xác suất của biến cố $A$ khi biết biến cố $B$ đã xảy ra được gọi là *xác suất có điều kiện* của $A$ với điều kiện $B$, kí hiệu là $P(A|B)$.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Công thức tính:*
    $ P(A|B) = P(A B) / P(B) $
    (Trong đó $P(A B)$ là xác suất xảy ra đồng thời cả $A$ và $B$).
  ]
  
  #v(0.5em)
  Từ công thức trên, ta suy ra *Công thức nhân xác suất*:
  $ P(A B) = P(B) dot P(A|B) $
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Tính chất và Ý nghĩa")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *1. Biến cố độc lập:*
    Hai biến cố $A$ và $B$ độc lập khi và chỉ khi sự xuất hiện của $B$ không ảnh hưởng đến xác suất của $A$, tức là:
    $ P(A|B) = P(A) <=> P(A B) = P(A) dot P(B) $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt, width: 100%)[
    *2. Sự khác biệt giữa $P(A|B)$ và $P(A B)$:*
    - $P(A B)$: Bạn nhắm mắt bốc 1 người ngẫu nhiên từ toàn bộ dân số, xác suất người đó thoả mãn cả $A$ và $B$. (Không gian mẫu là tất cả mọi người).
    - $P(A|B)$: Bạn chỉ chọn trong số những người đã có đặc điểm $B$, hỏi xác suất có đặc điểm $A$. (Không gian mẫu bị thu hẹp chỉ còn những người mang đặc điểm $B$).
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ minh hoạ")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#fecaca"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#991b1b"))[Ví dụ: Khảo sát thói quen đọc sách]
    
    Một lớp có 40 học sinh, trong đó có 25 nam và 15 nữ. Có 10 bạn nam thích đọc sách và 12 bạn nữ thích đọc sách. Chọn ngẫu nhiên 1 học sinh trong lớp.
    - Gọi $A$ là biến cố "Học sinh được chọn thích đọc sách".
    - Gọi $B$ là biến cố "Học sinh được chọn là nam".
    
    Tính $P(A|B)$ và $P(A B)$.
    
    *Giải:*
    - $P(B) = 25/40$.
    - $P(A B)$ là xác suất bốc trúng 1 học sinh vừa là nam vừa thích đọc sách: $P(A B) = 10/40$.
    - $P(A|B)$: Biết học sinh đó là nam, tính xác suất bạn đó thích đọc sách. Ta xét không gian mẫu thu hẹp (25 bạn nam), trong đó có 10 bạn thích đọc sách: $P(A|B) = 10/25 = 2/5$.
    *(Kiểm chứng bằng công thức: $P(A|B) = P(A B)/P(B) = (10/40)/(25/40) = 10/25 = 2/5$.)*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM

#lt-tn(
  [Cho hai biến cố $A$ và $B$ có $P(B) = 0.4$ và $P(A B) = 0.1$. Xác suất $P(A|B)$ bằng:],
  (
    [$0.5$],
    [$0.25$],
    [$0.4$],
    [$0.1$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập",
  loigiai: [
    $P(A|B) = P(A B) / P(B) = 0.1 / 0.4 = 1/4 = 0.25$.
  ]
)

#lt-tn(
  [Cho $A$ và $B$ là hai biến cố độc lập, $P(A) = 0.3, P(B) = 0.6$. Giá trị của $P(A|B)$ bằng:],
  (
    [$0.18$],
    [$0.6$],
    [$0.3$],
    [$0.5$]
  ),
  correct: 3,
  num: 2,
  de: "Phần Luyện Tập",
  loigiai: [
    Vì $A$ và $B$ độc lập nên $P(A|B) = P(A) = 0.3$.
  ]
)

#lt-tn(
  [Gieo một con xúc xắc cân đối. Gọi $A$ là biến cố "Xuất hiện mặt chẵn", $B$ là biến cố "Xuất hiện mặt lớn hơn 3". Tính xác suất xuất hiện mặt chẵn biết rằng mặt đó lớn hơn 3.],
  (
    [$1/3$],
    [$1/2$],
    [$2/3$],
    [$1/4$]
  ),
  correct: 3,
  num: 3,
  de: "Phần Luyện Tập",
  loigiai: [
    $Omega_B = {4, 5, 6}$. Trong đó có 2 số chẵn là 4 và 6. Vậy $P(A|B) = 2/3$.
  ]
)

#lt-tn(
  [Một hộp có 5 bi đỏ và 3 bi xanh. Lần lượt lấy ngẫu nhiên 2 viên bi (không hoàn lại). Xác suất để viên bi thứ hai là màu xanh, biết viên bi thứ nhất là màu đỏ bằng:],
  (
    [$3/8$],
    [$3/7$],
    [$5/8$],
    [$5/7$]
  ),
  correct: 2,
  num: 4,
  de: "Phần Luyện Tập",
  loigiai: [
    Lần 1 lấy bi đỏ, trong hộp còn lại 4 đỏ và 3 xanh (tổng 7 viên).
    Xác suất lấy bi xanh lần 2 lúc này là $3/7$.
  ]
)

#lt-tn(
  [Khẳng định nào sau đây là *sai* khi nói về xác suất có điều kiện? (Với $P(B) > 0$)],
  (
    [$0 <= P(A|B) <= 1$],
    [$P(A|B) = 1 - P(bar(A)|B)$],
    [$P(A B) = P(A|B) dot P(B)$],
    [$P(A|B) + P(B|A) = 1$]
  ),
  correct: 4,
  num: 5,
  de: "Phần Luyện Tập",
  loigiai: [
    $P(A|B)$ và $P(B|A)$ là hai xác suất khác biệt, tổng của chúng không nhất thiết bằng 1. (Ví dụ: Biết là người, xác suất là nam là 50%. Biết là nam, xác suất là người là 100%).
  ]
)
