// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C4-BÀI 1.2: PHƯƠNG PHÁP ĐỔI BIẾN SỐ
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 1.2: ĐỔI BIẾN SỐ TRONG NGUYÊN HÀM",
  subtitle:    "Kỹ thuật biến phức tạp thành đơn giản",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Tại sao Bảng nguyên hàm là chưa đủ?")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Vấn đề đặt ra:]
    
    Với bảng nguyên hàm cơ bản, ta dễ dàng tính được $int x^2 d x = x^3/3 + C$.
    
    Nhưng nếu gặp bài toán:
    $ int 2x (x^2 + 1)^100 d x $
    Ta không thể khai triển lũy thừa mũ 100, và cũng *không được phép* tách phép nhân thành $int 2x d x dot int (x^2 + 1)^100 d x$.
    
    *Vậy làm sao để xử lý những hàm số "cồng kềnh" như thế này?*
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp: Thay tên đổi họ (Đổi biến số)]
  
  Nếu ta tinh mắt nhận ra đạo hàm của $(x^2 + 1)$ chính là $2x$, ta có thể đặt một ẩn phụ mới $t = x^2 + 1$. Nhờ đó, cả biểu thức khổng lồ sẽ được thu gọn lại cực kỳ đơn giản!
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Định lý Phương pháp Đổi biến số")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Định lý:*
    Nếu $int f(u) d u = F(u) + C$ và $u = u(x)$ là hàm số có đạo hàm liên tục, thì:
    $ int f(u(x)) dot u'(x) d x = F(u(x)) + C $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Thuật toán Đổi biến số (3 Bước "Thần thánh"):*
    - *Bước 1 (Đặt ẩn):* Đặt $t = u(x)$ (thường chọn biểu thức nằm trong ngoặc mũ cao, dưới mẫu, trong căn, hoặc phần "lõi" của hàm hợp).
    - *Bước 2 (Vi phân):* Tính vi phân hai vế $d t = u'(x) d x$. (Dùng để thay thế phần còn lại của $d x$).
    - *Bước 3 (Thế & Giải):* Thay toàn bộ biến $x$ bằng biến $t$. Giải nguyên hàm theo $t$, sau đó trả lại biến $x$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Nhận diện Dấu hiệu Đổi biến (Đọc vị đề thi)")[
  Để đổi biến thành công, ta cần tìm một cặp $(u(x), u'(x))$ trong biểu thức.
  
  #grid(
    columns: (1fr, 1fr),
    gutter: 15pt,
    [
      #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt, height: 100%)[
        #text(weight: "bold", fill: rgb("#334155"))[1. Hàm Căn Thức / Lũy thừa]
        - $int f(sqrt(u(x))) u'(x) d x$ $=> "Đặt " t = sqrt(u(x))$ (Bình phương lên trước khi vi phân).
        - $int [u(x)]^n u'(x) d x$ $=> "Đặt " t = u(x)$.
      ]
    ],
    [
      #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, height: 100%)[
        #text(weight: "bold", fill: rgb("#b45309"))[2. Hàm Mũ / Logarit]
        - Thấy $(ln x) / x d x$ $=> "Đặt " t = ln x$ (Vì $(ln x)' = 1/x$).
        - Thấy $e^(u(x)) u'(x) d x$ $=> "Đặt " t = u(x)$.
      ]
    ]
  )
  
  #v(0.5em)
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#fecaca"), inset: 10pt, radius: 5pt, width: 100%)[
    #text(weight: "bold", fill: rgb("#991b1b"))[3. Hàm Lượng Giác]
    - Thấy $sin x dot cos^n x d x$ $=> "Đặt " t = cos x$ (Vì $(cos x)' = -sin x$).
    - Thấy $cos x dot sin^n x d x$ $=> "Đặt " t = sin x$ (Vì $(sin x)' = cos x$).
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Phân tích Chuyên Sâu")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#166534"))[Ví dụ 1: Xử lý bài toán Khởi động]
    Tính $I = int 2x (x^2 + 1)^100 d x$
    
    *Giải:*
    - Đặt $t = x^2 + 1$.
    - Vi phân 2 vế: $d t = 2x d x$.
    - Thay vào $I$: Cụm $(x^2 + 1)^100$ biến thành $t^100$. Cụm $2x d x$ biến thành $d t$.
    - Vậy $I = int t^100 d t = t^101/101 + C$.
    - Trả lại biến $x$: $I = (x^2 + 1)^101/101 + C$.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#1d4ed8"))[Ví dụ 2: Lượng giác có căn]
    Tính $J = int (cos x)/sqrt(sin x) d x$
    
    *Giải:*
    - Đặt $t = sqrt(sin x) => t^2 = sin x$.
    - Vi phân 2 vế: $2t d t = cos x d x$.
    - Thế vào $J$: $J = int (2t d t) / t = int 2 d t = 2t + C$.
    - Trả lại biến $x$: $J = 2 sqrt(sin x) + C$.
    *(Cách bình phương này giúp tránh phải làm việc với $d t = (cos x)/(2 sqrt(sin x)) d x$ rất rườm rà!)*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Để tính nguyên hàm $I = int x sqrt(x^2 + 3) d x$, cách đặt ẩn phụ nào sau đây là tối ưu nhất?],
  (
    [$t = x$],
    [$t = x^2$],
    [$t = x^2 + 3$],
    [$t = sqrt(x^2 + 3)$]
  ),
  correct: 4,
  num: 1,
  de: "Phần Luyện Tập Đổi Biến",
  loigiai: [
    Đặt $t = sqrt(x^2+3) => t^2 = x^2 + 3 => 2t d t = 2x d x => x d x = t d t$.
    Khi đó căn thức biến mất ngay lập tức, bài toán trở thành nguyên hàm đa thức rất gọn. (Cách $t=x^2+3$ cũng ra nhưng phải xử lý $t^(1/2)$).
  ]
)

#lt-tn(
  [Tính $int e^(x^3) dot x^2 d x$, kết quả là:],
  (
    [$1/3 e^(x^3) + C$],
    [$e^(x^3) + C$],
    [$x^3/3 e^(x^3) + C$],
    [$3 e^(x^3) + C$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Đổi Biến",
  loigiai: [
    Đặt $t = x^3 => d t = 3x^2 d x => x^2 d x = (d t)/3$.
    Nguyên hàm trở thành: $int e^t dot (d t)/3 = 1/3 e^t + C = 1/3 e^(x^3) + C$.
  ]
)

#lt-tn(
  [Họ nguyên hàm của hàm số $f(x) = (ln x) / x$ là:],
  (
    [$ln(ln x) + C$],
    [$1/2 (ln x)^2 + C$],
    [$ln x + C$],
    [$x (ln x)^2 + C$]
  ),
  correct: 2,
  num: 3,
  de: "Phần Luyện Tập Đổi Biến",
  loigiai: [
    Thấy có $ln x$ và $1/x$, ta đặt $t = ln x => d t = 1/x d x$.
    Biểu thức trở thành: $int t d t = t^2/2 + C = 1/2 (ln x)^2 + C$.
  ]
)

#lt-tn(
  [Biết $int f(x) d x = F(x) + C$. Khi đó $int f(5x + 3) d x$ bằng:],
  (
    [$5 F(5x + 3) + C$],
    [$F(5x + 3) + C$],
    [$1/5 F(5x + 3) + C$],
    [$1/5 F(x) + C$]
  ),
  correct: 3,
  num: 4,
  de: "Phần Luyện Tập Đổi Biến",
  loigiai: [
    Đây là hệ quả của đổi biến số. Đặt $t = 5x+3 => d t = 5 d x => d x = 1/5 d t$. 
    Ta được $int f(t) dot 1/5 d t = 1/5 F(t) + C = 1/5 F(5x+3) + C$.
  ]
)

#lt-tn(
  [Khẳng định nào sau đây là *SAI* khi áp dụng phương pháp đổi biến số?],
  (
    [Sau khi giải ra kết quả theo biến $t$, phải thay $t$ ngược lại bằng hàm theo biến $x$ ban đầu.],
    [Có thể đặt $t = u(x)$ tuỳ ý, miễn là trong đề bài xuất hiện $u'(x) d x$.],
    [Vi phân của $t = u(x)$ là $d t = u(x) d x$.],
    [Đổi biến số là kỹ thuật "làm ngược lại" của quy tắc đạo hàm hàm hợp.]
  ),
  correct: 3,
  num: 5,
  de: "Phần Luyện Tập Đổi Biến",
  loigiai: [
    Khẳng định sai là C. Vi phân đúng phải là $d t = u'(x) d x$ (có dấu đạo hàm).
  ]
)
