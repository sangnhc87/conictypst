// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C4-BÀI 2.2: TÍCH PHÂN - ĐỔI BIẾN SỐ VÀ TỪNG PHẦN
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2.2: KỸ THUẬT TÍNH TÍCH PHÂN",
  subtitle:    "Đổi biến số & Từng phần",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Tích phân bằng Đổi biến số (Quy tắc sinh tồn)")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[⚠️ QUY TẮC SINH TỒN: ĐỔI BIẾN PHẢI ĐỔI CẬN!]
    
    Khi giải Nguyên hàm bằng đổi biến $t=u(x)$, ta phải trả lại biến $x$ ở bước cuối cùng. 
    Nhưng với Tích phân, vì kết quả cuối cùng là một "con số", ta *KHÔNG CẦN* trả lại biến $x$. Thay vào đó, ta sẽ *đổi luôn cận* của bài toán từ $x$ sang $t$ ngay từ đầu!
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Quy trình 3 bước:]
  - *Bước 1:* Đặt $t = u(x) =>$ Tính vi phân $d t = u'(x) d x$.
  - *Bước 2 (Quan trọng):* Đổi cận. 
    - Khi $x = a => t = u(a)$.
    - Khi $x = b => t = u(b)$.
  - *Bước 3:* Chuyển hoàn toàn bài toán sang thế giới của biến $t$:
    $ int_a^b f(u(x)) u'(x) d x = int_(u(a))^(u(b)) f(t) d t $
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Ví dụ Tích phân Đổi biến")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Ví dụ:* Tính $I = int_0^1 x e^(x^2) d x$.
    
    *Giải:*
    - *Đặt ẩn & Vi phân:* Đặt $t = x^2 => d t = 2x d x => x d x = (d t)/2$.
    - *Đổi cận:*
      + Khi $x = 0 => t = 0^2 = 0$.
      + Khi $x = 1 => t = 1^2 = 1$.
    - *Thế vào biểu thức:*
      $I = int_0^1 e^t (d t)/2 = 1/2 int_0^1 e^t d t = 1/2 (e^t) |_0^1 = 1/2 (e^1 - e^0) = (e - 1)/2$.
      
    *(Lưu ý: Sau khi thế cận, ta ra thẳng đáp số mà không hề phải viết lại chữ $x$.)*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Tích phân Từng phần")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Công thức:*
    $ int_a^b u d v = (u v) |_a^b - int_a^b v d u $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Lưu ý:* 
    - Cận được gắn ngay vào phần $u v$ (tính ra số) và phần nguyên hàm mới $int v d u$.
    - Chiến thuật chọn $u$ vẫn giữ nguyên như cũ: *Nhất Lô, Nhì Đa, Tam Lượng, Tứ Mũ*.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Tích phân Từng phần")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    *Ví dụ:* Tính $J = int_1^e x ln x d x$.
    
    *Giải:* (Gặp Đa và Lô $=>$ Ưu tiên Lô làm $u$).
    - Đặt $cases(u = ln x, d v = x d x) => cases(d u = 1/x d x, v = x^2/2)$.
    
    - Áp dụng công thức:
      $J = ((x^2 ln x)/2) |_1^e - int_1^e (x^2)/2 dot 1/x d x$
      $J = ((e^2 ln e)/2 - (1^2 ln 1)/2) - int_1^e x/2 d x$
      $J = e^2/2 - (x^2/4) |_1^e$
      $J = e^2/2 - (e^2/4 - 1/4) = e^2/2 - e^2/4 + 1/4 = e^2/4 + 1/4$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Để tính $I = int_0^2 2x sqrt(x^2+5) d x$, nếu đặt $t = sqrt(x^2+5)$ thì ta thu được tích phân nào dưới đây?],
  (
    [$int_0^2 2t^2 d t$],
    [$int_sqrt(5)^3 2t^2 d t$],
    [$int_sqrt(5)^3 t^2 d t$],
    [$int_5^9 t d t$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Chuyên Sâu",
  loigiai: [
    Đặt $t = sqrt(x^2+5) => t^2 = x^2+5 => 2t d t = 2x d x$.
    Đổi cận: $x=0 => t=sqrt(5)$; $x=2 => t=sqrt(9)=3$.
    $I = int_sqrt(5)^3 t (2t d t) = int_sqrt(5)^3 2t^2 d t$.
  ]
)

#lt-tn(
  [Tính $I = int_0^(pi/2) sin x dot cos x d x$. (Gợi ý: Đặt $t = sin x$). Kết quả là:],
  (
    [$1/2$],
    [$-1/2$],
    [$1$],
    [$0$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Chuyên Sâu",
  loigiai: [
    Đặt $t = sin x => d t = cos x d x$.
    Đổi cận: $x=0 => t=0$; $x=pi/2 => t=1$.
    $I = int_0^1 t d t = (t^2/2)|_0^1 = 1/2$.
  ]
)

#lt-tn(
  [Áp dụng phương pháp từng phần để tính $I = int_0^1 x e^x d x$. Kết quả là:],
  (
    [$1$],
    [$e$],
    [$e-1$],
    [$0$]
  ),
  correct: 1,
  num: 3,
  de: "Phần Luyện Tập Chuyên Sâu",
  loigiai: [
    Đặt $u = x, d v = e^x d x => d u = d x, v = e^x$.
    $I = (x e^x)|_0^1 - int_0^1 e^x d x = (1 dot e^1 - 0) - (e^x)|_0^1 = e - (e^1 - e^0) = e - e + 1 = 1$.
  ]
)

#lt-tn(
  [Sai lầm nào sau đây thường gặp nhất khi học sinh làm bài Tích phân đổi biến số?],
  (
    [Quên đổi cận.],
    [Quên tính vi phân.],
    [Chọn sai ẩn $t$.],
    [Quên nhân với hằng số.]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập Chuyên Sâu",
  loigiai: [
    "Quên đổi cận" là sai lầm phổ biến nhất và nghiêm trọng nhất khiến bài toán sai hoàn toàn, vì miền tính diện tích bị biến dạng nếu không đồng bộ giữa biến và cận.
  ]
)

#lt-tn(
  [Biết $int_0^3 f(x) d x = 12$. Tính $I = int_0^1 f(3x) d x$.],
  (
    [$12$],
    [$4$],
    [$36$],
    [$3$]
  ),
  correct: 2,
  num: 5,
  de: "Phần Luyện Tập Chuyên Sâu",
  loigiai: [
    Đặt $t = 3x => d t = 3 d x => d x = 1/3 d t$.
    Đổi cận: $x=0 => t=0$; $x=1 => t=3$.
    $I = int_0^3 f(t) dot 1/3 d t = 1/3 int_0^3 f(x) d x = 1/3 (12) = 4$.
  ]
)
