// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C6-BÀI 1.1: XÁC SUẤT CÓ ĐIỀU KIỆN
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 1.1: XÁC SUẤT CÓ ĐIỀU KIỆN",
  subtitle:    "Khi thông tin mới làm thay đổi niềm tin",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Trò chơi Đổ Xúc Xắc")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Tình huống:]
    
    Bạn tung một viên xúc xắc 6 mặt cân đối. Xác suất để bạn tung được mặt 6 chấm là bao nhiêu?
    Chắc chắn là $1/6$.
    
    Tuy nhiên, giả sử người bạn của bạn nhìn trộm viên xúc xắc vừa tung và nói nhỏ: *"Tớ không biết chính xác là số mấy, nhưng chắc chắn nó là MỘT SỐ CHẴN!"*.
    
    Lúc này, xác suất để mặt ngửa là số 6 có còn là $1/6$ nữa không?
    *KHÔNG!* Vì bạn đã biết nó là số chẵn ($2, 4, 6$), nên xác suất để nó là số 6 đã tăng lên thành $1/3$!
    
    => *Đó chính là Xác suất có điều kiện!*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Công thức Xác suất có điều kiện")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    Xác suất của biến cố $A$ với điều kiện biến cố $B$ đã xảy ra, ký hiệu là $P(A|B)$, được tính bằng công thức:
    
    $ P(A|B) = (P(A B)) / (P(B)) $
    
    *(Điều kiện $P(B) > 0$)*
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Bản chất:* 
    Không gian mẫu ban đầu $Omega$ đã bị *thu hẹp* lại chỉ còn lại tập $B$ (vì $B$ đã chắc chắn xảy ra). 
    Do đó, để biến cố $A$ xảy ra, nó bắt buộc phải xảy ra phần chung của $A$ và $B$ (tức là giao $A B$).
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Từ Công thức đến Thực tế")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    Thay vì dùng $P(A B) / P(B)$, trong thực tế ta thường đếm số phần tử:
    
    $ P(A|B) = (n(A B)) / (n(B)) $
    
    *Ví dụ xúc xắc ở phần khởi động:*
    - $B$: "Ra mặt chẵn" $=> B = {2, 4, 6} => n(B) = 3$.
    - $A$: "Ra mặt 6" $=> A = {6}$.
    - $A B$: "Vừa ra mặt 6 vừa là chẵn" $=> A B = {6} => n(A B) = 1$.
    - $P(A|B) = n(A B) / n(B) = 1 / 3$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Phân tích Chuyên Sâu")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Bài toán Rút bài]
    Rút ngẫu nhiên 1 lá bài từ bộ 52 lá. Biết rằng lá rút ra là một lá Bích (Spade). Tính xác suất để lá đó là lá Át (Ace).
    
    *Phân tích:*
    - Không gian mẫu thu hẹp: Thay vì 52 lá, ta chỉ còn quan tâm đến 13 lá Bích (vì đã biết chắc nó là Bích). 
      => $n(B) = 13$.
    - Trong 13 lá Bích đó, có bao nhiêu lá Át? Chỉ có 1 lá (Át Bích).
      => $n(A B) = 1$.
    
    *Kết quả:* $P("Át" | "Bích") = 1 / 13$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Ký hiệu $P(A|B)$ mang ý nghĩa gì?],
  (
    [Xác suất để cả $A$ và $B$ cùng xảy ra.],
    [Xác suất để $A$ xảy ra HOẶC $B$ xảy ra.],
    [Xác suất để $B$ xảy ra biết rằng $A$ đã xảy ra.],
    [Xác suất để $A$ xảy ra biết rằng $B$ đã xảy ra.]
  ),
  correct: 4,
  num: 1,
  de: "Phần Luyện Tập Lý Thuyết",
  loigiai: [
    Ký hiệu dấu gạch dọc "$|$" đọc là "biết rằng" hoặc "với điều kiện". 
    $P(A|B)$ là xác suất của $A$, với điều kiện $B$ đã xảy ra.
  ]
)

#lt-tn(
  [Cho $P(A) = 0.5$, $P(B) = 0.4$, $P(A B) = 0.2$. Tính $P(A|B)$.],
  (
    [$0.5$],
    [$0.4$],
    [$0.2$],
    [$0.1$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Công Thức",
  loigiai: [
    Áp dụng công thức: $P(A|B) = (P(A B)) / (P(B)) = 0.2 / 0.4 = 1/2 = 0.5$.
  ]
)

#lt-tn(
  [Cho $P(A) = 0.5$, $P(B) = 0.4$, $P(A B) = 0.2$. Tính $P(B|A)$.],
  (
    [$0.5$],
    [$0.4$],
    [$0.2$],
    [$0.1$]
  ),
  correct: 2,
  num: 3,
  de: "Phần Luyện Tập Công Thức",
  loigiai: [
    Áp dụng công thức: $P(B|A) = (P(A B)) / (P(A)) = 0.2 / 0.5 = 2/5 = 0.4$.
    (Lưu ý: $P(A B)$ cũng chính là $P(B A)$).
  ]
)

#lt-tn(
  [Gieo một đồng xu 2 lần liên tiếp. Biết rằng lần đầu tiên ra mặt Sấp (S). Xác suất để cả 2 lần đều ra mặt Sấp là bao nhiêu?],
  (
    [$1/4$],
    [$1/3$],
    [$1/2$],
    [$1$]
  ),
  correct: 3,
  num: 4,
  de: "Phần Luyện Tập Thực Tế",
  loigiai: [
    Không gian mẫu $Omega = {"SS", "SN", "NS", "NN"}$.
    Biến cố B (lần đầu Sấp) = ${"SS", "SN"} => n(B) = 2$.
    Biến cố A (Cả 2 lần Sấp) = ${"SS"} => A B = {"SS"} => n(A B) = 1$.
    $P(A|B) = 1 / 2$.
    (Giải thích trực quan: Lần 1 đã Sấp rồi, chỉ còn chờ lần 2 tung ra Sấp hay Ngửa, xác suất lần 2 là 50%).
  ]
)

#lt-tn(
  [Trong một hộp có 3 bi đỏ và 2 bi xanh. Rút ngẫu nhiên LẦN LƯỢT từng viên bi (KHÔNG HOÀN LẠI). Biết viên bi rút lần 1 là màu đỏ. Xác suất để viên bi rút lần 2 là màu xanh là bao nhiêu?],
  (
    [$2/5$],
    [$3/5$],
    [$2/4$ (hay $1/2$)],
    [$3/4$]
  ),
  correct: 3,
  num: 5,
  de: "Phần Luyện Tập Thực Tế",
  loigiai: [
    Rút không hoàn lại nghĩa là rút xong bỏ ra ngoài. 
    Lúc đầu có 5 bi (3 đỏ, 2 xanh).
    Đã rút 1 bi đỏ ra ngoài, trong hộp chỉ còn lại 4 bi (2 đỏ, 2 xanh).
    Vậy xác suất rút lần 2 được bi xanh là $2 / 4 = 1/2$.
  ]
)
