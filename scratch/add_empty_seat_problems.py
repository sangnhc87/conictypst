filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

content = content.replace("\r\n", "\n")

target = """  $ N = M times (n_A! n_B! n_C! n_D!) times 2^5 = 310 times (3! times 3! times 2! times 2!) times 32 = 310 times 144 times 32 = bold(1428480) " cách." $
]"""

replacement = """  $ N = M times (n_A! n_B! n_C! n_D!) times 2^5 = 310 times (3! times 3! times 2! times 2!) times 32 = 310 times 144 times 32 = bold(1428480) " cách." $
]

#ex-box(title: "✏️ Bài C9 — Ghế Trống 1: Hai Lớp, Lưới 5 Cột, 2 Ghế Trống (4A, 4B, 2E)")[
  Có 4 học sinh lớp A, 4 học sinh lớp B và 2 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện nhau sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Lớp A có 4 học sinh, B có 4 học sinh, ghế trống E có 2 ghế.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp đối diện từ $\{A, B, E\}$. Các kiểu cột có thể có là $(A, B)$, $(A, E)$, $(B, E)$, $(E, E)$. Ta có hệ phương trình bảo toàn:
  $
  t_(A B) + t_(A E) + t_(B E) + t_(E E) = 5 quad &("tổng số cột") \\\\
  t_(A B) + t_(A E) = n_A = 4 quad &("lượt xuất hiện của A") \\\\
  t_(A B) + t_(B E) = n_B = 4 quad &("lượt xuất hiện của B") \\\\
  t_(A E) + t_(B E) + 2 t_(E E) = n_E = 2 quad &("lượt xuất hiện của E")
  $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 1$ (vì $2 t_(E E) <= 2$):
  - *Trường hợp 1: $t_(E E) = 1$* $arrow.r$ $t_(A E) = t_(B E) = 0$.
    Thay vào phương trình của A và B ta được $t_(A B) = 4$.
    Nghiệm này thỏa mãn tổng số cột ($4 + 0 + 0 + 1 = 5$).
    Ta thu được cấu hình: $ {4 times (A, B), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(5!, 4! 1!) = 5$.
  - *Trường hợp 2: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) = 2$.
    Từ phương trình của A và B ta có $t_(A E) = 4 - t_(A B)$ và $t_(B E) = 4 - t_(A B) \implies t_(A E) = t_(B E)$.
    Vì tổng của chúng bằng 2, ta suy ra $t_(A E) = t_(B E) = 1$.
    Thay lại ta được $t_(A B) = 3$.
    Nghiệm này thỏa mãn tổng số cột ($3 + 1 + 1 + 0 = 5$).
    Ta thu được cấu hình: $ {3 times (A, B), 1 times (A, E), 1 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_2 = frac(5!, 3! 1! 1!) = 20$.
  
  Tổng số cấu hình cột hợp lệ là $M = 5 + 20 = 25$ cấu hình.
  Lúc này mới nhân hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B!) times 2^5 = 25 times (4! times 4!) times 32 = 25 times 576 times 32 = bold(460800) " cách." $
]

#ex-box(title: "✏️ Bài C10 — Ghế Trống 2: Ba Lớp, Lưới 5 Cột, 2 Ghế Trống (3A, 3B, 2C, 2E)")[
  Có 3 học sinh lớp A, 3 học sinh lớp B, 2 học sinh lớp C và 2 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Học sinh các lớp là $n_A = 3, n_B = 3, n_C = 2, n_E = 2$.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp chọn từ $\{A, B, C, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(A E) + t_(B C) + t_(B E) + t_(C E) + t_(E E) = 5 quad &("tổng số cột") \\\\
  t_(A B) + t_(A C) + t_(A E) = 3 quad &("lượt xuất hiện của A") \\\\
  t_(A B) + t_(B C) + t_(B E) = 3 quad &("lượt xuất hiện của B") \\\\
  t_(A C) + t_(B C) + t_(C E) = 2 quad &("lượt xuất hiện của C") \\\\
  t_(A E) + t_(B E) + t_(C E) + 2 t_(E E) = 2 quad &("lượt xuất hiện của E")
  $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 1$:
  - *Trường hợp 1: $t_(E E) = 1$* $arrow.r$ $t_(A E) = t_(B E) = t_(C E) = 0$.
    Hệ phương trình rút gọn thành:
    $
    t_(A B) + t_(A C) = 3 \
    t_(A B) + t_(B C) = 3 \
    t_(A C) + t_(B C) = 2
    $
    Giải hệ con này ta được nghiệm: $t_(A B) = 2, t_(A C) = 1, t_(B C) = 1$.
    Ta thu được cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (E, E)} $ $\rightarrow$ Số cấu hình cột $M_1 = frac(5!, 2! 1! 1! 1!) = 60$.
  - *Trường hợp 2: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) = 2$. Ta biện luận theo giá trị của $t_(C E) <= 2$:
    + *Khả năng 2.1: $t_(C E) = 2$* $arrow.r$ $t_(A E) = t_(B E) = 0$.
      Khi đó phương trình của C trở thành $t_(A C) + t_(B C) = 0 \implies t_(A C) = t_(B C) = 0$.
      Thay vào ta được $t_(A B) = 3$.
      Ta thu được cấu hình: $ {3 times (A, B), 2 times (C, E)} $ $\rightarrow$ Số cấu hình cột $M_(2a) = frac(5!, 3! 2!) = 10$.
    + *Khả năng 2.2: $t_(C E) = 1$* $arrow.r$ $t_(A E) + t_(B E) = 1$. Do tính đối xứng của A và B, ta có 2 trường hợp con:
      * Nghiệm con $t_(A E) = 1, t_(B E) = 0$: Giải ra $t_(A B) = 2, t_(B C) = 1, t_(A C) = 0$.
        Cấu hình: $ {2 times (A, B), 1 times (B, C), 1 times (A, E), 1 times (C, E)} $ $\rightarrow$ Số cấu hình cột $M_(2b) = 60$.
      * Nghiệm con $t_(A E) = 0, t_(B E) = 1$: Giải ra $t_(A B) = 2, t_(A C) = 1, t_(B C) = 0$.
        Cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (B, E), 1 times (C, E)} $ $\rightarrow$ Số cấu hình cột $M_(2c) = 60$.
    + *Khả năng 2.3: $t_(C E) = 0$* $arrow.r$ $t_(A E) + t_(B E) = 2$ và $t_(A C) + t_(B C) = 2$.
      * Nghiệm con $t_(A E) = 2, t_(B E) = 0$: Giải ra $t_(A B) = 1, t_(B C) = 2, t_(A C) = 0$.
        Cấu hình: $ {1 times (A, B), 2 times (B, C), 2 times (A, E)} $ $\rightarrow$ Số cấu hình cột $M_(2d) = 30$.
      * Nghiệm con $t_(A E) = 0, t_(B E) = 2$: Giải ra $t_(A B) = 1, t_(A C) = 2, t_(B C) = 0$.
        Cấu hình: $ {1 times (A, B), 2 times (A, C), 2 times (B, E)} $ $\rightarrow$ Số cấu hình cột $M_(2e) = 30$.
      * Nghiệm con $t_(A E) = 1, t_(B E) = 1$: Giải ra $t_(A B) = 1, t_(A C) = 1, t_(B C) = 1$.
        Cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (A, E), 1 times (B, E)} $ $\rightarrow$ Số cấu hình cột $M_(2f) = 120$.
  
  Tổng số cấu hình cột hợp lệ là $M = 60 + 10 + 60 + 60 + 30 + 30 + 120 = 370$ cấu hình.
  Lúc này mới nhân hoán vị học sinh và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C!) times 2^5 = 370 times (3! times 3! times 2!) times 32 = 370 times 72 times 32 = bold(852480) " cách." $
]

#ex-box(title: "✏️ Bài C11 — Ghế Trống 3: Ba Lớp, Lưới 5 Cột, 3 Ghế Trống (3A, 2B, 2C, 3E)")[
  Có 3 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C và 3 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Ghế trống E hoạt động như một lớp phụ có 3 phần tử.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp từ $\{A, B, C, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(A E) + t_(B C) + t_(B E) + t_(C E) + t_(E E) = 5 quad &("tổng số cột") \\\\
  t_(A B) + t_(A C) + t_(A E) = 3 quad &("lượt xuất hiện của A") \\\\
  t_(A B) + t_(B C) + t_(B E) = 2 quad &("lượt xuất hiện của B") \\\\
  t_(A C) + t_(B C) + t_(C E) = 2 quad &("lượt xuất hiện của C") \\\\
  t_(A E) + t_(B E) + t_(C E) + 2 t_(E E) = 3 quad &("lượt xuất hiện của E")
  $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 1$:
  - *Trường hợp 1: $t_(E E) = 1$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) = 1$.
    + *Khả năng 1.1: $t_(C E) = 1$* $arrow.r$ $t_(A E) = t_(B E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 2, t_(A C) = 1, t_(B C) = 0$.
      Cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (C, E), 1 times (E, E)} $ $\rightarrow$ Số cấu hình cột $M_1 = 60$.
    + *Khả năng 1.2: $t_(A E) = 1$* $arrow.r$ $t_(B E) = t_(C E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 1, t_(A C) = 1, t_(B C) = 1$.
      Cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (A, E), 1 times (E, E)} $ $\rightarrow$ Số cấu hình cột $M_2 = 120$.
    + *Khả năng 1.3: $t_(B E) = 1$* $arrow.r$ $t_(A E) = t_(C E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 1, t_(A C) = 2, t_(B C) = 0$.
      Cấu hình: $ {1 times (A, B), 2 times (A, C), 1 times (B, E), 1 times (E, E)} $ $\rightarrow$ Số cấu hình cột $M_3 = 30$.
  - *Trường hợp 2: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) = 3$. Biện luận theo giá trị của $t_(A E) <= 3$:
    + *Khả năng 2.1: $t_(A E) = 3$* $arrow.r$ $t_(B E) = t_(C E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 0, t_(A C) = 0, t_(B C) = 2$.
      Cấu hình: $ {2 times (B, C), 3 times (A, E)} $ $\rightarrow$ Số cấu hình cột $M_4 = 10$.
    + *Khả năng 2.2: $t_(A E) = 2$* $arrow.r$ $t_(B E) + t_(C E) = 1$.
      * Với $t_(C E) = 1, t_(B E) = 0$: Giải ra $t_(A B) = 1, t_(B C) = 1, t_(A C) = 0$.
        Cấu hình: $ {1 times (A, B), 1 times (B, C), 2 times (A, E), 1 times (C, E)} $ $\rightarrow$ Số cấu hình cột $M_5 = 60$.
      * Với $t_(C E) = 0, t_(B E) = 1$: Giải ra $t_(A B) = 0, t_(B C) = 1, t_(A C) = 1$.
        Cấu hình: $ {1 times (A, C), 1 times (B, C), 2 times (A, E), 1 times (B, E)} $ $\rightarrow$ Số cấu hình cột $M_6 = 60$.
    + *Khả năng 2.3: $t_(A E) = 1$* $arrow.r$ $t_(B E) + t_(C E) = 2$.
      * Với $t_(C E) = 2, t_(B E) = 0$: Giải ra $t_(A B) = 2, t_(A C) = 0, t_(B C) = 0$.
        Cấu hình: $ {2 times (A, B), 1 times (A, E), 2 times (C, E)} $ $\rightarrow$ Số cấu hình cột $M_7 = 30$.
      * Với $t_(B E) = 2, t_(C E) = 0$: Giải ra $t_(A B) = 0, t_(A C) = 2, t_(B C) = 0$.
        Cấu hình: $ {2 times (A, C), 1 times (A, E), 2 times (B, E)} $ $\rightarrow$ Số cấu hình cột $M_8 = 30$.
      * Với $t_(B E) = 1, t_(C E) = 1$: Giải ra $t_(A B) = 1, t_(A C) = 1, t_(B C) = 0$.
        Cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (A, E), 1 times (B, E), 1 times (C, E)} $ $\rightarrow$ Số cấu hình cột $M_9 = 120$.
    + *Khả năng 2.4: $t_(A E) = 0 \implies t_(B E) + t_(C E) = 3$.* Hệ vô nghiệm vì $t_(C E) <= 2, t_(B E) <= 2$ nhưng tổng xuất hiện của C và B quá nhỏ không đủ tạo ra 3 cột đơn lẻ với E.
  
  Tổng số cấu hình cột hợp lệ là $M = 60 + 120 + 30 + 10 + 60 + 60 + 30 + 30 + 120 = 520$ cấu hình.
  Lúc này mới nhân hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C!) times 2^5 = 520 times (3! times 2! times 2!) times 32 = 520 times 24 times 32 = bold(399360) " cách." $
]

#ex-box(title: "✏️ Bài C12 — Ghế Trống 4: Bốn Lớp, Lưới 5 Cột, 4 Ghế Trống (2A, 2B, 1C, 1D, 4E)")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C, 1 học sinh lớp D và 4 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Ghế trống E hoạt động như một lớp phụ có 4 phần tử.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp đối diện từ $\{A, B, C, D, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) + t_(A E) + t_(B E) + t_(C E) + t_(D E) + t_(E E) = 5 \
  t_(A B) + t_(A C) + t_(A D) + t_(A E) = 2 \
  t_(A B) + t_(B C) + t_(B D) + t_(B E) = 2 \
  t_(A C) + t_(B C) + t_(C D) + t_(C E) = 1 \
  t_(A D) + t_(B D) + t_(C D) + t_(D E) = 1 \
  t_(A E) + t_(B E) + t_(C E) + t_(D E) + 2 t_(E E) = 4
  $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 2$ (vì $2 t_(E E) <= 4$):
  - *Trường hợp 1: $t_(E E) = 2$* $arrow.r$ $t_(A E) = t_(B E) = t_(C E) = t_(D E) = 0$.
    Hệ con bảo toàn cho A, B, C, D là:
    + $t_(A C) + t_(B C) + t_(C D) = 1$
    + $t_(A D) + t_(B D) + t_(C D) = 1$
    Biện luận theo $t_(C D) <= 1$:
    * Nếu $t_(C D) = 1 \implies$ tất cả các biến chứa C, D khác bằng 0. Khi đó từ A và B ta được $t_(A B) = 2$.
      Cấu hình: $ {2 times (A, B), 1 times (C, D), 2 times (E, E)} $ $\rightarrow$ Số cấu hình cột $M_1 = frac(5!, 2! 1! 2!) = 30$.
    * Nếu $t_(C D) = 0 \implies t_(A C) + t_(B C) = 1$ và $t_(A D) + t_(B D) = 1$. Có 2 nghiệm con thỏa mãn hệ:
      - $t_(A C) = 1, t_(B D) = 1 \implies t_(A B) = 1$.
        Cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, D), 2 times (E, E)} $ $\rightarrow$ Số cấu hình cột $M_2 = 60$.
      - $t_(B C) = 1, t_(A D) = 1 \implies t_(A B) = 1$.
        Cấu hình: $ {1 times (A, B), 1 times (B, C), 1 times (A, D), 2 times (E, E)} $ $\rightarrow$ Số cấu hình cột $M_3 = 60$.
  - *Trường hợp 2: $t_(E E) = 1$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) + t_(D E) = 2$. Biện luận theo $t_(C D) <= 1$:
    * Nếu $t_(C D) = 1 \implies t_(C E) = 0, t_(D E) = 0$. Do đó $t_(A E) + t_(B E) = 2$.
      Theo tính đối xứng $t_(A E) = t_(B E) = 1 \implies t_(A B) = 1$.
      Cấu hình: $ {1 times (A, B), 1 times (C, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $\rightarrow$ Số cấu hình cột $M_4 = 120$.
    * Nếu $t_(C D) = 0$: Biện luận theo $t_(C E), t_(D E) \in \{0, 1\}$:
      - Với $t_(C E) = 1, t_(D E) = 1 \implies t_(A E) = t_(B E) = 0 \implies t_(A B) = 2$.
        Cấu hình: $ {2 times (A, B), 1 times (C, E), 1 times (D, E), 1 times (E, E)} $ $\rightarrow$ Số cấu hình cột $M_5 = 60$.
      - Với $t_(C E) = 1, t_(D E) = 0 \implies t_(A E) + t_(B E) = 1$. Giải ra 2 nghiệm con:
        - $t_(A E) = 1 \implies t_(A B) = 1, t_(B D) = 1$. Cấu hình: $ {1 times (A, B), 1 times (C, E), 1 times (A, E), 1 times (B, D), 1 times (E, E)} $ $\rightarrow M_6 = 120$.
        - $t_(B E) = 1 \implies t_(A B) = 2 \implies t_(A D) = 1$. Cấu hình: $ {2 times (A, B), 1 times (C, E), 1 times (B, E), 1 times (A, D), 1 times (E, E)} $ $\rightarrow M_7 = 120$.
      - Với $t_(C E) = 0, t_(D E) = 1 \implies t_(A E) + t_(B E) = 1$. Tương tự:
        - $t_(A E) = 1 \implies t_(A B) = 2 \implies t_(B C) = 1$. Cấu hình: $ {2 times (A, B), 1 times (D, E), 1 times (A, E), 1 times (B, C), 1 times (E, E)} $ $\rightarrow M_8 = 120$.
        - $t_(B E) = 1 \implies t_(A B) = 1 \implies t_(A C) = 1$. Cấu hình: $ {1 times (A, B), 1 times (D, E), 1 times (B, E), 1 times (A, C), 1 times (E, E)} $ $\rightarrow M_9 = 120$.
      - Với $t_(C E) = 0, t_(D E) = 0 \implies t_(A E) = 1, t_(B E) = 1$.
        Giải ra 2 cấu hình hợp lệ là:
        - $ {1 times (A, C), 1 times (B, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $\rightarrow M_(10) = 120$.
        - $ {1 times (B, C), 1 times (A, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $\rightarrow M_(11) = 120$.
  - *Trường hợp 3: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) + t_(D E) = 4$.
    Nghiệm duy nhất thỏa mãn là $t_(A E) = 2, t_(B E) = 2, t_(C E) = 0, t_(D E) = 0 \implies t_(C D) = 1$.
    Cấu hình: $ {1 times (C, D), 2 times (A, E), 2 times (B, E)} $ $\rightarrow$ Số cấu hình cột $M_(12) = frac(5!, 1! 2! 2!) = 30$.
  
  Tổng số cấu hình cột hợp lệ là $M = 30 + 60 + 60 + 120 + 60 + 120 + 120 + 120 + 120 + 120 + 120 + 30 = 1080$ cấu hình.
  Lúc này mới nhân hoán vị học sinh và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C! n_D!) times 2^5 = 1080 times (2! times 2! times 1! times 1!) times 32 = 1080 times 4 times 32 = bold(138240) " cách." $
]

#ex-box(title: "✏️ Bài C13 — Ghế Trống 5: Cực Hạn Biện Luận, 4 Ghế Trống (2A, 2B, 2C, 4E)")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C và 4 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Ghế trống E hoạt động như một lớp phụ có 4 phần tử.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp đối diện từ $\{A, B, C, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(B C) + t_(A E) + t_(B E) + t_(C E) + t_(E E) = 5 quad &("tổng số cột") \\\\
  t_(A B) + t_(A C) + t_(A E) = n_A = 2 quad &("lượt xuất hiện của A") \\\\
  t_(A B) + t_(B C) + t_(B E) = n_B = 2 quad &("lượt xuất hiện của B") \\\\
  t_(A C) + t_(B C) + t_(C E) = n_C = 2 quad &("lượt xuất hiện của C") \\\\
  t_(A E) + t_(B E) + t_(C E) + 2 t_(E E) = n_E = 4 quad &("lượt xuất hiện của E")
  $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 2$ (vì $2 t_(E E) <= 4$):
  - *Trường hợp 1: $t_(E E) = 2$* $arrow.r$ $t_(A E) = t_(B E) = t_(C E) = 0$.
    Hệ con bảo toàn của A, B, C có dạng đối xứng:
    $
    t_(A B) + t_(A C) = 2 \
    t_(A B) + t_(B C) = 2 \
    t_(A C) + t_(B C) = 2
    $
    Giải ra nghiệm duy nhất: $t_(A B) = 1, t_(A C) = 1, t_(B C) = 1$.
    Ta thu được cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, C), 2 times (E, E)} $ $\rightarrow$ Số cấu hình cột $M_1 = frac(5!, 1! 1! 1! 2!) = 60$.
  - *Trường hợp 2: $t_(E E) = 1$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) = 2$. Có 2 khả năng cho các biến chứa E:
    + *Khả năng 2.1: Có một biến bằng 2, hai biến kia bằng 0.* Do tính đối xứng, giả sử $t_(A E) = 2, t_(B E) = t_(C E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 0, t_(A C) = 0, t_(B C) = 2$.
      Cấu hình: $ {2 times (B, C), 2 times (A, E), 1 times (E, E)} $. 
      Có 3 cấu hình đối xứng tương tự với số cấu hình cột: $3 times frac(5!, 2! 2! 1!) = 3 times 30 = 90$ cấu hình.
    + *Khả năng 2.2: Có hai biến bằng 1, một biến bằng 0.* Giả sử $t_(A E) = 1, t_(B E) = 1, t_(C E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 0, t_(A C) = 1, t_(B C) = 1$.
      Cấu hình: $ {1 times (A, C), 1 times (B, C), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $.
      Có 3 cấu hình đối xứng tương tự với số cấu hình cột: $3 times frac(5!, 1! 1! 1! 1! 1!) = 3 times 120 = 360$ cấu hình.
  - *Trường hợp 3: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) = 4$. Do $t_(i E) <= 2$, chỉ có 2 khả năng cho các biến chứa E:
    + *Khả năng 3.1: Bộ ba $(2, 2, 0)$* $arrow.r$ Giả sử $t_(A E) = 2, t_(B E) = 2, t_(C E) = 0$.
      Giải hệ con cho ta nghiệm vô lý $t_(C D) = 2$ (loại do không có D).
    + *Khả năng 3.2: Bộ ba $(2, 1, 1)$* $arrow.r$ Giả sử $t_(A E) = 2, t_(B E) = 1, t_(C E) = 1$.
      Giải hệ con ta được nghiệm: $t_(A B) = 0, t_(A C) = 0, t_(B C) = 1$.
      Cấu hình: $ {1 times (B, C), 2 times (A, E), 1 times (B, E), 1 times (C, E)} $.
      Có 3 cấu hình đối xứng tương tự với số cấu hình cột: $3 times frac(5!, 1! 2! 1! 1!) = 3 times 60 = 180$ cấu hình.
  
  Tổng số cấu hình cột hợp lệ là $M = 60 + 90 + 360 + 180 = 690$ cấu hình.
  Lúc này mới nhân hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C!) times 2^5 = 690 times (2! times 2! times 2!) times 32 = 690 times 8 times 32 = bold(176640) " cách." $
]"""

if target in content:
    content = content.replace(target, replacement)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)
    print("Empty seat problems appended successfully!")
else:
    print("Could not find the target end block!")
