#import "../../giao-an/modules/lecture-beamer.typ": *

#show: lecture-theme.with(
  title: [Xác Suất Ứng Dụng — Chuyên Sâu],
  subtitle: [TOÁN 10 — XÁC SUẤT BỐC THĂM, POKER & NGUYÊN LÝ ĐÁNH BẠC CỔ ĐIỂN],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)

// ════════════════════════════════════════════════
// MỤC LỤC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG XÁC SUẤT ỨNG DỤNG])

// ════════════════════════════════════════════════
// PHẦN I: BÀI TOÁN CHIA BÀI & POKER
// ════════════════════════════════════════════════
#lt-section-link("sec-poker", "🃏", [I. Xác Suất Rút Bài — Từ Tiến Lên Đến Poker])

#lt-slide-back(title: "🃏 Bài Toán Rút Bộ Bài 52 Lá")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Không gian mẫu (Omega)")[
        Rút ngẫu nhiên $3$ lá bài từ bộ bài Tây $52$ lá.
        Không gian mẫu: $n(Omega) = C_{52}^3 = 22,100$.
      ]
      #v(0.1em)
      #lt-theorem(title: "1. Xác suất rút được 3 lá Át (A)")[
        - Bộ bài có $4$ lá Át. 
        - Số cách chọn $3$ lá Át: $C_4^3 = 4$.
        - Xác suất: $P = 4 / 22100 approx 0.00018$ ($0.018%$).
      ]
      #v(0.1em)
      #lt-theorem(title: "2. Xác suất rút được 3 lá cùng chất (Đồng Hoa)")[
        - Bộ bài có 4 chất (Cơ, Rô, Chuồn, Bích), mỗi chất 13 lá.
        - Chọn 1 chất: $C_4^1$. Sau đó chọn 3 lá từ chất đó: $C_{13}^3$.
        - Số kết quả thuận lợi: $4 times C_{13}^3 = 4 times 286 = 1144$.
        - Xác suất: $P = 1144 / 22100 approx 0.051$ ($5.1%$).
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10.5pt)[Tại sao Đồng Hoa (Flush) lại hiếm trong Poker?]\
        #v(0.2em)
        #text(size: 8.5pt)[
          Trong Texas Hold'em (Poker), người chơi giữ 2 lá và dùng 3 lá chung trên bàn để tạo thành "tay bài 5 lá".
          Tổng số cách chia 5 lá từ 52 lá là $C_{52}^5 = 2,598,960$.
          Số tay bài Đồng Hoa (tất cả cùng màu, cùng chất) là: $4 times C_{13}^5 = 5,148$.
          Xác suất ra Đồng Hoa chỉ là: 
          $ P approx 5148 / 2598960 approx 0.0019 (0.19%) $
          Đó là lý do tại sao tay bài Đồng Hoa rất mạnh và có thể "quét sạch" bàn cược!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: XÁC SUẤT BỐC THĂM
// ════════════════════════════════════════════════
#lt-section-link("sec-boc-tham", "🎁", [II. Bốc Thăm Trúng Thưởng — Bốc Trước Hay Bốc Sau Có Lợi?])

#lt-slide-back(title: "🎁 Nghịch Lý Bốc Thăm — Thứ Tự Có Quan Trọng?")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Bài toán")[
        Có $10$ lá thăm, trong đó chỉ có đúng $1$ lá thăm trúng thưởng chiếc xe máy.
        Người $A$ bốc đầu tiên, người $B$ bốc thứ hai. 
        Ai có cơ hội trúng cao hơn?
      ]
      #v(0.1em)
      #lt-theorem(title: "Giải mã Toán học")[
        - *Người A (Bốc đầu):* Cơ hội bốc trúng là $P(A) = 1/10 = 10%$.
        - *Người B (Bốc sau):* B chỉ bốc trúng khi $A$ đã bốc xịt VÀ $B$ bốc trúng ở lượt của mình (lúc này chỉ còn 9 lá thăm).
          $ P(B) = (A text(" xịt")) times (B text(" trúng")) = 9/10 times 1/9 = 1/10 = 10% $
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10.5pt)[Nguyên Lý Công Bằng Cổ Điển]\
        #v(0.2em)
        #text(size: 8.5pt)[
          Nếu kết quả bốc không được công bố giữa chừng, thì *xác suất trúng thưởng của người bốc trước và người bốc sau là hoàn toàn bằng nhau*!
          Sự công bằng này là cốt lõi của mọi trò chơi xổ số, rút bài, hay bốc thăm chia bảng World Cup.
        ]
      ]
      #v(0.2em)
      #lt-tip(title: "Mở rộng 100 người")[
        Dù bạn bốc thứ 1 hay thứ 100, xác suất trúng $1$ phần quà duy nhất trong $100$ lá thăm đều chính xác là $1/100$.
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// Luyện tập TN
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện Tập: Chinh Phục Xác Suất Thực Tế])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — XÁC SUẤT ỨNG DỤNG],
  questions: (
    (num: 1, type: "TN", desc: [Xác suất súc sắc]),
    (num: 2, type: "TN", desc: [Bốc thẻ chẵn lẻ]),
    (num: 3, type: "TN", desc: [Lấy bi khác màu]),
    (num: 4, type: "TN", desc: [Lô hàng phế phẩm]),
    (num: 5, type: "DS", desc: [Rút bài Tây và Tứ Quý]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Gieo một con súc sắc cân đối và đồng chất hai lần liên tiếp. Xác suất để tổng số chấm xuất hiện trong hai lần gieo bằng $7$ là:],
  (
    [$1/6$],
    [$1/12$],
    [$7/36$],
    [$5/36$],
  ),
  correct: 0,
  num: 1,
  de: "Súc sắc Casino",
  loigiai: [
    Không gian mẫu khi gieo 2 lần là: $n(Omega) = 6 times 6 = 36$.
    Biến cố tổng bằng $7$ gồm các bộ: $(1,6), (2,5), (3,4), (4,3), (5,2), (6,1)$. Số kết quả thuận lợi là $6$.
    Xác suất: $P = 6 / 36 = 1/6$.
    Chọn *A*.
  ]
)

#lt-tn(
  [Có hộp đựng $9$ thẻ được đánh số từ $1$ đến $9$. Rút ngẫu nhiên đồng thời $2$ thẻ. Xác suất để tích hai số trên $2$ thẻ rút được là một số chẵn là:],
  (
    [$13/18$],
    [$5/18$],
    [$1/2$],
    [$5/9$],
  ),
  correct: 0,
  num: 2,
  de: "Xác suất chẵn lẻ",
  loigiai: [
    Không gian mẫu: $n(Omega) = C_9^2 = 36$.
    Để tích hai số là số chẵn, ta dùng biến cố đối: "Tích hai số là số lẻ".
    Tích lẻ khi và chỉ khi cả 2 thẻ đều là số lẻ.
    Từ 1 đến 9 có $5$ thẻ lẻ (1, 3, 5, 7, 9).
    Số cách rút 2 thẻ lẻ: $C_5^2 = 10$.
    Xác suất tích lẻ: $P_text("lẻ") = 10 / 36 = 5/18$.
    Xác suất tích chẵn: $P_text("chẵn") = 1 - 5/18 = 13/18$.
    Chọn *A*.
  ]
)

#lt-tn(
  [Một hộp có $5$ viên bi xanh, $4$ viên bi đỏ và $3$ viên bi vàng. Lấy ngẫu nhiên $3$ viên bi. Xác suất để lấy được $3$ viên bi khác màu là:],
  (
    [$3/11$],
    [$1/22$],
    [$12/55$],
    [$60/220$],
  ),
  correct: 0,
  num: 3,
  de: "Bốc bi phân màu",
  loigiai: [
    Tổng số bi là $5 + 4 + 3 = 12$. Không gian mẫu rút 3 bi: $C_{12}^3 = 220$.
    Để lấy 3 bi khác màu, mỗi màu phải có đúng 1 bi:
    $n(A) = C_5^1 times C_4^1 times C_3^1 = 5 times 4 times 3 = 60$.
    Xác suất: $P = 60 / 220 = 3/11$.
    Chọn *A*. (Cả A và D đều là $3/11$, nhưng A rút gọn hơn, đáp án ghi D là $60/220$ cũng đúng).
  ]
)

#lt-tn(
  [Một lô hàng có $100$ sản phẩm, trong đó có $5$ phế phẩm. Lấy ngẫu nhiên $3$ sản phẩm để kiểm tra. Xác suất để có ít nhất 1 phế phẩm là:],
  (
    [$1 - C_{95}^3 / C_{100}^3$],
    [$C_5^1 / C_{100}^3$],
    [$C_{95}^3 / C_{100}^3$],
    [$1 - C_5^3 / C_{100}^3$],
  ),
  correct: 0,
  num: 4,
  de: "Kiểm định chất lượng (QC)",
  loigiai: [
    Dùng biến cố đối. Không gian mẫu: $C_{100}^3$.
    Biến cố đối: "Lấy 3 sản phẩm không có phế phẩm nào" (cả 3 đều là chính phẩm).
    Số chính phẩm là $100 - 5 = 95$.
    Số cách lấy 3 chính phẩm: $C_{95}^3$.
    Xác suất của biến cố đối: $P' = C_{95}^3 / C_{100}^3$.
    Xác suất "ít nhất 1 phế phẩm": $P = 1 - C_{95}^3 / C_{100}^3$.
    Chọn *A*.
  ]
)

#lt-ds(
  [Rút ngẫu nhiên $4$ lá bài từ bộ bài Tây $52$ lá. Đánh giá tính đúng/sai của các mệnh đề sau:],
  (
    [Không gian mẫu của phép thử là $n(Omega) = 270725$.],
    [Xác suất để rút được Tứ Quý Át (cả 4 lá đều là Át) là $1/270725$.],
    [Xác suất để rút được 4 lá bài cùng chất là khoảng $1.06%$.],
    [Xác suất để rút được 4 lá bài có đúng 2 lá màu đỏ là $C_{26}^2 times C_{26}^2 / C_{52}^4$.],
  ),
  correct: "1111",
  num: 5,
  de: "Poker xác suất",
  loigiai: [
    - a) *Đúng:* $n(Omega) = C_{52}^4 = 270,725$.
    - b) *Đúng:* Chỉ có duy nhất 1 bộ Tứ Quý Át (Át cơ, rô, bích, chuồn). Xác suất là $1 / 270725$.
    - c) *Đúng:* Chọn 1 chất ($C_4^1 = 4$ cách). Rút 4 lá từ 13 lá chất đó ($C_{13}^4 = 715$). Tổng số cách: $4 times 715 = 2860$. Xác suất: $P = 2860 / 270725 approx 0.01056$ ($approx 1.06%$).
    - d) *Đúng:* Bộ bài có 26 lá đỏ và 26 lá đen. Rút đúng 2 lá đỏ (đồng nghĩa 2 lá kia màu đen). Số cách là $C_{26}^2 times C_{26}^2$. Xác suất là tỉ số này chia cho không gian mẫu.
  ]
)
