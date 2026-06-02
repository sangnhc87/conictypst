filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

content = content.replace("\r\n", "\n")

target = """  Vậy tổng số cách xếp là:
  $ N = 3 times 12 times 8 = bold(288) " cách." $
]"""

replacement = """  Vậy tổng số cách xếp là:
  $ N = 3 times 12 times 8 = bold(288) " cách." $
]

#ex-box(title: "✏️ Bài C6 — Biện Luận Nghiệm Lưới 4 Cột")[
  Có 3 học sinh lớp A, 3 học sinh lớp B, 2 học sinh lớp C. Xếp tất cả vào 2 hàng 4 ghế đối diện nhau sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 4$ cột. Học sinh của các lớp là $n_A = 3, n_B = 3, n_C = 2$.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C\}$. Để phân bổ hết học sinh vào $m = 4$ cột, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(B C) = 4 quad &("tổng số cột") \\\\
  t_(A B) + t_(A C) = n_A = 3 quad &("lượt xuất hiện của A") \\\\
  t_(A B) + t_(B C) = n_B = 3 quad &("lượt xuất hiện của B") \\\\
  t_(A C) + t_(B C) = n_C = 2 quad &("lượt xuất hiện của C")
  $
  Cộng ba phương trình xuất hiện của từng lớp:
  $ 2(t_(A B) + t_(A C) + t_(B C)) = 3 + 3 + 2 = 8 arrow.r.double t_(A B) + t_(A C) + t_(B C) = 4 $
  Điều này hoàn toàn khớp với phương trình tổng số cột. Giải hệ bằng cách trừ lần lượt phương trình xuất hiện của mỗi lớp khỏi tổng số cột, ta thu được nghiệm duy nhất:
  - $t_(B C) = 4 - 3 = 1$
  - $t_(A C) = 4 - 3 = 1$
  - $t_(A B) = 4 - 2 = 2$
  
  Ta thu được cấu hình cột duy nhất: $ {2 times (A, B), 1 times (A, C), 1 times (B, C)} $.
  + Số cấu hình cột là: $M = frac(4!, 2! 1! 1!) = 12$ cấu hình.
  
  Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^4 = 16$):
  $ N = M times (n_A! n_B! n_C!) times 2^4 = 12 times (3! times 3! times 2!) times 16 = 12 times 72 times 16 = bold(13824) " cách." $
]

#ex-box(title: "✏️ Bài C7 — Biện Luận Nghiệm Khi Có Ghế Trống E")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C và 1 ghế trống E. Xếp tất cả vào 2 hàng 3 ghế đối diện nhau sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 3$ cột. Ghế trống E hoạt động như một "lớp đặc biệt" có 1 phần tử.
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ (hoặc ghế trống E) với các cặp $(i, j)$ chọn từ $\{A, B, C, E\}$. Vì $n_E = 1$, không thể có cột trống $\{E, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(A E) + t_(B C) + t_(B E) + t_(C E) = 3 quad &("tổng số cột") \\\\
  t_(A B) + t_(A C) + t_(A E) = n_A = 2 quad &("lượt xuất hiện của A") \\\\
  t_(A B) + t_(B C) + t_(B E) = n_B = 2 quad &("lượt xuất hiện của B") \\\\
  t_(A C) + t_(B C) + t_(C E) = n_C = 1 quad &("lượt xuất hiện của C") \\\\
  t_(A E) + t_(B E) + t_(C E) = n_E = 1 quad &("lượt xuất hiện của E")
  $
  Vì $n_E = 1$, ta biện luận nghiệm nguyên không âm theo giá trị của $t_(C E) <= 1$:
  - *Trường hợp 1: $t_(C E) = 1$* $arrow.r$ $t_(A E) = t_(B E) = t_(A C) = t_(B C) = 0$.
    Thay vào phương trình của A và B ta được $t_(A B) = 2$.
    Nghiệm thu được: $t_(A B) = 2, t_(C E) = 1$ (các biến khác bằng 0), thỏa mãn tổng số cột.
    Ta thu được cấu hình: $ {2 times (A, B), 1 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(3!, 2! 1!) = 3$.
  - *Trường hợp 2: $t_(C E) = 0$* $arrow.r$ $t_(A C) + t_(B C) = 1$ và $t_(A E) + t_(B E) = 1$.
    Biện luận 4 khả năng cho cặp $((t_(A C), t_(B C)), (t_(A E), t_(B E)))$:
    + *Khả năng 2.1:* $t_(A C) = 1, t_(A E) = 1 arrow.r.double t_(B C) = 0, t_(B E) = 0$. Thay vào A ta được $t_(A B) + 2 = 2 arrow.r.double t_(A B) = 0$. Thay vào B ta được $0 != 2$ (loại).
    + *Khả năng 2.2:* $t_(B C) = 1, t_(B E) = 1 arrow.r.double t_(A C) = 0, t_(A E) = 0$. Tương tự, thay vào B ta được $t_(A B) = 0$, thay vào A ta được $0 != 2$ (loại).
    + *Khả năng 2.3:* $t_(A C) = 1, t_(B E) = 1 arrow.r.double t_(B C) = 0, t_(A E) = 0$. Thay vào A ta được $t_(A B) + 1 = 2 arrow.r.double t_(A B) = 1$. Thay vào B: $1 + 0 + 1 = 2$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_2 = frac(3!, 1! 1! 1!) = 6$.
    + *Khả năng 2.4:* $t_(B C) = 1, t_(A E) = 1 arrow.r.double t_(A C) = 0, t_(B E) = 0$. Thay vào A ta được $t_(A B) + 1 = 2 arrow.r.double t_(A B) = 1$. Thay vào B: $1 + 1 + 0 = 2$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 1 times (B, C), 1 times (A, E)} $ $arrow.r$ Số cấu hình cột $M_3 = 6$.
  
  Tổng số cấu hình cột hợp lệ là $M = 3 + 6 + 6 = 15$ cấu hình.
  Lúc này mới nhân hoán vị học sinh (ghế trống E chỉ có 1 cách xếp) và số cách đảo hàng ($2^3 = 8$):
  $ N = M times (n_A! n_B! n_C! n_E!) times 2^3 = 15 times (2! times 2! times 1! times 1!) times 8 = 15 times 4 times 8 = bold(480) " cách." $
]

#ex-box(title: "✏️ Bài C8 — Biện Luận Hệ Quy Mô Lớn: 3A, 3B, 2C, 2D ngồi 2 hàng 5 ghế ($m=5$)")[
  Có 3 học sinh lớp A, 3 học sinh lớp B, 2 học sinh lớp C, 2 học sinh lớp D. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Học sinh của các lớp là $n_A = 3, n_B = 3, n_C = 2, n_D = 2$.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh vào $m = 5$ cột, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 5 quad &("tổng số cột") \\\\
  t_(A B) + t_(A C) + t_(A D) = n_A = 3 quad &("lượt xuất hiện của A") \\\\
  t_(A B) + t_(B C) + t_(B D) = n_B = 3 quad &("lượt xuất hiện của B") \\\\
  t_(A C) + t_(B C) + t_(C D) = n_C = 2 quad &("lượt xuất hiện của C") \\\\
  t_(A D) + t_(B D) + t_(C D) = n_D = 2 quad &("lượt xuất hiện của D")
  $
  Ta biện luận nghiệm nguyên không âm theo giá trị của $t_(C D) <= 2$:
  - *Trường hợp 1: $t_(C D) = 2$* $arrow.r$ $t_(A C) = t_(B C) = t_(A D) = t_(B D) = 0$.
    Thay vào phương trình của A và B ta được $t_(A B) = 3$.
    Nghiệm thu được: $t_(A B) = 3, t_(C D) = 2$ (thỏa mãn tổng số cột $3 + 2 = 5$).
    Ta thu được cấu hình: $ {3 times (A, B), 2 times (C, D)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(5!, 3! 2!) = 10$.
  - *Trường hợp 2: $t_(C D) = 1$* $arrow.r$ $t_(A C) + t_(B C) = 1$ và $t_(A D) + t_(B D) = 1$.
    Biện luận 4 khả năng của cặp $((t_(A C), t_(B C)), (t_(A D), t_(B D)))$:
    + *Khả năng 2.1:* $t_(A C) = 1, t_(A D) = 1 arrow.r.double t_(B C) = 0, t_(B D) = 0$. Thay vào A ta được $t_(A B) = 1$. Thay vào B ta được $1 != 3$ (loại).
    + *Khả năng 2.2:* $t_(B C) = 1, t_(B D) = 1 arrow.r.double t_(A C) = 0, t_(A D) = 0$. Thay vào B ta được $t_(A B) = 1$. Thay vào A ta được $1 != 3$ (loại).
    + *Khả năng 2.3:* $t_(A C) = 1, t_(B D) = 1 arrow.r.double t_(B C) = 0, t_(A D) = 0$. Thay vào A ta được $t_(A B) + 1 = 3 \implies t_(A B) = 2$. Thay vào B: $2 + 0 + 1 = 3$ (thỏa mãn).
      Ta thu được cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (B, D), 1 times (C, D)} $ $arrow.r$ Số cấu hình cột $M_(2a) = frac(5!, 2! 1! 1! 1!) = 60$.
    + *Khả năng 2.4:* $t_(B C) = 1, t_(A D) = 1 arrow.r.double t_(A C) = 0, t_(B D) = 0$. Thay vào A ta được $t_(A B) + 1 = 3 \implies t_(A B) = 2$. Thay vào B: $2 + 1 + 0 = 3$ (thỏa mãn).
      Ta thu được cấu hình: $ {2 times (A, B), 1 times (B, C), 1 times (A, D), 1 times (C, D)} $ $arrow.r$ Số cấu hình cột $M_(2b) = 60$.
  - *Trường hợp 3: $t_(C D) = 0$* $arrow.r$ $t_(A C) + t_(B C) = 2$ và $t_(A D) + t_(B D) = 2$.
    Biện luận các khả năng:
    + *Khả năng 3.1:* $t_(A C) = 2, t_(A D) = 2 arrow.r.double t_(B C) = 0, t_(B D) = 0$. Thay vào A ta được $t_(A B) = -1$ (loại).
    + *Khả năng 3.2:* $t_(B C) = 2, t_(B D) = 2 arrow.r.double t_(A C) = 0, t_(A D) = 0$. Thay vào B ta được $t_(A B) = -1$ (loại).
    + *Khả năng 3.3:* $t_(A C) = 2, t_(B D) = 2 arrow.r.double t_(B C) = 0, t_(A D) = 0$. Thay vào A ta được $t_(A B) = 1$. Thay vào B: $1 + 0 + 2 = 3$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 2 times (A, C), 2 times (B, D)} $ $arrow.r$ Số cấu hình cột $M_(3a) = frac(5!, 1! 2! 2!) = 30$.
    + *Khả năng 3.4:* $t_(B C) = 2, t_(A D) = 2 arrow.r.double t_(A C) = 0, t_(B D) = 0$. Thay vào A ta được $t_(A B) = 1$. Thay vào B: $1 + 2 + 0 = 3$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 2 times (B, C), 2 times (A, D)} $ $arrow.r$ Số cấu hình cột $M_(3b) = 30$.
    + *Khả năng 3.5:* $t_(A C) = 1, t_(B C) = 1$ và $t_(A D) = 1, t_(B D) = 1$. Thay vào A ta được $t_(A B) = 1$. Thay vào B: $1 + 1 + 1 = 3$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (A, D), 1 times (B, D)} $ $arrow.r$ Số cấu hình cột $M_(3c) = frac(5!, 1! 1! 1! 1! 1!) = 120$.
  
  Tổng số cấu hình cột hợp lệ là $M = 10 + 60 + 60 + 30 + 30 + 120 = 310$ cấu hình.
  Lúc này mới nhân hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C! n_D!) times 2^5 = 310 times (3! times 3! times 2! times 2!) times 32 = 310 times 144 times 32 = bold(1428480) " cách." $
]"""

if target in content:
    content = content.replace(target, replacement)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)
    print("Practice problems appended successfully!")
else:
    print("Could not find the target end block!")
