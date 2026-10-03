// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C6-BÀI 1.2: XÁC SUẤT TOÀN PHẦN VÀ CÔNG THỨC BAYES
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 1.2: XÁC SUẤT TOÀN PHẦN & BAYES",
  subtitle:    "Sơ đồ cây và Nghịch lý Y tế",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Nghịch lý Xét nghiệm")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Tình huống Y khoa cực sốc:]
    
    Một căn bệnh hiếm gặp chỉ có 1% dân số mắc phải. 
    Bệnh viện có một bộ Kit Test rất xịn: Nếu bạn có bệnh, 99% nó báo "Dương tính". Nếu bạn không bệnh, 99% nó báo "Âm tính".
    
    Hôm nay, bạn đi xét nghiệm và nhận kết quả *DƯƠNG TÍNH*.
    Bạn suy sụp và nghĩ rằng: "Tiêu rồi, 99% là mình đang mang bệnh!"
    
    *NHƯNG SỰ THẬT KHÔNG PHẢI VẬY!* Xác suất thực sự bạn mắc bệnh chỉ là khoảng 50%. Tại sao một công cụ chính xác 99% lại đưa ra dự đoán chỉ ngang với trò tung đồng xu? Chào mừng đến với Công thức Bayes!
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Công thức Xác suất Toàn phần")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    Giả sử một quá trình chia làm 2 trường hợp (nhánh) là $B$ và $overline(B)$. Khi đó, để tính xác suất của một sự kiện $A$ xảy ra ở cuối quá trình, ta cộng xác suất của tất cả các con đường dẫn đến $A$:
    
    $ P(A) = P(B) dot P(A|B) + P(overline(B)) dot P(A|overline(B)) $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Mẹo Sơ đồ cây:* 
    - Nhân các xác suất dọc theo một nhánh (từ gốc đến ngọn).
    - Cộng các kết quả của các nhánh lại với nhau.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Công thức Bayes - Lật ngược vấn đề")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    Công thức Bayes cho phép ta tính "Xác suất nguyên nhân" khi đã biết "Kết quả".
    
    $ P(B|A) = (P(B) dot P(A|B)) / (P(A)) $
    
    *(Trong đó $P(A)$ được tính bằng Công thức xác suất toàn phần ở phần trước)*
  ]
  
  #v(0.5em)
  #text(style: "italic")[*Giải Nghịch lý Xét nghiệm:*
  - Bệnh nhân = 1%. Khỏe mạnh = 99%. (Nguyên nhân)
  - Bệnh => Dương tính = 99%. (Kết quả)
  - Khỏe => Dương tính = 1% (Dương tính giả).
  Tính P(Bệnh | Dương tính) = (1% x 99%) / (1% x 99% + 99% x 1%) = 0.0099 / 0.0198 = 50%!
  Lý do: Lượng người khỏe quá đông, nên 1% sai số của họ tạo ra số ca dương tính giả bằng đúng số ca bệnh thật!]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Phân tích Chuyên Sâu")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Bài toán Chọn hộp]
    Có 2 hộp bi. Hộp 1 có 3 bi Đỏ, 2 bi Xanh. Hộp 2 có 1 bi Đỏ, 4 bi Xanh.
    Chọn ngẫu nhiên 1 hộp (xác suất 50-50), rồi từ hộp đó bốc ra 1 viên bi.
    Biết rằng viên bi bốc ra là màu ĐỎ. Tính xác suất để nó được bốc từ Hộp 1.
    
    *Giải:*
    - Gọi $A$ là "Bốc được bi Đỏ". Gọi $H_1, H_2$ là "Chọn Hộp 1", "Chọn Hộp 2".
    - Xác suất toàn phần (Xác suất ra bi Đỏ nói chung):
      $P(A) = P(H_1) P(A|H_1) + P(H_2) P(A|H_2) = (1/2) (3/5) + (1/2) (1/5) = 3/10 + 1/10 = 4/10 = 0.4$.
    - Công thức Bayes (Tính xác suất rơi vào Hộp 1 khi đã biết ra Đỏ):
      $P(H_1 | A) = (P(H_1) P(A|H_1)) / P(A) = (3/10) / (4/10) = 3/4 = 75%$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Công thức nào sau đây là định lý Bayes?],
  (
    [$P(A|B) = P(B|A)$],
    [$P(A) = P(B)P(A|B) + P(overline(B))P(A|overline(B))$],
    [$P(B|A) = (P(B)P(A|B)) / P(A)$],
    [$P(A|B) = P(A) + P(B)$]
  ),
  correct: 3,
  num: 1,
  de: "Phần Luyện Tập Bayes",
  loigiai: [
    Công thức Bayes cho phép lật ngược điều kiện: Tính $P(B|A)$ thông qua $P(A|B)$, $P(B)$ và $P(A)$.
  ]
)

#lt-tn(
  [Một nhà máy có 2 máy sản xuất. Máy A chiếm 60% sản lượng, tỉ lệ phế phẩm là 2%. Máy B chiếm 40% sản lượng, tỉ lệ phế phẩm là 5%. Chọn ngẫu nhiên 1 sản phẩm của nhà máy. Tính xác suất để sản phẩm đó là phế phẩm (Áp dụng XS Toàn phần).],
  (
    [$3.2%$],
    [$7%$],
    [$1.2%$],
    [$2%$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Sản Xuất",
  loigiai: [
    Gọi $F$ là Phế phẩm.
    $P(F) = P(A)P(F|A) + P(B)P(F|B) = 0.6 times 0.02 + 0.4 times 0.05 = 0.012 + 0.020 = 0.032$ (tức $3.2%$).
  ]
)

#lt-tn(
  [Tiếp tục câu trên: Giả sử sản phẩm rút ra bị lỗi (là phế phẩm). Tính xác suất để sản phẩm lỗi này là do Máy B sản xuất. (Áp dụng định lý Bayes).],
  (
    [$40%$],
    [$62.5%$],
    [$37.5%$],
    [$5%$]
  ),
  correct: 2,
  num: 3,
  de: "Phần Luyện Tập Sản Xuất",
  loigiai: [
    Tính $P(B|F) = (P(B)P(F|B)) / P(F)$.
    $P(B)P(F|B) = 0.4 times 0.05 = 0.020$.
    $P(B|F) = 0.020 / 0.032 = 20 / 32 = 5 / 8 = 0.625$ ($62.5%$).
  ]
)

#lt-tn(
  [Sơ đồ cây (Tree diagram) rất hữu ích để tính toán loại bài toán nào?],
  (
    [Tích phân từng phần],
    [Xác suất của một quá trình nhiều giai đoạn (XS Toàn phần)],
    [Tính thể tích khối đa diện],
    [Tính tích có hướng]
  ),
  correct: 2,
  num: 4,
  de: "Phần Luyện Tập Bayes",
  loigiai: [
    Sơ đồ cây giúp trực quan hoá không gian mẫu khi các sự kiện xảy ra nối tiếp nhau (nhiều giai đoạn), rất thích hợp để giải bài toán Xác suất toàn phần và Bayes.
  ]
)

#lt-tn(
  [Trong y tế, độ "Nhạy" (Sensitivity) của một test là xác suất test ra Dương Tính khi bệnh nhân thực sự Có Bệnh. Còn "Đặc hiệu" (Specificity) là xác suất test Âm Tính khi bệnh nhân Không Có Bệnh. Nếu cả hai chỉ số này đều là 99%, liệu một người test Dương Tính có chắc chắn 99% mắc bệnh không?],
  (
    [Chắc chắn 99%.],
    [Chắc chắn 100%.],
    [Không, nó còn phụ thuộc vào tỉ lệ mắc bệnh trong cộng đồng (Tỉ lệ hiện lưu).],
    [Không, test đã bị hỏng.]
  ),
  correct: 3,
  num: 5,
  de: "Phần Luyện Tập Bayes",
  loigiai: [
    Theo định lý Bayes (Nghịch lý Xét nghiệm), nếu căn bệnh quá hiếm (tỉ lệ hiện lưu thấp), thì số ca dương tính giả từ những người khỏe mạnh sẽ lấn át số ca dương tính thật. Xác suất mắc bệnh thực tế có thể thấp hơn 99% rất nhiều.
  ]
)
