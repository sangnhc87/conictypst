// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C6-BÀI 2: XÁC SUẤT TOÀN PHẦN VÀ CÔNG THỨC BAYES
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2: XÁC SUẤT TOÀN PHẦN VÀ BAYES",
  subtitle:    "Truy tìm nguyên nhân từ kết quả",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Lật ngược bài toán")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Vấn đề thực tiễn (Chẩn đoán bệnh):]
    
    Một bệnh hiếm gặp có tỷ lệ mắc là 1%. Một loại xét nghiệm có độ chính xác 99% (nếu có bệnh thì 99% dương tính, nếu không bệnh thì 99% âm tính).
    
    *Bạn vừa nhận kết quả xét nghiệm là DƯƠNG TÍNH. Vậy xác suất thực sự bạn mắc bệnh là bao nhiêu? (Đa số mọi người sẽ đoán là 99%).*
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Sức mạnh của Định lý Bayes]
  
  Sự thật là xác suất bạn mắc bệnh chỉ khoảng *50%*! 
  Tại sao lại như vậy? Công thức Bayes sẽ giúp chúng ta lật ngược từ "kết quả" (dương tính) để truy tìm xác suất của "nguyên nhân" (mắc bệnh), dựa trên tỷ lệ ban đầu của dân số. Định lý này là nền tảng của Trí tuệ Nhân tạo (Machine Learning) và bộ lọc Spam email hiện đại!
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Công thức xác suất toàn phần")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Hệ đầy đủ các biến cố:*
    Hai biến cố $A$ và $bar(A)$ (phần bù của $A$) tạo thành một hệ đầy đủ. Tức là chúng xung khắc ($A cap bar(A) = tack.t$) và hợp của chúng bằng không gian mẫu ($A cup bar(A) = Omega$).
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Công thức xác suất toàn phần:*
    Với mọi biến cố $B$, ta luôn có thể tính xác suất của $B$ thông qua việc chia trường hợp theo $A$:
    
    $ P(B) = P(A) dot P(B|A) + P(bar(A)) dot P(B|bar(A)) $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Công thức Bayes")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Công thức Bayes:*
    Nếu ta đã biết biến cố $B$ xảy ra (kết quả), ta có thể tính lại xác suất của biến cố $A$ (nguyên nhân) bằng công thức:
    
    $ P(A|B) = (P(A) dot P(B|A)) / (P(B)) $
  ]
  
  #v(0.5em)
  #text(style: "italic")[Trong đó:]
  - $P(A)$: Xác suất tiên nghiệm (niềm tin ban đầu).
  - $P(B|A)$: Khả năng xảy ra kết quả $B$ nếu $A$ đúng.
  - $P(B)$: Xác suất toàn phần của kết quả $B$.
  - $P(A|B)$: Xác suất hậu nghiệm (niềm tin được cập nhật sau khi thấy bằng chứng $B$).
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Lời giải bài toán Y tế")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Phân tích:]
    - Gọi $A$: "Người đó mắc bệnh" $=> P(A) = 0.01$.
    - $bar(A)$: "Người đó KHÔNG mắc bệnh" $=> P(bar(A)) = 0.99$.
    - Gọi $B$: "Kết quả xét nghiệm Dương tính".
    - Độ nhạy 99%: $P(B|A) = 0.99$.
    - Dương tính giả 1%: $P(B|bar(A)) = 0.01$.
    
    *Bước 1: Tính XS toàn phần nhận KQ dương tính $P(B)$*
    $ P(B) &= P(A) dot P(B|A) + P(bar(A)) dot P(B|bar(A)) \
           &= 0.01 times 0.99 + 0.99 times 0.01 = 0.0198 $
           
    *Bước 2: Áp dụng Bayes để tìm XS mắc bệnh thực sự $P(A|B)$*
    $ P(A|B) &= (P(A) dot P(B|A)) / P(B) \
             &= (0.01 times 0.99) / 0.0198 = 0.5 " (tức 50%)" $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM

#lt-tn(
  [Cho $A$ và $bar(A)$ là hai biến cố đối nhau. Với biến cố $B$ bất kỳ, công thức xác suất toàn phần là:],
  (
    [$P(B) = P(A) P(B) + P(bar(A)) P(B)$],
    [$P(B) = P(A|B) P(A) + P(bar(A)|B) P(bar(A))$],
    [$P(B) = P(A) P(B|A) + P(bar(A)) P(B|bar(A))$],
    [$P(B) = P(B|A) / P(A) + P(B|bar(A)) / P(bar(A))$]
  ),
  correct: 3,
  num: 1,
  de: "Phần Luyện Tập"
)

#lt-tn(
  [Biết $P(A) = 0.2, P(B|A) = 0.8, P(B|bar(A)) = 0.1$. Xác suất toàn phần của biến cố $B$ là:],
  (
    [$0.24$],
    [$0.16$],
    [$0.9$],
    [$0.08$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập",
  loigiai: [
    $P(bar(A)) = 1 - 0.2 = 0.8$.
    $P(B) = P(A)P(B|A) + P(bar(A))P(B|bar(A)) = 0.2 times 0.8 + 0.8 times 0.1 = 0.16 + 0.08 = 0.24$.
  ]
)

#lt-tn(
  [Theo công thức Bayes, để tính $P(A|B)$, ta sử dụng biểu thức nào sau đây?],
  (
    [$(P(B) dot P(A|B)) / P(A)$],
    [$(P(A) dot P(B|A)) / P(B)$],
    [$(P(A) + P(B)) / P(A B)$],
    [$(P(A) dot P(B)) / P(A|B)$]
  ),
  correct: 2,
  num: 3,
  de: "Phần Luyện Tập"
)

#lt-tn(
  [Có 2 hộp bi. Hộp I có 3 bi đỏ và 7 bi xanh. Hộp II có 6 bi đỏ và 4 bi xanh. Chọn ngẫu nhiên 1 hộp rồi từ hộp đó lấy ngẫu nhiên 1 viên bi. Xác suất để viên bi lấy ra màu đỏ là:],
  (
    [$0.45$],
    [$0.5$],
    [$0.3$],
    [$0.6$]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập",
  loigiai: [
    Gọi $H_1, H_2$ là biến cố chọn hộp I, II. $P(H_1) = P(H_2) = 0.5$.
    Gọi $D$ là biến cố lấy được bi đỏ. $P(D|H_1) = 3/10 = 0.3$; $P(D|H_2) = 6/10 = 0.6$.
    $P(D) = 0.5 times 0.3 + 0.5 times 0.6 = 0.15 + 0.30 = 0.45$.
  ]
)

#lt-tn(
  [Tiếp tục câu trên. Giả sử ta bốc được viên bi đỏ. Xác suất viên bi đó thuộc Hộp I là bao nhiêu?],
  (
    [$1/2$],
    [$2/3$],
    [$1/3$],
    [$3/10$]
  ),
  correct: 3,
  num: 5,
  de: "Phần Luyện Tập",
  loigiai: [
    Áp dụng công thức Bayes: 
    $P(H_1|D) = (P(H_1)P(D|H_1)) / P(D) = (0.5 times 0.3) / 0.45 = 0.15 / 0.45 = 1/3$.
  ]
)
