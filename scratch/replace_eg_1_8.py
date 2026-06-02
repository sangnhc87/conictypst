import re

filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Locate Example 1.8 block using regex.
# Start of block: #eg-box(title: "🎯 Ví Dụ 1.8 — Quy mô lớn: 3A, 3B, 1C, 1D ngồi 2 hàng 4 ghế ($m=4$)")[
# End of block: the last ] before the section: \n\n== 1.5 — Bài Tập Luyện Chương 1

pattern = r'(#eg-box\(title:\s*"🎯 Ví Dụ 1.8 — Quy mô lớn: 3A, 3B, 1C, 1D ngồi 2 hàng 4 ghế \(\$m=4\$\)"\)\[.*?\])\s*\n\s*== 1\.5 — Bài Tập Luyện Chương 1'

match = re.search(pattern, content, re.DOTALL)
if not match:
    print("Could not find the target block using regex!")
else:
    target_block = match.group(1)
    print("Found match! Length:", len(target_block))

    replacement = """#eg-box(title: "🎯 Ví Dụ 1.8 — Quy mô lớn: 3A, 3B, 1C, 1D ngồi 2 hàng 4 ghế ($m=4$)")[
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

  *🟣 Cách 2: Phương pháp lập cấu hình cột tổng quát (Phương pháp bảng hệ phương trình)*
  Ta gọi kiểu cột $(X_i, X_j)$ là cột chứa 1 học sinh lớp $X_i$ và 1 học sinh lớp $X_j$. Gọi $t_{i j}$ là số cột tương ứng.
  Vì không có cặp đối diện nào cùng lớp, các kiểu cột có thể có là các cặp phân biệt chọn từ $\{A, B, C, D\}$:
  $ (A, B), (A, C), (A, D), (B, C), (B, D), (C, D) $
  Để phân bổ hết số học sinh của các lớp vào 4 cột ($m = 4$), ta có hệ phương trình:
  $
  t_{A B} + t_{A C} + t_{A D} + t_{B C} + t_{B D} + t_{C D} = 4 quad &("tổng số cột") \
  t_{A B} + t_{A C} + t_{A D} = n_A = 3 quad &("lượt xuất hiện của A") \
  t_{A B} + t_{B C} + t_{B D} = n_B = 3 quad &("lượt xuất hiện của B") \
  t_{A C} + t_{B C} + t_{C D} = n_C = 1 quad &("lượt xuất hiện của C") \
  t_{A D} + t_{B D} + t_{C D} = n_D = 1 quad &("lượt xuất hiện của D")
  $
  Vì $n_C = n_D = 1$, ta dễ dàng biện luận các cấu trúc nghiệm nguyên không âm của hệ phương trình trên theo giá trị của $t_{C D}$:
  - *Trường hợp 2.1: $t_{C D} = 1$* $arrow.r$ Bắt buộc các cột chứa C hoặc D khác đều bằng 0 ($t_{A C} = t_{B C} = t_{A D} = t_{B D} = 0$). Thay vào ta được $t_{A B} = 3$.
    Ta thu được cấu trúc cột: $\{3 times (A, B), 1 times (C, D)\}$.
  - *Trường hợp 2.2: $t_{C D} = 0$* $arrow.r$ Bắt buộc $t_{A C} + t_{B C} = 1$ và $t_{A D} + t_{B D} = 1$. Có 2 cấu trúc nghiệm thỏa mãn:
    + Cấu hình $2.2a$: $\{2 times (A, B), 1 times (A, C), 1 times (B, D)\}$ (ứng với $t_{A C} = 1, t_{B D} = 1$).
    + Cấu hình $2.2b$: $\{2 times (A, B), 1 times (B, C), 1 times (A, D)\}$ (ứng với $t_{B C} = 1, t_{A D} = 1$).

  #rev-box(title: "🧩 Bảng tính số cách xếp cho từng cấu hình cột")[
    #align(center)[
      #table(
        columns: (2.0fr, 1.2fr, 1.4fr, 1.0fr, 1.4fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cách gán M]],
        [#text(fill: white, weight: "bold")[Hoán vị học sinh]],
        [#text(fill: white, weight: "bold")[Đảo hàng]],
        [#text(fill: white, weight: "bold")[Đóng góp]],
        
        [$3 times (A, B) \\ 1 times (C, D)$],
        [$frac(4!, 3! 1!) = 4$],
        [$3! 3! 1! 1! = 36$],
        [$2^4 = 16$],
        [$4 times 36 times 16 = bold(2304)$],

        [$2 times (A, B) \\ 1 times (A, C) \\ 1 times (B, D)$],
        [$frac(4!, 2! 1! 1!) = 12$],
        [$3! 3! 1! 1! = 36$],
        [$2^4 = 16$],
        [$12 times 36 times 16 = bold(6912)$],

        [$2 times (A, B) \\ 1 times (B, C) \\ 1 times (A, D)$],
        [$frac(4!, 2! 1! 1!) = 12$],
        [$3! 3! 1! 1! = 36$],
        [$2^4 = 16$],
        [$12 times 36 times 16 = bold(6912)$]
      )
    ]
    $arrow.r$ Tổng số cách xếp là: $N = 2304 + 6912 + 6912 = bold(16128)$ cách.
  ]
]"""

    # Do replacement
    new_content = content.replace(target_block, replacement)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(new_content)
    print("Replacement success!")
