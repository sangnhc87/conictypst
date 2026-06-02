import re

filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Normalize newlines
content = content.replace("\r\n", "\n")

# ----------------- 1. Standardize Example 1.6 -----------------
# We look for "#eg-box(title: [🎯 Ví Dụ 1.6" and replace it
eg16_pattern = r'(#eg-box\(title:\s*\[🎯 Ví Dụ 1\.6 — Quy mô lớn: 2A, 2B, 2C, 2D ngồi 2 hàng 4 ghế \(\$m=4\$\)\]\)\[.*?\])\s*\n\s*\*⬧ Dạng 1\.4\.3'
match16 = re.search(eg16_pattern, content, re.DOTALL)
if match16:
    target_eg16 = match16.group(1)
    print("Found Example 1.6!")
    
    replacement_eg16 = """#eg-box(title: [🎯 Ví Dụ 1.6 — Quy mô lớn: 2A, 2B, 2C, 2D ngồi 2 hàng 4 ghế ($m=4$)])[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C, 2 học sinh lớp D. Xếp vào 2 hàng 4 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 4$ cột. Học sinh của mỗi lớp là $n_A = n_B = n_C = n_D = 2$.
  Dưới đây là 2 cách tiếp cận giải quyết bài toán:

  *🔵 Cách 1: Phương pháp phân tích chu trình đồ thị*
  Mỗi lớp có đúng 2 học sinh nên mỗi lớp phải xuất hiện trong đúng 2 cột khác nhau. Ta phân tích các cấu trúc ghép cột hợp lệ dưới dạng đồ thị (coi các cột là cạnh nối giữa các lớp):
  - *Trường hợp 1: Tạo thành một vòng khép kín duy nhất 4 đỉnh (Single 4-cycle).* Các cột ghép các lớp theo vòng tròn khép kín dạng: A - B - C - D - A.
    1. Số cách lập vòng tròn từ 4 lớp: $frac((4-1)!, 2) = 3$ cách (gồm: A-B-C-D-A, A-B-D-C-A, A-C-B-D-A).
    2. Với mỗi vòng tròn lớp, kiểu cột được xác định độc nhất.
    3. Số cách xếp cho TH1 là:
       $ N_1 = 3 times underbrace(4!, "Gán vào 4 cột") times underbrace(2! 2! 2! 2!, "Hoán vị học sinh") times underbrace(2^4, "Đảo hàng") = 3 times 24 times 16 times 16 = bold(18432) " cách." $
  - *Trường hợp 2: Tạo thành 2 vòng nhỏ 2 đỉnh (Hai cặp song song).* 4 lớp chia làm 2 cặp tự ghép với nhau. Ví dụ: cặp $\{A, B\}$ ghép 2 cột và $\{C, D\}$ ghép 2 cột.
    1. Số cách phân 4 lớp thành 2 cặp: $frac(1, 2) binom(4, 2) = 3$ cách.
    2. Với mỗi cách chia, kiểu cột gồm 2 cột kiểu này và 2 cột kiểu kia (ví dụ: 2 cột $\{A, B\}$, 2 cột $\{C, D\}$).
    3. Số cách xếp cho TH2 là:
       $ N_2 = 3 times underbrace(frac(4!, 2! times 2!), "Gán kiểu cột") times underbrace(2! 2! 2! 2!, "Hoán vị học sinh") times underbrace(2^4, "Đảo hàng") = 3 times 6 times 16 times 16 = bold(4608) " cách." $
  
  $arrow.r$ Tổng số cách xếp: $N = N_1 + N_2 = 18432 + 4608 = bold(23040)$ cách.

  *🟣 Cách 2: Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 4 quad &("tổng số cột") \\
  t_(A B) + t_(A C) + t_(A D) = n_A = 2 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) + t_(B D) = n_B = 2 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) + t_(C D) = n_C = 2 quad &("lượt xuất hiện của C") \\
  t_(A D) + t_(B D) + t_(C D) = n_D = 2 quad &("lượt xuất hiện của D")
  $
  Ta biện luận nghiệm nguyên không âm của hệ phương trình dựa trên giới hạn trên của các biến. Vì mỗi lớp chỉ có 2 học sinh, nên số cột chung của hai lớp bất kỳ $t_(i j) <= 2$.
  - *Trường hợp 2.1: Có một biến $t_(i j) = 2$ (cấu hình hai cặp song song)*
    Không mất tính tổng quát, giả sử $t_(A B) = 2$. Khi đó từ các phương trình của A và B, ta có các biến liên quan khác bằng 0: $t_(A C) = t_(A D) = t_(B C) = t_(B D) = 0$. 
    Thay vào phương trình của C và D ta được $t_(C D) = 2$.
    Vậy ta có cấu hình: $ {2 times (A, B), 2 times (C, D)} $.
    Do tính đối xứng, ta có 3 cách chia 4 lớp thành 2 cặp tương tự:
    1. $ {2 times (A, B), 2 times (C, D)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(4!, 2! 2!) = 6$.
    2. $ {2 times (A, C), 2 times (B, D)} $ $arrow.r$ Số cấu hình cột $M_2 = 6$.
    3. $ {2 times (A, D), 2 times (B, C)} $ $arrow.r$ Số cấu hình cột $M_3 = 6$.
    Tổng cộng cho trường hợp này có $6 + 6 + 6 = 18$ cấu hình cột.
  
  - *Trường hợp 2.2: Tất cả các biến $t_(i j) <= 1$ (cấu hình một vòng lớn 4 đỉnh)*
    Hệ phương trình chỉ có các nghiệm mà các biến chỉ nhận giá trị $0$ hoặc $1$. Để tổng số lượt xuất hiện của mỗi lớp bằng 2, mỗi lớp phải ghép với đúng 2 lớp khác. Điều này tương ứng với các cấu hình vòng khép kín.
    Có 3 nghiệm tương ứng với 3 vòng tròn:
    1. Vòng $A-B-C-D-A$ $arrow.r$ Cấu hình $ {1 times (A, B), 1 times (B, C), 1 times (C, D), 1 times (A, D)} $ $\rightarrow$ Số cấu hình cột là $frac(4!, 1! 1! 1! 1!) = 24$.
    2. Vòng $A-B-D-C-A$ $arrow.r$ Cấu hình $ {1 times (A, B), 1 times (B, D), 1 times (C, D), 1 times (A, C)} $ $\rightarrow$ Số cấu hình cột là $24$.
    3. Vòng $A-C-B-D-A$ $arrow.r$ Cấu hình $ {1 times (A, C), 1 times (B, C), 1 times (B, D), 1 times (A, D)} $ $\rightarrow$ Số cấu hình cột là $24$.
    Tổng cộng cho trường hợp này có $24 + 24 + 24 = 72$ cấu hình cột.

  #rev-box(title: "🧩 Bảng tính số cấu hình cột (Ví dụ 1.6)")[
    #align(center)[
      #table(
        columns: (2.2fr, 1.2fr, 1.6fr),
        inset: 6pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình lớp]],
        [#text(fill: white, weight: "bold")[Số cấu hình cột M]],
        
        [$2 times (A, B), 2 times (C, D)$ \\ (và 2 hoán vị lớp)],
        [$3$],
        [$3 times frac(4!, 2! 2!) = 18$],

        [$1 times (A, B), 1 times (B, C), \\ 1 times (C, D), 1 times (A, D)$ \\ (và 2 hoán vị vòng)],
        [$3$],
        [$3 times frac(4!, 1! 1! 1! 1!) = 72$]
      )
    ]
    Tổng số cấu hình cột hợp lệ thu được là: $M = 18 + 72 = 90$ cấu hình.
    
    Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^4 = 16$):
    $ N = M times (n_A! n_B! n_C! n_D!) times 2^4 = 90 times (2! times 2! times 2! times 2!) times 16 = 90 times 16 times 16 = bold(23040) " cách." $
  ]
]"""
    content = content.replace(target_eg16, replacement_eg16)
else:
    print("Could not find Example 1.6!")

# ----------------- 2. Standardize Example 1.7 -----------------
# We look for "#eg-box(title: [🎯 Ví Dụ 1.7" and replace it
eg17_pattern = r'(#eg-box\(title:\s*\[🎯 Ví Dụ 1\.7 — Quy mô nhỏ: 2A, 2B, 1C, 1D ngồi 2 hàng 3 ghế \(\$m=3\$\)\]\)\[.*?\])\s*\n\s*#eg-box\(title:\s*'
match17 = re.search(eg17_pattern, content, re.DOTALL)
if match17:
    target_eg17 = match17.group(1)
    print("Found Example 1.7!")
    
    replacement_eg17 = """#eg-box(title: [🎯 Ví Dụ 1.7 — Quy mô nhỏ: 2A, 2B, 1C, 1D ngồi 2 hàng 3 ghế ($m=3$)])[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C, 1 học sinh lớp D. Xếp vào 2 hàng 3 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 3$ cột. Học sinh của các lớp là $n_A = 2, n_B = 2, n_C = 1, n_D = 1$.
  Dưới đây là 2 cách tiếp cận giải quyết bài toán:

  *🔵 Cách 1: Chia trường hợp theo vị trí của C và D (Phương pháp ghép nhóm thủ công)*
  Ta phân tích các phương án dựa vào vị trí của C và D:
  - *Trường hợp 1: C và D ngồi đối diện nhau.* Có 1 cột kiểu $(C, D)$. Hai cột còn lại chứa 2A và 2B $arrow.r$ bắt buộc phải là 2 cột kiểu $(A, B)$.
    1. Số cách gán kiểu cột vào vị trí: $M_1 = frac(3!, 1! times 2!) = 3$ cách.
    2. Hoán vị học sinh cụ thể: $2!$ (lớp A) $times 2!$ (lớp B) $times 1!$ (lớp C) $times 1!$ (lớp D) $= 4$ cách.
    3. Đảo hàng: $2^3 = 8$ cách.
    4. Đóng góp TH1: $N_1 = 3 times 4 times 8 = bold(96)$ cách.
    
  - *Trường hợp 2: C và D đối diện với học sinh lớp khác.*
    1. *TH2a: C ghép với A, D ghép với B.* Kiểu cột gồm: 1 cột $(A, C)$, 1 cột $(B, D)$. Cột còn lại chứa 1A và 1B còn lại $arrow.r$ kiểu $(A, B)$.
       Số cách gán kiểu cột: $M_(2a) = frac(3!, 1! times 1! times 1!) = 6$ cách.
       Đóng góp TH2a: $N_(2a) = 6 times 4 times 8 = bold(192)$ cách.
    2. *TH2b: C ghép với B, D ghép với A.* Kiểu cột gồm: 1 cột $(B, C)$, 1 cột $(A, D)$ và 1 cột $(A, B)$.
       Tương tự TH2a, số cách gán kiểu cột: $M_(2b) = 6$ cách.
       Đóng góp TH2b: $N_(2b) = bold(192)$ cách.
       
  $arrow.r$ Tổng số cách xếp là: $N = N_1 + N_(2a) + N_(2b) = 96 + 192 + 192 = bold(480)$ cách.

  *🟣 Cách 2: Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh vào $m = 3$ cột, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 3 quad &("tổng số cột") \\
  t_(A B) + t_(A C) + t_(A D) = n_A = 2 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) + t_(B D) = n_B = 2 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) + t_(C D) = n_C = 1 quad &("lượt xuất hiện của C") \\
  t_(A D) + t_(B D) + t_(C D) = n_D = 1 quad &("lượt xuất hiện của D")
  $
  Ta chọn biến có giới hạn hẹp nhất để biện luận. Vì $n_C = n_D = 1$, ta có $t_(C D) <= 1$.
  - *Trường hợp 2.1: $t_(C D) = 1$*
    Khi đó bắt buộc các cột chứa C hoặc D khác đều bằng 0 ($t_(A C) = t_(B C) = t_(A D) = t_(B D) = 0$). 
    Thay vào phương trình của A và B ta được $t_(A B) = 2$.
    Vậy ta có duy nhất cấu hình cột: $ {2 times (A, B), 1 times (C, D)} $.
    + Số cách gán kiểu cột vào 3 vị trí: $M_1 = frac(3!, 2! 1!) = 3$ cách.
  
  - *Trường hợp 2.2: $t_(C D) = 0$*
    Khi đó phương trình của C và D trở thành: $t_(A C) + t_(B C) = 1$ và $t_(A D) + t_(B D) = 1$.
    Điều này cho ta 4 trường hợp con của cặp $((t_(A C), t_(B C)), (t_(A D), t_(B D)))$:
    1. *Khả năng 1:* $t_(A C) = 1, t_(A D) = 1$ $arrow.r$ $t_(B C) = 0, t_(B D) = 0$. Thay vào phương trình A ta được $t_(A B) + 2 = 2 \\implies t_(A B) = 0$. Thay vào B ta được $0 + 0 + 0 = 0 \\neq 2$ (loại).
    2. *Khả năng 2:* $t_(B C) = 1, t_(B D) = 1$ $arrow.r$ $t_(A C) = 0, t_(A D) = 0$. Thay vào A ta được $t_(A B) = 2$. Thay vào B ta được $2 + 1 + 1 = 4 \\neq 2$ (loại).
    3. *Khả năng 3:* $t_(A C) = 1, t_(B D) = 1$ $arrow.r$ $t_(B C) = 0, t_(A D) = 0$. Thay vào A ta được $t_(A B) + 1 = 2 arrow.r.double t_(A B) = 1$. Thay vào B ta được $1 + 0 + 1 = 2$ (thỏa mãn).
       Ta thu được cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, D)} $.
       + Số cách gán $M_2 = frac(3!, 1! 1! 1!) = 6$.
    4. *Khả năng 4:* $t_(B C) = 1, t_(A D) = 1$ $arrow.r$ $t_(A C) = 0, t_(B D) = 0$. Thay vào A ta được $t_(A B) + 1 = 2 arrow.r.double t_(A B) = 1$. Thay vào B ta được $1 + 1 + 0 = 2$ (thỏa mãn).
       Ta thu được cấu hình: $ {1 times (A, B), 1 times (B, C), 1 times (A, D)} $.
       + Số cách gán $M_3 = frac(3!, 1! 1! 1!) = 6$.

  #rev-box(title: "🧩 Bảng tính số cấu hình cột (Ví dụ 1.7)")[
    #align(center)[
      #table(
        columns: (1.4fr, 2.3fr, 1.8fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Bộ ẩn $(t_(A B), t_(A C), t_(A D), t_(B C), t_(B D), t_(C D))$]],
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình cột M]],
        
        [$(2, 0, 0, 0, 0, 1)$], [$2 times (A, B) \\ 1 times (C, D)$], [$frac(3!, 2! 1!) = 3$],
        [$(1, 1, 0, 0, 1, 0)$], [$1 times (A, B) \\ 1 times (A, C) \\ 1 times (B, D)$], [$frac(3!, 1! 1! 1!) = 6$],
        [$(1, 0, 1, 1, 0, 0)$], [$1 times (A, B) \\ 1 times (B, C) \\ 1 times (A, D)$], [$frac(3!, 1! 1! 1!) = 6$]
      )
    ]
    Tổng số cấu hình cột hợp lệ là: $M = 3 + 6 + 6 = 15$ cấu hình.
    
    Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^3 = 8$):
    $ N = M times (n_A! n_B! n_C! n_D!) times 2^3 = 15 times (2! times 2! times 1! times 1!) times 8 = 15 times 4 times 8 = bold(480) " cách." $
  ]
]"""
    content = content.replace(target_eg17, replacement_eg17)
else:
    print("Could not find Example 1.7!")

# ----------------- 3. Standardize Example 1.8 & Append Examples 1.9, 1.10 -----------------
# We replace Example 1.8 and put Example 1.9, 1.10 right after it.
eg18_pattern = r'(#eg-box\(title:\s*\[🎯 Ví Dụ 1\.8 — Quy mô lớn: 3A, 3B, 1C, 1D ngồi 2 hàng 4 ghế \(\$m=4\$\)\]\)\[.*?\])\s*\n\s*== 1\.5 — Bài Tập Luyện Chương 1'
match18 = re.search(eg18_pattern, content, re.DOTALL)
if match18:
    target_eg18 = match18.group(1)
    print("Found Example 1.8!")
    
    replacement_eg18_and_more = """#eg-box(title: [🎯 Ví Dụ 1.8 — Quy mô lớn: 3A, 3B, 1C, 1D ngồi 2 hàng 4 ghế ($m=4$)])[
  Có 3 học sinh A, 3 học sinh B, 1 học sinh C, 1 học sinh D. Xếp vào 2 hàng 4 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 4$ cột. Học sinh của các lớp là $n_A = 3, n_B = 3, n_C = 1, n_D = 1$.
  Dưới đây là 2 cách tiếp cận giải quyết bài toán:

  *🔵 Cách 1: Chia trường hợp theo sự đối diện của C và D (Phương pháp ghép nhóm thủ công)*
  Ta chia làm các trường hợp tương ứng dựa trên sự đối diện của C và D:
  - *Trường hợp 1: C và D ngồi đối diện nhau.* Cột chứa C và D có kiểu $(C, D)$ (1 cột). Để phân bổ hết 3A và 3B vào 3 cột còn lại, bắt buộc cả 3 cột còn lại đều có kiểu $(A, B)$ (3 cột).
    1. Số cách gán kiểu cột vào vị trí: $M_1 = frac(4!, 1! times 3!) = 4$ cách.
    2. Đóng góp số cách xếp của TH1:
       $ N_1 = 4 times (3! times 3! times 1! times 1!) times 2^4 = 4 times 36 times 16 = bold(2304) " cách." $
  - *Trường hợp 2: C ngồi đối diện với một bạn lớp B, D đối diện một bạn lớp A.* Ta có kiểu cột: 1 cột $(B, C)$, 1 cột $(A, D)$. Còn lại 2 học sinh A và 2 học sinh B phân bổ vào 2 cột còn lại $arrow.r$ bắt buộc có kiểu $(A, B)$ (2 cột).
    1. Số cách gán kiểu cột vào vị trí: $M_2 = frac(4!, 1! times 1! times 2!) = 12$ cách.
    2. Đóng góp số cách xếp của TH2:
       $ N_2 = 12 times (3! times 3! times 1! times 1!) times 2^4 = 12 times 36 times 16 = bold(6912) " cách." $
  - *Trường hợp 3: C ngồi đối diện một bạn lớp A, D đối diện một bạn lớp B.* Do tính đối xứng của A và B, trường hợp này cho kết quả tương tự Trường hợp 2:
    1. Số cách gán kiểu cột: $M_3 = 12$ cách.
    2. Đóng góp: $N_3 = bold(6912)$ cách.
  
  $arrow.r$ Tổng số cách xếp là: $N = N_1 + N_2 + N_3 = 2304 + 6912 + 6912 = bold(16128)$ cách.

  *🟣 Cách 2: Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*
  Ta gọi kiểu cột $(X_i, X_j)$ là cột chứa 1 học sinh lớp $X_i$ và 1 học sinh lớp $X_j$. Gọi $t_(i j)$ là số cột tương ứng.
  Vì không có cặp đối diện nào cùng lớp, các kiểu cột có thể có là các cặp phân biệt chọn từ $\{A, B, C, D\}$:
  $ (A, B), (A, C), (A, D), (B, C), (B, D), (C, D) $
  Để phân bổ hết số học sinh của các lớp vào 4 cột ($m = 4$), ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 4 quad &("tổng số cột") \\
  t_(A B) + t_(A C) + t_(A D) = n_A = 3 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) + t_(B D) = n_B = 3 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) + t_(C D) = n_C = 1 quad &("lượt xuất hiện của C") \\
  t_(A D) + t_(B D) + t_(C D) = n_D = 1 quad &("lượt xuất hiện của D")
  $
  Vì $n_C = n_D = 1$, ta dễ dàng biện luận các cấu trúc nghiệm nguyên không âm của hệ phương trình trên theo giá trị của $t_(C D)$:
  - *Trường hợp 2.1: $t_(C D) = 1$* $arrow.r$ Bắt buộc các cột chứa C hoặc D khác đều bằng 0 ($t_(A C) = t_(B C) = t_(A D) = t_(B D) = 0$). Thay vào ta được $t_(A B) = 3$.
    Ta thu được cấu trúc cột: $ {3 times (A, B), 1 times (C, D)} $ $\rightarrow$ Số cấu hình cột $M_1 = frac(4!, 3! 1!) = 4$.
  - *Trường hợp 2.2: $t_(C D) = 0$* $arrow.r$ Bắt buộc $t_(A C) + t_(B C) = 1$ và $t_(A D) + t_(B D) = 1$. Có 2 cấu trúc nghiệm thỏa mãn:
    + Cấu hình $2.2a$: $ {2 times (A, B), 1 times (A, C), 1 times (B, D)} $ (ứng với $t_(A C) = 1, t_(B D) = 1$) $\rightarrow$ Số cấu hình cột $M_2 = frac(4!, 2! 1! 1!) = 12$.
    + Cấu hình $2.2b$: $ {2 times (A, B), 1 times (B, C), 1 times (A, D)} $ (ứng với $t_(B C) = 1, t_(A D) = 1$) $\rightarrow$ Số cấu hình cột $M_3 = frac(4!, 2! 1! 1!) = 12$.

  #rev-box(title: "🧩 Bảng tính số cấu hình cột (Ví dụ 1.8)")[
    #align(center)[
      #table(
        columns: (1.4fr, 2.3fr, 1.8fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Bộ ẩn $(t_(A B), t_(A C), t_(A D), t_(B C), t_(B D), t_(C D))$]],
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình cột M]],
        
        [$(3, 0, 0, 0, 0, 1)$], [$3 times (A, B) \\ 1 times (C, D)$], [$frac(4!, 3! 1!) = 4$],
        [$(2, 1, 0, 0, 1, 0)$], [$2 times (A, B) \\ 1 times (A, C) \\ 1 times (B, D)$], [$frac(4!, 2! 1! 1!) = 12$],
        [$(2, 0, 1, 1, 0, 0)$], [$2 times (A, B) \\ 1 times (B, C) \\ 1 times (A, D)$], [$frac(4!, 2! 1! 1!) = 12$]
      )
    ]
    Tổng số cấu hình cột hợp lệ là: $M = 4 + 12 + 12 = 28$ cấu hình.
    
    Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^4 = 16$):
    $ N = M times (n_A! n_B! n_C! n_D!) times 2^4 = 28 times (3! times 3! times 1! times 1!) times 16 = 28 times 36 times 16 = bold(16128) " cách." $
  ]
]

#eg-box(title: [🎯 Ví Dụ 1.9 — Hệ phức tạp hơn: 3A, 2B, 2C, 1D ngồi 2 hàng 4 ghế ($m=4$)])[
  Có 3 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C, 1 học sinh lớp D. Xếp vào 2 hàng 4 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 4$ cột. Học sinh của các lớp là $n_A = 3, n_B = 2, n_C = 2, n_D = 1$.
  Ta giải bằng **Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)**:
  
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh vào $m = 4$ cột, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 4 quad &("tổng số cột") \\
  t_(A B) + t_(A C) + t_(A D) = n_A = 3 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) + t_(B D) = n_B = 2 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) + t_(C D) = n_C = 2 quad &("lượt xuất hiện của C") \\
  t_(A D) + t_(B D) + t_(C D) = n_D = 1 quad &("lượt xuất hiện của D")
  $
  Ta chọn biến có giới hạn hẹp nhất để biện luận. Vì $n_D = 1$, ta có $t_(A D) + t_(B D) + t_(C D) = 1$. Do đó, có đúng một trong ba biến này nhận giá trị bằng 1, hai biến còn lại bằng 0:
  
  - *Trường hợp 1: $t_(C D) = 1$* $arrow.r$ $t_(A D) = 0, t_(B D) = 0$.
    Thay vào hệ phương trình ta được:
    $
    t_(A B) + t_(A C) = 3 \
    t_(A B) + t_(B C) = 2 \
    t_(A C) + t_(B C) = 1
    $
    Giải hệ con này bằng cách trừ phương trình (3) khỏi (1): $t_(A B) - t_(B C) = 2$.
    Cộng với phương trình (2): $2 t_(A B) = 4 arrow.r.double t_(A B) = 2$, từ đó $t_(B C) = 0$ và $t_(A C) = 1$.
    Bộ nghiệm này thỏa mãn tổng số cột ($2 + 1 + 1 = 4$).
    Ta thu được cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (C, D)} $.
    + Số cấu hình cột: $M_1 = frac(4!, 2! 1! 1!) = 12$ cách.
    
  - *Trường hợp 2: $t_(B D) = 1$* $arrow.r$ $t_(A D) = 0, t_(C D) = 0$.
    Thay vào hệ phương trình ta được:
    $
    t_(A B) + t_(A C) = 3 \
    t_(A B) + t_(B C) = 1 \
    t_(A C) + t_(B C) = 2
    $
    Từ (2), vì $t_(A B), t_(B C)$ nguyên không âm nên chỉ có 2 khả năng:
    + *Khả năng 2.1:* $t_(A B) = 1, t_(B C) = 0 arrow.r.double t_(A C) = 2$ (từ 1). Thay vào (3): $2 + 0 = 2$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 2 times (A, C), 1 times (B, D)} $.
      Số cấu hình cột: $M_2 = frac(4!, 1! 2! 1!) = 12$ cách.
    + *Khả năng 2.2:* $t_(A B) = 0, t_(B C) = 1 arrow.r.double t_(A C) = 3$ (từ 1). Thay vào (3): $3 + 1 = 4 != 2$ (loại).
    
  - *Trường hợp 3: $t_(A D) = 1$* $arrow.r$ $t_(B D) = 0, t_(C D) = 0$.
    Thay vào hệ phương trình ta được:
    $
    t_(A B) + t_(A C) = 2 \
    t_(A B) + t_(B C) = 2 \
    t_(A C) + t_(B C) = 2
    $
    Giải hệ con đối xứng này ta được nghiệm duy nhất: $t_(A B) = 1, t_(A C) = 1, t_(B C) = 1$.
    Ta thu được cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (A, D)} $.
    + Số cấu hình cột: $M_3 = frac(4!, 1! 1! 1! 1!) = 24$ cách.

  #rev-box(title: "🧩 Bảng tính số cấu hình cột (Ví dụ 1.9)")[
    #align(center)[
      #table(
        columns: (1.4fr, 2.3fr, 1.8fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Bộ ẩn $(t_(A B), t_(A C), t_(A D), t_(B C), t_(B D), t_(C D))$]],
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình cột M]],
        
        [$(2, 1, 0, 0, 0, 1)$], [$2 times (A, B) \\ 1 times (A, C) \\ 1 times (C, D)$], [$frac(4!, 2! 1! 1!) = 12$],
        [$(1, 2, 0, 0, 1, 0)$], [$1 times (A, B) \\ 2 times (A, C) \\ 1 times (B, D)$], [$frac(4!, 1! 2! 1!) = 12$],
        [$(1, 1, 1, 1, 0, 0)$], [$1 times (A, B) \\ 1 times (A, C) \\ 1 times (B, C) \\ 1 times (A, D)$], [$frac(4!, 1! 1! 1! 1!) = 24$]
      )
    ]
    Tổng số cấu hình cột hợp lệ là: $M = 12 + 12 + 24 = 48$ cấu hình.
    
    Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^4 = 16$):
    $ N = M times (n_A! n_B! n_C! n_D!) times 2^4 = 48 times (3! times 2! times 2! times 1!) times 16 = 48 times 24 times 16 = bold(18432) " cách." $
  ]
]

#eg-box(title: [🎯 Ví Dụ 1.10 — Lớp quy mô lớn: 4A, 3B, 2C, 1D ngồi 2 hàng 5 ghế ($m=5$)])[
  Có 4 học sinh lớp A, 3 học sinh lớp B, 2 học sinh lớp C, 1 học sinh lớp D. Xếp vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 5$ cột. Học sinh của các lớp là $n_A = 4, n_B = 3, n_C = 2, n_D = 1$.
  Ta giải bằng **Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)**:
  
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh vào $m = 5$ cột, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 5 quad &("tổng số cột") \\
  t_(A B) + t_(A C) + t_(A D) = n_A = 4 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) + t_(B D) = n_B = 3 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) + t_(C D) = n_C = 2 quad &("lượt xuất hiện của C") \\
  t_(A D) + t_(B D) + t_(C D) = n_D = 1 quad &("lượt xuất hiện của D")
  $
  Ta nhận xét rằng tổng số cột là 5, trong khi lớp A có số học sinh bằng 4. Do đó, chỉ có đúng $5 - 4 = 1$ cột không chứa học sinh lớp A.
  Nghĩa là: $t_(B C) + t_(B D) + t_(C D) = 1$.
  Vì các biến nguyên không âm, ta biện luận theo 3 trường hợp tương ứng:
  
  - *Trường hợp 1: $t_(C D) = 1$* $arrow.r$ $t_(B C) = 0, t_(B D) = 0$.
    Từ phương trình của D ($t_(A D) + t_(B D) + t_(C D) = 1$), ta suy ra $t_(A D) = 0$.
    Hệ phương trình rút gọn thành:
    $
    t_(A B) + t_(A C) = 4 \
    t_(A B) = 3 \
    t_(A C) + 1 = 2 arrow.r.double t_(A C) = 1
    $
    Nghiệm thu được: $t_(A B) = 3, t_(A C) = 1, t_(C D) = 1$ (thỏa mãn).
    Ta thu được cấu hình: $ {3 times (A, B), 1 times (A, C), 1 times (C, D)} $.
    + Số cấu hình cột: $M_1 = frac(5!, 3! 1! 1!) = 20$ cách.
    
  - *Trường hợp 2: $t_(B D) = 1$* $arrow.r$ $t_(B C) = 0, t_(C D) = 0$.
    Từ phương trình của D, ta suy ra $t_(A D) = 0$.
    Hệ phương trình rút gọn thành:
    $
    t_(A B) + t_(A C) = 4 \
    t_(A B) + 1 = 3 arrow.r.double t_(A B) = 2 \
    t_(A C) = 2
    $
    Nghiệm thu được: $t_(A B) = 2, t_(A C) = 2, t_(B D) = 1$ (thỏa mãn).
    Ta thu được cấu hình: $ {2 times (A, B), 2 times (A, C), 1 times (B, D)} $.
    + Số cấu hình cột: $M_2 = frac(5!, 2! 2! 1!) = 30$ cách.
    
  - *Trường hợp 3: $t_(B C) = 1$* $arrow.r$ $t_(B D) = 0, t_(C D) = 0$.
    Từ phương trình của D, ta suy ra $t_(A D) = 1$.
    Hệ phương trình rút gọn thành:
    $
    t_(A B) + t_(A C) + 1 = 4 arrow.r.double t_(A B) + t_(A C) = 3 \
    t_(A B) + 1 = 3 arrow.r.double t_(A B) = 2 \
    t_(A C) + 1 = 2 arrow.r.double t_(A C) = 1
    $
    Nghiệm thu được: $t_(A B) = 2, t_(A C) = 1, t_(B C) = 1, t_(A D) = 1$ (thỏa mãn).
    Ta thu được cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (A, D)} $.
    + Số cấu hình cột: $M_3 = frac(5!, 2! 1! 1! 1!) = 60$ cách.

  #rev-box(title: "🧩 Bảng tính số cấu hình cột (Ví dụ 1.10)")[
    #align(center)[
      #table(
        columns: (1.4fr, 2.3fr, 1.8fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Bộ ẩn $(t_(A B), t_(A C), t_(A D), t_(B C), t_(B D), t_(C D))$]],
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình cột M]],
        
        [$(3, 1, 0, 0, 0, 1)$], [$3 times (A, B) \\ 1 times (A, C) \\ 1 times (C, D)$], [$frac(5!, 3! 1! 1!) = 20$],
        [$(2, 2, 0, 0, 1, 0)$], [$2 times (A, B) \\ 2 times (A, C) \\ 1 times (B, D)$], [$frac(5!, 2! 2! 1!) = 30$],
        [$(2, 1, 1, 1, 0, 0)$], [$2 times (A, B) \\ 1 times (A, C) \\ 1 times (B, C) \\ 1 times (A, D)$], [$frac(5!, 2! 1! 1! 1!) = 60$]
      )
    ]
    Tổng số cấu hình cột hợp lệ là: $M = 20 + 30 + 60 = 110$ cấu hình.
    
    Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^5 = 32$):
    $ N = M times (n_A! n_B! n_C! n_D!) times 2^5 = 110 times (4! times 3! times 2! times 1!) times 32 = 110 times 288 times 32 = bold(1013760) " cách." $
  ]
]"""
    content = content.replace(target_eg18, replacement_eg18_and_more)
else:
    print("Could not find Example 1.8!")

# Write back to file
with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Add and standardise finished!")
