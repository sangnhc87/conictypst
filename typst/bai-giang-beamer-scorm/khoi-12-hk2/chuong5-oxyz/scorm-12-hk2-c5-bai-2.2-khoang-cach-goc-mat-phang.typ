// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 2.2: KHOẢNG CÁCH VÀ GÓC CỦA MẶT PHẲNG
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2.2: KHOẢNG CÁCH VÀ GÓC (OXYZ)",
  subtitle:    "Ứng dụng trong xây dựng và kiến trúc",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Bài toán Cần cẩu")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Đo đạc an toàn:]
    
    Một đầu cần cẩu đang treo lơ lửng tại điểm $M$. Bên dưới là một mái nhà có mặt phẳng nghiêng $(P)$. 
    
    Làm sao để hệ thống an toàn tính toán được *khoảng cách ngắn nhất* từ đầu cần cẩu xuống mái nhà, để đảm bảo không xảy ra va chạm?
    
    *Chìa khoá:* Khoảng cách ngắn nhất chính là độ dài đoạn vuông góc hạ từ $M$ xuống mặt phẳng $(P)$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Công thức Khoảng cách từ Điểm đến Mặt phẳng")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    Khoảng cách từ điểm $M_0 (x_0; y_0; z_0)$ đến mặt phẳng $(alpha): A x + B y + C z + D = 0$ được tính bằng:
    
    $ d(M_0, (alpha)) = (|A x_0 + B y_0 + C z_0 + D|) / sqrt(A^2 + B^2 + C^2) $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Mẹo ghi nhớ công thức:* 
    - *Tử số:* Lấy toạ độ điểm $M_0$ "thay thế" trực tiếp vào vế trái của phương trình mặt phẳng, và đóng mộc *Trị tuyệt đối* (vì khoảng cách không âm).
    - *Mẫu số:* Là độ dài của Vectơ pháp tuyến $arrow(n) = (A; B; C)$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Góc giữa hai Mặt phẳng")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Góc giữa 2 mặt phẳng bằng góc giữa 2 vectơ pháp tuyến của chúng.*
    
    Cho 2 mặt phẳng:
    - $(P)$ có VTPT $arrow(n_1) = (A_1; B_1; C_1)$
    - $(Q)$ có VTPT $arrow(n_2) = (A_2; B_2; C_2)$
    
    Gọi $phi$ là góc giữa $(P)$ và $(Q)$. ($0^circ <= phi <= 90^circ$).
    
    $ cos phi = (|arrow(n_1) dot arrow(n_2)|) / (|arrow(n_1)| dot |arrow(n_2)|) = (|A_1 A_2 + B_1 B_2 + C_1 C_2|) / (sqrt(A_1^2+B_1^2+C_1^2) dot sqrt(A_2^2+B_2^2+C_2^2)) $
  ]
  
  #v(0.5em)
  #text(style: "italic")[*Chú ý:* Góc giữa 2 mặt phẳng luôn $<= 90^circ$, nên tử số *bắt buộc* phải có trị tuyệt đối! (Khác với góc giữa 2 vectơ có thể tù).]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Phân tích Chuyên Sâu")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Bài toán thiết kế nhà kính]
    Mái nhà $(P)$ có phương trình: $2x - y + 2z - 5 = 0$. Mặt đất là mặt phẳng $(O x y)$. Tính góc nghiêng của mái nhà so với mặt đất.
    
    *Giải:*
    - VTPT của mái nhà $(P)$ là: $arrow(n_1) = (2; -1; 2)$.
    - Mặt đất $(O x y)$ có phương trình $z = 0$, VTPT là: $arrow(n_2) = (0; 0; 1)$.
    
    Áp dụng công thức:
    $ cos phi &= (|2(0) + (-1)(0) + 2(1)|) / (sqrt(2^2 + (-1)^2 + 2^2) dot sqrt(0^2 + 0^2 + 1^2)) \
              &= 2 / (sqrt(9) dot 1) = 2/3 $
    
    => $phi approx 48.19^circ$. Mái nhà dốc khoảng $48^circ$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Khoảng cách từ điểm $M(1; -2; 3)$ đến mặt phẳng $(P): 2x - y + 2z - 6 = 0$ bằng:],
  (
    [$4/3$],
    [$8/3$],
    [$4$],
    [$2$]
  ),
  correct: 1,
  num: 1,
  de: "Phần Luyện Tập Góc - Khoảng Cách",
  loigiai: [
    Tử: $|2(1) - (-2) + 2(3) - 6| = |2 + 2 + 6 - 6| = 4$.
    Mẫu: $sqrt(2^2 + (-1)^2 + 2^2) = sqrt(9) = 3$.
    Khoảng cách là $4/3$.
  ]
)

#lt-tn(
  [Khoảng cách từ gốc toạ độ $O$ đến mặt phẳng $(P): x + y + z - 3 = 0$ là:],
  (
    [$3$],
    [$sqrt(3)$],
    [$1$],
    [$3 sqrt(3)$]
  ),
  correct: 2,
  num: 2,
  de: "Phần Luyện Tập Góc - Khoảng Cách",
  loigiai: [
    Thế toạ độ $O(0;0;0)$: Tử = $|0 + 0 + 0 - 3| = 3$.
    Mẫu = $sqrt(1^2 + 1^2 + 1^2) = sqrt(3)$.
    Khoảng cách = $3 / sqrt(3) = sqrt(3)$.
  ]
)

#lt-tn(
  [Biết mặt phẳng $(P): 2x - y + 2z - 1 = 0$ và mặt phẳng $(Q): 2x - y + 2z + 5 = 0$ song song với nhau. Khoảng cách giữa hai mặt phẳng song song này là:],
  (
    [$2$],
    [$4/3$],
    [$6/3 = 2$],
    [Chưa có thông tin để tính]
  ),
  correct: 1,
  num: 3,
  de: "Phần Luyện Tập Góc - Khoảng Cách",
  loigiai: [
    Cách 1: Lấy điểm $M(0; -1; 0) in (P)$. Tính d(M, (Q)) = $|2(0) - (-1) + 2(0) + 5| / 3 = 6/3 = 2$.
    Cách 2: Công thức nhanh: $d = |D_1 - D_2| / sqrt(A^2+B^2+C^2) = |-1 - 5| / 3 = 2$.
  ]
)

#lt-tn(
  [Cosin của góc giữa hai mặt phẳng $(P): x - y = 0$ và $(Q): y - z = 0$ bằng:],
  (
    [$1/2$],
    [$-1/2$],
    [$0$],
    [$sqrt(2)/2$]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập Góc - Khoảng Cách",
  loigiai: [
    $arrow(n_1) = (1; -1; 0)$ và $arrow(n_2) = (0; 1; -1)$.
    $cos phi = (|1(0) + (-1)(1) + 0(-1)|) / (sqrt(2) dot sqrt(2)) = |-1| / 2 = 1/2$.
  ]
)

#lt-tn(
  [Khi tính góc giữa 2 mặt phẳng $(P)$ và $(Q)$, nếu ta lấy lộn công thức của góc giữa hai vectơ (thiếu trị tuyệt đối ở tử số) và ra kết quả $cos alpha = -0.5$. Vậy góc giữa hai mặt phẳng đó thực tế là:],
  (
    [$120^circ$],
    [$60^circ$],
    [$-60^circ$],
    [Không xác định]
  ),
  correct: 2,
  num: 5,
  de: "Phần Luyện Tập Góc - Khoảng Cách",
  loigiai: [
    Góc giữa 2 vectơ là $120^circ$ (góc tù). Nhưng góc giữa 2 mặt phẳng luôn là góc nhọn (hoặc vuông), tức là góc kề bù với nó: $180^circ - 120^circ = 60^circ$. Hoặc nếu có trị tuyệt đối thì $|-0.5| = 0.5 => 60^circ$.
  ]
)
