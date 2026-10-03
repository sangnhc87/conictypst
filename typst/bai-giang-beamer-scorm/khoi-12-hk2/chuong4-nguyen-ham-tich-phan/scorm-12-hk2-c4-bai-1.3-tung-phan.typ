// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C4-BÀI 1.3: PHƯƠNG PHÁP NGUYÊN HÀM TỪNG PHẦN
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 1.3: NGUYÊN HÀM TỪNG PHẦN",
  subtitle:    "Tuyệt chiêu xử lý hai hàm khác 'họ'",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Khi Đổi biến số 'bó tay'")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Vấn đề đặt ra:]
    
    Hãy xét bài toán tính nguyên hàm sau:
    $ int x e^x d x $
    
    - Có nhân phân phối được không? $=> "Không"$.
    - Đổi biến số $t = x$ được không? $=> "Vô ích (giữ nguyên hình dạng)"$.
    - Đổi biến số $t = e^x$ được không? $=> "Bế tắc vì dư ra chữ " x$.
    
    *Tại sao lại khó như vậy?* Vì $x$ (Đa thức) và $e^x$ (Mũ) thuộc hai "họ" hàm số hoàn toàn khác nhau. Chúng không có mối liên hệ đạo hàm với nhau!
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp: Từng phần]
  
  Dựa trên công thức đạo hàm của một tích: $(u v)' = u' v + u v'$, các nhà toán học đã lật ngược lại để tạo ra *Phương pháp Từng phần*, giúp chuyển một bài toán khó thành một bài toán dễ hơn.
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Công thức Nguyên hàm Từng phần")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Công thức chuẩn:*
    Nếu $u(x)$ và $v(x)$ là hai hàm số có đạo hàm liên tục, thì:
    $ int u d v = u v - int v d u $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Cách thực hiện:*
    Trong biểu thức $int f(x) d x$, ta chia $f(x) d x$ thành hai phần:
    - Một phần đặt là $u$ $=> "Đi tính Đạo hàm để tìm " d u$.
    - Phần còn lại đặt là $d v$ $=> "Đi tính Nguyên hàm để tìm " v$.
    
    *Mục tiêu:* Phải chọn $u$ và $d v$ sao cho cái nguyên hàm mới $int v d u$ trở nên dễ giải hơn cái nguyên hàm ban đầu $int u d v$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Chiến thuật ưu tiên: Nhất Lô - Nhì Đa - Tam Lượng - Tứ Mũ")[
  Để chọn $u$ chuẩn xác, ta ghi nhớ thứ tự ưu tiên chọn hàm $u$ từ trái sang phải như sau:
  
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 10pt,
    [
      #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 5pt, radius: 5pt, height: 100%)[
        #text(weight: "bold", fill: rgb("#b45309"))[1. Lôgic (Logarit)]
        $ln x$, $log_2 x$...
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 5pt, radius: 5pt, height: 100%)[
        #text(weight: "bold", fill: rgb("#166534"))[2. Đa (Đa thức)]
        $x$, $x^2 + 1$...
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 5pt, radius: 5pt, height: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"))[3. Lượng (Lượng giác)]
        $sin x$, $cos 2x$...
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#fecaca"), inset: 5pt, radius: 5pt, height: 100%)[
        #text(weight: "bold", fill: rgb("#991b1b"))[4. Mũ (Hàm Mũ)]
        $e^x$, $2^x$...
      ]
    ]
  )
  
  #v(0.5em)
  *Ví dụ cách chọn:* 
  - Gặp $int x e^x d x$: Chứa Đa thức ($x$) và Mũ ($e^x$). Đa ưu tiên hơn Mũ $=> "Đặt " u = x$, $d v = e^x d x$.
  - Gặp $int x^2 ln x d x$: Chứa Lô ($ln x$) và Đa ($x^2$). Lô ưu tiên hơn Đa $=> "Đặt " u = ln x$, $d v = x^2 d x$.
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Phân tích Chuyên Sâu")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#166534"))[Ví dụ 1: Đa thức x Mũ]
    Tính $I = int x e^x d x$
    
    *Giải:* Đặt $cases(u = x, d v = e^x d x)$ $=> cases(d u = 1 d x, v = e^x)$
    Áp dụng CT: $I = u v - int v d u$
    $I = x e^x - int e^x d x = x e^x - e^x + C = e^x (x - 1) + C$.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#1d4ed8"))[Ví dụ 2: Đa thức x Logarit]
    Tính $J = int x ln x d x$
    
    *Giải:* Đặt $cases(u = ln x, d v = x d x)$ $=> cases(d u = 1/x d x, v = x^2/2)$
    Áp dụng CT: $J = u v - int v d u$
    $J = (x^2 ln x)/2 - int (x^2)/2 dot 1/x d x = (x^2 ln x)/2 - int x/2 d x$
    $J = (x^2 ln x)/2 - x^2/4 + C$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Để tính nguyên hàm $int (2x-1) cos x d x$ bằng phương pháp từng phần, ta nên đặt $u$ và $d v$ như thế nào?],
  (
    [$u = cos x$, $d v = (2x-1) d x$],
    [$u = 2x-1$, $d v = cos x d x$],
    [$u = x$, $d v = cos x d x$],
    [$u = (2x-1)cos x$, $d v = d x$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Từng Phần",
  loigiai: [
    Biểu thức chứa Đa thức ($2x-1$) và Lượng giác ($cos x$).
    Theo quy tắc "Nhất Lô, Nhì Đa, Tam Lượng, Tứ Mũ", ta ưu tiên Đa thức làm $u$.
    Vậy đặt $u = 2x-1, d v = cos x d x$.
  ]
)

#lt-tn(
  [Áp dụng phương pháp từng phần, nguyên hàm $I = int x sin x d x$ bằng:],
  (
    [$-x cos x + sin x + C$],
    [$-x cos x - sin x + C$],
    [$x cos x + sin x + C$],
    [$x sin x + cos x + C$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Từng Phần",
  loigiai: [
    Đặt $u = x => d u = d x$. Và $d v = sin x d x => v = -cos x$.
    $I = x(-cos x) - int (-cos x) d x = -x cos x + int cos x d x = -x cos x + sin x + C$.
  ]
)

#lt-tn(
  [Tính nguyên hàm $int ln x d x$. (Gợi ý: Coi $ln x = 1 dot ln x$)],
  (
    [$1/x + C$],
    [$x ln x - x + C$],
    [$x ln x + x + C$],
    [$(ln x)^2/2 + C$]
  ),
  correct: 2,
  num: 3,
  de: "Phần Luyện Tập Từng Phần",
  loigiai: [
    Đặt $u = ln x => d u = 1/x d x$. Và $d v = 1 d x => v = x$.
    $int ln x d x = x ln x - int x(1/x) d x = x ln x - int 1 d x = x ln x - x + C$.
  ]
)

#lt-tn(
  [Khi tính nguyên hàm $int x^2 e^x d x$ bằng phương pháp từng phần, ta phải thực hiện phương pháp này bao nhiêu lần?],
  (
    [1 lần],
    [2 lần],
    [3 lần],
    [Không tính được bằng từng phần]
  ),
  correct: 2,
  num: 4,
  de: "Phần Luyện Tập Từng Phần",
  loigiai: [
    Bậc của đa thức là 2 ($x^2$). Mỗi lần từng phần, bậc của $x$ sẽ giảm đi 1.
    Nên ta cần từng phần 2 lần để khử hết đa thức $x^2$.
  ]
)

#lt-tn(
  [Trong công thức nguyên hàm từng phần $int u d v = u v - int v d u$, mục đích chính của việc áp dụng là gì?],
  (
    [Để tìm ra ngay lập tức kết quả của bài toán.],
    [Để biến biểu thức đạo hàm thành tích phân.],
    [Để thay thế nguyên hàm $int u d v$ khó bằng nguyên hàm $int v d u$ dễ tính hơn.],
    [Để đơn giản hoá hằng số $C$.]
  ),
  correct: 3,
  num: 5,
  de: "Phần Luyện Tập Từng Phần",
  loigiai: [
    Bản chất của từng phần không cho ra đáp án ngay, mà nó chuyển "trách nhiệm" giải từ cái khó sang cái dễ hơn.
  ]
)
