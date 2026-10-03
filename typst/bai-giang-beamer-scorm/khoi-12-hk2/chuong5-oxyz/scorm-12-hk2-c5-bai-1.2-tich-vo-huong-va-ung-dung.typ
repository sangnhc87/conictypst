// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 1.2: TÍCH VÔ HƯỚNG VÀ ỨNG DỤNG (OXYZ)
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 1.2: TÍCH VÔ HƯỚNG VÀ ỨNG DỤNG",
  subtitle:    "Đo đạc khoảng cách và góc nhìn trong Không gian 3D",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Góc mù của Radar")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Bài toán Hàng không:]
    
    Một đài kiểm soát không lưu phát hiện hai máy bay. Máy bay A bay theo hướng vectơ $arrow(u)$, máy bay B bay theo hướng vectơ $arrow(v)$.
    
    Làm thế nào để hệ thống tính toán được *góc giữa hai hướng bay* này một cách chớp nhoáng để cảnh báo va chạm, chỉ bằng các dãy số toạ độ truyền về?
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp: Tích vô hướng]
  
  Công cụ "Tích vô hướng" là phép toán kết nối kỳ diệu giữa toạ độ đại số (những con số vô hồn) và hình học không gian (góc, độ dài). Nó là trái tim của mọi phần mềm dẫn đường 3D!
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Công thức Tích vô hướng và Độ dài")[
  Cho $arrow(u) = (x_1; y_1; z_1)$ và $arrow(v) = (x_2; y_2; z_2)$.
  
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *1. Tích vô hướng (Hoành nhân hoành + Tung nhân tung + Cao nhân cao):*
    $ arrow(u) dot arrow(v) = x_1 x_2 + y_1 y_2 + z_1 z_2 $
    (Kết quả của phép nhân này là một SỐ THỰC, không phải là vectơ).
    
    *Hệ quả cực kỳ quan trọng:* Hai vectơ vuông góc khi và chỉ khi Tích vô hướng bằng $0$.
    $ arrow(u) perp arrow(v) <=> arrow(u) dot arrow(v) = 0 $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *2. Độ dài vectơ (Pythagore trong không gian 3D):*
    $ |arrow(u)| = sqrt(x_1^2 + y_1^2 + z_1^2) $
    
    *Khoảng cách giữa hai điểm* $A(x_A; y_A; z_A)$ và $B(x_B; y_B; z_B)$:
    $ A B = |arrow(A B)| = sqrt((x_B - x_A)^2 + (y_B - y_A)^2 + (z_B - z_A)^2) $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Tính Góc và Ứng dụng Vật lý")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *1. Góc giữa hai vectơ:*
    Từ công thức định nghĩa tích vô hướng $arrow(u) dot arrow(v) = |arrow(u)| |arrow(v)| cos(arrow(u), arrow(v))$, ta suy ra:
    $ cos(arrow(u), arrow(v)) = (arrow(u) dot arrow(v)) / (|arrow(u)| dot |arrow(v)|) = (x_1 x_2 + y_1 y_2 + z_1 z_2) / (sqrt(x_1^2 + y_1^2 + z_1^2) dot sqrt(x_2^2 + y_2^2 + z_2^2)) $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt, width: 100%)[
    #text(weight: "bold", fill: rgb("#334155"))[2. Ứng dụng: Tính Công của lực]
    Trong Vật lý, khi một lực $arrow(F)$ (không đổi) tác dụng lên một vật làm vật dịch chuyển theo một độ dời $arrow(s)$ (từ A đến B), Công sinh ra được tính bằng:
    $ A = arrow(F) dot arrow(s) = arrow(F) dot arrow(A B) $
    *(Công là tích vô hướng của Lực và Độ dời!)*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Phân tích Chuyên Sâu")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#166534"))[Ví dụ: Drone giao hàng]
    Một chiếc Drone nâng một kiện hàng thẳng đứng từ điểm $A(1; 2; 0)$ (mặt đất) lên sân thượng điểm $B(1; 2; 50)$ (cao 50m). Lực nâng của Drone tác dụng lên kiện hàng là vectơ $arrow(F) = (0; 0; 200)$ (Đơn vị Newton). Tính công do lực nâng này sinh ra.
    
    *Giải:*
    - Độ dời của kiện hàng là vectơ: $arrow(A B) = (0; 0; 50)$.
    - Công của lực nâng:
      $ A = arrow(F) dot arrow(A B) = 0 dot 0 + 0 dot 0 + 200 dot 50 = 10 000 (J) $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Cho hai vectơ $arrow(u) = (1; 2; -3)$ và $arrow(v) = (-2; 0; 4)$. Tích vô hướng $arrow(u) dot arrow(v)$ bằng:],
  (
    [$-14$],
    [$-10$],
    [$10$],
    [$-2$]
  ),
  correct: 1,
  num: 1,
  de: "Phần Luyện Tập Oxyz",
  loigiai: [
    $arrow(u) dot arrow(v) = 1(-2) + 2(0) + (-3)(4) = -2 + 0 - 12 = -14$.
  ]
)

#lt-tn(
  [Khoảng cách từ điểm $M(3; 4; 0)$ đến gốc toạ độ $O(0; 0; 0)$ là:],
  (
    [$7$],
    [$25$],
    [$5$],
    [$12$]
  ),
  correct: 3,
  num: 2,
  de: "Phần Luyện Tập Oxyz",
  loigiai: [
    $O M = sqrt(3^2 + 4^2 + 0^2) = sqrt(9 + 16) = sqrt(25) = 5$.
  ]
)

#lt-tn(
  [Hai vectơ $arrow(u) = (m; 1; -2)$ và $arrow(v) = (2; -4; 1)$ vuông góc với nhau khi $m$ bằng bao nhiêu?],
  (
    [$1$],
    [$3$],
    [$-3$],
    [$2$]
  ),
  correct: 2,
  num: 3,
  de: "Phần Luyện Tập Oxyz",
  loigiai: [
    $arrow(u) perp arrow(v) <=> arrow(u) dot arrow(v) = 0 <=> m(2) + 1(-4) + (-2)(1) = 0 <=> 2m - 6 = 0 <=> m = 3$.
  ]
)

#lt-tn(
  [Cho ba điểm $A(1; 0; 0)$, $B(0; 1; 0)$, $C(0; 0; 1)$. Cosin của góc $angle B A C$ là:],
  (
    [$1/2$],
    [$-1/2$],
    [$0$],
    [$1/3$]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập Oxyz",
  loigiai: [
    Ta có $arrow(A B) = (-1; 1; 0)$ và $arrow(A C) = (-1; 0; 1)$.
    Tích vô hướng: $arrow(A B) dot arrow(A C) = 1$. Độ dài: $A B = sqrt(2)$, $A C = sqrt(2)$.
    $cos(angle B A C) = cos(arrow(A B), arrow(A C)) = 1 / (sqrt(2) dot sqrt(2)) = 1/2$.
    *(Góc thực tế là $60^circ$)*
  ]
)

#lt-tn(
  [Một con tàu vũ trụ di chuyển theo một đường thẳng với vectơ độ dời $arrow(s) = (100; 200; 50)$ (km) nhờ một lực đẩy $arrow(F) = (2; 1; 0)$ (tấn). Công sinh ra là $A = 400$. Khẳng định nào sau đây diễn tả đúng bản chất vật lý của công sinh ra trong trường hợp này?],
  (
    [Toàn bộ lực đẩy đều đóng góp vào việc sinh công.],
    [Thành phần lực đẩy theo phương Z không sinh công, do tàu không được đẩy theo hướng đó mặc dù tàu vẫn dịch chuyển lên.],
    [Công phụ thuộc vào bình phương của vận tốc tàu.],
    [Công là một vectơ có hướng chỉ đường bay của tàu.]
  ),
  correct: 2,
  num: 5,
  de: "Phần Luyện Tập Oxyz",
  loigiai: [
    Vectơ lực $arrow(F)$ có toạ độ $Z = 0$, nghĩa là động cơ không tạo lực đẩy nào đẩy theo phương thẳng đứng. Thành phần dịch chuyển $Z = 50$ của $arrow(s)$ có thể do quán tính, nhưng nó không được trợ lực bởi $arrow(F)$, nên không có công theo phương Z ($F_z dot s_z = 0 dot 50 = 0$).
  ]
)
