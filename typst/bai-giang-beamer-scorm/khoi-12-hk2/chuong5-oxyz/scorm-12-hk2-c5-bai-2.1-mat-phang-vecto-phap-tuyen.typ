// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 2.1: PHƯƠNG TRÌNH MẶT PHẲNG - VECTƠ PHÁP TUYẾN
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2.1: PHƯƠNG TRÌNH MẶT PHẲNG",
  subtitle:    "Vectơ pháp tuyến và Tích có hướng",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Làm sao để định vị một Mặt phẳng?")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Bản chất hình học:]
    
    Hãy tưởng tượng bạn cầm một tờ bìa cứng (mặt phẳng). Bạn cắm một chiếc đinh thẳng đứng xuyên qua tờ bìa đó. Chiếc đinh đó chính là *Vectơ pháp tuyến*!
    
    - Nếu bạn nghiêng chiếc đinh, tờ bìa sẽ nghiêng theo. 
    - Nếu bạn giữ nguyên chiếc đinh và trượt tờ bìa lên xuống dọc theo cây đinh, tờ bìa vẫn song song với vị trí cũ, chỉ khác *điểm đi qua*.
    
    *Vậy để "chốt" cứng một mặt phẳng duy nhất, ta cần: 1 Điểm neo (để không bị trượt) và 1 Vectơ pháp tuyến (để định hướng độ nghiêng).*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Phương trình Tổng quát Mặt phẳng")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Công thức chuẩn:*
    Mặt phẳng $(P)$ đi qua điểm $M_0 (x_0; y_0; z_0)$ và có vectơ pháp tuyến (VTPT) $arrow(n) = (A; B; C) eq.not arrow(0)$ có phương trình là:
    
    $ A(x - x_0) + B(y - y_0) + C(z - z_0) = 0 $
    
    Khai triển ra ta được dạng tổng quát: $A x + B y + C z + D = 0$.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Mẹo đọc nhanh:* 
    Nếu nhìn thấy phương trình $3x - 4y + 5z - 7 = 0$, ta lập tức "bắt" ngay được VTPT của nó là hệ số đứng trước x, y, z: $arrow(n) = (3; -4; 5)$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Tuyệt kỹ: Tích có hướng của 2 vectơ")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    Trong nhiều bài toán, ta không có sẵn chiếc đinh đứng (VTPT), mà chỉ có 2 vectơ "nằm bẹp" trên mặt phẳng (gọi là 2 Vectơ chỉ phương $arrow(u)$ và $arrow(v)$).
    
    *Giải pháp:* Dùng "Tích có hướng" (Ký hiệu $[arrow(u), arrow(v)]$).
    Kết quả của tích có hướng là một *vectơ mới, vuông góc với cả 2 vectơ ban đầu*. Và nó chính là VTPT ta cần tìm!
    
    $ arrow(n) = [arrow(u), arrow(v)] $
  ]
  
  #v(0.5em)
  #text(style: "italic")[*Ví dụ:* Mặt phẳng đi qua 3 điểm $A, B, C$ sẽ có VTPT là: $arrow(n) = [arrow(A B), arrow(A C)]$.]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Phân tích Chuyên Sâu")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Ví dụ: Viết phương trình mặt phẳng qua 3 điểm]
    Viết phương trình mặt phẳng $(P)$ đi qua 3 điểm: $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$.
    
    *Giải tự luận:*
    - Tính hai vectơ trên mặt phẳng: $arrow(A B) = (-1; 2; 0)$, $arrow(A C) = (-1; 0; 3)$.
    - Tính tích có hướng (VTPT): 
      $arrow(n) = [arrow(A B), arrow(A C)] = (2(3) - 0(0); 0(-1) - (-1)(3); (-1)0 - 2(-1)) = (6; 3; 2)$.
    - Phương trình $(P)$ đi qua $A(1;0;0)$ có VTPT $(6;3;2)$:
      $ 6(x - 1) + 3(y - 0) + 2(z - 0) = 0 <=> 6x + 3y + 2z - 6 = 0 $
      
    *(Lưu ý: Đây chính là phương trình mặt phẳng theo đoạn chắn $x/1 + y/2 + z/3 = 1$)*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Vectơ nào dưới đây là một vectơ pháp tuyến của mặt phẳng $(P): 2x - y + 5z - 4 = 0$?],
  (
    [$(2; 1; 5)$],
    [$(2; -1; 5)$],
    [$(-2; 1; 5)$],
    [$(2; -1; -4)$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Mặt Phẳng",
  loigiai: [
    Hệ số trước $x, y, z$ lần lượt là $2; -1; 5$. Do đó $arrow(n) = (2; -1; 5)$.
  ]
)

#lt-tn(
  [Phương trình mặt phẳng đi qua điểm $M(1; -2; 3)$ và có vectơ pháp tuyến $arrow(n) = (2; 0; -1)$ là:],
  (
    [$2x - z - 5 = 0$],
    [$2x - z + 1 = 0$],
    [$2x - y + 3z = 0$],
    [$x - 2y + 3z - 14 = 0$]
  ),
  correct: 2,
  num: 2,
  de: "Phần Luyện Tập Mặt Phẳng",
  loigiai: [
    Áp dụng công thức: $2(x - 1) + 0(y - (-2)) - 1(z - 3) = 0 <=> 2x - 2 - z + 3 = 0 <=> 2x - z + 1 = 0$.
  ]
)

#lt-tn(
  [Hai mặt phẳng $(P): x + 2y - z + 3 = 0$ và $(Q): 2x + 4y - 2z - 5 = 0$ có vị trí tương đối như thế nào với nhau?],
  (
    [Cắt nhau.],
    [Vuông góc với nhau.],
    [Song song với nhau.],
    [Trùng nhau.]
  ),
  correct: 3,
  num: 3,
  de: "Phần Luyện Tập Mặt Phẳng",
  loigiai: [
    Lập tỉ lệ: $1/2 = 2/4 = (-1)/(-2) eq.not 3/(-5)$. Hai vectơ pháp tuyến cùng phương nhưng $D eq.not D'$, do đó hai mặt phẳng song song.
  ]
)

#lt-tn(
  [Một mặt phẳng $(P)$ chứa hai vectơ không cùng phương $arrow(u)$ và $arrow(v)$. Tích có hướng $[arrow(u), arrow(v)]$ sẽ sinh ra một vectơ $arrow(w)$. Khẳng định nào sau đây là mô tả ĐÚNG bản chất của $arrow(w)$?],
  (
    [$arrow(w)$ nằm trên mặt phẳng $(P)$.],
    [$arrow(w)$ vuông góc với mọi đường thẳng nằm trên $(P)$.],
    [$arrow(w)$ là vectơ chỉ phương của $(P)$.],
    [$arrow(w)$ tạo với $(P)$ một góc 45 độ.]
  ),
  correct: 2,
  num: 4,
  de: "Phần Luyện Tập Mặt Phẳng",
  loigiai: [
    Tích có hướng sinh ra vectơ vuông góc với cả $arrow(u)$ và $arrow(v)$, do đó nó vuông góc với cả mặt phẳng $(P)$. Vectơ vuông góc với mặt phẳng thì sẽ vuông góc với mọi đường thẳng trên mặt phẳng đó.
  ]
)

#lt-tn(
  [Mặt phẳng toạ độ $(O x z)$ có phương trình là gì?],
  (
    [$x = 0$],
    [$z = 0$],
    [$x = z$],
    [$y = 0$]
  ),
  correct: 4,
  num: 5,
  de: "Phần Luyện Tập Mặt Phẳng",
  loigiai: [
    Mặt phẳng $(O x z)$ chứa trục $O x$ và trục $O z$. Nó vuông góc với trục $O y$. 
    Nghĩa là mọi điểm trên mặt phẳng này đều có tung độ bằng $0$. Phương trình là $y = 0$.
  ]
)
