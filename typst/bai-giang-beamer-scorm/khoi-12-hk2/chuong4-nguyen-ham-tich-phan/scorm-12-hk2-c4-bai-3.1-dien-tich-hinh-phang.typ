// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C4-BÀI 3.1: ỨNG DỤNG TÍCH PHÂN - DIỆN TÍCH HÌNH PHẲNG
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 3.1: DIỆN TÍCH HÌNH PHẲNG",
  subtitle:    "Tính diện tích mọi bề mặt uốn lượn",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Mảnh đất ven sông")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Bài toán Quy hoạch đô thị:]
    
    Một gia đình được đền bù một mảnh đất. Mảnh đất có 3 mặt là rào chắn thẳng tắp, nhưng mặt còn lại nằm sát một con sông uốn khúc có phương trình được đo đạc là $y = x^3 - 4x^2 + 5x$.
    
    *Làm sao để cán bộ địa chính tính chính xác diện tích mảnh đất này đến từng mét vuông để đền bù công bằng nhất?*
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp: Tích phân trị tuyệt đối]
  
  Sử dụng tích phân! Tuy nhiên, diện tích là một đại lượng *không bao giờ âm*. Do đó, ta phải cẩn thận với những phần đồ thị "chìm" dưới trục hoành. Trị tuyệt đối sẽ là chìa khoá để giải quyết bài toán này.
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Công thức Diện tích cơ bản")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *1. Hình phẳng giới hạn bởi 1 đồ thị và trục hoành:*
    Diện tích $S$ của hình phẳng giới hạn bởi đồ thị $y = f(x)$, trục $O x$ ($y = 0$) và hai đường thẳng $x = a, x = b$ ($a < b$) là:
    
    $ S = int_a^b |f(x)| d x $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *2. Hình phẳng giới hạn bởi 2 đồ thị:*
    Diện tích $S$ của hình phẳng giới hạn bởi $y = f(x)$, $y = g(x)$ và hai đường thẳng $x = a, x = b$ ($a < b$) là:
    
    $ S = int_a^b |f(x) - g(x)| d x $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Kỹ thuật phá dấu Trị tuyệt đối")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    Máy tính Casio có thể bấm trực tiếp tích phân chứa trị tuyệt đối. Tuy nhiên, nếu giải tự luận, ta làm theo 3 bước sau:
    
    *Bước 1:* Giải phương trình hoành độ giao điểm $f(x) - g(x) = 0$ trên đoạn $[a; b]$. Giả sử có 1 nghiệm $c$ ($a < c < b$).
    
    *Bước 2:* Tách chặng theo nghiệm $c$:
    $ S = int_a^c |f(x) - g(x)| d x + int_c^b |f(x) - g(x)| d x $
    
    *Bước 3:* Đưa trị tuyệt đối ra ngoài (vì trên mỗi chặng nhỏ, hàm số không đổi dấu):
    $ S = abs(int_a^c (f(x) - g(x)) d x) + abs(int_c^b (f(x) - g(x)) d x) $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Thực tế: Cổng Parabol")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Bài toán Xây cổng làng]
    
    Một cái cổng hình Parabol có phương trình $y = 4 - x^2$ (trục $O x$ nằm trên mặt đất). Cổng rộng 4m (đi từ $x=-2$ đến $x=2$). Người ta muốn ốp gạch toàn bộ phần diện tích bề mặt của cổng này. Tính diện tích cần ốp gạch.
    
    *Giải:*
    Phần cần ốp gạch bị giới hạn bởi $y = 4 - x^2$, mặt đất $y = 0$, $x = -2$, $x = 2$.
    Vì trên $[-2; 2]$, ta có $4 - x^2 >= 0$, nên trị tuyệt đối có thể bỏ qua.
    
    $ S &= int_{-2}^2 (4 - x^2) d x = (4x - x^3/3) |_{-2}^2 \
      &= (8 - 8/3) - (-8 + 8/3) = 16/3 - (-16/3) = 32/3 (m^2) $
      
    Vậy diện tích ốp gạch là khoảng $10.67 m^2$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Diện tích hình phẳng giới hạn bởi đồ thị hàm số $y=x^2-2x$, trục hoành và hai đường thẳng $x=0, x=3$ là:],
  (
    [$8/3$],
    [$4/3$],
    [$0$],
    [$2/3$]
  ),
  correct: 1,
  num: 1,
  de: "Phần Luyện Tập Diện Tích",
  loigiai: [
    Phương trình $x^2-2x=0 <=> x=0$ hoặc $x=2$. 
    $S = int_0^3 |x^2-2x| d x = abs(int_0^2 (x^2-2x) d x) + abs(int_2^3 (x^2-2x) d x) = |-4/3| + |4/3| = 8/3$.
  ]
)

#lt-tn(
  [Cho hai hàm số $y=x^3$ và $y=x$. Diện tích hình phẳng giới hạn bởi hai đồ thị hàm số này là:],
  (
    [$1/4$],
    [$1/2$],
    [$0$],
    [$1$]
  ),
  correct: 2,
  num: 2,
  de: "Phần Luyện Tập Diện Tích",
  loigiai: [
    PT hoành độ giao điểm: $x^3 - x = 0 <=> x=-1, x=0, x=1$.
    Đề không cho cận, lấy cận nhỏ nhất và lớn nhất là $a=-1, b=1$.
    $S = int_{-1}^1 |x^3 - x| d x = abs(int_{-1}^0 (x^3-x) d x) + abs(int_0^1 (x^3-x) d x) = |1/4| + |-1/4| = 1/2$.
  ]
)

#lt-tn(
  [Tính diện tích phần gạch chéo giới hạn bởi đường cong $y=sin x$ và trục $O x$ trong khoảng từ $x=0$ đến $x=2pi$.],
  (
    [$0$],
    [$2$],
    [$4$],
    [$pi$]
  ),
  correct: 3,
  num: 3,
  de: "Phần Luyện Tập Diện Tích",
  loigiai: [
    $sin x = 0 <=> x = pi$ (trên đoạn $[0; 2pi]$).
    $S = int_0^(2pi) |sin x| d x = int_0^pi sin x d x - int_pi^(2pi) sin x d x = 2 - (-2) = 4$.
  ]
)

#lt-tn(
  [Tại sao trong công thức diện tích $S = int_a^b |f(x)| d x$, ta *BẮT BUỘC* phải có dấu trị tuyệt đối?],
  (
    [Để kết quả luôn luôn là số dương, phù hợp với bản chất diện tích hình học.],
    [Để phép tính không bị lỗi cú pháp.],
    [Để đồ thị hàm số trở thành đường thẳng.],
    [Vì máy tính Casio yêu cầu như vậy.]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập Diện Tích",
  loigiai: [
    Nếu không có trị tuyệt đối, phần đồ thị nằm dưới trục hoành sẽ cho kết quả âm, triệt tiêu với phần nằm trên, dẫn đến kết quả sai lệch hoặc bằng 0.
  ]
)

#lt-tn(
  [Diện tích hình phẳng giới hạn bởi đường thẳng $y=x$ và Parabol $y=x^2-2$ là:],
  (
    [$9/2$],
    [$3/2$],
    [$2/3$],
    [$5/2$]
  ),
  correct: 1,
  num: 5,
  de: "Phần Luyện Tập Diện Tích",
  loigiai: [
    PT: $x^2-2 = x <=> x^2-x-2 = 0 <=> x=-1$ hoặc $x=2$.
    $S = int_{-1}^2 |x^2-x-2| d x = abs((x^3/3 - x^2/2 - 2x) |_{-1}^2) = abs(-10/3 - 7/6) = |-27/6| = 9/2$.
  ]
)
