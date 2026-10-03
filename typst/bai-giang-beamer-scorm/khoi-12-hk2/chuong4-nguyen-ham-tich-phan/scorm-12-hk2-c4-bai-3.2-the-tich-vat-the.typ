// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C4-BÀI 3.2: ỨNG DỤNG TÍCH PHÂN - THỂ TÍCH
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 3.2: THỂ TÍCH VẬT THỂ & KHỐI TRÒN XOAY",
  subtitle:    "Từ công nghệ MRI đến nghệ thuật làm gốm",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Công nghệ chụp MRI")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Bản chất của hình ảnh Y khoa:]
    
    Máy MRI (Cộng hưởng từ) không thể chụp toàn bộ khối u trong não người cùng lúc. Thay vào đó, nó quét thành hàng nghìn "lát cắt" mỏng. Mỗi lát cắt có một diện tích $S(x)$ nhất định.
    
    *Làm thế nào máy tính có thể từ hàng nghìn diện tích lát cắt 2D này mà dựng lại được thể tích chính xác của khối u 3D?*
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp: Tích phân thể tích (Cắt lát)]
  
  Tương tự như tính diện tích bằng cách cộng các đoạn thẳng $d x$, ta có thể tính thể tích bằng cách cộng dồn tất cả các "lát cắt" có độ dày $d x$ và diện tích $S(x)$. Công thức $V = int S(x) d x$ chính là cốt lõi của công nghệ dựng hình 3D!
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Thể tích vật thể (Phương pháp mặt cắt)")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Công thức tính:*
    Giả sử một vật thể nằm giữa hai mặt phẳng vuông góc với trục $O x$ tại $x=a$ và $x=b$. 
    Nếu cắt vật thể bởi mặt phẳng tuỳ ý vuông góc với trục $O x$ tại hoành độ $x$ ($a <= x <= b$), ta được một thiết diện có diện tích là $S(x)$.
    
    Nếu hàm số $S(x)$ liên tục trên $[a; b]$, thể tích $V$ của vật thể được tính bởi:
    $ V = int_a^b S(x) d x $
  ]
  
  #v(0.5em)
  #text(style: "italic")[*Lưu ý:* $S(x)$ thường là các hình quen thuộc phụ thuộc vào $x$, ví dụ như hình vuông (cạnh theo $x$), tam giác đều, hoặc hình tròn.]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Khối tròn xoay (Bàn xoay làm gốm)")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Hình phẳng xoay quanh trục $O x$:*
    Khi thợ gốm quay một biên dạng cong $y = f(x)$ quanh trục ngang, tạo ra một chiếc bình. 
    Lúc này, mỗi lát cắt vuông góc với $O x$ chính là một *hình tròn* có bán kính $R = |f(x)|$.
    => Diện tích lát cắt: $S(x) = pi R^2 = pi [f(x)]^2$.
    
    *Công thức:*
    Thể tích khối tròn xoay tạo thành khi quay hình phẳng giới hạn bởi $y=f(x)$, trục $O x$ và $x=a, x=b$ quanh trục $O x$ là:
    
    $ V = pi int_a^b [f(x)]^2 d x $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Thực tế: Tính thể tích Quả dưa hấu")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    Một quả dưa hấu có hình dạng là một khối Ellipsoid, sinh ra khi quay nửa Elip $x^2/16 + y^2/9 = 1$ (với $y>=0$) xung quanh trục $O x$. Tính thể tích quả dưa hấu (đơn vị dm).
    
    *Giải:*
    Từ phương trình Elip: $y^2 = 9 (1 - x^2/16) = 9 - 9/16 x^2$.
    Giao điểm với $O x$ (khi $y=0$): $x^2 = 16 <=> x = -4, x = 4$.
    
    Áp dụng công thức khối tròn xoay:
    $ V &= pi int_{-4}^4 (9 - 9/16 x^2) d x \
      &= pi (9x - 3/16 x^3) |_{-4}^4 \
      &= pi [ (36 - 12) - (-36 + 12) ] \
      &= pi [ 24 - (-24) ] = 48 pi (d m^3) $
      
    Thể tích dưa hấu khoảng 150 lít (rất khổng lồ!).
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Phần vật thể giới hạn bởi hai mặt phẳng $x=0$ và $x=3$. Thiết diện cắt bởi mặt phẳng vuông góc với trục $O x$ tại hoành độ $x$ là một hình chữ nhật có hai kích thước là $x$ và $2 sqrt(9-x^2)$. Thể tích vật thể là:],
  (
    [$36$],
    [$18$],
    [$18 pi$],
    [$36 pi$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Thể Tích",
  loigiai: [
    $S(x) = x dot 2 sqrt(9-x^2) = 2x sqrt(9-x^2)$.
    $V = int_0^3 2x sqrt(9-x^2) d x$. Đặt $t = 9-x^2 => d t = -2x d x$.
    Đổi cận: $x=0 => t=9$; $x=3 => t=0$.
    $V = int_9^0 -sqrt(t) d t = int_0^9 t^(1/2) d t = (2/3 t^(3/2)) |_0^9 = 2/3 dot 27 = 18$.
  ]
)

#lt-tn(
  [Thể tích khối tròn xoay do hình phẳng giới hạn bởi các đường $y=sqrt(x)$, trục $O x$ và $x=4$ quay quanh $O x$ là:],
  (
    [$16 pi/3$],
    [$8 pi$],
    [$8$],
    [$16/3$]
  ),
  correct: 2,
  num: 2,
  de: "Phần Luyện Tập Thể Tích",
  loigiai: [
    Cận từ $0$ đến $4$.
    $V = pi int_0^4 (sqrt(x))^2 d x = pi int_0^4 x d x = pi (x^2/2) |_0^4 = 8 pi$.
  ]
)

#lt-tn(
  [Một học sinh viết công thức tính thể tích khối tròn xoay như sau: $V = int_a^b pi |f(x)| d x$. Công thức này SAI ở đâu?],
  (
    [Thiếu dấu bình phương ở $f(x)$.],
    [Dư chữ $pi$.],
    [Dấu trị tuyệt đối không cần thiết.],
    [Cả A và C đều đúng.]
  ),
  correct: 4,
  num: 3,
  de: "Phần Luyện Tập Thể Tích",
  loigiai: [
    Bản chất là diện tích hình tròn $pi R^2 = pi [f(x)]^2$. 
    Do có bình phương nên tự khắc nó dương, không cần và không được để trị tuyệt đối thay cho bình phương. Vậy A và C đều là lỗi.
  ]
)

#lt-tn(
  [Khi quay hình phẳng giới hạn bởi hai đường cong $y=f(x)$ và $y=g(x)$ (với $f(x) >= g(x) >= 0$) quanh trục $O x$, công thức tính thể tích là:],
  (
    [$V = pi int_a^b (f(x) - g(x))^2 d x$],
    [$V = pi int_a^b |f^2(x) - g^2(x)| d x$],
    [$V = pi^2 int_a^b (f(x) - g(x)) d x$],
    [$V = int_a^b |f(x) - g(x)| d x$]
  ),
  correct: 2,
  num: 4,
  de: "Phần Luyện Tập Thể Tích",
  loigiai: [
    Đây là khối tròn xoay "có lõi rỗng". 
    Thể tích là $V_("ngoài") - V_("trong") = pi int_a^b [f(x)]^2 d x - pi int_a^b [g(x)]^2 d x = pi int_a^b (f^2(x) - g^2(x)) d x$. 
    Bỏ vào trị tuyệt đối cho an toàn nếu không biết đường nào nằm trên.
  ]
)

#lt-tn(
  [Tính thể tích khối tròn xoay sinh ra khi quay hình phẳng giới hạn bởi $y=x^2$ và $y=x$ quanh trục $O x$.],
  (
    [$2 pi / 15$],
    [$pi / 3$],
    [$pi / 5$],
    [$pi / 15$]
  ),
  correct: 1,
  num: 5,
  de: "Phần Luyện Tập Thể Tích",
  loigiai: [
    PT hoành độ giao điểm: $x^2 = x <=> x=0, x=1$.
    $V = pi int_0^1 |x^2 - (x^2)^2| d x = pi int_0^1 (x^2 - x^4) d x = pi (x^3/3 - x^5/5) |_0^1 = pi (1/3 - 1/5) = (2pi)/15$.
  ]
)
