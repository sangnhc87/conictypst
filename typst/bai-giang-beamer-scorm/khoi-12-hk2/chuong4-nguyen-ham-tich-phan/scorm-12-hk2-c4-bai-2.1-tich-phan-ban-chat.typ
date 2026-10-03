// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C4-BÀI 2.1: TÍCH PHÂN - BẢN CHẤT VÀ TÍNH CHẤT
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2.1: TÍCH PHÂN CƠ BẢN",
  subtitle:    "Từ phép cộng Riemann đến Định lý Newton-Leibniz",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Bài toán quét diện tích")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Thách thức của Hình học cổ đại:]
    
    Từ thời cổ đại, con người đã biết tính diện tích hình chữ nhật (dài $times$ rộng), hình tam giác, hình thang... nhờ các đường thẳng. 
    Nhưng nếu một mảnh đất có ranh giới là một *đường cong uốn lượn* $y = f(x)$, thì làm thế nào để tính diện tích của nó?
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp của Riemann: Chia để trị]
  
  Nhà toán học Riemann đưa ra ý tưởng: Hãy "xắt" mảnh đất đó thành hàng ngàn hình chữ nhật nhỏ xíu dựng đứng. Chiều rộng của mỗi hình chữ nhật vô cùng bé (gọi là $d x$), chiều cao chính là giá trị hàm số $f(x)$. 
  Cộng (Sum - ký hiệu là $int$) diện tích của tất cả các hình chữ nhật li ti này lại, ta sẽ có diện tích chính xác của toàn bộ hình!
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Định nghĩa và Định lý Newton-Leibniz")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *1. Ký hiệu Tích phân:*
    $ I = int_a^b f(x) d x $
    - $a, b$: Gọi là cận dưới và cận trên.
    - $f(x)$: Hàm số dưới dấu tích phân.
    - $x$: Biến số (có thể thay bằng $t, u$ tùy ý, bản chất không đổi).
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *2. Định lý Newton-Leibniz (Sợi dây liên kết kỳ diệu):*
    Định lý này khẳng định rằng bài toán tính "diện tích cộng dồn" (Tích phân) hoàn toàn có thể giải bằng "Đạo hàm ngược" (Nguyên hàm)!
    
    Nếu $F(x)$ là một nguyên hàm của $f(x)$ trên đoạn $[a; b]$, thì:
    $ int_a^b f(x) d x = F(x) |_a^b = F(b) - F(a) $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Các tính chất cốt lõi của Tích phân")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *1. Tính vô hướng và biến số:*
    - $int_a^b f(x) d x$ là một *số thực* cụ thể, không phải là một "họ hàm số" như Nguyên hàm. (Nên Tích phân *KHÔNG CÓ* hằng số $+C$).
    - $int_a^b f(x) d x = int_a^b f(t) d t = int_a^b f(u) d u$ (Tích phân không phụ thuộc vào tên biến).
  ]
  
  #v(0.5em)
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt, width: 100%)[
    *2. Các phép toán với cận:*
    - Hai cận trùng nhau: $int_a^a f(x) d x = 0$.
    - Đảo cận thì đổi dấu: $int_a^b f(x) d x = - int_b^a f(x) d x$.
    - Chèn điểm (tách chặng đường): Với điểm $c$ nằm giữa (hoặc ngoài) đoạn $[a; b]$:
      $ int_a^b f(x) d x = int_a^c f(x) d x + int_c^b f(x) d x $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Phân tích Chuyên Sâu")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#166534"))[Ví dụ 1: Tính tích phân cơ bản]
    Tính $I = int_1^2 (3x^2 - 2x + 1) d x$
    
    *Giải:*
    - Tìm một nguyên hàm: $F(x) = x^3 - x^2 + x$.
    - Áp dụng Newton-Leibniz: 
      $I = F(2) - F(1) = (2^3 - 2^2 + 2) - (1^3 - 1^2 + 1) = (8 - 4 + 2) - (1 - 1 + 1) = 6 - 1 = 5$.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#1d4ed8"))[Ví dụ 2: Ứng dụng tính chất chèn điểm]
    Biết $int_0^5 f(x) d x = 10$ và $int_3^5 f(x) d x = 4$. Tính $int_0^3 f(x) d x$.
    
    *Giải:*
    Ta có quy tắc chèn điểm $c=3$:
    $int_0^5 f(x) d x = int_0^3 f(x) d x + int_3^5 f(x) d x$
    Thay số: $10 = int_0^3 f(x) d x + 4 => int_0^3 f(x) d x = 10 - 4 = 6$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Tính tích phân $I = int_0^1 e^x d x$. Kết quả là:],
  (
    [$e$],
    [$e-1$],
    [$e+1$],
    [$1$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Tính Chất Tích Phân",
  loigiai: [
    Nguyên hàm của $e^x$ là $e^x$. $I = e^x |_0^1 = e^1 - e^0 = e - 1$.
  ]
)

#lt-tn(
  [Biết $int_1^2 f(x) d x = 3$ và $int_1^2 g(x) d x = -2$. Tính $I = int_1^2 [2f(x) - 3g(x)] d x$.],
  (
    [$0$],
    [$12$],
    [$5$],
    [$10$]
  ),
  correct: 2,
  num: 2,
  de: "Phần Luyện Tập Tính Chất Tích Phân",
  loigiai: [
    Áp dụng tính chất tuyến tính:
    $I = 2 int_1^2 f(x) d x - 3 int_1^2 g(x) d x = 2(3) - 3(-2) = 6 + 6 = 12$.
  ]
)

#lt-tn(
  [Cho $int_1^4 f(x) d x = 9$ và $int_3^4 f(x) d x = 4$. Tính $I = int_1^3 f(x) d x$.],
  (
    [$5$],
    [$13$],
    [$-5$],
    [$36$]
  ),
  correct: 1,
  num: 3,
  de: "Phần Luyện Tập Tính Chất Tích Phân",
  loigiai: [
    Chèn điểm 3: $int_1^4 f(x) d x = int_1^3 f(x) d x + int_3^4 f(x) d x => 9 = I + 4 => I = 5$.
  ]
)

#lt-tn(
  [Biết $f(x)$ là hàm số liên tục trên $RR$ và $int_0^2 f(x) d x = 10$. Tính $I = int_0^2 f(t) d t$.],
  (
    [$5$],
    [$10$],
    [$20$],
    [Không tính được]
  ),
  correct: 2,
  num: 4,
  de: "Phần Luyện Tập Tính Chất Tích Phân",
  loigiai: [
    Tích phân không phụ thuộc vào tên biến, do đó $int_0^2 f(t) d t = int_0^2 f(x) d x = 10$.
  ]
)

#lt-tn(
  [Khẳng định nào sau đây là *SAI* đối với tích phân $I = int_a^b f(x) d x$?],
  (
    [Tích phân $I$ là một hằng số thực.],
    [Nếu đảo cận thì giá trị tích phân sẽ bị đổi dấu.],
    [Có thể tách tích phân thành tổng của hai tích phân bằng cách chèn điểm $c$ bất kỳ.],
    [Kết quả của tích phân là một họ hàm số $F(x) + C$.]
  ),
  correct: 4,
  num: 5,
  de: "Phần Luyện Tập Tính Chất Tích Phân",
  loigiai: [
    Nguyên hàm mới ra họ hàm số $+C$. Tích phân xác định là một số thực cụ thể.
  ]
)
