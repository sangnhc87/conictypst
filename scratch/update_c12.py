filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

target = """#ex-box(title: "✏️ Bài C12 — Ghế Trống 4: Bốn Lớp, Lưới 5 Cột, 4 Ghế Trống (2A, 2B, 1C, 1D, 4E)")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C, 1 học sinh lớp D và 4 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Ghế trống E hoạt động như một lớp phụ có 4 phần tử.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp đối diện từ $\{A, B, C, D, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) + t_(A E) + t_(B E) + t_(C E) + t_(D E) + t_(E E) = 5   t_(A B) + t_(A C) + t_(A D) + t_(A E) = 2   t_(A B) + t_(B C) + t_(B D) + t_(B E) = 2   t_(A C) + t_(B C) + t_(C D) + t_(C E) = 1   t_(A D) + t_(B D) + t_(C D) + t_(D E) = 1   t_(A E) + t_(B E) + t_(C E) + t_(D E) + 2 t_(E E) = 4
  $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 2$ (vì $2 t_(E E) <= 4$):
  - *Trường hợp 1: $t_(E E) = 2$* $arrow.r$ $t_(A E) = t_(B E) = t_(C E) = t_(D E) = 0$.
    Hệ con bảo toàn cho A, B, C, D là:
    + $t_(A C) + t_(B C) + t_(C D) = 1$
    + $t_(A D) + t_(B D) + t_(C D) = 1$
    Biện luận theo $t_(C D) <= 1$:
    - Nếu $t_(C D) = 1  arrow.r.double $ tất cả các biến chứa C, D khác bằng 0. Khi đó từ A và B ta được $t_(A B) = 2$.
      Cấu hình: $ {2 times (A, B), 1 times (C, D), 2 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(5!, 2! 1! 2!) = 30$.
    - Nếu $t_(C D) = 0  arrow.r.double  t_(A C) + t_(B C) = 1$ và $t_(A D) + t_(B D) = 1$. Có 2 nghiệm con thỏa mãn hệ:
      - $t_(A C) = 1, t_(B D) = 1  arrow.r.double  t_(A B) = 1$.
        Cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, D), 2 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_2 = 60$.
      - $t_(B C) = 1, t_(A D) = 1  arrow.r.double  t_(A B) = 1$.
        Cấu hình: $ {1 times (A, B), 1 times (B, C), 1 times (A, D), 2 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_3 = 60$.
  - *Trường hợp 2: $t_(E E) = 1$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) + t_(D E) = 2$. Biện luận theo $t_(C D) <= 1$:
    - Nếu $t_(C D) = 1  arrow.r.double  t_(C E) = 0, t_(D E) = 0$. Do đó $t_(A E) + t_(B E) = 2$.
      Theo tính đối xứng $t_(A E) = t_(B E) = 1  arrow.r.double  t_(A B) = 1$.
      Cấu hình: $ {1 times (A, B), 1 times (C, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_4 = 120$.
    - Nếu $t_(C D) = 0$: Biện luận theo $t_(C E), t_(D E) \in \{0, 1\}$:
      - Với $t_(C E) = 1, t_(D E) = 1  arrow.r.double  t_(A E) = t_(B E) = 0  arrow.r.double  t_(A B) = 2$.
        Cấu hình: $ {2 times (A, B), 1 times (C, E), 1 times (D, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_5 = 60$.
      - Với $t_(C E) = 1, t_(D E) = 0  arrow.r.double  t_(A E) + t_(B E) = 1$. Giải ra 2 nghiệm con:
        - $t_(A E) = 1  arrow.r.double  t_(A B) = 1, t_(B D) = 1$. Cấu hình: $ {1 times (A, B), 1 times (C, E), 1 times (A, E), 1 times (B, D), 1 times (E, E)} $ $arrow.r M_6 = 120$.
        - $t_(B E) = 1  arrow.r.double  t_(A B) = 2  arrow.r.double  t_(A D) = 1$. Cấu hình: $ {2 times (A, B), 1 times (C, E), 1 times (B, E), 1 times (A, D), 1 times (E, E)} $ $arrow.r M_7 = 120$.
      - Với $t_(C E) = 0, t_(D E) = 1  arrow.r.double  t_(A E) + t_(B E) = 1$. Tương tự:
        - $t_(A E) = 1  arrow.r.double  t_(A B) = 2  arrow.r.double  t_(B C) = 1$. Cấu hình: $ {2 times (A, B), 1 times (D, E), 1 times (A, E), 1 times (B, C), 1 times (E, E)} $ $arrow.r M_8 = 120$.
        - $t_(B E) = 1  arrow.r.double  t_(A B) = 1  arrow.r.double  t_(A C) = 1$. Cấu hình: $ {1 times (A, B), 1 times (D, E), 1 times (B, E), 1 times (A, C), 1 times (E, E)} $ $arrow.r M_9 = 120$.
      - Với $t_(C E) = 0, t_(D E) = 0  arrow.r.double  t_(A E) = 1, t_(B E) = 1$.
        Giải ra 2 cấu hình hợp lệ là:
        - $ {1 times (A, C), 1 times (B, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $arrow.r M_(10) = 120$.
        - $ {1 times (B, C), 1 times (A, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $arrow.r M_(11) = 120$.
  - *Trường hợp 3: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) + t_(D E) = 4$.
    Nghiệm duy nhất thỏa mãn là $t_(A E) = 2, t_(B E) = 2, t_(C E) = 0, t_(D E) = 0  arrow.r.double  t_(C D) = 1$.
    Cấu hình: $ {1 times (C, D), 2 times (A, E), 2 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_(12) = frac(5!, 1! 2! 2!) = 30$.
  
  Tổng số cấu hình cột hợp lệ là $M = 30 + 60 + 60 + 120 + 60 + 120 + 120 + 120 + 120 + 120 + 120 + 30 = 1080$ cấu hình.
  Lúc này mới nhân hoán vị học sinh và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C! n_D!) times 2^5 = 1080 times (2! times 2! times 1! times 1!) times 32 = 1080 times 4 times 32 = bold(138240) " cách." $
]"""

replacement = """#ex-box(title: "✏️ Bài C12 — Ghế Trống 4: Bốn Lớp, Lưới 5 Cột, 4 Ghế Trống (2A, 2B, 1C, 1D, 4E)")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C, 1 học sinh lớp D và 4 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Ghế trống E hoạt động như một lớp phụ có 4 phần tử.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp đối diện từ $\{A, B, C, D, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) + t_(A E) + t_(B E) + t_(C E) + t_(D E) + t_(E E) = 5 \\\\
  t_(A B) + t_(A C) + t_(A D) + t_(A E) = n_A = 2 \\\\
  t_(A B) + t_(B C) + t_(B D) + t_(B E) = n_B = 2 \\\\
  t_(A C) + t_(B C) + t_(C D) + t_(C E) = n_C = 1 \\\\
  t_(A D) + t_(B D) + t_(C D) + t_(D E) = n_D = 1 \\\\
  t_(A E) + t_(B E) + t_(C E) + t_(D E) + 2 t_(E E) = n_E = 4
  $
  Cộng phương trình xuất hiện của 4 lớp A, B, C, D:
  $ (t_(A B) + t_(A C) + t_(A D) + t_(A E)) + (t_(A B) + t_(B C) + t_(B D) + t_(B E)) + (t_(A C) + t_(B C) + t_(C D) + t_(C E)) + (t_(A D) + t_(B D) + t_(C D) + t_(D E)) = 2 + 2 + 1 + 1 = 6 $
  $ arrow.r.double 2(t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D)) + (t_(A E) + t_(B E) + t_(C E) + t_(D E)) = 6 $
  Thế $t_(A E) + t_(B E) + t_(C E) + t_(D E) = 4 - 2 t_(E E)$ từ phương trình của E vào, ta được:
  $ 2(t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D)) + 4 - 2 t_(E E) = 6 $
  $ arrow.r.double t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 1 + t_(E E) $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 2$ (vì $2 t_(E E) <= 4$):
  
  - *Trường hợp 1: $t_(E E) = 2$* $arrow.r$ $t_(A E) = t_(B E) = t_(C E) = t_(D E) = 0$.
    Hệ con bảo toàn cho A, B, C, D là:
    + $t_(A C) + t_(B C) + t_(C D) = 1$
    + $t_(A D) + t_(B D) + t_(C D) = 1$
    Biện luận theo $t_(C D) <= 1$:
    - Nếu $t_(C D) = 1 \implies$ tất cả các biến chứa C, D khác bằng 0 $\implies t_(A C) = t_(B C) = t_(A D) = t_(B D) = 0$. Khi đó từ A và B ta được $t_(A B) = 2$.
      Cấu hình: $ {2 times (A, B), 1 times (C, D), 2 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(5!, 2! 1! 2!) = 30$.
    - Nếu $t_(C D) = 0 \implies t_(A C) + t_(B C) = 1$ và $t_(A D) + t_(B D) = 1$. Có 2 nghiệm con thỏa mãn hệ:
      - $t_(A C) = 1, t_(B D) = 1 \implies t_(A B) = 1$.
        Cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, D), 2 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_2 = 60$.
      - $t_(B C) = 1, t_(A D) = 1 \implies t_(A B) = 1$.
        Cấu hình: $ {1 times (A, B), 1 times (B, C), 1 times (A, D), 2 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_3 = 60$.
    Tổng số cấu hình của Trường hợp 1 là $M_(T1) = 30 + 60 + 60 = 150$.

  - *Trường hợp 2: $t_(E E) = 1$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) + t_(D E) = 2$.
    Ta có $t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 2$. Biện luận theo $t_(C D) <= 1$:
    - Nếu $t_(C D) = 1 \implies t_(A C) = t_(B C) = t_(A D) = t_(B D) = 0$ và $t_(C E) = t_(D E) = 0 \implies t_(A E) + t_(B E) = 2$.
      Theo tính đối xứng $t_(A E) = t_(B E) = 1 \implies t_(A B) = 1$.
      Cấu hình: $ {1 times (A, B), 1 times (C, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_4 = 120$.
    - Nếu $t_(C D) = 0$: Biện luận theo cặp $(t_(C E), t_(D E))$:
      - Với $t_(C E) = 1, t_(D E) = 1 \implies t_(A E) = t_(B E) = 0 \implies t_(A B) = 2$.
        Cấu hình: $ {2 times (A, B), 1 times (C, E), 1 times (D, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_5 = 60$.
      - Với $t_(C E) = 1, t_(D E) = 0 \implies t_(A E) + t_(B E) = 1$. Giải ra 2 nghiệm con:
        - $t_(A E) = 1 \implies t_(A B) = 1, t_(B D) = 1$.
          Cấu hình: $ {1 times (A, B), 1 times (C, E), 1 times (A, E), 1 times (B, D), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_6 = 120$.
        - $t_(B E) = 1 \implies t_(A B) = 1, t_(A D) = 1$.
          Cấu hình: $ {1 times (A, B), 1 times (C, E), 1 times (B, E), 1 times (A, D), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_7 = 120$.
      - Với $t_(C E) = 0, t_(D E) = 1 \implies t_(A E) + t_(B E) = 1$. Tương tự:
        - $t_(A E) = 1 \implies t_(A B) = 1, t_(B C) = 1$.
          Cấu hình: $ {1 times (A, B), 1 times (D, E), 1 times (A, E), 1 times (B, C), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_8 = 120$.
        - $t_(B E) = 1 \implies t_(A B) = 1, t_(A C) = 1$.
          Cấu hình: $ {1 times (A, B), 1 times (D, E), 1 times (B, E), 1 times (A, C), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_9 = 120$.
      - Với $t_(C E) = 0, t_(D E) = 0 \implies t_(A E) + t_(B E) = 2$:
        - Nếu $t_(A E) = 1, t_(B E) = 1$, ta có 2 nghiệm con:
          - $t_(A C) = 1, t_(B D) = 1 \implies$ Cấu hình: $ {1 times (A, C), 1 times (B, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_(10) = 120$.
          - $t_(B C) = 1, t_(A D) = 1 \implies$ Cấu hình: $ {1 times (B, C), 1 times (A, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_(11) = 120$.
        - Nếu $t_(A E) = 2, t_(B E) = 0 \implies t_(B C) = 1, t_(B D) = 1$.
          Cấu hình: $ {1 times (B, C), 1 times (B, D), 2 times (A, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_(12) = 60$.
        - Nếu $t_(A E) = 0, t_(B E) = 2 \implies t_(A C) = 1, t_(A D) = 1$.
          Cấu hình: $ {1 times (A, C), 1 times (A, D), 2 times (B, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_(13) = 60$.
    Tổng số cấu hình của Trường hợp 2 là $M_(T2) = 120 + 60 + 120 + 120 + 120 + 120 + 120 + 120 + 60 + 60 = 1020$.

  - *Trường hợp 3: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) + t_(D E) = 4$.
    Ta có $t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 1$. Vì tổng này bằng 1 nên có duy nhất một biến bằng 1 và 5 biến còn lại bằng 0:
    - Nếu $t_(C D) = 1 \implies t_(A E) = 2, t_(B E) = 2, t_(C E) = 0, t_(D E) = 0$.
      Cấu hình: $ {1 times (C, D), 2 times (A, E), 2 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_(14) = 30$.
    - Nếu $t_(A B) = 1 \implies t_(A E) = 1, t_(B E) = 1, t_(C E) = 1, t_(D E) = 1$.
      Cấu hình: $ {1 times (A, B), 1 times (A, E), 1 times (B, E), 1 times (C, E), 1 times (D, E)} $ $arrow.r$ Số cấu hình cột $M_(15) = 120$.
    - Nếu $t_(B D) = 1 \implies t_(A E) = 2, t_(B E) = 1, t_(C E) = 1, t_(D E) = 0$.
      Cấu hình: $ {1 times (B, D), 2 times (A, E), 1 times (B, E), 1 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_(16) = 60$.
    - Nếu $t_(A C) = 1 \implies t_(A E) = 1, t_(B E) = 2, t_(C E) = 0, t_(D E) = 1$.
      Cấu hình: $ {1 times (A, C), 1 times (A, E), 2 times (B, E), 1 times (D, E)} $ $arrow.r$ Số cấu hình cột $M_(17) = 60$.
    - Nếu $t_(B C) = 1 \implies t_(A E) = 2, t_(B E) = 1, t_(C E) = 0, t_(D E) = 1$.
      Cấu hình: $ {1 times (B, C), 2 times (A, E), 1 times (B, E), 1 times (D, E)} $ $arrow.r$ Số cấu hình cột $M_(18) = 60$.
    - Nếu $t_(A D) = 1 \implies t_(A E) = 1, t_(B E) = 2, t_(C E) = 1, t_(D E) = 0$.
      Cấu hình: $ {1 times (A, D), 1 times (A, E), 2 times (B, E), 1 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_(19) = 60$.
    Tổng số cấu hình của Trường hợp 3 là $M_(T3) = 30 + 120 + 60 + 60 + 60 + 60 = 390$.
  
  Tổng số cấu hình cột hợp lệ là $M = 150 + 1020 + 390 = 1560$ cấu hình.
  Lúc này mới nhân hoán vị học sinh và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C! n_D!) times 2^5 = 1560 times (2! times 2! times 1! times 1!) times 32 = 1560 times 4 times 32 = bold(199680) " cách." $
]"""

if target in content:
    content = content.replace(target, replacement)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)
    print("Bài C12 updated successfully with correct math and full cases!")
else:
    print("Could not find the target block for C12!")
