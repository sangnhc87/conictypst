// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 4.1: MẶT CẦU TRONG KHÔNG GIAN
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 4.1: PHƯƠNG TRÌNH MẶT CẦU",
  subtitle:    "Từ quả bóng đến Vùng phủ sóng Radar",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Vùng phủ sóng Radar")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Bài toán Quốc phòng:]
    
    Một trạm Radar phòng không đặt tại vị trí $I(a; b; c)$. Trạm radar này phát sóng điện từ đẳng hướng ra xung quanh với bán kính tối đa là $R$.
    
    Ranh giới phát hiện mục tiêu của radar tạo thành một *Mặt cầu*. Bất kỳ chiếc máy bay nào bay cắt qua vỏ của mặt cầu này đều sẽ bị phát hiện!
    
    *Vậy làm sao để viết được phương trình toán học mô tả chính xác ranh giới của vùng cảnh báo này?*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Phương trình Chính tắc của Mặt cầu")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    Mặt cầu $(S)$ tâm $I(a; b; c)$, bán kính $R$ ($R > 0$) gồm tập hợp tất cả các điểm $M(x; y; z)$ sao cho $I M = R$.
    
    Bình phương 2 vế của công thức khoảng cách, ta có *Phương trình chính tắc*:
    $ (x - a)^2 + (y - b)^2 + (z - c)^2 = R^2 $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Mẹo đọc nhanh:*
    Cho $(S): (x - 1)^2 + (y + 2)^2 + z^2 = 9$.
    - Lấy toạ độ tâm $I$: Đổi dấu các số trong ngoặc $=> I(1; -2; 0)$.
    - Lấy bán kính $R$: Căn bậc hai số bên phải $=> R = sqrt(9) = 3$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Phương trình Dạng Khai triển")[
  Nếu ta khai triển hằng đẳng thức của phương trình chính tắc, ta sẽ thu được:
  $ x^2 + y^2 + z^2 - 2a x - 2b y - 2c z + (a^2 + b^2 + c^2 - R^2) = 0 $
  
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Dạng tổng quát:*
    $ x^2 + y^2 + z^2 - 2a x - 2b y - 2c z + d = 0 $
    
    Để phương trình này thực sự là một mặt cầu, nó phải thỏa mãn điều kiện tồn tại bán kính:
    $ a^2 + b^2 + c^2 - d > 0 $
    
    Khi đó: 
    - Tâm $I(a; b; c)$ (Bằng cách lấy hệ số của $x, y, z$ *chia cho $-2$*).
    - Bán kính $R = sqrt(a^2 + b^2 + c^2 - d)$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Phân tích Chuyên Sâu")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Bài toán Nhận diện Mặt cầu]
    Trong các phương trình sau, phương trình nào là mặt cầu? Tìm tâm và bán kính nếu có.
    1) $x^2 + y^2 + z^2 + 4x - 2y + 6z - 2 = 0$
    2) $x^2 + y^2 + z^2 + 2x - 4y + 2z + 10 = 0$
    
    *Giải:*
    1) Tâm $I$: chia các hệ số cho $-2 => I(-2; 1; -3)$.
       Kiểm tra: $a^2+b^2+c^2-d = (-2)^2 + 1^2 + (-3)^2 - (-2) = 4 + 1 + 9 + 2 = 16 > 0$.
       => Là mặt cầu! Bán kính $R = sqrt(16) = 4$.
       
    2) Tâm $I$: chia cho $-2 => I(-1; 2; -1)$.
       Kiểm tra: $a^2+b^2+c^2-d = (-1)^2 + 2^2 + (-1)^2 - 10 = 1 + 4 + 1 - 10 = -4 < 0$.
       => Bán kính bị âm, nên đây *KHÔNG PHẢI* là mặt cầu (Đó là một tập hợp rỗng).
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Mặt cầu $(S): (x+1)^2 + (y-3)^2 + (z-2)^2 = 16$ có tâm $I$ và bán kính $R$ là:],
  (
    [$I(1; -3; -2), R=16$],
    [$I(-1; 3; 2), R=4$],
    [$I(-1; 3; 2), R=16$],
    [$I(1; -3; -2), R=4$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Mặt Cầu",
  loigiai: [
    Đổi dấu trong ngoặc để lấy tâm: $I(-1; 3; 2)$.
    Lấy căn bậc 2 số bên phải để lấy bán kính: $R = sqrt(16) = 4$.
  ]
)

#lt-tn(
  [Cho mặt cầu $(S): x^2 + y^2 + z^2 - 2x + 4y - 6z - 11 = 0$. Toạ độ tâm $I$ của mặt cầu là:],
  (
    [$(1; -2; 3)$],
    [$(-2; 4; -6)$],
    [$(-1; 2; -3)$],
    [$(1; 2; 3)$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Mặt Cầu",
  loigiai: [
    Lấy các hệ số của $x, y, z$ đem chia cho $-2$.
    $x_I = (-2)/(-2) = 1$; $y_I = 4/(-2) = -2$; $z_I = (-6)/(-2) = 3$.
    Vậy $I(1; -2; 3)$.
  ]
)

#lt-tn(
  [Bán kính $R$ của mặt cầu $(S): x^2 + y^2 + z^2 - 2x + 4y - 6z - 11 = 0$ (ở câu trên) là bao nhiêu?],
  (
    [$sqrt(11)$],
    [$11$],
    [$5$],
    [$25$]
  ),
  correct: 3,
  num: 3,
  de: "Phần Luyện Tập Mặt Cầu",
  loigiai: [
    Tâm $I(1; -2; 3)$, $d = -11$.
    $R = sqrt(a^2 + b^2 + c^2 - d) = sqrt(1^2 + (-2)^2 + 3^2 - (-11)) = sqrt(1 + 4 + 9 + 11) = sqrt(25) = 5$.
  ]
)

#lt-tn(
  [Phương trình nào sau đây KHÔNG PHẢI là phương trình mặt cầu?],
  (
    [$x^2 + y^2 + z^2 = 9$],
    [$x^2 + y^2 + z^2 - 2x = 0$],
    [$x^2 + y^2 + z^2 + 2x + 2y + 2z + 10 = 0$],
    [$2x^2 + 2y^2 + 2z^2 - 4x + 8y - 12z + 2 = 0$]
  ),
  correct: 3,
  num: 4,
  de: "Phần Luyện Tập Mặt Cầu",
  loigiai: [
    Kiểm tra đáp án C: Tâm $I(-1; -1; -1)$, $d=10$.
    $a^2+b^2+c^2-d = 1+1+1-10 = -7 < 0$. Do điều kiện âm nên không phải mặt cầu.
    (Lưu ý đáp án D có hệ số 2 ở đầu, ta phải chia 2 cho toàn bộ phương trình trước khi kiểm tra, và nó là mặt cầu chuẩn).
  ]
)

#lt-tn(
  [Một vệ tinh nhân tạo phát tín hiệu tạo thành một vùng phủ sóng hình mặt cầu $(S): x^2+y^2+z^2-4x+2y-20 = 0$ (đơn vị: 100km). Nếu một phi thuyền đi ngang qua điểm $M(4; -3; 2)$, phi thuyền có nằm trong vùng nhận được tín hiệu của vệ tinh không?],
  (
    [Có, vì $M$ nằm đúng trên bề mặt vỏ sóng.],
    [Có, vì $M$ nằm lọt thỏm bên trong mặt cầu sóng.],
    [Không, vì $M$ nằm bên ngoài mặt cầu sóng.],
    [M nằm tại vị trí vệ tinh.]
  ),
  correct: 2,
  num: 5,
  de: "Phần Luyện Tập Toán Thực Tế",
  loigiai: [
    Tâm vệ tinh $I(2; -1; 0)$, bán kính $R = sqrt(2^2 + (-1)^2 + 0^2 - (-20)) = sqrt(25) = 5$.
    Khoảng cách từ tâm đến $M$: $I M = sqrt((4-2)^2 + (-3 - (-1))^2 + (2-0)^2) = sqrt(2^2 + (-2)^2 + 2^2) = sqrt(12) approx 3.46$.
    Vì $I M = 3.46 < R = 5$, nên phi thuyền nằm *bên trong* vùng phủ sóng. (Sẽ nhận được tín hiệu mạnh).
  ]
)
