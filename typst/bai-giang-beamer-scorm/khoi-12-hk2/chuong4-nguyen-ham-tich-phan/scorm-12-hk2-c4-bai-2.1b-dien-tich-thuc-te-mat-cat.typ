// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C4-BÀI 2.1B: ỨNG DỤNG TÍCH PHÂN - DIỆN TÍCH MÔ HÌNH HOÁ
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2.1B: DIỆN TÍCH MÔ HÌNH HOÁ",
  subtitle:    "Thiết kế Cổng Parabol & Đo đạc công trình",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Bài toán Cổng Trường Đại Học")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Thực tế Kiến trúc:]
    
    Trường Đại học Bách Khoa dự định xây một cái cổng chào hình Parabol. Cổng cao 8 mét và chân cổng rộng 8 mét. Nhà thầu cần tính chính xác diện tích mặt trước của cổng để đặt mua kính cường lực.
    
    *Làm sao để tính diện tích khi đây không phải là hình chữ nhật hay tam giác vuông vức?*
    => *Giải pháp:* Gắn hệ trục toạ độ $O x y$ vào cánh cổng, viết phương trình đường Parabol $y = a x^2 + b x + c$, và dùng Tích phân để quét toàn bộ diện tích!
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Phương pháp Mô hình hoá Toạ độ")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *4 Bước Cốt Lõi để Tính Diện tích Công trình:*
    1. *Gắn trục Toạ độ $O x y$:* Chọn gốc toạ độ $O$ tại vị trí thông minh nhất (thường là đỉnh cổng, tâm của đáy, hoặc một mép góc).
    2. *Xác định toạ độ các điểm:* Dựa vào chiều cao, chiều rộng của công trình.
    3. *Lập phương trình hàm số:* Tìm $a, b, c$ của Parabol hoặc phương trình của đường cong tương ứng (Elip, đường bậc 3...).
    4. *Thiết lập Tích phân:* 
       $ S = integral_A^B |f(x) - g(x)| d x $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Giải quyết Bài toán Cổng Bách Khoa")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Bước 1 & 2:* Gắn $O$ tại chính giữa đáy cổng. Khi đó đáy trải từ $x = -4$ đến $x = 4$ (rộng 8m). Đỉnh cổng nằm trên trục tung có toạ độ $(0; 8)$ (cao 8m).
    
    *Bước 3: Lập phương trình Parabol*
    Dạng $y = a x^2 + b x + c$. 
    - Đỉnh tại trục tung => $b = 0$.
    - Đi qua đỉnh $(0; 8) => c = 8$.
    - Đi qua chân $(-4; 0) => a(-4)^2 + 8 = 0 <=> 16a = -8 <=> a = -1/2$.
    => Phương trình vòm cổng: $f(x) = -1/2 x^2 + 8$.
    
    *Bước 4: Tính diện tích*
    $ S = integral_{-4}^4 (-1/2 x^2 + 8) d x = [-1/6 x^3 + 8x]_{-4}^4 = 128/3 approx 42.67 " m"^2 $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Tại sao trong các bài toán thực tế (cổng chào, gầm cầu), ta thường chọn gốc toạ độ $O$ tại trung điểm của đáy công trình hoặc đỉnh của nó thay vì một góc ngẫu nhiên?],
  (
    [Để Parabol có tính đối xứng qua trục tung (hàm số chẵn), giúp phương trình đơn giản đi rất nhiều (khuyết hệ số $b$).],
    [Để Tích phân luôn ra số dương.],
    [Để không phải dùng máy tính Casio.],
    [Vì công trình luôn được xây dựng hướng về hướng Bắc.]
  ),
  correct: 1,
  num: 1,
  de: "Phần Luyện Tập Mô Hình Hoá",
  loigiai: [
    Khi gốc toạ độ là tâm đối xứng (như trung điểm đáy), thì Parabol sẽ nhận trục $O y$ làm trục đối xứng. Phương trình sẽ có dạng $y = a x^2 + c$, triệt tiêu được $b x$, giúp việc tìm hệ số $a, c$ cực kỳ nhanh và chính xác.
  ]
)

#lt-tn(
  [Ông An có một mảnh vườn hình Elip, độ dài trục lớn là $10m$, trục bé là $6m$. Ông định trồng hoa hồng trên mảnh vườn này. Phương trình Elip (khi đặt tâm tại gốc toạ độ) là $x^2 / 25 + y^2 / 9 = 1$. Phần nửa trên của mảnh vườn có phương trình đồ thị là gì?],
  (
    [$y = 3 sqrt(1 - x^2/25)$],
    [$y = 9 - x^2/25$],
    [$y = sqrt(25 - x^2)$],
    [$y = 5 sqrt(1 - x^2/9)$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Thiết Kế Vườn",
  loigiai: [
    Từ $x^2 / 25 + y^2 / 9 = 1 <=> y^2 / 9 = 1 - x^2 / 25 <=> y^2 = 9(1 - x^2/25)$.
    Suy ra nửa trên (phần dương) là $y = sqrt(9(1 - x^2/25)) = 3 sqrt(1 - x^2/25)$.
  ]
)

#lt-tn(
  [Diện tích một hình Elip có nửa trục lớn là $a$, nửa trục bé là $b$ được tính theo công thức S = $pi a b$. Áp dụng vào mảnh vườn của ông An (trục lớn $10m => a=5$; trục bé $6m => b=3$). Diện tích vườn ông An là:],
  (
    [$15 pi (m^2)$],
    [$30 pi (m^2)$],
    [$60 pi (m^2)$],
    [$15 (m^2)$]
  ),
  correct: 1,
  num: 3,
  de: "Phần Luyện Tập Thiết Kế Vườn",
  loigiai: [
    $a = 10 / 2 = 5$; $b = 6 / 2 = 3$.
    Diện tích $S = pi a b = pi dot 5 dot 3 = 15pi approx 47.1 m^2$.
    *(Lưu ý: Có thể bấm máy tích phân $2 times integral_{-5}^5 3 sqrt(1 - x^2/25) d x$ để kiểm chứng, kết quả cũng sẽ ra $15pi$).*
  ]
)

#lt-tn(
  [Một kỹ sư thiết kế mặt cắt ngang của một kênh dẫn nước có dạng Parabol, miệng kênh rộng $6m$, sâu $3m$ ở chính giữa. Nếu mức nước cao $2m$ (tính từ đáy), làm sao để thiết lập tích phân tính DIỆN TÍCH mặt nước cắt ngang dòng chảy?],
  (
    [Chọn đỉnh Parabol ở đáy là gốc $O(0;0)$. Tìm PT Parabol $y = a x^2$. Cắt bởi đường $y=2$. Tích phân $integral_{-x_0}^{x_0} (2 - a x^2) d x$.],
    [Tích phân $integral_0^6 2 d x$.],
    [Tính thể tích khối tròn xoay quanh trục Ox.],
    [Tính diện tích tam giác.]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập Công Trình Thuỷ Lợi",
  loigiai: [
    Mô hình hoá tối ưu: Đặt $O(0;0)$ tại đáy kênh. Miệng kênh rộng 6, sâu 3 nghĩa là đỉnh đáy ở $(0;0)$ và đi qua $(3; 3), (-3; 3)$. 
    => $3 = a(3)^2 => a = 1/3 =>$ Parabol là $y = 1/3 x^2$.
    Mặt nước cao 2m là đường $y = 2$. Diện tích cắt ngang là phần hình học kẹp giữa đường thẳng $y=2$ và đồ thị $y = 1/3 x^2$. Công thức $S = integral (2 - 1/3 x^2) d x$ với cận là giao điểm.
  ]
)

#lt-tn(
  [Biết mặt cắt ngang phần chứa nước của kênh ở câu trên là $S = integral_{-sqrt(6)}^{sqrt(6)} (2 - 1/3 x^2) d x$. Diện tích này xấp xỉ bằng bao nhiêu?],
  (
    [$6.53 (m^2)$],
    [$12 (m^2)$],
    [$4.89 (m^2)$],
    [$2.44 (m^2)$]
  ),
  correct: 1,
  num: 5,
  de: "Phần Luyện Tập Công Trình Thuỷ Lợi",
  loigiai: [
    Tính tích phân: $integral_{-sqrt(6)}^{sqrt(6)} (2 - 1/3 x^2) d x$.
    Nguyên hàm: $F(x) = 2x - 1/9 x^3$.
    Thế cận $sqrt(6)$: $F(sqrt(6)) = 2sqrt(6) - 1/9 (6sqrt(6)) = 2sqrt(6) - 2/3 sqrt(6) = 4/3 sqrt(6)$.
    Thế cận $-sqrt(6)$: $F(-sqrt(6)) = - 4/3 sqrt(6)$.
    Diện tích = $4/3 sqrt(6) - (-4/3 sqrt(6)) = 8/3 sqrt(6) approx 6.53 m^2$.
  ]
)
